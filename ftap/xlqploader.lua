getgenv().SCRIPT_KEY = "DO NOT REMOVE OR CHANGE"

do
    -- Anti-tamper marker (result intentionally discarded)
    ("JNKIE Loader - Unauthorized tampering or debugging of protected scripts is strictly prohibited and may result in a global blacklist from JNKIE protected scripts."):sub(1, 1)

    local key = getgenv().SCRIPT_KEY or SCRIPT_KEY

    local NETWORK_ERROR = "Could not load the script. Check your internet connection and try again."
    local NO_KEY_ERROR  = "No key provided. Get a key from the script provider, enter it, then try again."

    -- Hard failure: warn, kick the player, and show a Roblox error prompt.
    local function abort(message)
        warn(message)
        task.spawn(function()
            pcall(function()
                game:GetService("Players").LocalPlayer:Kick(message)
            end)
            task.wait()
            pcall(function()
                local prompt = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt
                prompt.TitleFrame.ErrorTitle.Text = "JNKIE"
                prompt.MessageArea.ErrorFrame.ErrorMessage.Text = message
            end)
        end)
    end

    -- Pick whichever HTTP library this executor exposes.
    local httpRequest =
        (type(syn) == "table" and type(syn.request) == "function" and syn.request)
        or (type(request) == "function" and request)
        or (type(http_request) == "function" and http_request)
        or (type(http) == "table" and type(http.request) == "function" and http.request)

    if type(key) ~= "string" then
        abort(NO_KEY_ERROR)
        return
    end

    if type(httpRequest) ~= "function" then
        warn(NETWORK_ERROR)
        return
    end

    -- Request with a 15 second timeout. Returns ok, response.
    local function requestWithTimeout(options)
        local finished, ok, response

        task.spawn(function()
            ok, response = pcall(httpRequest, options)
            finished = true
        end)

        local started = os.clock()
        repeat
            task.wait()
        until finished or os.clock() - started > 15

        if not finished then
            return false, nil
        end

        return ok, response
    end

    local ok, response = requestWithTimeout({
        Url = "https://api.jnkie.com/api/v1/luascripts/delivery/091c8b7cfeb79409f81d03aab8d123d9d9aa776a25d9c7f48b43bc184cda3fc3?v=2&errors=text",
        Method = "POST",
        Headers = { ["Content-Type"] = "text/plain" },
        Body = key,
    })

    -- Error responses are "<CODE>\n<human readable message>"
    local errorBody = ok
        and type(response) == "table"
        and type(response.Body) == "string"
        and (response.StatusCode == 400 or response.StatusCode == 401 or response.StatusCode == 403)
        and response.Body

    if errorBody then
        local code, message = errorBody:match("^([^\r\n]+)\n([^\r\n]+)$")
        code = code or errorBody

        if #code <= 75 and (code == "LDR-DENIED" or code:match("^LDR%-DENIED:[A-Z_]+$")) then
            if not message or #message > 512 then
                message = NETWORK_ERROR
                if key == "" or key:match("^%s*$") then
                    message = NO_KEY_ERROR
                end
            end
            abort(message .. " (" .. code .. ")")
            return
        end
    end

    -- Status 200 with a URL body means "follow this link".
    if ok
        and type(response) == "table"
        and response.StatusCode == 200
        and type(response.Body) == "string"
        and string.sub(response.Body, 1, 8) == "https://" then
        ok, response = requestWithTimeout({ Url = response.Body, Method = "GET" })
    end

    -- Status 302/303: follow the Location header.
    if ok and type(response) == "table" and (response.StatusCode == 302 or response.StatusCode == 303) then
        local headers  = response.Headers or response.headers
        local location = type(headers) == "table" and (headers.Location or headers.location)
        if type(location) == "string" and string.sub(location, 1, 8) == "https://" then
            ok, response = requestWithTimeout({ Url = location, Method = "GET" })
        end
    end

    if not ok
        or type(response) ~= "table"
        or response.StatusCode ~= 200
        or type(response.Body) ~= "string"
        or #response.Body == 0 then
        warn(NETWORK_ERROR)
        return
    end

    local source = response.Body
    response = nil

    local chunk = loadstring(source)
    source = nil

    if type(chunk) ~= "function" then
        warn(NETWORK_ERROR)
        return
    end

    chunk()
end
