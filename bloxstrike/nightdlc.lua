do local function _a()
    local _b,_c="Unknown",""
    local _d,_e,_f=pcall(function()
      if type(identifyexecutor)=="function"then return identifyexecutor()
      end
      if type(getexecutorname)=="function"then return getexecutorname()
      end
      return nil
    end)
    if _d then if type(_e)=="string"and _e~=""then _b=_e
      end
      if type(_f)=="string"and _f~=""then _c=_f
      end
    end
    return tostring(_b),tostring(_c)
  end
  local _g,_h=_a()getgenv().SHIZUKUSCRIPTS_EXECUTOR=_g getgenv().SHIZUKUSCRIPTS_EXECUTOR_VER=_h
end
local _i="SHIZUKUSCRIPTS_VP_1"
local _j="shizukuscripts"getgenv()[_i]=true getgenv()["SHIZUKUSCRIPTS_PROTECTED"]=true pcall(function()
  local _k=game:GetService("SoundService")
  for _l,_m in ipairs(_k:GetChildren())do if _m:IsA("Sound")and _m.Name=="SHIZUKUSCRIPTS_AnimeStartup"then _m:Destroy()
    end
  end
  local _n=Instance.new("Sound")_n.Name="SHIZUKUSCRIPTS_AnimeStartup"_n.SoundId="rbxassetid://78798011197804"_n.Volume=0.65 _n.PlaybackSpeed=1 _n.Parent=_k _k:PlayLocalSound(_n)task.delay(12,function()
    if _n and _n.Parent then _n:Destroy()
    end
  end)
end)
local function _o()pcall(function()
    local function _p(_q)
      if not _q then return
      end
      for _r,_s in ipairs(_q:GetDescendants())do if _s:IsA("ImageLabel")or _s:IsA("ImageButton")then local _t=string.lower(_s.Name or"")
          if _t:find("topimage")or _t:find("cute")or _t:find("banner")then pcall(function()_s:Destroy()
            end)
          end
        end
        if _s:IsA("ScreenGui")and(_s.Name=="SHIZUKUSCRIPTS_TopImage"or _s.Name=="NightDlc_HVHSettings")then pcall(function()_s:Destroy()
          end)
        end
      end
    end _p(game:GetService("CoreGui"))_p(game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui"))
    if type(gethui)=="function"then pcall(function()_p(gethui())
      end)
    end
  end)
  local _u
  local _v=function()
  end
  local _w,_x=true,true
  local _y={}
  local _z={}do local _A={}do local _B={}
      local _C={}
      local _D={}
      local _E={}
      local _F do do local _H={}
          local _I={}
          local _J={}do do local _K,_L do local _M={[1]=12,[2]="ScrollBarImageColor3",[3]="SettingsButton",[4]="7",[5]="Malformed rich text",[6]="BackgroundColor3",[7]="MouseButton2",[8]=1,[9]=false,[10]=247,[11]="Thickness",[12]=23,[13]=1,[14]="MB1",[15]="19",[16]="RS",[17]=36,[18]=12,[19]="UIListLayout",[20]=20,[21]="ApplyStrokeMode",[22]="UIStroke",[23]="2",[24]=200,[25]=12,[26]=40,[27]="Visible",[28]=0,[29]="TextLabel",[30]="BackgroundTransparency",[31]=function()
                end,[32]=0,[33]="TextButton",[34]="ImageLabel",[35]=0,[36]="1b",[37]=138,[38]="BindableEvent",[39]="f",[40]="Escape",[41]=129,[42]="TextColor3",[43]="ScrollingFrame",[44]="Frame",[45]="TextButton",[46]="Name",[47]=124,[48]="ImageLabel",[49]=15,[50]="a",[51]="TextSize",[52]="TextButton",[53]=4,[54]="Padding",[55]="Always",[56]=1,[57]="UIListLayout",[58]=0.1,[59]=159,[60]="UIStroke",[61]="11",[62]="Heartbeat",[63]="Frame",[64]=1,[65]="Frame",[66]=129,[67]=1,[68]="9",[69]=229,[70]="BorderColor3",[71]="Frame",[72]=0,[73]=0,[74]=0.2,[75]=0,[76]="HttpService",[77]="UIGradient",[78]="1a",[79]=24,[80]="",[81]=5,[82]="UICorner",[83]="ImageLabel",[84]="string",[85]=1,[86]="Visible",[87]=18,[88]=0.5,[89]="FillDirection",[90]=0.1,[91]=true,[92]="3",[93]="UIStroke",[94]=14,[95]="LC",[96]=6,[97]=12,[98]=1080,[99]=99999,[100]="TextButton",[101]="ScreenGui",[102]=0.55,[103]=5,[104]="Regular",[105]="TextTransparency",[106]="2",[107]=106,[108]="TextButton",[109]=5,[110]="Toggle",[111]="BorderSizePixel",[112]="MB1",[113]="RunService",[114]="Position",[115]=1,[116]="TextLabel",[117]="Frame",[118]=0,[119]=2,[120]="none",[121]="MouseButton3",[122]="Frame",[123]=5,[124]=40,[125]="BackgroundColor3",[126]=265,[127]="SortOrder",[128]=0,[129]=".",[130]=100,[131]=2,[132]="6",[133]=16,[134]=229,[135]="TextLabel",[136]="UIPadding",[137]=37,[138]="",[139]="RenderStepped",[140]="MainFrame",[141]="UIStroke",[142]=16,[143]="Frame",[144]="LISTLAYOUT_RIGHT",[145]=999999,[146]="UIPadding",[147]="LISTLAYOUT_SINGLE",[148]="TextLabel",[149]="ENTER",[150]=255,[151]="smallest_pixel.ttf",[152]=102,[153]=1,[154]="UICorner",[155]=86,[156]=143,[157]=1,[158]="Frame",[159]=20,[160]="d",[161]=36,[162]="BackgroundFrameStroke",[163]=20,[164]=216,[165]="b",[166]="ESC",[167]=21,[168]="HumanoidRootPart",[169]=5,[170]="TextButton",[171]="Transparency",[172]=17,[173]=0.55,[174]="Text",[175]="TextLabel",[176]="8",[177]="TextButton",[178]=34,[179]="settings.png",[180]="TextButton",[181]=166,[182]=159,[183]="e4l3g4nt",[184]="_info",[185]="Position",[186]=159,[187]="Frame",[188]=28,[189]="5",[190]="untitled",[191]="1",[192]="Frame",[193]=6,[194]="",[195]=3,[196]=32,[197]="ImageLabel",[198]=40,[199]="TextButton",[200]="ImageButton",}_y.v83=setmetatable(_M,{__index=function(_N,_O)error("Unrecovered menu constant "..tostring(_O),2)
                end,})_y.n24=9070 _y.n25=0 _y.n26=function()
                  return 0
                end _y.n27=function(_P)
                  return _P*400-1440000
                end _y.n28=function()
                  return 1100
                end _K=""_L={Modules={UI={}}}
                local _Q=getgenv()getgenv()["e4l3g4nt_mark_47"]="e4l44gant77 :: 4747"getgenv()["e4l44gant77_build"]="elegant x4 x7 :: do not remove"getgenv()["elegant_watermark_7447"]="4l3g4nt wuz here 7744"getgenv()["e4l3g4nt_owns_this"]="elegant | 47 | 74 | 4477"_Q.SYC=_L _Q.playerService=game:GetService("Players")_Q.coreguiService=game:GetService("CoreGui")_Q.tweenService=game:GetService("TweenService")_Q.inputService=game:GetService("UserInputService")_Q.rsService=game:GetService("RunService")_Q.replicatedStorage=game:GetService("ReplicatedStorage")_Q.textService=game:GetService("TextService")_Q.httpService=game:GetService("HttpService")_Q.userSettings=UserSettings()_Q.userGameSettings=_Q.userSettings:GetService("UserGameSettings")
                if type(isfolder)=="function"and type(makefolder)=="function"then for _R,_S in ipairs({"e4l3g4nt","e4l3g4nt/configs","e4l3g4nt/configs/bloxstrike","e4l3g4nt/configs/bloxstrike/skin_configs"})do if not isfolder(_S)then makefolder(_S)
                    end
                  end
                end _y.localPlayer=_Q.playerService.LocalPlayer _y.font=Font.fromEnum(Enum.Font.GothamMedium)pcall(function()_y.font=Font.fromEnum(Enum.Font.GothamMedium)
                end)_H.huge2=math.huge _H.remove2=table.remove _H.vector=Vector3.zero _y.vector2=Vector2.new _y.udim2=UDim2.new _y.color=Color3.fromRGB _y.new=Instance.new _y.delay=task.delay _y.spawn_=task.spawn _y.wait_=task.wait
              end
              local _T,_U do do do do local _V=game getgenv().textService=_V:GetService("TextService")
                    end do local _W=game getgenv().httpService=_W:GetService("HttpService")
                    end
                  end do getgenv().userSettings=UserSettings()do local _X=userSettings getgenv().userGameSettings=_X:GetService("UserGameSettings")
                    end
                  end _y.localPlayer=playerService.LocalPlayer _y.localPlayer:GetMouse()_H.huge2=math.huge _H.remove2=table.remove _y.vector2=Vector2.new _H.vector=Vector3.zero _y.udim2=UDim2.new _y.color=Color3.fromRGB _y.new=Instance.new _y.delay=task.delay _y.spawn_=task.spawn _y.wait_=task.wait do local function _Y()
                      local _bb={include=function(_Z,_ba)
                        if not _L then return
                        end
                        if not _L.Modules then return
                        end
                        if not type(_ba)=="string"then return
                        end
                        return _L.Modules[_ba]
                      end}getgenv().include=function(_bc)
                        return _bb:include(_bc)
                      end
                      return _bb
                    end _Y()
                  end
                end do local _bd do do _L.Modules.Connect=function(_be,_bf)
                        return(_be:Connect(_bf))
                      end _L.Modules.lerp=function(_bg,_bh,_bi)
                        return _bg+(_bh-_bg)*_bi
                      end _u={Heartbeat={},RenderStepped={},AddToHeartbeat=function(_bj,_bk,_bl)
                        if _u["Heartbeat"][_bk]==nil then _u.Heartbeat[_bk]=rsService.Heartbeat:Connect(_bl)
                        end
                      end,RemoveFromHeartbeat=function(_bm,_bn)
                        if _u.Heartbeat[_bn]then _u.Heartbeat[_bn]:Disconnect()_u["Heartbeat"][_bn]=nil
                        end
                      end,AddToRenderStepped=function(_bo,_bp,_bq)
                        if _u.RenderStepped[_bp]==nil then _u["RenderStepped"][_bp]=rsService.RenderStepped:Connect(_bq)
                        end
                      end,RemoveFromRenderStepped=function(_br,_bs)
                        if _u.RenderStepped[_bs]then _u.RenderStepped[_bs]:Disconnect()_u.RenderStepped[_bs]=nil
                        end
                      end,}_L.Modules.Loops=_u _L.Modules.PerlinNoise=function(_bt,_bu,_bv)
                        return math.clamp(math.noise(_bv*_bu+_bt),-0.5,0.5)
                      end _L.Modules.UI.RichTextToNormalText=function(_bw)
                        while true do if true then if not _bw:find("<")and not _bw:find(">")then return _bw
                            end
                            if _bw:find("<")and not _bw:find(">")or _bw:find(">")and not _bw:find("<")then break
                            end
                            local _bx=_bw.find
                            local _by=_bw:gsub(_bw:sub(_bw:find("<"),_bx(_bw,">")),"",1)_y.wait_()_bw=_by
                          else return _bw
                          end
                        end
                        return error("Malformed rich text")
                      end _L.Modules.UI.GetTextBoundary=function(_bz,_bA,_bB,_bC,_bD)
                        local _bE=textService:GetTextSize(_bA,_bC,_bB,_bD or _y.vector2(1920,1080))
                        return _bE.X,_bE.Y
                      end do local function _bF()
                          local _bG={Instances={},Popup=nil,KeybindsListObjects={},KeybindList=nil,Flags={},ConfigFlags={},}getgenv().uishit=_bG getgenv().theme={accent=_y.color(120,200,255),risky=_y.color(143,77,77),playerlist=_y.color(120,200,255),scroll=_y.color(100,180,255),bg=Color3.fromRGB(14,16,22),card=Color3.fromRGB(20,23,30),text=Color3.fromRGB(235,240,250),muted=Color3.fromRGB(130,140,160),name="Dark",}getgenv().theme_event=Instance.new("BindableEvent")
                          local _bH=_bG.Instances
                          local _bI=include("UI")
                          local _bJ=nil
                          local _bK=nil
                          local _bL=nil
                          local _bM=nil
                          local _bN=nil
                          local _bO={[Enum.KeyCode.LeftShift]="LS",[Enum.KeyCode.RightShift]="RS",[Enum.KeyCode.LeftControl]="LC",[Enum.KeyCode.RightControl]="RC",[Enum.KeyCode.LeftAlt]="LA",[Enum.KeyCode.RightAlt]="RA",[Enum.KeyCode.CapsLock]="CAPS",[Enum.KeyCode.Return]="ENTER",[Enum.KeyCode.PageDown]="PGD",[Enum.KeyCode.PageUp]="PGU",[Enum.KeyCode.ScrollLock]="SCL",[Enum.KeyCode.One]="1",[Enum.KeyCode.Two]="2",[Enum.KeyCode.Three]="3",[Enum.KeyCode.Four]="4",[Enum.KeyCode.Five]="5",[Enum.KeyCode.Six]="6",[Enum.KeyCode.Seven]="7",[Enum.KeyCode.Eight]="8",[Enum.KeyCode.Nine]="9",[Enum.KeyCode.Zero]="0",[Enum.KeyCode.KeypadOne]="1",[Enum.KeyCode.KeypadTwo]="2",[Enum.KeyCode.KeypadThree]="3",[Enum.KeyCode.KeypadFour]="4",[Enum.KeyCode.KeypadFive]="5",[Enum.KeyCode.KeypadSix]="6",[Enum.KeyCode.KeypadSeven]="7",[Enum.KeyCode.KeypadEight]="8",[Enum.KeyCode.KeypadNine]="9",[Enum.KeyCode.KeypadZero]="0",[Enum.KeyCode.Minus]="-",[Enum.KeyCode.Equals]="=",[Enum.KeyCode.Tilde]="~",[Enum.KeyCode.LeftBracket]="[",[Enum.KeyCode.RightBracket]="]",[Enum.KeyCode.RightParenthesis]=")",[Enum.KeyCode.LeftParenthesis]="(",[Enum.KeyCode.Semicolon]=",",[Enum.KeyCode.Quote]="'",[Enum.KeyCode.BackSlash]="\\",[Enum.KeyCode.Comma]=",",[Enum.KeyCode.Period]=".",[Enum.KeyCode.Slash]="/",[Enum.KeyCode.Asterisk]="*",[Enum.KeyCode.Plus]="+",[Enum.KeyCode.Period]=".",[Enum.KeyCode.Backquote]="`",[Enum.KeyCode.Insert]="INS",[Enum.UserInputType.MouseButton1]="MB1",[Enum.UserInputType.MouseButton2]="MB2",[Enum.UserInputType.MouseButton3]="MB3",[Enum.KeyCode.Backspace]="BS",[Enum.KeyCode.Escape]="ESC",[Enum.KeyCode.Space]="SPC",}
                          local _bP=0 _bG.GetNextFlag=function()_bP+=1
                            return tostring(_bP)
                          end _bG.Create=function(_bQ,_bR)
                            local _bS={Tabs={},Title=_bR.title or "syndicate<font color=\"rgb(129, 127, 127)\">.free</font>"}
                            local _bT={"xoxo","! tip - right click colorpickers","best community","elegant4 made it with <3 xaxa","truly an elegant solution",}
                            local function _bU(_bV,_bW)tweenService:Create(_bV,TweenInfo.new(0.5),{TextTransparency=1}):Play()_y.wait_(0.5)_bV.Text=_bW tweenService:Create(_bV,TweenInfo.new(0.5),{TextTransparency=0}):Play()
                            end _bH["1"]=_y.new("ScreenGui",coreguiService)_bH["1"].Name="ScreenGui" _bH["1"].ZIndexBehavior=Enum.ZIndexBehavior.Sibling _bH["2"]=_y.new("Frame",_bH["1"])_bH["2"]["BorderSizePixel"]=0 _bH["2"].BackgroundColor3=Color3.fromRGB(14,16,21)_bH["2"].Size=_y.udim2(0,620,0,560)_bH["2"].AnchorPoint=Vector2.new(0.5,0.5)_bH["2"].Position=UDim2.fromScale(0.5,0.5)_bH["2"]["BorderColor3"]=_y.color(0,0,0)_bH["2"].Name="BackgroundFrame"_bH["3"]=_y.new("UICorner",_bH["2"])_bH["3"].Name="BackgroundCorner"_bH["3"].CornerRadius=UDim.new(0,10)_bH["4"]=_y.new("UIStroke",_bH["2"])_bH["4"].ApplyStrokeMode=Enum.ApplyStrokeMode.Border _bH["4"]["Name"]="BackgroundFrameStroke" _bH["4"]["Thickness"]=2 _bH["4"].Color=Color3.fromRGB(31,33,31)_bH["7"]=_y.new("Frame",_bH["2"])_bH["7"].BorderSizePixel=0 _bH["7"]["BackgroundColor3"]=_y.color(255,255,255)_bH["7"].Size=_y.udim2(0,480,0,18)_bH["7"].Position=_y.udim2(0,110,0,16)_bH["7"].BorderColor3=_y.color(0,0,0)_bH["7"].Name="TabsList"
                            local _bX=_y.new("TextLabel",_bH["2"])_bX.Name="MenuBrand"_bX.Size=UDim2.fromOffset(82,16)_bX.Position=UDim2.fromOffset(15,16)_bX.BackgroundTransparency=1 _bX.BorderSizePixel=0 _bX.RichText=true _bX.Text=_bS.Title.." |"_bX.TextColor3=Color3.new(1,1,1)_bX.TextSize=12 _bX.FontFace=_y.font _bX.TextXAlignment=Enum.TextXAlignment.Left _bH["7"].BackgroundTransparency=1 pcall(function()
                              local _bY=_y.new("ImageLabel",_bH["2"])_bY.Name="SHIZUKUSCRIPTS_CuteBanner"_bY.Visible=false _bY.BackgroundTransparency=1 _bY.BorderSizePixel=0 _bY.Size=UDim2.fromOffset(48,48)_bY.Position=UDim2.new(1,-56,0,4)_bY.ZIndex=5 _bY.ScaleType=Enum.ScaleType.Fit _bY.Image="rbxthumb://type=Asset&id=1293887215&w=150&h=150"_bY.ScaleType=Enum.ScaleType.Crop _bY.ImageTransparency=0 _bY.BackgroundColor3=Color3.fromRGB(20,24,40)_bY.BackgroundTransparency=0.3
                              local _bZ=_y.new("UICorner",_bY)_bZ.CornerRadius=UDim.new(0,12)
                              local _ca=_y.new("UIStroke",_bY)_ca.Color=Color3.fromRGB(140,190,255)_ca.Transparency=0.35 _ca.Thickness=1.2 pcall(function()
                                local _cb=game:GetService("TweenService")_bY.ImageTransparency=1 _bY.Position=UDim2.new(1,-90,0,-20)_cb:Create(_bY,TweenInfo.new(0.6,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Position=UDim2.new(1,-56,0,4),ImageTransparency=0.05,}):Play()task.spawn(function()
                                  local _cc=tick()
                                  while _bY and _bY.Parent do local _cd=math.sin((tick()-_cc)*1.4)*2.5 _bY.Position=UDim2.new(1,-56,0,4+_cd)_ca.Transparency=0.25+0.2*(0.5+0.5*math.sin((tick()-_cc)*2))task.wait(0.03)
                                  end
                                end)
                              end)
                              local _ce=_y.new("Frame",_bH["2"])_ce.Name="SHIZUKUSCRIPTS_CuteGlow"_ce.Visible=false _ce.BackgroundColor3=Color3.fromRGB(120,170,255)_ce.BackgroundTransparency=0.85 _ce.BorderSizePixel=0 _ce.Size=UDim2.fromOffset(52,52)_ce.Position=UDim2.new(1,-58,0,4)_ce.ZIndex=4
                              local _cf=_y.new("UICorner",_ce)_cf.CornerRadius=UDim.new(0,14)
                            end)_bH["9"]=_y.new("UIListLayout",_bH["7"])_bH["9"]["Padding"]=UDim.new(0,5)_bH["9"].SortOrder=Enum.SortOrder.LayoutOrder _bH["9"].Name="TabsListLayout"_bH["9"]["FillDirection"]=Enum.FillDirection.Horizontal _bH.a=_y.new("TextLabel",_bH["2"])_bH.a.TextWrapped=false _bH.a.TextStrokeTransparency=0 _bH.a.BorderSizePixel=0 _bH["a"].TextXAlignment=Enum.TextXAlignment.Right _bH.a["Visible"]=false _bH["a"].BackgroundColor3=_y.color(255,255,255)_bH.a.TextSize=12 _bH.a.FontFace=_y.font _bH.a.TextColor3=_y.color(255,255,255)_bH.a.BackgroundTransparency=1 _bH.a.Size=_y.udim2(0,500,0,14)_bH["a"]["BorderColor3"]=_y.color(0,0,0)_bH["a"].Text="" _bH["a"].Name="CreditTitle"_bH.a.Position=_y.udim2(0,110,0,530)_bH["b"]=_y.new("Frame",_bH["2"])_bH.b.BorderSizePixel=0 _bH["b"]["BackgroundColor3"]=_y.color(20,23,30)_bH.b.Size=_y.udim2(0,590,0,470)_bH.b.Position=_y.udim2(0.024,0,0.09,0)_bH.b.BorderColor3=_y.color(0,0,0)_bH.b["Name"]="MainFrame" _bH.c=_y.new("UICorner",_bH.b)_bH.c.Name="MainFrameCorner"_bH.c.CornerRadius=UDim.new(0,8)_bH["d"]=_y.new("UIStroke",_bH.b)_bH.d.ApplyStrokeMode=Enum.ApplyStrokeMode.Border _bH["d"].Name="MainFrameStroke"_bH.d.Color=_y.color(42,47,58)_bH.e=_y.new("Frame",_bH["2"])_bH.e.BackgroundTransparency=1 _bH.e.BorderSizePixel=0 _bH.e.Size=UDim2.fromScale(1,1)_bH.e.Name="Sections"
                            local _ch=coroutine.create(function()
                              while _y.wait_()do for _cg=1,#_bT do _y.wait_(2)_bU(_bH.a,_bT[_cg])
                                end
                              end
                            end)coroutine.resume(_ch)_bS.Tab=function(_ci,_cj,_ck)
                              local _cl="string"
                              if not type(_cj)==_cl then return
                              end
                              local _cm=_ck or false
                              local _cn={Sections={},SingleSection=_cm}
                              local _co=_bI:GetTextBoundary(_cj,Enum.Font.SourceSans.Value,16)_bH["8"]=_y.new("TextButton",_bH["7"])_bH["8"].TextStrokeTransparency=0 _bH["8"].BorderSizePixel=0 _bH["8"].TextSize=12 _bH["8"]["TextColor3"]=_y.color(137,138,139)_bH["8"]["BackgroundColor3"]=_y.color(255,255,255)_bH["8"].FontFace=_y.font _bH["8"].Size=_y.udim2(0,_co,1,0)_bH["8"].BackgroundTransparency=1 _bH["8"].Name="TextButton" _bH["8"].BorderColor3=_y.color(0,0,0)_bH["8"]["Text"]=_cj _bH["f"]=_y.new("Frame",_bH.e)_bH.f["Visible"]=true _bH.f.BorderSizePixel=0 _bH.f["BackgroundColor3"]=_y.color(255,255,255)_bH.f["Name"]="MainSectionFrame"_bH.f["Position"]=_y.udim2(1,0,0.142,0)_bH.f.Size=_y.udim2(0,590,0,470)_bH.f.BorderColor3=_y.color(0,0,0)_bH.f.BackgroundTransparency=1 _bH.f.Position=_y.udim2(0.024,0,0.09,0)
                              local _cp=_bH.f
                              if _cm then local _cq=_y.new("ScrollingFrame",_bH.f)_cq.Active=true _cq.BorderSizePixel=0 _cq["BackgroundColor3"]=_y.color(255,255,255)_cq.Name="SingleSection"_cq.ScrollBarImageTransparency=0 _cq.Size=_y.udim2(0,590,1,0)_cq.ScrollBarImageColor3=_y.color(0,255,255)_cq["BorderColor3"]=_y.color(0,0,0)_cq.ScrollBarThickness=3 _cq["BackgroundTransparency"]=1 _cq.AutomaticCanvasSize=Enum.AutomaticSize.Y _cq["Position"]=_y.udim2(0,0,0,0)_cq.BottomImage=""_cq.TopImage=""theme_event.Event:Connect(function()_cq.ScrollBarImageColor3=theme.scroll
                                end)_bH["11"]=_y.new("UIPadding",_cq)_bH["11"].PaddingTop=UDim.new(0,18)_bH["11"].Name="Frame" _bH["11"].PaddingLeft=UDim.new(0,7)_bH["11"].PaddingRight=UDim.new(0,7)_bH.LISTLAYOUT_SINGLE=_y.new("UIListLayout")_bH.LISTLAYOUT_SINGLE.Name="SingleSectionList"_bH["LISTLAYOUT_SINGLE"].Parent=_cq _bH.LISTLAYOUT_SINGLE.SortOrder=Enum.SortOrder.LayoutOrder _bH.LISTLAYOUT_SINGLE.Padding=UDim.new(0,19)
                                local _cr=_bH.LISTLAYOUT_SINGLE _cr.Changed:Connect(function()_cq.CanvasSize=_y.udim2(0,0,0,100+_cr.AbsoluteContentSize.Y)
                                end)_cn.Button=_bH["8"]_cn.MainSectionFrame=_cp _cn.MainContainer=_cq
                              else local _cs=_y.new("ScrollingFrame",_bH["f"])_cs.Active=true _cs["BorderSizePixel"]=0 _cs["BackgroundColor3"]=_y.color(255,255,255)_cs.Name="Left"_cs.ScrollBarImageTransparency=0 _cs.Size=_y.udim2(0,290,1,0)_cs["ScrollBarImageColor3"]=_y.color(0,255,255)_cs.BorderColor3=_y.color(0,0,0)_cs.ScrollBarThickness=3 _cs.BackgroundTransparency=1 _cs.AutomaticCanvasSize=Enum.AutomaticSize.Y _cs["Position"]=_y.udim2(0,0,0,0)_cs.BottomImage=""_cs.TopImage=""theme_event.Event:Connect(function()_cs.ScrollBarImageColor3=theme.scroll
                                end)_bH["11"]=_y.new("UIPadding",_cs)_bH["11"].PaddingTop=UDim.new(0,18)_bH["11"]["Name"]="LeftColumnPadding"_bH["11"].PaddingLeft=UDim.new(0,7)
                                local _ct=_y.new("ScrollingFrame",_bH["f"])_ct.Active=true _ct["BorderSizePixel"]=0 _ct.BackgroundColor3=_y.color(255,255,255)_ct.Name="Right"_ct.ScrollBarImageTransparency=0 _ct.Size=_y.udim2(0,290,1,0)_ct.ScrollBarImageColor3=_y.color(0,255,255)_ct["BorderColor3"]=_y.color(0,0,0)_ct.ScrollBarThickness=3 _ct.BackgroundTransparency=1 _ct.AutomaticCanvasSize=Enum.AutomaticSize.Y _ct["Position"]=_y.udim2(0,290,0,0)_ct.BottomImage=""_ct.TopImage=""theme_event.Event:Connect(function()_ct.ScrollBarImageColor3=theme.scroll
                                end)_bH["20"]=_y.new("UIPadding",_ct)_bH["20"].PaddingTop=UDim.new(0,18)_bH["20"].PaddingRight=UDim.new(0,5)_bH["20"].PaddingLeft=UDim.new(0,6)_bH["20"].Name="RightColumnPadding"_bH.LISTLAYOUT_LEFT=_y.new("UIListLayout")_bH.LISTLAYOUT_LEFT.Name="LeftColumnList"_bH.LISTLAYOUT_LEFT.Parent=_cs _bH.LISTLAYOUT_LEFT.SortOrder=Enum.SortOrder.LayoutOrder _bH.LISTLAYOUT_LEFT.Padding=UDim.new(0,14)_bH.LISTLAYOUT_RIGHT=_y.new("UIListLayout")_bH["LISTLAYOUT_RIGHT"].Name="RightColumnList"_bH.LISTLAYOUT_RIGHT.Parent=_ct _bH["LISTLAYOUT_RIGHT"].SortOrder=Enum.SortOrder.LayoutOrder _bH.LISTLAYOUT_RIGHT.Padding=UDim.new(0,19)
                                local _cu=_bH.LISTLAYOUT_LEFT
                                local _cv=_bH["LISTLAYOUT_RIGHT"]_cu.Changed:Connect(function()_cs.CanvasSize=_y.udim2(0,0,0,100+_cu.AbsoluteContentSize.Y)
                                end)_cv.Changed:Connect(function()_ct.CanvasSize=_y.udim2(0,0,0,100+_cv.AbsoluteContentSize.Y)
                                end)_cn.Button=_bH["8"]_cn.MainSectionFrame=_cp _cn.Left=_cs _cn.Right=_ct
                              end _cn.Select=function()_bG:RemovePopups()
                                local _cw=next
                                local _cx,_cy=_bH.e:GetChildren()
                                for _cz,_cA in _cw,_cx,_cy do if _cA:IsA("UIListLayout")then return
                                  end _cA.Visible=false
                                end
                                local _cB=next
                                local _cC,_cD=_bH["7"]:GetChildren()
                                for _cE,_cF in _cB,_cC,_cD do if _cF:IsA("TextButton")then _cF.TextColor3=_y.color(137,137,139)
                                  end
                                end _cn.Button.TextColor3=_y.color(255,255,255)_cn.MainSectionFrame.Visible=true
                              end _cn.Button.MouseButton1Click:Connect(function()_cn:Select()
                              end)_cn.Section=function(_cG,_cH,_cI)
                                if not type(_cH)=="string"then return
                                end
                                if not _cn.SingleSection then if not type(_cI)=="string"then return
                                  end
                                end
                                local _cJ=_cn.SingleSection and _cn.MainContainer or _cI=="right"and _cn.Right or _cn.Left
                                local _cK={}
                                local _cL=_cn.SingleSection and 510 or 247
                                local _cM=_cn.SingleSection and 492 or 229
                                local _cN=_cn.SingleSection and 0 or 20
                                local _cO=_y.new("Frame",_cJ)_cO["BorderSizePixel"]=0 _cO.BackgroundColor3=_y.color(28,28,28)_cO.Size=_y.udim2(0,_cL,0,_cN)_cO["Position"]=_y.udim2(0,6,0,0)_cO.BorderColor3=_y.color(0,0,0)_cO["Name"]="Column"
                                local _cP=_y.new("UIStroke",_cO)_cP["ApplyStrokeMode"]=Enum.ApplyStrokeMode.Border _cP.Name="ColumnStroke"_cP.Color=_y.color(37,37,37)
                                local _cQ="Name" _y.new("UICorner",_cO)[_cQ]="ColumnCorner"
                                local _cR=_y.new("TextLabel",_cO)_cR.TextStrokeTransparency=0 _cR.BorderSizePixel=0 _cR.TextXAlignment=Enum.TextXAlignment.Left _cR.BackgroundColor3=_y.color(255,255,255)_cR["TextSize"]=12 _cR.FontFace=_y.font _cR.TextColor3=_y.color(255,255,255)_cR.BackgroundTransparency=1 _cR.Size=_y.udim2(0,_cM,0,16)_cR["BorderColor3"]=_y.color(0,0,0)_cR.Text=_cH _cR.Name="ColumnTitle"_cR.Position=_y.udim2(0,8,0,0)
                                local _cS=_y.new("UIListLayout",_cO)_cS.Padding=UDim.new(0,2)_cS["SortOrder"]=Enum.SortOrder.LayoutOrder _cS["Name"]="ColumnListLayout"
                                local _cT=_y.new("UIPadding",_cO)_cT.Name="UIPadding" _cT.PaddingLeft=UDim.new(0,9)
                                local _cU=_cn.SingleSection and 340 or 0
                                local _cV=_y.new("Frame",_cO)_cV.BorderSizePixel=0 _cV["BackgroundColor3"]=_y.color(255,255,255)_cV.Size=_y.udim2(0,_cM,0,_cU)_cV.Position=_y.udim2(0,0,0,16)_cV["BorderColor3"]=_y.color(0,0,0)_cV.Name=tostring(math.random(10000,16384))_cV.BackgroundTransparency=1
                                local _cW=_y.new("UIListLayout",_cV)_cW["Padding"]=UDim.new(0,5)_cW["SortOrder"]=Enum.SortOrder.LayoutOrder _cW.Name="ColumnComponentsList"
                                local function _cX(_cY)
                                  if _cn.SingleSection then return
                                  end
                                  local _cZ="Position" _cV[_cZ]=_cV[_cZ]+_y.udim2(0,0,0,_cY)_cO.Size=_y.udim2(0,_cL,0,22+_cW.AbsoluteContentSize.Y)
                                end _cK.Button=function(_da,_db)
                                  local _dc={title=_db.title or "button",callback=_db.callback or function()
                                  end,}
                                  local _dd=_y.new("TextButton")
                                  local _de=_y.new("UICorner")_dd.Name="Button"_dd.Parent=_cV _dd.BackgroundColor3=_y.color(21,21,21)_dd.BorderColor3=_y.color(0,0,0)_dd.BorderSizePixel=0 _dd.Size=_y.udim2(0,159,0,23)_dd.AutoButtonColor=false _dd.FontFace=_y.font _dd.Text=_dc.title _dd.TextColor3=_y.color(255,255,255)_dd.TextSize=12 _dd.TextStrokeTransparency=0 _dd.TextWrapped=true _de.CornerRadius=UDim.new(0,2)_de.Name="ButtonCorner"_de.Parent=_dd
                                  local _df=_y.new("UIStroke",_dd)_df.ApplyStrokeMode=Enum.ApplyStrokeMode.Border _df.Name="UIStroke" _df.Color=_y.color(48,54,68)
                                  local _dm={OnClick=function()
                                    local _dg=tweenService:Create(_dd,TweenInfo.new(0),{BackgroundColor3=_y.color(36,36,36)})
                                    local _dh=tweenService:Create(_df,TweenInfo.new(0),{Color=_y.color(40,43,46)})_dg:Play()_dh:Play()
                                  end,OnHover=function()
                                    local _di=tweenService:Create(_dd,TweenInfo.new(0),{BackgroundColor3=_y.color(28,28,28)})
                                    local _dj=tweenService:Create(_df,TweenInfo.new(0),{Color=_y.color(36,36,36)})_di:Play()_dj:Play()
                                  end,OnMouseLeave=function()
                                    local _dk=tweenService:Create(_dd,TweenInfo.new(0),{BackgroundColor3=_y.color(21,21,21)})
                                    local _dl=tweenService:Create(_df,TweenInfo.new(0),{Color=_y.color(40,40,40)})_dk:Play()_dl:Play()
                                  end,}
                                  local _dn={TextColor3=theme.accent}
                                  local _do=tweenService:Create(_dd,TweenInfo.new(0.2),_dn)
                                  local _dp=tweenService:Create(_dd,TweenInfo.new(0.2),{TextColor3=_y.color(255,255,255)})theme_event.Event:Connect(function()
                                    local _dq={TextColor3=theme.accent}_do=tweenService:Create(_dd,TweenInfo.new(0.2),_dq)
                                  end)_dd.MouseButton1Click:Connect(function()_dm.OnClick()pcall(_dc.callback)_do:Play()_y.wait_(0.1)_dm.OnHover()_y.wait_(0.1)_dp:Play()
                                  end)_dd.MouseEnter:Connect(_dm.OnHover)_dd.MouseLeave:Connect(_dm.OnMouseLeave)_cX(23)
                                end _cK.Colorpicker=function(_dr,_ds,_dt)
                                  local _du={Title=_ds.title or "colorpicker"}_du.Default=_ds.default or _y.color(255,255,255)_du.Transparency=_ds.transparency or 0 _du.Callback=_ds.callback or function()
                                  end _du.Flag=_bG:GetNextFlag()
                                  local _dv={TransparencyValue=0,ColorValue=nil,HuePosition=0,SlidingSat=false,SlidingHue=false,SlidingAlpha=false,}
                                  local _dw=_y.new("Frame")
                                  local _dx=_y.new("TextLabel")
                                  local _dy=_y.new("TextButton")
                                  local _dz=_y.new("Frame")
                                  local _dA=_y.new("Frame")
                                  local _dB=_y.new("UICorner")
                                  local _dC=_y.new("Frame")
                                  local _dD=_y.new("Frame")
                                  local _dE=_y.new("Frame")
                                  local _dF=_y.new("UIGradient")
                                  local _dG=_y.new("ImageLabel")
                                  local _dH=_y.new("TextButton")
                                  local _dI=_y.new("Frame")
                                  local _dJ=_y.new("ImageLabel")
                                  local _dK=_y.new("ImageLabel")
                                  local _dL=_y.new("TextButton")
                                  local _dM=_y.new("ImageLabel")
                                  local _dN=_y.new("Frame")
                                  local _dO=_y.new("UIGradient")
                                  local _dP=_y.new("ImageLabel")
                                  local _dQ=_y.new("TextButton")_dw.Name="ColorpickerHolder"_dw.Parent=_dt==nil and _cV or _dt
                                  if _dt then local _dR=_dt:FindFirstChild("SettingsButton")_dR=_dR and _dR.Position.X.Scale*216+_dR.Position.X.Offset-18 or 20
                                    local _dS=0
                                    for _dT,_dU in ipairs(_dt:GetChildren())do if _dU.Name=="SettingsButton" then _dS+=1
                                      end
                                    end _dw.Position=_y.udim2(0,_dR-20*(_dS-1)-20,0,0)
                                  end _dw.BackgroundColor3=_y.color(255,255,255)_dw.BackgroundTransparency=1 _dw.BorderColor3=_y.color(0,0,0)_dw.BorderSizePixel=0 _dw.Size=_y.udim2(0,216,0,16)
                                  if _dt==nil then _dx.Name="ColorpickerTitle"_dx.Parent=_dw _dx.BackgroundColor3=_y.color(255,255,255)_dx.BackgroundTransparency=1 _dx.BorderColor3=_y.color(0,0,0)_dx.BorderSizePixel=0 _dx.Size=_y.udim2(0,216,0,13)_dx.FontFace=_y.font _dx.Text=_du.Title _dx.TextColor3=_y.color(255,255,255)_dx.TextSize=12 _dx.TextXAlignment=Enum.TextXAlignment.Left
                                  end _dy.Name="TextButton" _dy.Parent=_dw _dy.BackgroundColor3=_y.color(255,255,255)_dy.BackgroundTransparency=1 _dy.BorderColor3=_y.color(0,0,0)_dy.BorderSizePixel=0 _dy.Position=_y.udim2(0.943231463,0,0,0)_dy.Size=_y.udim2(0,13,0,13)_dy.FontFace=_y.font _dy.Text=""_dy.TextColor3=_y.color(0,0,0)_dy.TextSize=12
                                  local _dV=_y.new("ImageLabel")_dV.Name="ImageLabel" _dV.Parent=_dw _dV.BackgroundTransparency=1 _dV.BorderSizePixel=0 _dV.Position=_y.udim2(0.943231463,0,0,0)_dV.Size=_y.udim2(0,13,0,13)_dV.Image="rbxassetid://101382427624863"_dV.ScaleType=Enum.ScaleType.Tile _dV.TileSize=_y.udim2(0,6,0,6)
                                  local _dW=_y.new("UICorner")_dW.CornerRadius=UDim.new(0,4)_dW.Name="ColorpickerStatusAlphaCorner"_dW.Parent=_dV _dz.Name="Frame" _dz.Parent=_dw _dz.BackgroundColor3=_y.color(86,170,255)_dz.BorderColor3=_y.color(0,0,0)_dz.BorderSizePixel=0 _dz.Position=_y.udim2(0.943231463,0,0,0)_dz.Size=_y.udim2(0,13,0,13)_dA.Name="ColorpickerInline"_dA.Parent=_bH["1"]_dA.BackgroundColor3=_y.color(86,170,255)_dA.BackgroundTransparency=1 _dA.BorderColor3=_y.color(0,0,0)_dA.BorderSizePixel=0 _dA.Position=_y.udim2(0,0,0,0)_dA.Size=_y.udim2(0,13,0,13)_dA.Visible=false _dA.ZIndex=3 _dB.CornerRadius=UDim.new(0,2)_dB.Name="Frame" _dB.Parent=_dA
                                  local _dX=_y.new("UICorner")_dX.CornerRadius=UDim.new(0,5)_dX.Name="ColorpickerStatusCorner"_dX.Parent=_dz _dC.Name="ColorpickerContent"_dC.Parent=_dA _dC.BackgroundColor3=_y.color(23,23,23)_dC.BorderColor3=_y.color(0,0,0)_dC.Position=_y.udim2(-9.46153831,0,0,0)_dC.Size=_y.udim2(0,136,0,159)_dC.ZIndex=3 _dD.Name="Frame" _dD.Parent=_dC _dD.BackgroundColor3=_y.color(166,157,159)_dD.BorderColor3=_y.color(0,0,0)_dD.Size=_y.udim2(1,0,0,1)_dE.Name="HueBackground"_dE.Parent=_dC _dE.BackgroundColor3=_y.color(255,255,255)_dE.BorderColor3=_y.color(0,0,0)_dE.BorderSizePixel=0 _dE.Position=_y.udim2(1,0,0,29)_dE.Size=_y.udim2(0,9,0,106)
                                  local _dY=ColorSequence.new
                                  local _dZ={}
                                  local _ea=ColorSequenceKeypoint.new(0,_y.color(255,0,0))
                                  local _eb=ColorSequenceKeypoint.new(0.17,_y.color(255,0,255))
                                  local _ec=ColorSequenceKeypoint.new(0.33,_y.color(0,0,255))
                                  local _ed=ColorSequenceKeypoint.new(0.5,_y.color(0,255,255))
                                  local _ee=ColorSequenceKeypoint.new(0.67,_y.color(0,255,0))
                                  local _ef=ColorSequenceKeypoint.new(0.83,_y.color(255,255,0))_dZ[1]=_ea _dZ[2]=_eb _dZ[3]=_ec _dZ[4]=_ed _dZ[5]=_ee _dZ[6]=_ef do local _eg=table.pack(ColorSequenceKeypoint.new(1,_y.color(255,0,0)))table.move(_eg,1,_eg.n,7,_dZ)
                                  end _dF.Color=_dY(_dZ)_dF.Rotation=90 _dF.Name="CPHueGradient"_dF.Parent=_dE _dG.Name="HuePicker"_dG.Parent=_dE _dG.BackgroundColor3=_y.color(255,255,255)_dG.BackgroundTransparency=1 _dG.BorderColor3=_y.color(0,0,0)_dG.BorderSizePixel=0 _dG.Position=_y.udim2(0,-5,0,-2)_dG.Size=_y.udim2(0,17,0,5)_dG.Image="rbxassetid://13900818694"_dH.Parent=_dE _dH.BackgroundColor3=_y.color(255,255,255)_dH.BackgroundTransparency=1 _dH.BorderColor3=_y.color(0,0,0)_dH.BorderSizePixel=0 _dH.Size=_y.udim2(1,0,1,0)_dH.FontFace=_y.font _dH.Text=""_dH.TextColor3=_y.color(0,0,0)_dH.TextSize=12 _dI.Name="SaturationBackground"_dI.Parent=_dC _dI.BackgroundColor3=_y.color(255,255,255)_dI.BorderColor3=_y.color(0,0,0)_dI.Position=_y.udim2(0.0661764741,0,0,40)_dI.Size=_y.udim2(0,102,0,106)_dJ.Name="SaturationImage"_dJ.Parent=_dI _dJ.BackgroundColor3=_y.color(255,255,255)_dJ.BackgroundTransparency=1 _dJ.BorderColor3=_y.color(0,0,0)_dJ.Size=_y.udim2(1,0,1,0)_dJ.Image="rbxassetid://13901004307"_dK.Name="ImageLabel" _dK.Parent=_dI _dK.BackgroundColor3=_y.color(255,255,255)_dK.BackgroundTransparency=1 _dK.BorderColor3=_y.color(0,0,0)_dK.Position=_y.udim2(0,-1,0,-1)_dK.Size=_y.udim2(0,5,0,5)_dK.Image="rbxassetid://13900819741"_dL.Name="TextButton" _dL.Parent=_dI _dL.BackgroundColor3=_y.color(255,255,255)_dL.BackgroundTransparency=1 _dL.BorderColor3=_y.color(0,0,0)_dL.BorderSizePixel=0 _dL.Size=_y.udim2(1,0,1,0)_dL.FontFace=_y.font _dL.Text=""_dL.TextColor3=_y.color(0,0,0)_dL.TextSize=12 _dM.Name="TransparencyAlphaBG"_dM.Parent=_dC _dM.BackgroundTransparency=1 _dM.BorderSizePixel=0 _dM.Position=_y.udim2(1,0,0,142)_dM.Size=_y.udim2(0,123,0,6)_dM.Image="rbxassetid://101382427624863"_dM.ScaleType=Enum.ScaleType.Tile _dM.TileSize=_y.udim2(0,6,0,6)_dN.Name="TransparencyBackground"_dN.Parent=_dC _dN.BackgroundColor3=_y.color(255,255,255)_dN.BorderColor3=_y.color(0,0,0)_dN.BorderSizePixel=0 _dN.Position=_y.udim2(1,0,0,142)_dN.Size=_y.udim2(0,123,0,6)
                                  local _eh=ColorSequence.new
                                  local _ei={}
                                  local _ej=ColorSequenceKeypoint.new(0,_y.color(255,255,255))
                                  local _ek=ColorSequenceKeypoint.new(0.57,_y.color(0,0,150))
                                  local _el=ColorSequenceKeypoint.new _ei[1]=_ej _ei[2]=_ek do local _em=table.pack(_el(1,_y.color(0,0,0)))table.move(_em,1,_em.n,3,_ei)
                                  end _dO.Color=_eh(_ei)
                                  local _en=NumberSequenceKeypoint.new _dO.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0),_en(1,1)})_dO.Name="Frame" _dO.Parent=_dN _dP.Name="TransparencyPicker"_dP.Parent=_dN _dP.BackgroundColor3=_y.color(255,255,255)_dP.BackgroundTransparency=1 _dP.BorderColor3=_y.color(0,0,0)_dP.BorderSizePixel=0 _dP.Position=_y.udim2(0,-2,0,-2)_dP.Size=_y.udim2(0,5,0,5)_dP.Image="rbxassetid://14248606745"_dQ.Name="TransparencyButton"_dQ.Parent=_dN _dQ.BackgroundColor3=_y.color(255,255,255)_dQ.BackgroundTransparency=1 _dQ.BorderColor3=_y.color(0,0,0)_dQ.BorderSizePixel=0 _dQ.Size=_y.udim2(1,0,1,0)_dQ.FontFace=_y.font _dQ.Text=""_dQ.TextColor3=_y.color(0,0,0)_dQ.TextSize=12
                                  local _eo=next
                                  local _ep,_eq=_dC:GetDescendants()
                                  for _er,_es in _eo,_ep,_eq do if not _es:IsA("UIGradient")then if _es.ZIndex then _es.ZIndex=3
                                      end
                                    end
                                  end _dC.Size=_y.udim2(0,136,0,139)_dE.Position=UDim2.fromOffset(120,9)_dI.Position=UDim2.fromOffset(9,9)_dM.Position=UDim2.fromOffset(6,122)_dN.Position=UDim2.fromOffset(6,122)
                                  local _et,_eu,_ev=_du.Default:ToHSV()
                                  local _ew _ew={Open=function(_ex)_dC.Visible=true _dA.Visible=true
                                    local _ey=_dy.AbsolutePosition
                                    local _ez=_bH["1"].IgnoreGuiInset and Vector2.zero or game:GetService("GuiService"):GetGuiInset()
                                    local _eA=workspace.CurrentCamera.ViewportSize
                                    local _eB,_eC=_ey.X-_ez.X,_ey.Y-_ez.Y
                                    local _eD=_eB+18
                                    if _eD+136>_eA.X-6 then _eD=_eB-142
                                    end _eD=math.clamp(_eD,6,math.max(6,_eA.X-142))
                                    local _eE=math.clamp(_eC,6,math.max(6,_eA.Y-145))_dA.Position=UDim2.fromOffset(_eB,_eC)_dA.Size=UDim2.fromOffset(13,13)tweenService:Create(_dC,TweenInfo.new(0.15),{BackgroundTransparency=0,Position=UDim2.fromOffset(_eD-_eB,_eE-_eC)}):Play()_ex:FadeIn()
                                  end,FadeIn=function()
                                    for _eF,_eG in pairs(_dC:GetDescendants())do if _eG:IsA("Frame")then local _eH={BackgroundTransparency=0}tweenService:Create(_eG,TweenInfo.new(0.15),_eH):Play()
                                      elseif _eG:IsA("ImageLabel")then local _eI={ImageTransparency=0}tweenService:Create(_eG,TweenInfo.new(0.15),_eI):Play()
                                      elseif _eG:IsA("TextLabel")or _eG:IsA("TextButton")then local _eJ={TextTransparency=0}tweenService:Create(_eG,TweenInfo.new(0.15),_eJ):Play()
                                      end
                                    end
                                  end,FadeOut=function()
                                    for _eK,_eL in pairs(_dC:GetDescendants())do if _eL:IsA("Frame")then tweenService:Create(_eL,TweenInfo.new(0.15),{BackgroundTransparency=1}):Play()
                                      elseif _eL:IsA("ImageLabel")then local _eM={ImageTransparency=1}tweenService:Create(_eL,TweenInfo.new(0.15),_eM):Play()
                                      elseif _eL:IsA("TextLabel")or _eL:IsA("TextButton")then tweenService:Create(_eL,TweenInfo.new(0.15),{TextTransparency=1}):Play()
                                      end
                                    end
                                  end,Close=function()tweenService:Create(_dC,TweenInfo.new(0.15),{BackgroundTransparency=1,Position=_y.udim2(-9.46153831,0,0,0)}):Play()_ew:FadeOut()_y.wait_(0.1)_dC.Visible=false _dA.Visible=false
                                  end,}
                                  local function _eN(_eO,_eP,_eQ)
                                    return(_y.color(_eO,_eP,_eQ))
                                  end _du.Set=function(_eR,_eS,_eT,_eU)
                                    if not _du.Transparency then _dv.TransparencyValue=1
                                    end _eT=_eT or _dv.TransparencyValue
                                    local _eV,_eW
                                    if typeof(_eS)=="table"then local _eX=Color3.fromHex(_eS[1])
                                      if _eS[2]==nil then _eV=_eT _eW=_eX
                                      else _eV=_eS[2]_eW=_eX
                                      end
                                    else _eV=_eT _eW=_eS
                                    end
                                    local _eY,_eZ,_fa=_eW:ToHSV()_et=_eY _eu=_eZ _ev=_fa _dv.ColorValue=_eW _dv.TransparencyValue=_eV _dI.BackgroundColor3=Color3.fromHSV(_dv.HuePosition,1,1)_dz.BackgroundColor3=_eW _dz.BackgroundTransparency=1-_eV
                                    if not _eU then local _fb=math.clamp
                                      local _fc=_dI.AbsoluteSize.Y-_ev*_dI.AbsoluteSize.Y
                                      local _fd=_dI.AbsoluteSize.Y-3 _dK.Position=_y.udim2(0,math.clamp(_eu*_dI.AbsoluteSize.X,0,_dI.AbsoluteSize.X-3),0,_fb(_fc,0,_fd))_dv.HuePosition=_et _dG.Position=_y.udim2(0,-2,1-_et,-2)
                                    end pcall(_du.Callback,_eN(_eW.R*255,_eW.G*255,_eW.B*255),_eV)_bG.Flags[_du.Flag]={_eN(_eW.R*255,_eW.G*255,_eW.B*255):ToHex(),_eV}
                                  end _du:Set(_du.Default,_du.Transparency)
                                  local function _fe(_ff)
                                    local _fg=math.clamp((_ff.Position.X-_dI.AbsolutePosition.X)/_dI.AbsoluteSize.X,0,1)
                                    local _fh=1-math.clamp((_ff.Position.Y-_dI.AbsolutePosition.Y)/_dI.AbsoluteSize.Y,0,1)
                                    local _fi=math.clamp((_ff.Position.Y-_dI.AbsolutePosition.Y)/_dI.AbsoluteSize.Y*_dI.AbsoluteSize.Y,0,_dI.AbsoluteSize.Y-3)_dK.Position=_y.udim2(0,math.clamp((_ff.Position.X-_dI.AbsolutePosition.X)/_dI.AbsoluteSize.X*_dI.AbsoluteSize.X,0,_dI.AbsoluteSize.X-4),0,_fi)
                                    local _fj=_dv.TransparencyValue _du:Set(Color3.fromHSV(_dv.HuePosition,_fg,_fh),_fj,true)
                                  end _dL.MouseButton1Down:Connect(function()_dv.SlidingSat=true _fe({Position=game.UserInputService:GetMouseLocation()-_y.vector2(0,36)})
                                  end)
                                  local function _fk(_fl)
                                    local _fm=1-math.clamp((_fl.Position.Y-_dE.AbsolutePosition.Y)/_dE.AbsoluteSize.Y,0,1)_dG.Position=_y.udim2(0,-2,0,math.clamp((_fl.Position.Y-_dE.AbsolutePosition.Y)/_dE.AbsoluteSize.Y*_dE.AbsoluteSize.Y,0,_dE.AbsoluteSize.Y-2)-2)_dv.HuePosition=_fm _du:Set(Color3.fromHSV(_fm,_eu,_ev),_dv.TransparencyValue,true)
                                  end _dH.MouseButton1Down:Connect(function()_dv.SlidingHue=true _fk({Position=game.UserInputService:GetMouseLocation()-_y.vector2(0,36)})
                                  end)
                                  local function _fn(_fo)
                                    local _fp=1-math.clamp((_fo.Position.X-_dN.AbsolutePosition.X)/_dN.AbsoluteSize.X,0,1)_dP.Position=_y.udim2(0,math.clamp((_fo.Position.X-_dN.AbsolutePosition.X)/_dN.AbsoluteSize.X*_dN.AbsoluteSize.X,0,_dN.AbsoluteSize.X-3),0,-2)_du:Set(Color3.fromHSV(_dv.HuePosition,_eu,_ev),_fp,true)
                                  end _dQ.MouseButton1Down:Connect(function()_dv.SlidingAlpha=true _fn({Position=game.UserInputService:GetMouseLocation()-_y.vector2(0,36)})
                                  end)inputService.InputEnded:Connect(function(_fq)
                                    if _fq.UserInputType==Enum.UserInputType.MouseButton1 then local _fr=_dv
                                      local _fs=_dv _dv.SlidingSat=false _fr.SlidingHue=false _fs.SlidingAlpha=false
                                    end
                                  end)inputService.InputChanged:Connect(function(_ft)
                                    if _ft.UserInputType==Enum.UserInputType.MouseMovement then if _dv.SlidingSat then _fe(_ft)
                                      elseif _dv.SlidingHue then _fk(_ft)
                                      elseif _dv.SlidingAlpha then _fn(_ft)
                                      end
                                    end
                                  end)_dy.MouseButton1Click:Connect(function()
                                    if _bG.Popup and _bG.Popup.ID~=_dw.Name then _bG:RemovePopups()
                                    end
                                    if _dA.Visible then _ew:Close()
                                    else _bG:NewPopup({Remove=_ew.Close,ID=_dw.Name})_ew:Open()
                                    end
                                  end)
                                  local _fu=_y.new("Frame")
                                  local _fv=_y.new("UICorner")
                                  local _fw=_y.new("UIStroke")
                                  local _fx=_y.new("UIListLayout")
                                  local _fy=_y.new("TextButton")
                                  local _fz=_y.new("TextButton")_fu.Name="CPContextMenu"_fu.Parent=_bH["1"]_fu.BackgroundColor3=_y.color(15,15,15)_fu.BorderColor3=_y.color(0,0,0)_fu.BorderSizePixel=0 _fu.Position=_y.udim2(0,0,0,0)_fu.Size=_y.udim2(0,68,0,28)_fu.Visible=false _fu.ClipsDescendants=false _fu.ZIndex=4 _fv.Name="CPContextCorner"_fv.Parent=_fu _fv.CornerRadius=UDim.new(0,3)_fw.Name="CPContextStroke"_fw.Parent=_fu _fw.ApplyStrokeMode=Enum.ApplyStrokeMode.Border _fw.Color=_y.color(48,54,68)_fx.Name="CPContextList"_fx.Parent=_fu _fx.SortOrder=Enum.SortOrder.LayoutOrder _fy.Name="CopyButton"_fy.Parent=_fu _fy.BackgroundColor3=_y.color(19,22,29)_fy.BorderColor3=_y.color(43,49,61)_fy.BorderSizePixel=0 _fy.Size=_y.udim2(1,0,0,14)_fy.ZIndex=4 _fy.FontFace=_y.font _fy.Text="copy"_fy.TextColor3=_y.color(129,129,129)_fy.TextSize=12 _fy.LayoutOrder=1 _fz.Name="TextButton" _fz.Parent=_fu _fz.BackgroundColor3=_y.color(19,22,29)_fz.BorderColor3=_y.color(43,49,61)_fz.BorderSizePixel=0 _fz.Size=_y.udim2(1,0,0,16)_fz.ZIndex=4 _fz.FontFace=_y.font _fz.Text="paste"_fz.TextColor3=_y.color(129,129,129)_fz.TextSize=12 _fz.LayoutOrder=2
                                  local function _fA()_fu.Visible=false
                                  end _fy.MouseButton1Click:Connect(function()_bG.ClipboardColor=_dv.ColorValue _fA()
                                  end)_fz.MouseButton1Click:Connect(function()
                                    if _bG.ClipboardColor then _du:Set(_bG.ClipboardColor)
                                    end _fA()
                                  end)_dy.InputBegan:Connect(function(_fB)
                                    if _fB.UserInputType==Enum.UserInputType.MouseButton2 then if _bG.Popup and _bG.Popup.ID~=_dw.Name.."_context"then _bG:RemovePopups()
                                      end
                                      if _fu.Visible then _fA()
                                      else local _fC=_dw.AbsolutePosition _fu.Position=_y.udim2(0,_fC.X+_dw.AbsoluteSize.X-68,0,_fC.Y+15)_fu.Visible=true _bG:NewPopup({Remove=_fA,ID=_dw.Name.."_context"})
                                      end
                                    end
                                  end)_cX(13)_bG.ConfigFlags[_du.Flag]=function(_fD)_du:Set(_fD)
                                  end
                                  return _du
                                end _cK.Dropdown=function(_fE,_fF)
                                  local _fG={Title=_fF.title or"",Content=_fF.values or{},Default=_fF.default or "-",Multi=_fF.multi or false,Callback=_fF.callback or function()
                                  end,}_fG.Flag=_bG:GetNextFlag()
                                  local _fH={FValues={},FValue=_fG.Multi and{}or""}
                                  local _fI=_y.new("Frame")
                                  local _fJ=_y.new("TextLabel")_fI.Name=tostring(math.random(100,999999))_fI.Parent=_cV _fI.BackgroundColor3=_y.color(255,255,255)_fI.BackgroundTransparency=1 _fI.BorderColor3=_y.color(0,0,0)_fI.BorderSizePixel=0 _fI.Size=_y.udim2(0,159,0,40)_fJ.Name="DropdownTitle"_fJ.Parent=_fI _fJ.BackgroundColor3=_y.color(255,255,255)_fJ.BackgroundTransparency=1 _fJ.BorderColor3=_y.color(0,0,0)_fJ.BorderSizePixel=0 _fJ.Size=_y.udim2(0,164,0,16)_fJ.FontFace=_y.font _fJ.Text=_fG.Title _fJ.TextColor3=_y.color(255,255,255)_fJ.TextSize=12 _fJ.TextXAlignment=Enum.TextXAlignment.Left
                                  local _fK=_y.new("UIListLayout",_fI)_fK.Padding=UDim.new(0,5)_fK["SortOrder"]=Enum.SortOrder.LayoutOrder _fK.Name="ColumnListLayout"
                                  local _fL=_y.new("TextButton")
                                  local _fM=_y.new("UICorner")
                                  local _fN=_y.new("UIStroke")
                                  local _fO=_y.new("ImageLabel")
                                  local _fP=_y.new("TextLabel")_fL.Name="TextButton" _fL.Parent=_fI _fL.ZIndex=2 _fL.Size=_y.udim2(0,159,0,22)_fL.BorderColor3=_y.color(43,49,61)_fL.Position=_y.udim2(0,0,0.576923072,0)_fL.BackgroundColor3=_y.color(21,21,21)_fL.AutoButtonColor=false _fL.TextColor3=_y.color(255,255,255)_fL.Text=""_fL.TextXAlignment=Enum.TextXAlignment.Left _fL.TextSize=12 _fL.TextTruncate=Enum.TextTruncate.AtEnd _fL.FontFace=_y.font _fM.Name="OpenButtonCorner"_fM.Parent=_fL _fM.CornerRadius=UDim.new(0,3)_fN.Name="OpenButtonStroke"_fN.Parent=_fL _fN.ApplyStrokeMode=Enum.ApplyStrokeMode.Border _fN.Color=_y.color(37,37,37)_fO.Name="Frame" _fO.Parent=_fL _fO.ZIndex=4 _fO.Size=_y.udim2(0,12,0,6)_fO.BorderColor3=_y.color(0,0,0)_fO.BackgroundTransparency=1 _fO.Position=_y.udim2(0.899999938,0,0.322727214,0)_fO.BorderSizePixel=0 _fO.BackgroundColor3=_y.color(255,255,255)_fO.Image="rbxassetid://17830630301"_fP.Name="DropdownText"_fP.Parent=_fL _fP.ZIndex=4 _fP.Size=_y.udim2(0,204,0,22)_fP.BorderColor3=_y.color(0,0,0)_fP.BackgroundTransparency=1 _fP.Position=_y.udim2(0.0430434781,0,0,0)_fP.BorderSizePixel=0 _fP.BackgroundColor3=_y.color(255,255,255)_fP.TextColor3=_y.color(255,255,255)_fP.Text=_fG.Default _fP.TextXAlignment=Enum.TextXAlignment.Left _fP.TextSize=12 _fP.FontFace=_y.font _fP.TextTruncate="AtEnd"
                                  local _fQ=_y.new("Frame")
                                  local _fR=_y.new("UICorner")
                                  local _fS=_y.new("UIStroke")
                                  local _fT=_y.new("UIListLayout")_fQ.Name="Inline"_fQ.Parent=_fL _fQ.Size=_y.udim2(0,159,0,0)_fQ.BorderColor3=_y.color(0,0,0)_fQ.Position=_y.udim2(0,0,1,0)_fQ.BorderSizePixel=0 _fQ.BackgroundColor3=_y.color(15,15,15)_fQ.Visible=false _fQ.ZIndex=3 _fR.Name="InlineCorner"_fR.Parent=_fQ _fR.CornerRadius=UDim.new(0,3)_fS.Name="InlineStroke"_fS.Parent=_fQ _fS.ApplyStrokeMode=Enum.ApplyStrokeMode.Border _fS.Color=_y.color(37,37,37)_fT.Name="InlineList"_fT.Parent=_fQ
                                  local _fU _fU={Open=function(_fV)_fQ.AnchorPoint=Vector2.new(0,1)_fQ.Position=UDim2.new(0,0,0,0)_fQ.Visible=true tweenService:Create(_fO,TweenInfo.new(0.15),{Rotation=180}):Play()
                                    local _fW={BackgroundTransparency=0}tweenService:Create(_fQ,TweenInfo.new(0.15),_fW):Play()_fV:FadeIn()
                                  end,FadeIn=function()
                                    for _fX,_fY in pairs(_fQ:GetDescendants())do if _fY:IsA("Frame")then tweenService:Create(_fY,TweenInfo.new(0.15),{BackgroundTransparency=0}):Play()
                                      elseif _fY:IsA("TextButton")then tweenService:Create(_fY,TweenInfo.new(0.15),{TextTransparency=0}):Play()
                                      elseif _fY:IsA("UIStroke")then tweenService:Create(_fY,TweenInfo.new(0.15),{Transparency=0}):Play()
                                      elseif _fY:IsA("TextLabel")then tweenService:Create(_fY,TweenInfo.new(0.1),{TextTransparency=0}):Play()
                                      end
                                    end
                                  end,FadeOut=function()
                                    for _fZ,_ga in pairs(_fQ:GetDescendants())do if _ga:IsA("Frame")then local _gb={BackgroundTransparency=1}tweenService:Create(_ga,TweenInfo.new(0.1),_gb):Play()
                                      elseif _ga:IsA("TextButton")then tweenService:Create(_ga,TweenInfo.new(0.15),{TextTransparency=1}):Play()
                                      elseif _ga:IsA("TextLabel")then local _gc={TextTransparency=1}tweenService:Create(_ga,TweenInfo.new(0.15),_gc):Play()
                                      elseif _ga:IsA("UIStroke")then local _gd={Transparency=1}tweenService:Create(_ga,TweenInfo.new(0.15),_gd):Play()
                                      end
                                    end
                                  end,Close=function()tweenService:Create(_fQ,TweenInfo.new(0.15),{BackgroundTransparency=1}):Play()
                                    local _ge={Rotation=0}tweenService:Create(_fO,TweenInfo.new(0.15),_ge):Play()_fU:FadeOut()_y.wait_(0.15)_fQ.Visible=false
                                  end,}
                                  local _gf=0 _fH.CreateValue=function(_gg,_gh)
                                    if not _fH.FValues[_gh]then local _gi={}
                                      local _gj=_y.new("TextButton")
                                      local _gk=_y.new("UIStroke")
                                      local _gl=_y.new("UICorner")
                                      local _gm=_y.new("TextLabel")_gj.Name="DropdownButton"_gj.Parent=_fQ _gj.Size=_y.udim2(1,0,0,20)_gj.BorderColor3=_y.color(0,0,0)_gj.BackgroundTransparency=1 _gj.Position=_y.udim2(1,0,0,0)_gj.BorderSizePixel=0 _gj.BackgroundColor3=_y.color(255,255,255)_gj.TextColor3=_y.color(255,255,255)_gj.Text=""_gj.TextXAlignment=Enum.TextXAlignment.Left _gj.TextSize=12 _gj.FontFace=_y.font _gj.TextTransparency=1 _gj.ZIndex=4 _gk.Name="DBStroke"_gk.Parent=_gj _gk.ApplyStrokeMode=Enum.ApplyStrokeMode.Border _gk.Color=_y.color(24,24,24)_gl.Name="DBCorner"_gl.Parent=_gj _gl.CornerRadius=UDim.new(0,3)_gm.Name="DBName"_gm.Parent=_gj _gm.Size=_y.udim2(0,12,1,0)_gm.BorderColor3=_y.color(0,0,0)_gm.BackgroundTransparency=1 _gm.Position=_y.udim2(0.0131004369,0,0,0)_gm.BorderSizePixel=0 _gm.BackgroundColor3=_y.color(255,255,255)_gm.TextColor3=_y.color(129,129,127)_gm.TextXAlignment=Enum.TextXAlignment.Left _gm.TextSize=12 _gm.FontFace=_y.font _gm.Text=_gh _gm.ZIndex=4 _gi.Name=_gj _fQ.Size=_fQ.Size+_y.udim2(0,0,0,22)
                                      local function _gn()_gm.TextColor3=theme.accent _fH.FValues[_gh].Selected=true
                                      end
                                      local function _go()_gm.TextColor3=_y.color(129,129,127)_fH.FValues[_gh].Selected=false
                                        if not(_y.n25>2331)then return
                                        end
                                        while true do end
                                      end _gj.MouseButton1Down:Connect(function()_fH:Set(_gh)
                                      end)_gf+=1 _fH.FValues[_gh]={Click=_gn,Unclick=_go,Objects=_gi,Selected=false}theme_event.Event:Connect(function()
                                        local _gp=_fH.FValues[_gh]
                                        if _gp and _gp.Selected then _gm.TextColor3=theme.accent
                                        end
                                      end)
                                    end
                                    return _fH
                                  end _fH.Update=function()
                                    for _gq,_gr in pairs(_fH.FValues)do if _fH.FValue==_gq then _gr.Click()
                                      else _gr.Unclick()
                                      end
                                    end
                                    return _fH
                                  end _fH.Display=function()
                                    if _fG.Multi then local _gs={}
                                      if#_fH.FValue>0 then for _gt,_gu in pairs(_fH.FValue)do _gs[#_gs+1]=_gu _fP.Text=table.concat(_gs,", ")
                                        end
                                      else _fP.Text="-"
                                      end
                                    else _fP.Text=_fH.FValue~=""and _fH.FValue or "-"
                                    end
                                    return _fH
                                  end _fH.Set=function(_gv,_gw)
                                    if _fG.Multi then if typeof(_gw)=="table"then table.clear(_fH.FValue)
                                        for _gx,_gy in ipairs(_gw)do _fH.FValue[#_fH.FValue+1]=_gy
                                        end
                                        for _gz,_gA in pairs(_fH.FValues)do if table.find(_fH.FValue,_gz)then _gA.Click()
                                          else _gA.Unclick()
                                          end
                                        end _fH:Display()pcall(_fG.Callback,_fH.FValue)_bG.Flags[_fG.Flag]=_fH.FValue _bG.Flags[_fG.Flag.."f"]={function(_gB)_fH:Refresh(_gB)
                                        end,function(_gC)_fH:Set(_gC)
                                        end,}
                                        return
                                      end
                                      local _gD=table.find(_fH.FValue,_gw)
                                      if _gD then table.remove(_fH.FValue,_gD)_fH:Display()
                                        if _fH.FValues[_gw]then _fH.FValues[_gw].Unclick()
                                        end pcall(_fG.Callback,_fH.FValue)_bG.Flags[_fG.Flag]=_fH.FValue _bG.Flags[_fG.Flag.."f"]={function(_gE)_fH:Refresh(_gE)
                                        end,function(_gF)_fH:Set(_gF)
                                        end,}
                                      else if not _fH.FValues[_gw]then _fH:Display()
                                          return
                                        end _fH.FValue[#_fH.FValue+1]=_gw _fH:Display()_fH.FValues[_gw].Click()pcall(_fG.Callback,_fH.FValue)_bG.Flags[_fG.Flag]=_fH.FValue _bG.Flags[_fG.Flag.."f"]={function(_gG)_fH:Refresh(_gG)
                                        end,[2]=function(_gH)_fH:Set(_gH)
                                        end,}
                                      end
                                    else _fH.FValue=_gw _gv:Update()_fH:Display()pcall(_fG.Callback,_fH.FValue)_bG.Flags[_fG.Flag]=_fH.FValue _bG.Flags[_fG.Flag.."f"]={function(_gI)_fH:Refresh(_gI)
                                      end,[2]=function(_gJ)_fH:Set(_gJ)
                                      end,}
                                    end
                                    return _fH
                                  end _fH.Refresh=function(_gK,_gL)
                                    for _gM,_gN in pairs(_fH.FValues)do _gN.Objects.Name:Destroy()
                                    end _fQ.Size=_y.udim2(0,159,0,0)table.clear(_fH.FValues)
                                    if _fG.Multi then table.clear(_fH.FValue)_gf=0
                                      for _gO,_gP in pairs(_gL)do _fH:CreateValue(_gP)
                                      end _fH:Display()pcall(_fG.Callback,_fH.FValue)_bG.Flags[_fG.Flag]=_fH.FValue _bG.Flags[_fG.Flag.."f"]={function(_gQ)_fH:Refresh(_gQ)
                                      end,function(_gR)_fH:Set(_gR)
                                      end,}
                                    else _gf=0
                                      for _gS,_gT in pairs(_gL)do _fH:CreateValue(_gT)
                                      end _fH.FValue=nil _fH:Update()_fH:Display()pcall(_fG.Callback,_fH.FValue)_bG.Flags[_fG.Flag]=_fH.FValue _bG.Flags[_fG.Flag.."f"]={function(_gU)_fH:Refresh(_gU)
                                      end,[2]=function(_gV)_fH:Set(_gV)
                                      end,}
                                    end
                                    for _gW,_gX in pairs(_gL)do _fH:CreateValue(_gX)
                                    end _fH:Set(_fG.Default)
                                    return _fH
                                  end
                                  for _gY,_gZ in pairs(_fG.Content)do _fH:CreateValue(_gZ)
                                  end _fH:Set(_fG.Default)_fL.MouseButton1Click:Connect(function()
                                    if _bG.Popup and _bG.Popup.ID~=_fI.Name then _bG:RemovePopups()
                                    end
                                    if _fQ.Visible then _fU:Close()_fQ.ZIndex=4
                                    else _bG:NewPopup({Remove=_fU.Close,ID=_fI.Name})_fQ.ZIndex=4 _fU:Open()
                                    end
                                  end)_bG.ConfigFlags[_fG.Flag]=function(_ha)_fH:Set(_ha)
                                  end _cX(40)
                                  return _fG,_fH
                                end _cK.Keybind=function(_hb,_hc,_hd)
                                  local _he={Title=_hc.title or"",Mode=_hc.mode or "Toggle",Key=_hc.key or"",Callback=_hc.callback or function()
                                  end,KeybindsList=_hc.keybindlist or false,KeybindListName=_hc.keybindname or _hb.Title,}_he.Flag=_bG:GetNextFlag()
                                  local _hf={FMode=_he.Mode,FKey=_he.Key,Toggled=false,Picking=false,Modes={}}
                                  local _hg=_y.new("Frame")
                                  local _hh=_y.new("TextButton")_hg.Name=tostring(math.random(1000,16384))_hg.Parent=_hd==nil and _cV or _hd _hg.BackgroundColor3=_y.color(255,255,255)_hg.BackgroundTransparency=1 _hg.BorderColor3=_y.color(0,0,0)_hg.BorderSizePixel=0 _hg.Size=_y.udim2(0,229,0,14)
                                  if _hd==nil then local _hi=_y.new("TextLabel")_hi.Name="TextLabel" _hi.Parent=_hg _hi.BackgroundColor3=_y.color(255,255,255)_hi.BackgroundTransparency=1 _hi.BorderColor3=_y.color(0,0,0)_hi.BorderSizePixel=0 _hi.Size=_y.udim2(0,161,0,16)_hi.FontFace=_y.font _hi.Text=_he.Title _hi.TextColor3=_y.color(255,255,255)_hi.TextSize=12 _hi.TextXAlignment=Enum.TextXAlignment.Left
                                  end _hh.Name="KeybindButton"_hh.Parent=_hg _hh.BackgroundColor3=_y.color(21,21,21)_hh.BorderColor3=_y.color(43,49,61)_hh.Position=_y.udim2(0.703056753,0,0,0)_hh.Size=_y.udim2(0,68,0,14)_hh.FontFace=_y.font _hh.Text="key : none"_hh.TextColor3=_y.color(255,255,255)_hh.TextSize=12 _hh.ZIndex=2 _hh.AutoButtonColor=false
                                  local _hj=_y.new("Frame")
                                  local _hk=_y.new("Frame")
                                  local _hl=_y.new("UIListLayout")_hj.Name="KeybindInline"_hj.Parent=_hg _hj.BackgroundColor3=_y.color(170,170,255)_hj.BackgroundTransparency=1 _hj.BorderColor3=_y.color(0,0,0)_hj.BorderSizePixel=0 _hj.Position=_y.udim2(0.943231463,0,0,0)_hj.Size=_y.udim2(0,16,0,13)_hj.Visible=false _hk.Name="KeybindContent"_hk.Parent=_hj _hk.BackgroundColor3=_y.color(21,21,21)_hk.BorderColor3=_y.color(34,34,34)_hk.Position=_y.udim2(-1,0,1.2,0)_hk.Size=_y.udim2(0,68,0,0)_hk.ZIndex=3 _hl.Name="KBContent"_hl.Parent=_hk _hl.SortOrder=Enum.SortOrder.LayoutOrder
                                  local _hm _hm={Open=function(_hn)_hk.Visible=true _hj.Visible=true _hn:FadeIn()
                                  end,FadeIn=function()
                                    for _ho,_hp in pairs(_hk:GetDescendants())do if _hp:IsA("Frame")then tweenService:Create(_hp,TweenInfo.new(0.1),{BackgroundTransparency=0}):Play()
                                      elseif _hp:IsA("TextButton")then tweenService:Create(_hp,TweenInfo.new(0.1),{TextTransparency=0}):Play()
                                      end
                                    end
                                  end,FadeOut=function()
                                    for _hq,_hr in pairs(_hk:GetDescendants())do if _hr:IsA("Frame")then tweenService:Create(_hr,TweenInfo.new(0.1),{BackgroundTransparency=1}):Play()
                                      elseif _hr:IsA("TextButton")then local _hs={TextTransparency=1}tweenService:Create(_hr,TweenInfo.new(0.1),_hs):Play()
                                      end
                                    end
                                  end,Close=function()_hm:FadeOut()_y.wait_(0.05)_hk.Visible=false _hj.Visible=false
                                  end,}_hf.UpdateList=function()
                                    if _bG.KeybindList and _he.KeybindsList then _bG.KeybindList:Add(_he.KeybindListName,_hf.FMode)_bG.KeybindList:SetVisibility(_he.KeybindListName,_he:GetState())_bG.KeybindList:SetMode(_he.KeybindListName,_hf.FMode)
                                    end
                                  end _hf.Value=function(_ht,_hu)
                                    if _hu then if _hu[1]then local _hv=_hu[1]_hh.Text="key : "..((_hv=="none"or _hv=="")and "none"or _hv)_hf.FKey=_hv
                                      else _hh.Text="key : none"
                                      end
                                      if _hu[2]then _hf.Modes[_hu[2]]:Click(_hu[2]=="Toggle"and true or false)
                                      end _hf:UpdateList()
                                    end
                                    return _hf
                                  end _he.GetState=function()
                                    if _hf.FMode=="Always"then return true
                                    end
                                    if _hf.FMode=="Toggle" then if _hf.FKey=="none" then return false
                                      end
                                      return _hf.Toggled
                                    end
                                    if _hf.FKey=="none" then return false
                                    end
                                    return _hf.Toggled
                                  end
                                  for _hw,_hx in pairs({"Toggle","Hold","Always"})do local _hy={}
                                    local _hz=_y.new("TextButton")_hz.Name="TextButton" _hz.Parent=_hk _hz.BackgroundColor3=_y.color(21,21,21)_hz.BackgroundTransparency=0 _hz.BorderColor3=_y.color(43,49,61)_hz.BorderSizePixel=0 _hz.Position=_y.udim2(0,0,0.0416666679,0)_hz.Size=_y.udim2(0,68,0,14)_hz.ZIndex=3 _hz.FontFace=_y.font _hz.Text=tostring(_hx)_hz.TextColor3=_y.color(129,129,127)_hz.TextSize=12 _hk.Size=_hk.Size+_y.udim2(0,0,0,_hz.TextBounds.Y)_hy.Click=function(_hA,_hB)
                                      for _hC,_hD in pairs(_hf.Modes)do _hD:Unclick()
                                      end _hf.FMode=_hx _hj.Visible=false _hf:UpdateList()_hz.TextColor3=_y.color(166,157,159)
                                      if not _hB then pcall(_he.Callback,_he:GetState())
                                      end
                                    end _hy.Unclick=function()_hz.TextColor3=_y.color(129,129,129)
                                    end
                                    if _hx==_hf.FMode then _hy:Click()
                                    end _hz.MouseButton1Down:Connect(_hy.Click)theme_event.Event:Connect(function()
                                      if _hx==_hf.FMode then _hz.TextColor3=theme.accent
                                      end
                                    end)_hf.Modes[_hx]=_hy
                                  end _hh.InputBegan:Connect(function(_hE)
                                    if _hE.UserInputType==Enum.UserInputType.MouseButton1 then _hf.Picking=true _hh.Text="" _y.wait_(0.02)
                                      local _hF=nil _hF=inputService.InputBegan:Connect(function(_hG)
                                        local _hH=_hG.KeyCode.Name=="Escape"and "none" or _bO[_hG.KeyCode]or _bO[_hG.UserInputType]or _hG.KeyCode.Name
                                        if _hG.UserInputType==Enum.UserInputType.Keyboard and _hG.KeyCode.Name=="Escape" then _hf.FKey="none"
                                        elseif _hG.UserInputType==Enum.UserInputType.Keyboard then _hf.FKey=_hG.KeyCode.Name
                                        elseif _hG.UserInputType==Enum.UserInputType.MouseButton1 then _hf.FKey="MB1"
                                        elseif _hG.UserInputType==Enum.UserInputType.MouseButton2 then _hf.FKey="MB2"
                                        end _hf.Picking=false _hh.Text="key : ".._hH pcall(_he.Callback,_he:GetState())_bG.Flags[_he.Flag]=_he:GetState()_bG.Flags[_he.Flag.."_info"]={_hf.FKey,_hf.FMode}_hf:UpdateList()_hF:Disconnect()
                                      end)
                                    end
                                    if _hE.UserInputType==Enum.UserInputType.MouseButton2 then if _bG.Popup and _bG.Popup.ID~=_hg.Name then _bG:RemovePopups()
                                      end
                                      if _hj.Visible then _hm:Close()
                                      else _bG:NewPopup({Remove=_hm.Close,ID=_hg.Name})_hm:Open()
                                      end
                                    end
                                  end)inputService.InputBegan:Connect(function(_hI)
                                    if _hf.Picking then return
                                    end
                                    local _hJ=_hf.FKey=="MB2"and "MouseButton2"or _hf.FKey=="MB1"and "MouseButton1"
                                    local _hK
                                    if _hJ then _hK=_hJ
                                    else _hK=_hf.FKey=="MB3"and "MouseButton3"
                                    end
                                    if _hI.KeyCode.Name==_hf.FKey or _hI.UserInputType.Name==_hK then if _hf.FMode=="Toggle"then _hf.Toggled=not _hf.Toggled
                                      elseif _hf.FMode=="Hold"then _hf.Toggled=true
                                        local _hL=nil _hL=inputService.InputEnded:Connect(function(_hM)
                                          if _hM.KeyCode.Name==_hf.FKey or _hM.UserInputType.Name==_hK then _hL:Disconnect()_hf.Toggled=false pcall(_he.Callback,_he:GetState())_hf:UpdateList()
                                          end
                                        end)
                                      end pcall(_he.Callback,_he:GetState())_bG.Flags[_he.Flag]=_he:GetState()_bG.Flags[_he.Flag.."_info"]={_hf.FKey,_hf.FMode}_hf:UpdateList()
                                    end
                                  end)
                                  if _hf.FKey~=""then _hf:Value({_hf.FKey,_hf.FMode})
                                  end _cX(14)_bG.Flags[_he.Flag]=_he:GetState()_bG.Flags[_he.Flag.."_info"]={_hf.FKey,_hf.FMode}_bG.ConfigFlags[_he.Flag.."_info"]=function(_hN)_hf:Value(_hN)
                                  end
                                  return _he
                                end _cK.StandaloneKeybind=function(_hO,_hP)
                                  local _hQ={Title=_hP.title or"",Mode=_hP.mode or "Toggle",Key=_hP.key or"",Callback=_hP.callback or function()
                                  end,KeybindsList=_hP.keybindlist or false,KeybindListName=_hP.keybindname or _hP.title or"",}_hQ.Flag=_bG:GetNextFlag()
                                  local _hR={FMode=_hQ.Mode,FKey=_hQ.Key,Toggled=false,Picking=false,Modes={}}
                                  local _hS=_y.new("Frame")
                                  local _hT=_y.new("TextButton")_hS.Name=tostring(math.random(1000,16384))_hS.Parent=_cV _hS.BackgroundColor3=_y.color(255,255,255)_hS.BackgroundTransparency=1 _hS.BorderColor3=_y.color(0,0,0)_hS.BorderSizePixel=0 _hS.Size=_y.udim2(0,229,0,14)
                                  local _hU=_y.new("TextLabel")_hU.Name="KeybindTitle"_hU.Parent=_hS _hU.BackgroundColor3=_y.color(255,255,255)_hU.BackgroundTransparency=1 _hU.BorderColor3=_y.color(0,0,0)_hU.BorderSizePixel=0 _hU.Size=_y.udim2(0,229,0,16)_hU.FontFace=_y.font _hU.Text=_hQ.Title _hU.TextColor3=_y.color(255,255,255)_hU.TextSize=12 _hU.TextXAlignment=Enum.TextXAlignment.Left _hT.Name="TextButton" _hT.Parent=_hS _hT.BackgroundColor3=_y.color(21,21,21)_hT.BorderColor3=_y.color(43,49,61)_hT.Position=_y.udim2(0,0,0,0)_hT.Size=_y.udim2(0,68,0,14)_hT.FontFace=_y.font _hT.Text="key : none"_hT.TextColor3=_y.color(255,255,255)_hT.TextSize=12 _hT.ZIndex=2 _hT.AutoButtonColor=false
                                  local _hV=_y.new("Frame")
                                  local _hW=_y.new("Frame")
                                  local _hX=_y.new("UIListLayout")_hV.Name="KeybindInline"_hV.Parent=_hS _hV.BackgroundColor3=_y.color(170,170,255)_hV.BackgroundTransparency=1 _hV.BorderColor3=_y.color(0,0,0)_hV.BorderSizePixel=0 _hV.Position=_y.udim2(0.943231463,0,0,0)_hV.Size=_y.udim2(0,16,0,13)_hV.Visible=false _hW.Name="KeybindContent"_hW.Parent=_hV _hW.BackgroundColor3=_y.color(21,21,21)_hW.BorderColor3=_y.color(34,34,34)_hW.Position=_y.udim2(-4.23076916,0,1.2,0)_hW.Size=_y.udim2(0,68,0,0)_hW.ZIndex=3 _hX.Name="UIListLayout" _hX.Parent=_hW _hX.SortOrder=Enum.SortOrder.LayoutOrder
                                  local _hY _hY={Open=function(_hZ)_hW.Visible=true _hV.Visible=true _hZ:FadeIn()
                                  end,FadeIn=function()
                                    for _ia,_ib in pairs(_hW:GetDescendants())do if _ib:IsA("Frame")then local _ic={BackgroundTransparency=0}tweenService:Create(_ib,TweenInfo.new(0.1),_ic):Play()
                                      elseif _ib:IsA("TextButton")then local _id={TextTransparency=0}tweenService:Create(_ib,TweenInfo.new(0.1),_id):Play()
                                      end
                                    end
                                  end,FadeOut=function()
                                    for _ie,_if in pairs(_hW:GetDescendants())do if _if:IsA("Frame")then tweenService:Create(_if,TweenInfo.new(0.1),{BackgroundTransparency=1}):Play()
                                      elseif _if:IsA("TextButton")then tweenService:Create(_if,TweenInfo.new(0.1),{TextTransparency=1}):Play()
                                      end
                                    end
                                  end,Close=function()_hY:FadeOut()_y.wait_(0.05)_hW.Visible=false _hV.Visible=false
                                  end,}_hR.UpdateList=function()
                                    if _bG.KeybindList and _hQ.KeybindsList then _bG.KeybindList:Add(_hQ.KeybindListName,_hR.FMode)_bG.KeybindList:SetVisibility(_hQ.KeybindListName,_hQ:GetState())_bG.KeybindList:SetMode(_hQ.KeybindListName,_hR.FMode)
                                    end
                                  end _hR.Value=function(_ig,_ih)
                                    if _ih then if _ih[1]then local _ii=_ih[1]_hT.Text="key : "..((_ii=="none"or _ii=="")and "none"or _ii)_hR.FKey=_ii
                                      else _hT.Text="key : none"
                                      end
                                      if _ih[2]then _hR.Modes[_ih[2]]:Click(_ih[2]=="Toggle"and true or false)
                                      end _hR:UpdateList()
                                    end
                                    return _hR
                                  end _hQ.GetState=function()
                                    if _hR.FMode=="Always"then return true
                                    end
                                    if _hR.FMode=="Hold"then if _hR.FKey=="none"then return false
                                      end
                                      return _hR.Toggled
                                    end
                                    if _hR.FKey=="none" then return false
                                    end
                                    return _hR.Toggled
                                  end
                                  for _ij,_ik in pairs({"Toggle","Hold","Always"})do local _il={}
                                    local _im=_y.new("TextButton")_im.Name="KB_Button"_im.Parent=_hW _im.BackgroundColor3=_y.color(21,21,21)_im.BackgroundTransparency=0 _im.BorderColor3=_y.color(34,34,34)_im.BorderSizePixel=0 _im.Position=_y.udim2(0,0,0.0416666679,0)_im.Size=_y.udim2(0,68,0,14)_im.ZIndex=4 _im.FontFace=_y.font _im.Text=tostring(_ik)_im.TextColor3=_y.color(129,129,129)_im.TextSize=12 _hW.Size=_hW.Size+_y.udim2(0,0,0,_im.TextBounds.Y)_il.Click=function(_in,_io)
                                      for _ip,_iq in pairs(_hR.Modes)do _iq:Unclick()
                                      end _hR.FMode=_ik _hV.Visible=false _hR:UpdateList()_im.TextColor3=_y.color(110,180,255)
                                      if not _io then pcall(_hQ.Callback,_hQ:GetState())
                                      end
                                    end _il.Unclick=function()_im.TextColor3=_y.color(129,129,127)
                                    end
                                    if _ik==_hR.FMode then _il:Click()
                                    end _im.MouseButton1Down:Connect(_il.Click)theme_event.Event:Connect(function()
                                      if _ik==_hR.FMode then _im.TextColor3=theme.accent
                                      end
                                    end)_hR.Modes[_ik]=_il
                                  end _hT.InputBegan:Connect(function(_ir)
                                    if _ir.UserInputType==Enum.UserInputType.MouseButton1 then _hR.Picking=true _hT.Text="" _y.wait_(0.02)
                                      local _is=nil _is=inputService.InputBegan:Connect(function(_it)
                                        local _iu=_it.KeyCode.Name=="Escape" and "none"or _bO[_it.KeyCode]or _bO[_it.UserInputType]or _it.KeyCode.Name
                                        if _it.UserInputType==Enum.UserInputType.Keyboard and _it.KeyCode.Name=="Escape"then _hR.FKey="none"
                                        elseif _it.UserInputType==Enum.UserInputType.Keyboard then _hR.FKey=_it.KeyCode.Name
                                        elseif _it.UserInputType==Enum.UserInputType.MouseButton1 then _hR.FKey="MB1"
                                        elseif _it.UserInputType==Enum.UserInputType.MouseButton2 then _hR.FKey="MB1"
                                        end _hR.Picking=false _hT.Text="key : ".._iu pcall(_hQ.Callback,_hQ:GetState())_bG.Flags[_hQ.Flag]=_hQ:GetState()_bG.Flags[_hQ.Flag.."_info"]={_hR.FKey,_hR.FMode}_hR:UpdateList()_is:Disconnect()
                                      end)
                                    end
                                    if _ir.UserInputType==Enum.UserInputType.MouseButton2 then if _bG.Popup and _bG.Popup.ID~=_hS.Name then _bG:RemovePopups()
                                      end
                                      if _hV.Visible then _hY:Close()
                                      else _bG:NewPopup({Remove=_hY.Close,ID=_hS.Name})_hY:Open()
                                      end
                                    end
                                  end)inputService.InputBegan:Connect(function(_iv)
                                    if _hR.Picking then return
                                    end
                                    local _iw=_hR.FKey=="MB2"and "MouseButton2" or _hR.FKey=="MB1"and "MouseButton1"
                                    local _ix
                                    if _iw then _ix=_iw
                                    else _ix=_hR.FKey=="MB3"and "MouseButton3"
                                    end
                                    if _iv.KeyCode.Name==_hR.FKey or _iv.UserInputType.Name==_ix then if _hR.FMode=="Toggle"then _hR.Toggled=not _hR.Toggled
                                      elseif _hR.FMode=="Hold"then _hR.Toggled=true
                                        local _iy=nil _iy=inputService.InputEnded:Connect(function(_iz)
                                          if _iz.KeyCode.Name==_hR.FKey or _iz.UserInputType.Name==_ix then _iy:Disconnect()_hR.Toggled=false pcall(_hQ.Callback,_hQ:GetState())_hR:UpdateList()
                                          end
                                        end)
                                      end pcall(_hQ.Callback,_hQ:GetState())_bG.Flags[_hQ.Flag]=_hQ:GetState()_bG.Flags[_hQ.Flag.."_info"]={_hR.FKey,_hR.FMode}_hR:UpdateList()
                                    end
                                  end)
                                  if _hR.FKey~=""then _hR:Value({_hR.FKey,_hR.FMode})
                                  end _cX(14)_bG.Flags[_hQ.Flag]=_hQ:GetState()_bG.Flags[_hQ.Flag.."_info"]={_hR.FKey,_hR.FMode}_bG.ConfigFlags[_hQ.Flag.."_info"]=function(_iA)_hR:Value(_iA)
                                  end
                                  return _hQ
                                end _cK.Label=function(_iB,_iC,_iD)
                                  local _iE={}
                                  local _iF=_iD~=nil and _iD==true and true or false
                                  local _iG=_y.new("TextLabel")_iG.Name="Label"_iG.Parent=_cV _iG.BackgroundColor3=_y.color(255,255,255)_iG.BackgroundTransparency=1 _iG.BorderColor3=_y.color(0,0,0)_iG.BorderSizePixel=0 _iG.Size=_y.udim2(0,216,0,16)_iG.FontFace=_y.font _iG.Text=_iC _iG.TextColor3=_y.color(255,255,255)_iG.TextSize=12 _iG.TextXAlignment=Enum.TextXAlignment.Left _iG.RichText=_iF _iG.TextTruncate="AtEnd"_iE.ChangeText=function(_iH,_iI)
                                    if not type(_iI)=="string"then return
                                    end _iG.Text=tostring(_iI)
                                  end _cX(14)
                                  return _iE
                                end
                                if _y.n24<9069 then while true do end
                                end _cK.Slider=function(_iJ,_iK)
                                  local _iL={Title=_iK.title or "slider",Min=_iK.min or 1,Max=_iK.max or 10,Float=_iK.float or 1,Default=_iK.default or 0,Value=0,Callback=_iK.callback or function()
                                  end,Sliding=false,Suffix=_iK.suffix or"",}_iL.Flag=_bG:GetNextFlag()_iL.MinText=_iK.mintext or tostring(_iL.Min)_iL.MaxText=_iK.maxtext or tostring(_iL.Max)
                                  local _iM=_y.new("Frame")
                                  local _iN=_y.new("TextLabel")
                                  local _iO=_y.new("TextLabel")
                                  local _iP=_y.new("Frame")
                                  local _iQ=_y.new("UICorner")
                                  local _iR=_y.new("Frame")
                                  local _iS=_y.new("UICorner")
                                  local _iT=_y.new("Frame")
                                  local _iU=_y.new("UICorner")
                                  local _iV=_y.new("Frame")
                                  local _iW=_y.new("UICorner")_iM.Name="Slider"_iM.Parent=_cV _iM.BackgroundColor3=_y.color(255,255,255)_iM.BackgroundTransparency=1 _iM.BorderColor3=_y.color(0,0,0)_iM.BorderSizePixel=0 _iM.Size=_y.udim2(0,229,0,30)_iN.Name="TextLabel" _iN.Parent=_iM _iN.BackgroundColor3=_y.color(255,255,255)_iN.BackgroundTransparency=1 _iN.BorderColor3=_y.color(0,0,0)_iN.BorderSizePixel=0 _iN.Size=_y.udim2(0,229,0,20)_iN.FontFace=_y.font _iN.Text=_iL.Title _iN.TextColor3=_y.color(255,255,255)_iN.TextSize=12 _iN.TextXAlignment=Enum.TextXAlignment.Left _iO.Name="TextLabel" _iO.Parent=_iM _iO.BackgroundColor3=_y.color(255,255,255)_iO.BackgroundTransparency=1 _iO.BorderColor3=_y.color(0,0,0)_iO.BorderSizePixel=0 _iO.Position=_y.udim2(0,0,0,0)_iO.Size=_y.udim2(0,160,0,20)_iO.FontFace=_y.font _iO.Text=_iL.Value.._iL.Suffix _iO.TextColor3=_y.color(124,124,124)_iO.TextSize=12 _iO.TextXAlignment=Enum.TextXAlignment.Right _iP.Name="Frame" _iP.Parent=_iM _iP.BackgroundColor3=_y.color(21,21,21)_iP.BorderColor3=_y.color(0,0,0)_iP.BorderSizePixel=0 _iP.Position=_y.udim2(0,0,0.766666651,0)_iP.Size=_y.udim2(0,160,0,7)_iQ.CornerRadius=UDim.new(0,2)_iQ.Name="InlineCorner"_iQ.Parent=_iP _iR.Name="SliderBackground"_iR.Parent=_iP _iR.BackgroundColor3=_y.color(21,21,21)_iR.BorderColor3=_y.color(0,0,0)_iR.BorderSizePixel=0 _iR.Position=_y.udim2(0,0,-0.00999999978,0)_iR.Size=_y.udim2(0,160,1,0)_iS.CornerRadius=UDim.new(0,2)_iS.Name="BackgroundCorner"_iS.Parent=_iR _iT.Name="SliderFill"_iT.Parent=_iR _iT.BackgroundColor3=_y.color(159,153,159)_iT.BorderColor3=_y.color(0,0,0)_iT.BorderSizePixel=0 _iT.Position=_y.udim2(0,0,0,0)_iT.Size=_y.udim2(0,0,1,0)_iU.CornerRadius=UDim.new(0,2)_iU.Name="FillCorner"_iU.Parent=_iT _iV.Name="SliderDrag"_iV.Parent=_iM _iV.BackgroundColor3=_y.color(255,0,0)_iV.BackgroundTransparency=1 _iV.BorderColor3=_y.color(0,0,0)_iV.BorderSizePixel=0 _iV.Position=_y.udim2(0,0,0.766666651,-5)_iV.Size=_y.udim2(0,229,0,16)_iW.CornerRadius=UDim.new(0,2)_iW.Name="DragCorner"_iW.Parent=_iV
                                  local _iX=_y.new("UIStroke",_iP)_iX["ApplyStrokeMode"]=Enum.ApplyStrokeMode.Border _iX.Name="INLINESTROKE"_iX.Color=_y.color(32,32,32)
                                  local _iY=_y.new("UIStroke",_iR)_iY.ApplyStrokeMode=Enum.ApplyStrokeMode.Border _iY["Name"]="SliderBackgroundStroke"_iY.Color=_y.color(32,32,32)
                                  local _iZ=_y.new("UIStroke",_iT)_iZ["ApplyStrokeMode"]=Enum.ApplyStrokeMode.Border _iZ.Name="SliderFillStroke"_iZ.Color=_y.color(172,159,159)_iZ["Transparency"]=0.5 theme_event.Event:Connect(function()_iT.BackgroundColor3=theme.accent _iZ.Color=theme.accent
                                  end)
                                  local function _ja(_jb,_jc)
                                    if _y.n27(3649)>18517 then return _jc*math.round(_jb/_jc)
                                    end
                                    while true do end
                                  end _iL.Set=function(_jd,_je)
                                    local _jf=_iL.Min
                                    local _jg=_iL.Max
                                    local _jh=math.clamp(_ja(_je,_iL.Float),_jf,_jg)
                                    local _ji=(_jh-_iL.Min)/(_iL.Max-_iL.Min)_iL.Value=_jh tweenService:Create(_iT,TweenInfo.new(0.13,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=_y.udim2(_ji,0,1,0)}):Play()_iL.Callback(_jh)_bG.Flags[_iL.Flag]=_iL.Value _iO.Text=_iL.Value==_iL.Min and _iL.MinText or _iL.Value==_iL.Max and _iL.MaxText or string.format("%.14g%s",_iL.Value,_iL.Suffix)
                                  end _iL.Slide=function(_jj,_jk)
                                    local _jl=math.clamp((_iL.Max-_iL.Min)*(_jk.Position.X-_iR.AbsolutePosition.X)/_iR.AbsoluteSize.X+_iL.Min,_iL.Min,_iL.Max)_jj:Set(_jl)
                                  end _iL:Set(_iL.Default)_iV.MouseEnter:Connect(function()tweenService:Create(_iY,TweenInfo.new(0.2),{Color=_y.color(255,255,255)}):Play()
                                  end)_iV.MouseLeave:Connect(function()tweenService:Create(_iY,TweenInfo.new(0.2),{Color=_y.color(32,32,32)}):Play()
                                  end)_iV.InputBegan:Connect(function(_jm)
                                    if _jm.UserInputType==Enum.UserInputType.MouseButton1 then _iL.Sliding=true _iL:Slide(_jm)
                                    end
                                  end)_iV.InputEnded:Connect(function(_jn)
                                    if _jn.UserInputType==Enum.UserInputType.MouseButton1 then _iL.Sliding=false _iL:Slide(_jn)
                                    end
                                  end)_iV.InputChanged:Connect(function(_jo)
                                    if _jo.UserInputType==Enum.UserInputType.MouseMovement and _iL.Sliding then _iL:Slide(_jo)
                                    end
                                  end)_bG.ConfigFlags[_iL.Flag]=function(_jp)_iL:Set(_jp)
                                  end _cX(30)
                                  return _iL
                                end _cK.TextBox=function(_jq,_jr)
                                  local _js={Title=_jr.title or "textbox",Default=_jr.default or"",Placeholder=_jr.placeholder or"",ClearTextOnFocus=_jr.cleartextonfocus or _jr.ctf or true,Callback=_jr.callback or function()
                                  end,Text="",}_js.Flag=_bG:GetNextFlag()
                                  if _js.Title~="NO TITLE"then _jq:Label(_js.Title)
                                  end
                                  local _jt=_y.new("TextBox")
                                  local _ju=_y.new("UICorner")_jt.Parent=_cV _jt.BackgroundColor3=_y.color(23,23,23)_jt.BorderColor3=_y.color(0,0,0)_jt.BorderSizePixel=0 _jt.Size=_y.udim2(0,159,0,22)_jt.FontFace=_y.font _jt.PlaceholderText=_js.Placeholder _jt.Text=""_jt.TextColor3=_y.color(255,255,255)_jt.TextSize=12 _jt.TextXAlignment=Enum.TextXAlignment.Left _jt.TextTruncate="AtEnd"_jt.ClearTextOnFocus=_js.ClearTextOnFocus _ju.CornerRadius=UDim.new(0,4)_ju.Name="TextboxCorner"_ju.Parent=_jt
                                  local _jv=_y.new("UIStroke",_jt)_jv.ApplyStrokeMode=Enum.ApplyStrokeMode.Border _jv.Name="TextBoxStroke"_jv.Color=_y.color(37,37,37)_y.new("UIPadding",_jt).PaddingLeft=UDim.new(0,8)_js.Set=function(_jw,_jx)_jt.Text=_jx or""_js.Text=_jt.Text _bG.Flags[_js.Flag]=_js.Text _bG.Flags[_js.Flag.."f"]=function(_jy)_js:Set(_jy)
                                    end pcall(_js.Callback,_js.Text)
                                  end _jt.FocusLost:Connect(function()_js.Text=_jt.Text _bG.Flags[_js.Flag]=_js.Text _bG.Flags[_js.Flag.."f"]=function(_jz)_js:Set(_jz)
                                    end pcall(_js.Callback,_js.Text)
                                  end)_cX(22)_bG.ConfigFlags[_js.Flag]=function(_jA)_js:Set(_jA)
                                  end
                                  return _js
                                end _cK.Toggle=function(_jB,_jC)
                                  local _jD={title=_jC.title or "toggle",default=_jC.default or false,state=false,callback=_jC.callback or function()
                                  end,Risky=_jC.risky or false,Info=_jC.info or false,InfoText=_jC.infotext or"",}_jD.Flag=_bG:GetNextFlag()_bH["19"]=_y.new("TextButton",_cV)_bH["19"].BorderSizePixel=0 _bH["19"]["TextTransparency"]=1 _bH["19"]["TextSize"]=12 _bH["19"]["TextColor3"]=_y.color(255,255,255)_bH["19"].BackgroundColor3=_y.color(255,255,255)_bH["19"].FontFace=_y.font _bH["19"].Size=_y.udim2(0,229,0,15)_bH["19"].BackgroundTransparency=1 _bH["19"].Name="ToggleButton"_bH["19"].BorderColor3=_y.color(0,0,0)_bH["19"].Text="Toggle"_bH["1a"]=_y.new("Frame",_bH["19"])_bH["1a"].BorderSizePixel=0 _bH["1a"].BackgroundColor3=_y.color(20,17,17)_bH["1a"].Size=_y.udim2(0,13,0,13)_bH["1a"].BorderColor3=_y.color(0,0,0)_bH["1a"].Position=_y.udim2(0,0,0.077,0)_bH["1a"].Name="ToggleStatus"_bH["1b"]=_y.new("UICorner",_bH["1a"])_bH["1b"].Name="ToggleStatusCorner"_bH["1b"].CornerRadius=UDim.new(0,4)_bH["1c"]=_y.new("UIStroke",_bH["1a"])_bH["1c"].ApplyStrokeMode=Enum.ApplyStrokeMode.Border _bH["1c"].Name="ToggleUIStroke"_bH["1c"].Color=_y.color(37,37,37)_bH["1d"]=_y.new("TextLabel",_bH["19"])_bH["1d"].TextStrokeTransparency=1 _bH["1d"].BorderSizePixel=0 _bH["1d"].TextXAlignment=Enum.TextXAlignment.Left _bH["1d"].BackgroundColor3=_y.color(255,255,255)_bH["1d"].TextSize=12 _bH["1d"].FontFace=_y.font _bH["1d"]["TextColor3"]=_y.color(129,129,127)_bH["1d"].BackgroundTransparency=1 _bH["1d"].Size=_y.udim2(0,150,0,13)_bH["1d"]["BorderColor3"]=_y.color(0,0,0)_bH["1d"]["Text"]=_jD.title _bH["1d"].Name="ToggleName"_bH["1d"]["Position"]=_y.udim2(0,18,0,0)
                                  local _jE=_bH["19"]
                                  local _jF=_bH["1a"]
                                  local _jG=_bH["1d"]
                                  local _jH=tweenService:Create(_jF,TweenInfo.new(0.2),{BackgroundColor3=_y.color(110,180,255)})
                                  local _jI=tweenService:Create(_jG,TweenInfo.new(0.2),{TextColor3=_jD.Risky and theme.risky or _y.color(255,255,255)})
                                  local _jJ=tweenService:Create(_jF,TweenInfo.new(0.2),{BackgroundColor3=_y.color(20,20,17)})
                                  local _jK=tweenService:Create(_jG,TweenInfo.new(0.2),{TextColor3=_jD.Risky and theme.risky or _y.color(129,129,127)})
                                  if _jD.Risky then _jG.TextColor3=theme.risky
                                  end theme_event.Event:Connect(function()
                                    local _jL={BackgroundColor3=theme.accent}_jH=tweenService:Create(_jF,TweenInfo.new(0.2),_jL)
                                    if _jD.Risky then local _jM={TextColor3=theme.risky}_jI=tweenService:Create(_jG,TweenInfo.new(0.2),_jM)
                                      local _jN={TextColor3=theme.risky}_jK=tweenService:Create(_jG,TweenInfo.new(0.2),_jN)_jG.TextColor3=theme.risky
                                    end
                                    if _jD.state then _jF.BackgroundColor3=theme.accent
                                    end
                                  end)
                                  local function _jO()_jH:Play()_jI:Play()
                                  end
                                  local function _jP()_jJ:Play()_jK:Play()
                                  end
                                  if _jD.Info then local _jQ=_bI:GetTextBoundary(_jD.title,Enum.Font.SourceSans.Value,12)
                                    local _jR=_y.new("Frame",_bH["19"])_jR.Name="InfoIconBG"_jR.Active=true _jR.BackgroundColor3=_y.color(21,21,21)_jR.BorderSizePixel=0 _jR.Position=_y.udim2(0,18+_jQ+6,0,0)_jR.Size=_y.udim2(0,13,0,13)_jR.ZIndex=2
                                    local _jS=_y.new("UICorner",_jR)_jS.Name="InfoIconBGCorner"_jS.CornerRadius=UDim.new(0,100)
                                    local _jT=_y.new("UIStroke",_jR)_jT.ApplyStrokeMode=Enum.ApplyStrokeMode.Border _jT.Name="InfoIconBGStroke"_jT.Color=_y.color(48,54,68)
                                    local _jU=_y.new("TextLabel",_jR)_jU.Name="InfoIcon"_jU.BackgroundTransparency=1 _jU.BorderSizePixel=0 _jU.Size=_y.udim2(1,0,1,0)_jU.FontFace=_y.font _jU.Text="?"_jU.TextColor3=_y.color(255,255,255)_jU.TextSize=12 _jU.TextXAlignment=Enum.TextXAlignment.Center _jU.TextYAlignment=Enum.TextYAlignment.Center _jU.ZIndex=2
                                    local _jV=_y.new("Frame",_bH["1"])_jV.Name="InfoTooltip"_jV.BackgroundColor3=_y.color(15,15,15)_jV.BackgroundTransparency=1 _jV.BorderSizePixel=0 _jV.Visible=false _jV.ZIndex=10 _jV.AutomaticSize=Enum.AutomaticSize.XY _y.new("UICorner",_jV).CornerRadius=UDim.new(0,4)
                                    local _jW=_y.new("UIStroke",_jV)_jW.ApplyStrokeMode=Enum.ApplyStrokeMode.Border _jW.Color=_y.color(37,37,37)_jW.Transparency=1
                                    local _jX=_y.new("UIPadding",_jV)_jX.PaddingLeft=UDim.new(0,6)_jX.PaddingRight=UDim.new(0,6)_jX.PaddingTop=UDim.new(0,4)_jX.PaddingBottom=UDim.new(0,4)
                                    local _jY=_y.new("TextLabel",_jV)_jY.BackgroundTransparency=1 _jY.FontFace=_y.font _jY.Text=_jD.InfoText _jY.TextColor3=_y.color(255,255,255)_jY.TextTransparency=1 _jY.TextSize=12 _jY.Size=_y.udim2(0,0,0,16)_jY.AutomaticSize=Enum.AutomaticSize.X _jY.ZIndex=2
                                    local _jZ={TextTransparency=0}
                                    local _ka={BG=tweenService:Create(_jV,TweenInfo.new(0.2),{BackgroundTransparency=0}),Stroke=tweenService:Create(_jW,TweenInfo.new(0.2),{Transparency=0}),Text=tweenService:Create(_jY,TweenInfo.new(0.2),_jZ),}
                                    local _kb={BG=tweenService:Create(_jV,TweenInfo.new(0.2),{BackgroundTransparency=1}),Stroke=tweenService:Create(_jW,TweenInfo.new(0.2),{Transparency=1}),Text=tweenService:Create(_jY,TweenInfo.new(0.2),{TextTransparency=1}),}
                                    local function _kc()
                                      local _kd=inputService:GetMouseLocation()_jV.Position=_y.udim2(0,_kd.X+12,0,_kd.Y-28)
                                    end _jR.MouseEnter:Connect(function()_jV.Visible=true _kc()_ka.BG:Play()_ka.Stroke:Play()_ka.Text:Play()
                                    end)_jR.MouseMoved:Connect(function()_kc()
                                    end)_jR.MouseLeave:Connect(function()_kb.BG:Play()_kb.Stroke:Play()_kb.Text:Play()_y.wait_(0.2)_jV.Visible=false
                                    end)
                                  end _jD.Set=function(_ke,_kf)_jD.state=_kf pcall(_jD.callback,_jD.state)_bG.Flags[_jD.Flag]=_jD.state
                                    if _jD.state==true then _jO()
                                    else _jP()
                                    end
                                  end _jD.Keybind=function(_kg,_kh)_cK:Keybind(_kh,_jE)
                                  end _jD.Colorpicker=function(_ki,_kj)_jD.HasColorpicker=true
                                    return _cK:Colorpicker(_kj,_jE)
                                  end _jD.Settings=function(_kk,_kl)
                                    local _km=(_kl or{}).callback or function()
                                    end
                                    local _kn=_y.new("ImageButton")
                                    local _ko=_y.new("UICorner")
                                    local _kp=_y.new("UIStroke")_kn.Name="SettingsButton"_kn.Parent=_jE _kn.BackgroundColor3=_y.color(21,21,21)_kn.BorderSizePixel=0 _kn.Position=_y.udim2(1,-13,0,0)_kn.Size=_y.udim2(0,16,0,16)_kn.Image=_K
                                    local _kq=Instance.new("TextLabel")_kq.Name="SettingsGlyph"_kq.Parent=_kn _kq.Size=UDim2.fromScale(1,1)_kq.BackgroundTransparency=1 _kq.Font=Enum.Font.SourceSansBold _kq.Text="\226\154\153"_kq.TextSize=16 _kq.TextColor3=Color3.fromRGB(200,200,200)_kq.ZIndex=3 _kn.ImageColor3=_y.color(200,200,200)_kn.ScaleType=Enum.ScaleType.Fit _kn.ZIndex=2
                                    local _kr=_jE:FindFirstChild("KeybindButton",true)
                                    if _kr then _kr.Position=_y.udim2(1,0,0,0)
                                    else for _ks,_kt in ipairs(_jE:GetDescendants())do if _kt.Name=="KeybindButton"then _kt.Position=_y.udim2(0.635,0,0,0)break
                                        end
                                      end
                                    end _ko.CornerRadius=UDim.new(0,4)_ko.Name="SettingsCorner"_ko.Parent=_kn _kp.ApplyStrokeMode=Enum.ApplyStrokeMode.Border _kp.Name="SettingsStroke"_kp.Color=_y.color(48,54,68)_kp.Parent=_kn
                                    local _ku={ImageColor3=theme.accent}
                                    local _kv=tweenService:Create(_kn,TweenInfo.new(0.2),_ku)
                                    local _kw=tweenService:Create(_kn,TweenInfo.new(0.2),{ImageColor3=_y.color(200,200,200)})theme_event.Event:Connect(function()
                                      local _kx={ImageColor3=theme.accent}_kv=tweenService:Create(_kn,TweenInfo.new(0.2),_kx)
                                    end)
                                    local _ky=_y.new("Frame")
                                    local _kz=_y.new("UICorner")
                                    local _kA=_y.new("UIStroke")
                                    local _kB=_y.new("UIListLayout")
                                    local _kC=_y.new("UIPadding")_ky.Name="SettingsPopup"_ky.Parent=_bH["1"]_ky.BackgroundColor3=_y.color(23,23,23)_ky.BorderColor3=_y.color(0,0,0)_ky.BorderSizePixel=0 _ky.Position=_y.udim2(0,0,0,0)_ky.Size=_y.udim2(0,180,0,0)_ky.Visible=false _ky.ZIndex=2 _ky.AutomaticSize=Enum.AutomaticSize.Y _kz.Name="UICorner" _kz.CornerRadius=UDim.new(0,5)_kz.Parent=_ky _kA.Name="UIStroke" _kA.Parent=_ky _kA.ApplyStrokeMode=Enum.ApplyStrokeMode.Border _kA.Color=_y.color(48,54,68)_kB.Name="SettingsPopupList"_kB.Parent=_ky _kB.SortOrder=Enum.SortOrder.LayoutOrder _kB.Padding=UDim.new(0,6)_kC.Name="SettingsPopupPadding"_kC.Parent=_ky _kC.PaddingLeft=UDim.new(0,8)_kC.PaddingRight=UDim.new(0,8)_kC.PaddingTop=UDim.new(0,8)_kC.PaddingBottom=UDim.new(0,6)
                                    local _kD=_y.new("Frame")_kD.Name="SettingsComponents"_kD.Parent=_ky _kD.BackgroundTransparency=1 _kD.BorderSizePixel=0 _kD.Size=_y.udim2(1,0,0,0)_kD.AutomaticSize=Enum.AutomaticSize.Y _kD.ZIndex=10
                                    local _kE=_y.new("UIListLayout")_kE.Name="SettingsComponentsList"_kE.Parent=_kD _kE.SortOrder=Enum.SortOrder.LayoutOrder _kE.Padding=UDim.new(0,6)
                                    local _kF={}
                                    local _kG=false
                                    local _kH="SettingsPopup_"..tostring(math.random(10000,99999))
                                    local _kI=nil
                                    local function _kJ()
                                      if _kI then _kI:Disconnect()_kI=nil
                                      end
                                    end
                                    local function _kK()_kJ()_kI=inputService.InputBegan:Connect(function(_kL)
                                        if _kL.UserInputType~=Enum.UserInputType.MouseButton1 then return
                                        end
                                        if not _kG then return
                                        end
                                        local _kM=inputService:GetMouseLocation()-_y.vector2(0,36)
                                        local _kN=_ky.AbsolutePosition
                                        local _kO=_ky.AbsoluteSize
                                        local _kP=_kM.X>=_kN.X and _kM.X<=_kN.X+_kO.X and _kM.Y>=_kN.Y and _kM.Y<=_kN.Y+_kO.Y
                                        local _kQ=_kn.AbsolutePosition
                                        local _kR=_kn.AbsoluteSize
                                        local _kS=_kM.X>=_kQ.X and _kM.X<=_kQ.X+_kR.X and _kM.Y>=_kQ.Y and _kM.Y<=_kQ.Y+_kR.Y
                                        local _kT=false
                                        for _kU,_kV in ipairs(_ky:GetDescendants())do if _kV:IsA("GuiObject")and _kV.Visible then local _kW=_kV.Name
                                            if _kW=="Inline"or _kW=="ColorpickerContent"or _kW=="CPContextMenu"then local _kX=_kV.AbsolutePosition
                                              local _kY=_kV.AbsoluteSize
                                              if _kM.X>=_kX.X and _kM.X<=_kX.X+_kY.X and _kM.Y>=_kX.Y and _kM.Y<=_kX.Y+_kY.Y then _kT=true break
                                              end
                                            end
                                          end
                                        end
                                        if not _kP and not _kS and not _kT then _kG=false _kJ()_ky.Visible=false
                                        end
                                      end)
                                    end
                                    local function _kZ()
                                      local _la=_kn.AbsolutePosition
                                      local _lb=_bH["1"].IgnoreGuiInset and Vector2.zero or game:GetService("GuiService"):GetGuiInset()
                                      local _lc=workspace.CurrentCamera.ViewportSize
                                      local _ld=math.max(_ky.AbsoluteSize.X,180)
                                      local _le=math.max(_ky.AbsoluteSize.Y,_kD.AbsoluteSize.Y+16)
                                      local _lf=_la.X-_lb.X+_kn.AbsoluteSize.X+4
                                      if _lf+_ld>_lc.X-6 then _lf=_la.X-_lb.X-_ld-4
                                      end _ky.Position=UDim2.fromOffset(math.clamp(_lf,6,math.max(6,_lc.X-_ld-6)),math.clamp(_la.Y-_lb.Y,6,math.max(6,_lc.Y-_le-6)))
                                    end
                                    local function _lg()_kG=false _kJ()_ky.Visible=false
                                    end
                                    local function _lh()_ky.Visible=true _kZ()_kG=true _kK()_bG:NewPopup({Remove=function()
                                        if _kG then _lg()
                                        end
                                      end,ID=_kH,})
                                    end _kn.Activated:Connect(function()
                                      if _kG then _lg()
                                      else if _bG.Popup and _bG.Popup.ID~=_kH then _bG:RemovePopups()
                                        end _lh()
                                      end _kv:Play()_y.wait_(0.1)_kw:Play()pcall(_km)
                                    end)_kF.Slider=function(_li,_lj)
                                      local _lk={Title=_lj.title or "slider",Min=_lj.min or 1,Max=_lj.max or 10,Float=_lj.float or 1,Default=_lj.default or 0,Value=0,Callback=_lj.callback or function()
                                      end,Sliding=false,Suffix=_lj.suffix or"",}_lk.Flag=_bG:GetNextFlag()_lk.MinText=_lj.mintext or tostring(_lk.Min)_lk.MaxText=_lj.maxtext or tostring(_lk.Max)
                                      local _ll=_y.new("Frame")
                                      local _lm=_y.new("TextLabel")
                                      local _ln=_y.new("TextLabel")
                                      local _lo=_y.new("Frame")
                                      local _lp=_y.new("UICorner")
                                      local _lq=_y.new("Frame")
                                      local _lr=_y.new("UICorner")
                                      local _ls=_y.new("Frame")
                                      local _lt=_y.new("UICorner")
                                      local _lu=_y.new("Frame")
                                      local _lv=_y.new("UICorner")_ll.Name="Slider"_ll.Parent=_kD _ll.BackgroundColor3=_y.color(23,23,23)_ll.BackgroundTransparency=1 _ll.BorderColor3=_y.color(0,0,0)_ll.BorderSizePixel=0 _ll.Size=_y.udim2(1,0,0,30)_ll.ZIndex=11 _lm.Name="SliderName"_lm.Parent=_ll _lm.BackgroundColor3=_y.color(255,255,255)_lm.BackgroundTransparency=1 _lm.BorderColor3=_y.color(0,0,0)_lm.BorderSizePixel=0 _lm.Size=_y.udim2(0,100,0,14)_lm.FontFace=_y.font _lm.Text=_lk.Title _lm.TextColor3=_y.color(255,255,255)_lm.TextSize=11 _lm.TextXAlignment=Enum.TextXAlignment.Left _lm.ZIndex=11 _ln.Name="SliderValue"_ln.Parent=_ll _ln.BackgroundColor3=_y.color(255,255,255)_ln.BackgroundTransparency=1 _ln.BorderColor3=_y.color(0,0,0)_ln.BorderSizePixel=0 _ln.Position=_y.udim2(0,0,0,0)_ln.Size=_y.udim2(1,0,0,14)_ln.FontFace=_y.font _ln.Text=_lk.Value.._lk.Suffix _ln.TextColor3=_y.color(124,124,124)_ln.TextSize=11 _ln.TextXAlignment=Enum.TextXAlignment.Right _ln.ZIndex=11 _lo.Name="SliderInline"_lo.Parent=_ll _lo.BackgroundColor3=_y.color(21,21,21)_lo.BorderColor3=_y.color(0,0,0)_lo.BorderSizePixel=0 _lo.Position=_y.udim2(0,0,0.55,0)_lo.Size=_y.udim2(1,0,0,6)_lo.ZIndex=11 _lp.CornerRadius=UDim.new(0,2)_lp.Name="InlineCorner"_lp.Parent=_lo _lq.Name="SliderBackground"_lq.Parent=_lo _lq.BackgroundColor3=_y.color(21,21,21)_lq.BorderColor3=_y.color(0,0,0)_lq.BorderSizePixel=0 _lq.Size=_y.udim2(1,0,1,0)_lq.ZIndex=11 _lr.CornerRadius=UDim.new(0,2)_lr.Name="BackgroundCorner"_lr.Parent=_lq _ls.Name="Frame" _ls.Parent=_lq _ls.BackgroundColor3=_y.color(159,153,159)_ls.BorderColor3=_y.color(0,0,0)_ls.BorderSizePixel=0 _ls.Size=_y.udim2(0,0,1,0)_ls.ZIndex=11 _lt.CornerRadius=UDim.new(0,2)_lt.Name="FillCorner"_lt.Parent=_ls _lu.Name="SliderDrag"_lu.Parent=_ll _lu.BackgroundColor3=_y.color(255,0,0)_lu.BackgroundTransparency=1 _lu.BorderColor3=_y.color(0,0,0)_lu.BorderSizePixel=0 _lu.Position=_y.udim2(0,0,0.55,-5)_lu.Size=_y.udim2(1,0,0,16)_lu.ZIndex=12 _lv.CornerRadius=UDim.new(0,2)_lv.Name="DragCorner"_lv.Parent=_lu
                                      local _lw=_y.new("UIStroke",_lo)_lw.ApplyStrokeMode=Enum.ApplyStrokeMode.Border _lw.Name="INLINESTROKE"_lw.Color=_y.color(32,32,32)_lw.ZIndex=11
                                      local _lx=_y.new("UIStroke",_lq)_lx.ApplyStrokeMode=Enum.ApplyStrokeMode.Border _lx.Name="UIStroke" _lx.Color=_y.color(32,32,32)_lx.ZIndex=11
                                      local _ly=_y.new("UIStroke",_ls)_ly.ApplyStrokeMode=Enum.ApplyStrokeMode.Border _ly.Name="SliderFillStroke"_ly.Color=_y.color(172,159,159)_ly["Transparency"]=0.5 _ly.ZIndex=3 theme_event.Event:Connect(function()_ls.BackgroundColor3=theme.accent _ly.Color=theme.accent
                                      end)
                                      local function _lz(_lA,_lB)
                                        return _lB*math.round(_lA/_lB)
                                      end _lk.Set=function(_lC,_lD)
                                        local _lE=_lk.Min
                                        local _lF=_lk.Max
                                        local _lG=math.clamp(_lz(_lD,_lk.Float),_lE,_lF)
                                        local _lH=(_lG-_lk.Min)/(_lk.Max-_lk.Min)_lk.Value=_lG tweenService:Create(_ls,TweenInfo.new(0.13,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=_y.udim2(_lH,0,1,0)}):Play()_lk.Callback(_lG)_bG.Flags[_lk.Flag]=_lk.Value _ln.Text=_lk.Value==_lk.Min and _lk.MinText or _lk.Value==_lk.Max and _lk.MaxText or string.format("%.14g%s",_lk.Value,_lk.Suffix)
                                      end _lk.Slide=function(_lI,_lJ)
                                        local _lK=math.clamp((_lk.Max-_lk.Min)*(_lJ.Position.X-_lq.AbsolutePosition.X)/_lq.AbsoluteSize.X+_lk.Min,_lk.Min,_lk.Max)_lI:Set(_lK)
                                      end _lk:Set(_lk.Default)_lu.MouseEnter:Connect(function()tweenService:Create(_lx,TweenInfo.new(0.2),{Color=_y.color(255,255,255)}):Play()
                                      end)_lu.MouseLeave:Connect(function()tweenService:Create(_lx,TweenInfo.new(0.2),{Color=_y.color(32,32,32)}):Play()
                                      end)_lu.InputBegan:Connect(function(_lL)
                                        if _lL.UserInputType==Enum.UserInputType.MouseButton1 then _lk.Sliding=true _lk:Slide(_lL)
                                        end
                                      end)_lu.InputEnded:Connect(function(_lM)
                                        if _lM.UserInputType==Enum.UserInputType.MouseButton1 then _lk.Sliding=false _lk:Slide(_lM)
                                        end
                                      end)_lu.InputChanged:Connect(function(_lN)
                                        if _lN.UserInputType==Enum.UserInputType.MouseMovement and _lk.Sliding then _lk:Slide(_lN)
                                        end
                                      end)_bG.ConfigFlags[_lk.Flag]=function(_lO)_lk:Set(_lO)
                                      end
                                      return _lk
                                    end _kF.Label=function(_lP,_lQ,_lR)
                                      local _lS={}
                                      local _lT=_lR~=nil and _lR==true and true or false
                                      local _lU=_y.new("TextLabel")_lU.Name="Label"_lU.Parent=_kD _lU.BackgroundColor3=_y.color(23,23,23)_lU.BackgroundTransparency=1 _lU.BorderColor3=_y.color(0,0,0)_lU.BorderSizePixel=0 _lU.Size=_y.udim2(1,0,0,14)_lU.FontFace=_y.font _lU.Text=_lQ _lU.TextColor3=_y.color(255,255,255)_lU.TextSize=11 _lU.TextXAlignment=Enum.TextXAlignment.Left _lU.RichText=_lT _lU.TextTruncate="AtEnd"_lU.ZIndex=11 _lS.ChangeText=function(_lV,_lW)
                                        if not type(_lW)=="string"then return
                                        end _lU.Text=tostring(_lW)
                                      end
                                      return _lS
                                    end _kF.Button=function(_lX,_lY)
                                      local _lZ={title=_lY.title or "untitled",callback=_lY.callback or function()
                                      end,}
                                      local _ma=_y.new("TextButton")
                                      local _mb=_y.new("UICorner")_ma.Name="Button"_ma.Parent=_kD _ma.BackgroundColor3=_y.color(21,21,21)_ma.BorderColor3=_y.color(0,0,0)_ma.BorderSizePixel=0 _ma.Size=_y.udim2(1,0,0,22)_ma.AutoButtonColor=false _ma.FontFace=_y.font _ma.Text=_lZ.title _ma.TextColor3=_y.color(255,255,255)_ma.TextSize=11 _ma.TextStrokeTransparency=0 _ma.TextWrapped=true _ma.ZIndex=11 _mb.CornerRadius=UDim.new(0,2)_mb.Name="ButtonCorner"_mb.Parent=_ma
                                      local _mc=_y.new("UIStroke",_ma)_mc.ApplyStrokeMode=Enum.ApplyStrokeMode.Border _mc["Name"]="ButtonStroke"_mc.Color=_y.color(48,54,68)_mc.ZIndex=3
                                      local _mj={OnClick=function()
                                        local _md=tweenService:Create(_ma,TweenInfo.new(0),{BackgroundColor3=_y.color(36,36,36)})
                                        local _me=tweenService:Create(_mc,TweenInfo.new(0),{Color=_y.color(45,43,46)})_md:Play()_me:Play()
                                      end,OnHover=function()
                                        local _mf=tweenService:Create(_ma,TweenInfo.new(0),{BackgroundColor3=_y.color(28,28,28)})
                                        local _mg=tweenService:Create(_mc,TweenInfo.new(0),{Color=_y.color(36,36,36)})_mf:Play()_mg:Play()
                                      end,OnMouseLeave=function()
                                        local _mh=tweenService:Create(_ma,TweenInfo.new(0),{BackgroundColor3=_y.color(21,21,21)})
                                        local _mi=tweenService:Create(_mc,TweenInfo.new(0),{Color=_y.color(40,40,40)})_mh:Play()_mi:Play()
                                      end,}
                                      local _mk={TextColor3=theme.accent}
                                      local _ml=tweenService:Create(_ma,TweenInfo.new(0.2),_mk)
                                      local _mm=tweenService:Create(_ma,TweenInfo.new(0.2),{TextColor3=_y.color(255,255,255)})theme_event.Event:Connect(function()
                                        local _mn={TextColor3=theme.accent}_ml=tweenService:Create(_ma,TweenInfo.new(0.2),_mn)
                                      end)_ma.MouseButton1Click:Connect(function()_mj.OnClick()pcall(_lZ.callback)_ml:Play()_y.wait_(0.1)_mj.OnHover()_y.wait_(0.15)_mm:Play()
                                      end)_ma.MouseEnter:Connect(_mj.OnHover)_ma.MouseLeave:Connect(_mj.OnMouseLeave)
                                      return _lZ
                                    end _kF.Toggle=function(_mo,_mp)
                                      local _mq={title=_mp.title or "toggle",default=_mp.default or false,state=false,callback=_mp.callback or function()
                                      end,}_mq.Flag=_bG:GetNextFlag()
                                      local _mr=_y.new("TextButton")
                                      local _ms=_y.new("Frame")
                                      local _mt=_y.new("UICorner")
                                      local _mu=_y.new("UIStroke")
                                      local _mv=_y.new("TextLabel")_mq.Colorpicker=function(_mw,_mx)
                                        return _kF:Colorpicker(_mx,_mr)
                                      end _mr.Name="TextButton" _mr.Parent=_kD _mr.BorderSizePixel=0 _mr.TextTransparency=1 _mr.TextSize=12 _mr.TextColor3=_y.color(255,255,255)_mr.BackgroundColor3=_y.color(23,23,23)_mr.FontFace=_y.font _mr.Size=_y.udim2(1,0,0,15)_mr.BackgroundTransparency=1 _mr.BorderColor3=_y.color(0,0,0)_mr.Text=""_mr.ZIndex=11 _ms.Name="ToggleStatus"_ms.Parent=_mr _ms.BorderSizePixel=0 _ms.BackgroundColor3=_y.color(20,17,5)_ms.Size=_y.udim2(0,12,0,12)_ms.BorderColor3=_y.color(0,0,0)_ms.Position=_y.udim2(0,0,0.077,0)_ms.ZIndex=11 _mt.Name="ToggleStatusCorner"_mt.CornerRadius=UDim.new(0,3)_mt.Parent=_ms _mu.ApplyStrokeMode=Enum.ApplyStrokeMode.Border _mu.Name="ToggleUIStroke"_mu.Color=_y.color(37,37,37)_mu.Parent=_ms _mu.ZIndex=11 _mv.Name="ToggleName"_mv.Parent=_mr _mv.TextStrokeTransparency=1 _mv.BorderSizePixel=0 _mv.TextXAlignment=Enum.TextXAlignment.Left _mv.BackgroundColor3=_y.color(255,255,255)_mv.TextSize=11 _mv.FontFace=_y.font _mv.TextColor3=_y.color(129,129,127)_mv.BackgroundTransparency=1 _mv.Size=_y.udim2(1,-30,0,13)_mv.BorderColor3=_y.color(0,0,0)_mv.Text=_mq.title _mv.Position=_y.udim2(0,17,0,0)_mv.ZIndex=11
                                      local _my=tweenService:Create(_ms,TweenInfo.new(0.2),{BackgroundColor3=_y.color(168,0,159)})
                                      local _mz=tweenService:Create(_mv,TweenInfo.new(0.2),{TextColor3=_y.color(255,255,255)})
                                      local _mA=tweenService:Create(_ms,TweenInfo.new(0.2),{BackgroundColor3=_y.color(17,20,17)})
                                      local _mB=tweenService:Create(_mv,TweenInfo.new(0.2),{TextColor3=_y.color(129,129,127)})theme_event.Event:Connect(function()
                                        local _mC={BackgroundColor3=theme.accent}_my=tweenService:Create(_ms,TweenInfo.new(0.2),_mC)
                                        if _mq.state then _ms.BackgroundColor3=theme.accent
                                        end
                                      end)
                                      local function _mD()_my:Play()_mz:Play()
                                      end
                                      local function _mE()_mA:Play()_mB:Play()
                                      end _mq.Set=function(_mF,_mG)_mq.state=_mG pcall(_mq.callback,_mq.state)_bG.Flags[_mq.Flag]=_mq.state
                                        if _mq.state==true then _mD()
                                        else _mE()
                                        end
                                      end _mr.MouseButton1Click:Connect(function()_mq.state=not _mq.state _mq:Set(_mq.state)
                                      end)_mq:Set(_mq.default)_bG.ConfigFlags[_mq.Flag]=function(_mH)_mq:Set(_mH)
                                      end
                                      return _mq
                                    end _kF.Colorpicker=function(_mI,_mJ,_mK)
                                      if _mK==nil and _mI.ParentToggle then _mI.ParentToggle:Colorpicker(_mJ)
                                        return _mI
                                      end
                                      local _mL={Title=_mJ.title or ""}_mL.Default=_mJ.default or _y.color(255,255,255)_mL.Transparency=_mJ.transparency or 0 _mL.Callback=_mJ.callback or function()
                                      end _mL.Flag=_bG:GetNextFlag()
                                      local _mM={TransparencyValue=0,ColorValue=nil,HuePosition=0,SlidingSat=false,SlidingHue=false,SlidingAlpha=false,}
                                      local _mN=_y.new("Frame")
                                      local _mO=_y.new("TextLabel")
                                      local _mP=_y.new("TextButton")
                                      local _mQ=_y.new("Frame")
                                      local _mR=_y.new("Frame")
                                      local _mS=_y.new("UICorner")
                                      local _mT=_y.new("Frame")
                                      local _mU=_y.new("Frame")
                                      local _mV=_y.new("Frame")
                                      local _mW=_y.new("UIGradient")
                                      local _mX=_y.new("ImageLabel")
                                      local _mY=_y.new("TextButton")
                                      local _mZ=_y.new("Frame")
                                      local _na=_y.new("ImageLabel")
                                      local _nb=_y.new("ImageLabel")
                                      local _nc=_y.new("TextButton")
                                      local _nd=_y.new("ImageLabel")
                                      local _ne=_y.new("Frame")
                                      local _nf=_y.new("UIGradient")
                                      local _ng=_y.new("ImageLabel")
                                      local _nh=_y.new("TextButton")_mN.Name="ColorpickerHolder"_mN.Parent=_mK==nil and _kD or _mK
                                      if _mK then local _ni=_mK:FindFirstChild("HumanoidRootPart")_ni=_ni and _ni.Position.X.Scale*216+_ni.Position.X.Offset-18 or 20
                                        local _nj=0
                                        for _nk,_nl in ipairs(_mK:GetChildren())do if _nl.Name=="ColorpickerHolder"then _nj+=1
                                          end
                                        end _mN.Position=_y.udim2(0,-18*(_nj-1),0,0)
                                      end _mN.BackgroundColor3=_y.color(255,255,255)_mN.BackgroundTransparency=1 _mN.BorderColor3=_y.color(0,0,0)_mN.BorderSizePixel=0 _mN.Size=_y.udim2(1,0,0,13)_mN.ZIndex=11
                                      if _mK==nil then _mO.Name="TextLabel" _mO.Parent=_mN _mO.BackgroundColor3=_y.color(255,255,255)_mO.BackgroundTransparency=1 _mO.BorderColor3=_y.color(0,0,0)_mO.BorderSizePixel=0 _mO.Size=_y.udim2(1,-16,0,13)_mO.FontFace=_y.font _mO.Text=_mL.Title _mO.TextColor3=_y.color(255,255,255)_mO.TextSize=11 _mO.TextXAlignment=Enum.TextXAlignment.Left _mO.ZIndex=11
                                      end _mP.Name="ColorpickerButton"_mP.Parent=_mN _mP.BackgroundColor3=_y.color(255,255,255)_mP.BackgroundTransparency=1 _mP.BorderColor3=_y.color(0,0,0)_mP.BorderSizePixel=0 _mP.Position=_y.udim2(1,-13,0,0)_mP.Size=_y.udim2(0,13,0,13)_mP.FontFace=_y.font _mP.Text=""_mP.TextColor3=_y.color(0,0,0)_mP.TextSize=12 _mP.ZIndex=11
                                      local _nm=_y.new("ImageLabel")_nm.Name="ColorpickerStatusAlphaBG"_nm.Parent=_mN _nm.BackgroundTransparency=1 _nm.BorderSizePixel=0 _nm.Position=_y.udim2(1,-16,0,0)_nm.Size=_y.udim2(0,13,0,13)_nm.Image="rbxassetid://101382427624863"_nm.ScaleType=Enum.ScaleType.Tile _nm.TileSize=_y.udim2(0,6,0,6)_nm.ZIndex=11
                                      local _nn=_y.new("UICorner")_nn.CornerRadius=UDim.new(0,5)_nn.Name="ColorpickerStatusAlphaCorner"_nn.Parent=_nm _mQ.Name="Frame" _mQ.Parent=_mN _mQ.BackgroundColor3=_y.color(170,170,255)_mQ.BorderColor3=_y.color(0,0,0)_mQ.BorderSizePixel=0 _mQ.Position=_y.udim2(1,-13,0,0)_mQ.Size=_y.udim2(0,13,0,16)_mQ.ZIndex=11 _mR.Name="ColorpickerInline"_mR.Parent=_mN _mR.BackgroundColor3=_y.color(170,170,255)_mR.BackgroundTransparency=1 _mR.BorderColor3=_y.color(0,0,0)_mR.BorderSizePixel=0 _mR.Position=_y.udim2(1,-16,0,0)_mR.Size=_y.udim2(0,13,0,13)_mR.Visible=false _mR.ZIndex=13 _mS.CornerRadius=UDim.new(0,2)_mS.Name="CPInlineCorner"_mS.Parent=_mR
                                      local _no=_y.new("UICorner")_no.CornerRadius=UDim.new(0,4)_no.Name="ColorpickerStatusCorner"_no.Parent=_mQ _mT.Name="ColorpickerContent"_mT.Parent=_mR _mT.BackgroundColor3=_y.color(23,23,23)_mT.BorderColor3=_y.color(0,0,0)_mT.Position=_y.udim2(1,4,0,0)_mT.Size=_y.udim2(0,102,0,159)_mT.ZIndex=13 _mU.Name="Accent"_mU.Parent=_mT _mU.BackgroundColor3=_y.color(75,90,115)_mU.BorderColor3=_y.color(0,0,0)_mU.Size=_y.udim2(1,0,0,1)_mU.ZIndex=13 _mV.Name="HueBackground"_mV.Parent=_mT _mV.BackgroundColor3=_y.color(255,255,255)_mV.BorderColor3=_y.color(0,0,0)_mV.BorderSizePixel=0 _mV.Position=_y.udim2(0.879000008,0,0,29)_mV.Size=_y.udim2(0,12,0,106)_mV.ZIndex=16
                                      local _np=ColorSequence.new
                                      local _nq={}
                                      local _nr=ColorSequenceKeypoint.new(0,_y.color(255,0,0))
                                      local _ns=ColorSequenceKeypoint.new(0.17,_y.color(255,0,255))
                                      local _nt=ColorSequenceKeypoint.new(0.33,_y.color(0,0,255))
                                      local _nu=ColorSequenceKeypoint.new(0.5,_y.color(0,255,255))
                                      local _nv=ColorSequenceKeypoint.new(0.67,_y.color(0,255,0))
                                      local _nw=ColorSequenceKeypoint.new(0.83,_y.color(255,255,0))
                                      local _nx=ColorSequenceKeypoint.new
                                      local _ny=1 _nq[1]=_nr _nq[2]=_ns _nq[3]=_nt _nq[4]=_nu _nq[5]=_nv _nq[6]=_nw do local _nz=table.pack(_nx(_ny,_y.color(255,0,0)))table.move(_nz,1,_nz.n,7,_nq)
                                      end _mW.Color=_np(_nq)_mW.Rotation=90 _mW.Name="CPHueGradient"_mW.Parent=_mV _mX.Name="HuePicker"_mX.Parent=_mV _mX.BackgroundColor3=_y.color(255,255,255)_mX.BackgroundTransparency=1 _mX.BorderColor3=_y.color(0,0,0)_mX.BorderSizePixel=0 _mX.Position=_y.udim2(0,-4,0,-2)_mX.Size=_y.udim2(0,5,0,5)_mX.Image="rbxassetid://13900818694"_mX.ZIndex=16 _mY.Parent=_mV _mY.BackgroundColor3=_y.color(255,255,255)_mY.BackgroundTransparency=1 _mY.BorderColor3=_y.color(0,0,0)_mY.BorderSizePixel=0 _mY.Size=_y.udim2(1,0,1,0)_mY.FontFace=_y.font _mY.Text=""_mY.TextColor3=_y.color(0,0,0)_mY.TextSize=12 _mY.ZIndex=13 _mZ.Name="Frame" _mZ.Parent=_mT _mZ.BackgroundColor3=_y.color(255,255,255)_mZ.BorderColor3=_y.color(0,0,0)_mZ.Position=_y.udim2(0.0661764741,0,0,29)_mZ.Size=_y.udim2(0,102,0,106)_mZ.ZIndex=13 _na.Name="ImageLabel" _na.Parent=_mZ _na.BackgroundColor3=_y.color(255,255,255)_na.BackgroundTransparency=1 _na.BorderColor3=_y.color(0,0,0)_na.Size=_y.udim2(1,0,1,0)_na.Image="rbxassetid://13901004307"_na.ZIndex=13 _nb.Name="SaturationPicker"_nb.Parent=_mZ _nb.BackgroundColor3=_y.color(255,255,255)_nb.BackgroundTransparency=1 _nb.BorderColor3=_y.color(0,0,0)_nb.Position=_y.udim2(0,-1,0,-1)_nb.Size=_y.udim2(0,5,0,5)_nb.Image="rbxassetid://13900819741"_nb.ZIndex=13 _nc.Name="TextButton" _nc.Parent=_mZ _nc.BackgroundColor3=_y.color(255,255,255)_nc.BackgroundTransparency=1 _nc.BorderColor3=_y.color(0,0,0)_nc.BorderSizePixel=0 _nc.Size=_y.udim2(1,0,1,0)_nc.FontFace=_y.font _nc.Text=""_nc.TextColor3=_y.color(0,0,0)_nc.TextSize=12 _nc.ZIndex=13 _nd.Name="TransparencyAlphaBG"_nd.Parent=_mT _nd.BackgroundTransparency=1 _nd.BorderSizePixel=0 _nd.Position=_y.udim2(1,0,0,5)_nd.Size=_y.udim2(0,123,0,6)_nd.Image="rbxassetid://101382427624863"_nd.ScaleType=Enum.ScaleType.Tile _nd.TileSize=_y.udim2(0,6,0,6)_nd.ZIndex=13 _ne.Name="TransparencyBackground"_ne.Parent=_mT _ne.BackgroundColor3=_y.color(255,255,255)_ne.BorderColor3=_y.color(0,0,0)_ne.BorderSizePixel=0 _ne.Position=_y.udim2(0.0441176482,0,0,142)_ne.Size=_y.udim2(0,123,0,6)_ne.ZIndex=13
                                      local _nA=ColorSequence.new
                                      local _nB={}
                                      local _nC=ColorSequenceKeypoint.new(0,_y.color(255,255,255))
                                      local _nD=ColorSequenceKeypoint.new(0.57,_y.color(0,0,150))
                                      local _nE=ColorSequenceKeypoint.new _nB[1]=_nC _nB[2]=_nD do local _nF=table.pack(_nE(1,_y.color(0,0,0)))table.move(_nF,1,_nF.n,3,_nB)
                                      end _nf.Color=_nA(_nB)
                                      local _nG=NumberSequenceKeypoint.new _nf.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0),_nG(1,1)})_nf.Name="TransparencyGradient"_nf.Parent=_ne _ng.Name="TransparencyPicker"_ng.Parent=_ne _ng.BackgroundColor3=_y.color(255,255,255)_ng.BackgroundTransparency=1 _ng.BorderColor3=_y.color(0,0,0)_ng.BorderSizePixel=0 _ng.Position=_y.udim2(0,-2,0,-2)_ng.Size=_y.udim2(0,5,0,17)_ng.Image="rbxassetid://14248606745"_ng.ZIndex=13 _nh.Name="TransparencyButton"_nh.Parent=_ne _nh.BackgroundColor3=_y.color(255,255,255)_nh.BackgroundTransparency=1 _nh.BorderColor3=_y.color(0,0,0)_nh.BorderSizePixel=0 _nh.Size=_y.udim2(1,0,1,0)_nh.FontFace=_y.font _nh.Text=""_nh.TextColor3=_y.color(0,0,0)_nh.TextSize=12 _nh.ZIndex=16
                                      local _nH=next
                                      local _nI,_nJ=_mT:GetDescendants()
                                      for _nK,_nL in _nH,_nI,_nJ do if not _nL:IsA("UIGradient")then if _nL.ZIndex then _nL.ZIndex=13
                                          end
                                        end
                                      end _mT.Size=_y.udim2(0,136,0,139)_mV.Position=_y.udim2(0.879000008,0,0.0680000037,0)_mZ.Position=_y.udim2(0.0661764741,0,0.0676691756,0)_nd.Position=_y.udim2(0.0441176482,0,0.880901992,0)_ne.Position=_y.udim2(0.0441176482,0,0.880901992,0)
                                      local _nM,_nN,_nO=_mL.Default:ToHSV()
                                      local _nP _nP={Open=function(_nQ)_mT.Visible=true _mR.Visible=true tweenService:Create(_mT,TweenInfo.new(0.1),{BackgroundTransparency=0,Position=_y.udim2(1,5,0,0)}):Play()_nQ:FadeIn()
                                      end,FadeIn=function()
                                        for _nR,_nS in pairs(_mT:GetDescendants())do if _nS:IsA("Frame")then tweenService:Create(_nS,TweenInfo.new(0.1),{BackgroundTransparency=0}):Play()
                                          elseif _nS:IsA("ImageLabel")then tweenService:Create(_nS,TweenInfo.new(0.1),{ImageTransparency=0}):Play()
                                          end
                                        end
                                      end,FadeOut=function()
                                        for _nT,_nU in pairs(_mT:GetDescendants())do if _nU:IsA("Frame")then tweenService:Create(_nU,TweenInfo.new(0.15),{BackgroundTransparency=1}):Play()
                                          elseif _nU:IsA("ImageLabel")then tweenService:Create(_nU,TweenInfo.new(0.15),{ImageTransparency=1}):Play()
                                          end
                                        end
                                      end,Close=function()tweenService:Create(_mT,TweenInfo.new(0.15),{BackgroundTransparency=1,Position=_y.udim2(1,5,0,0)}):Play()_nP:FadeOut()_y.wait_(0.1)_mT.Visible=false _mR.Visible=false
                                      end,}
                                      local function _nV(_nW,_nX,_nY)
                                        return(_y.color(_nW,_nX,_nY))
                                      end _mL.Set=function(_nZ,_oa,_ob,_oc)
                                        if not _mL.Transparency then _mM.TransparencyValue=1
                                        end _ob=_ob or _mM.TransparencyValue
                                        local _od,_oe
                                        if typeof(_oa)=="table"then local _of=Color3.fromHex(_oa[1])
                                          if _oa[2]==nil then _od=_of _oe=_ob
                                          else _od=_of _oe=_oa[2]
                                          end
                                        else _od=_oa _oe=_ob
                                        end
                                        local _og,_oh,_oi=_od:ToHSV()_nM=_og _nN=_oh _nO=_oi _mM.ColorValue=_od _mM.TransparencyValue=_oe _mZ.BackgroundColor3=Color3.fromHSV(_mM.HuePosition,1,1)_mQ.BackgroundColor3=_od _mQ.BackgroundTransparency=1-_oe
                                        if not _oc then if _y.n26(0)<8107 then local _oj=math.clamp
                                            local _ok=_mZ.AbsoluteSize.Y-_nO*_mZ.AbsoluteSize.Y
                                            local _ol=_mZ.AbsoluteSize.Y-3 _nb.Position=_y.udim2(0,math.clamp(_nN*_mZ.AbsoluteSize.X,0,_mZ.AbsoluteSize.X-3),0,_oj(_ok,0,_ol))_mM.HuePosition=_nM _mX.Position=_y.udim2(0,-2,1-_nM,-2)
                                          else while true do end
                                          end
                                        end pcall(_mL.Callback,_nV(_od.R*255,_od.G*255,_od.B*255),_oe)_bG.Flags[_mL.Flag]={_nV(_od.R*255,_od.G*255,_od.B*255):ToHex(),_oe}
                                      end _mL:Set(_mL.Default,_mL.Transparency)
                                      local function _om(_on)
                                        local _oo=math.clamp((_on.Position.X-_mZ.AbsolutePosition.X)/_mZ.AbsoluteSize.X,0,1)
                                        local _op=1-math.clamp((_on.Position.Y-_mZ.AbsolutePosition.Y)/_mZ.AbsoluteSize.Y,0,1)
                                        local _oq=math.clamp((_on.Position.Y-_mZ.AbsolutePosition.Y)/_mZ.AbsoluteSize.Y*_mZ.AbsoluteSize.Y,0,_mZ.AbsoluteSize.Y-3)_nb.Position=_y.udim2(0,math.clamp((_on.Position.X-_mZ.AbsolutePosition.X)/_mZ.AbsoluteSize.X*_mZ.AbsoluteSize.X,0,_mZ.AbsoluteSize.X-4),0,_oq)
                                        local _or=_mM.TransparencyValue _mL:Set(Color3.fromHSV(_mM.HuePosition,_oo,_op),_or,true)
                                      end _nc.MouseButton1Down:Connect(function()_mM.SlidingSat=true _om({Position=game.UserInputService:GetMouseLocation()-_y.vector2(0,36)})
                                      end)
                                      local function _os(_ot)
                                        local _ou=1-math.clamp((_ot.Position.Y-_mV.AbsolutePosition.Y)/_mV.AbsoluteSize.Y,0,1)_mX.Position=_y.udim2(0,-2,0,math.clamp((_ot.Position.Y-_mV.AbsolutePosition.Y)/_mV.AbsoluteSize.Y*_mV.AbsoluteSize.Y,0,_mV.AbsoluteSize.Y-2)-2)_mM.HuePosition=_ou _mL:Set(Color3.fromHSV(_ou,_nN,_nO),_mM.TransparencyValue,true)
                                      end _mY.MouseButton1Down:Connect(function()_mM.SlidingHue=true _os({Position=game.UserInputService:GetMouseLocation()-_y.vector2(0,36)})
                                        if not _x then return
                                        end
                                      end)
                                      local function _ov(_ow)
                                        local _ox=1-math.clamp((_ow.Position.X-_ne.AbsolutePosition.X)/_ne.AbsoluteSize.X,0,1)_ng.Position=_y.udim2(0,math.clamp((_ow.Position.X-_ne.AbsolutePosition.X)/_ne.AbsoluteSize.X*_ne.AbsoluteSize.X,0,_ne.AbsoluteSize.X-3),0,-2)_mL:Set(Color3.fromHSV(_mM.HuePosition,_nN,_nO),_ox,true)
                                      end _nh.MouseButton1Down:Connect(function()_mM.SlidingAlpha=true _ov({Position=game.UserInputService:GetMouseLocation()-_y.vector2(0,36)})
                                      end)inputService.InputEnded:Connect(function(_oy)
                                        if _oy.UserInputType==Enum.UserInputType.MouseButton1 then local _oz=_mM
                                          local _oA=_mM _mM.SlidingSat=false _oz.SlidingHue=false _oA.SlidingAlpha=false
                                        end
                                      end)inputService.InputChanged:Connect(function(_oB)
                                        if _oB.UserInputType==Enum.UserInputType.MouseMovement then if _mM.SlidingSat then _om(_oB)
                                          elseif _mM.SlidingHue then _os(_oB)
                                          elseif _mM.SlidingAlpha then _ov(_oB)
                                          end
                                        end
                                      end)_mP.MouseButton1Click:Connect(function()
                                        if _mR.Visible then _nP:Close()
                                        else _nP:Open()
                                        end
                                      end)
                                      local _oC=_y.new("Frame")
                                      local _oD=_y.new("UICorner")
                                      local _oE=_y.new("UIStroke")
                                      local _oF=_y.new("UIListLayout")
                                      local _oG=_y.new("TextButton")
                                      local _oH=_y.new("TextButton")_oC.Name="CPContextMenu"_oC.Parent=_mN _oC.BackgroundColor3=_y.color(15,15,15)_oC.BorderColor3=_y.color(0,0,0)_oC.BorderSizePixel=0 _oC.Position=_y.udim2(1,-68,0,15)_oC.Size=_y.udim2(0,24,0,28)_oC.Visible=false _oC.ClipsDescendants=false _oC.ZIndex=16 _oD.Name="CPContextCorner"_oD.Parent=_oC _oD.CornerRadius=UDim.new(0,3)_oE.Name="CPContextStroke"_oE.Parent=_oC _oE.ApplyStrokeMode=Enum.ApplyStrokeMode.Border _oE.Color=_y.color(48,54,68)_oF.Name="CPContextList"_oF.Parent=_oC _oF.SortOrder=Enum.SortOrder.LayoutOrder _oG.Name="CopyButton"_oG.Parent=_oC _oG.BackgroundColor3=_y.color(19,22,29)_oG.BorderColor3=_y.color(43,49,61)_oG.BorderSizePixel=0 _oG.Size=_y.udim2(1,0,0,16)_oG.ZIndex=14 _oG.FontFace=_y.font _oG.Text="copy"_oG.TextColor3=_y.color(129,129,127)_oG.TextSize=12 _oG.LayoutOrder=1 _oH.Name="TextButton" _oH.Parent=_oC _oH.BackgroundColor3=_y.color(15,15,15)_oH.BorderColor3=_y.color(34,34,34)_oH.BorderSizePixel=0 _oH.Size=_y.udim2(1,0,0,14)_oH.ZIndex=14 _oH.FontFace=_y.font _oH.Text="paste"_oH.TextColor3=_y.color(129,129,127)_oH.TextSize=12 _oH.LayoutOrder=2
                                      local function _oI()_oC.Visible=false
                                      end _oG.MouseButton1Click:Connect(function()_bG.ClipboardColor=_mM.ColorValue _oI()
                                      end)_oH.MouseButton1Click:Connect(function()
                                        if _bG.ClipboardColor then _mL:Set(_bG.ClipboardColor)
                                        end _oI()
                                      end)_mP.InputBegan:Connect(function(_oJ)
                                        if _oJ.UserInputType==Enum.UserInputType.MouseButton2 then if _oC.Visible then _oI()
                                          else _oC.Visible=true
                                          end
                                        end
                                      end)_bG.ConfigFlags[_mL.Flag]=function(_oK)_mL:Set(_oK)
                                      end
                                      return _mL
                                    end _kF.Dropdown=function(_oL,_oM)
                                      local _oN={Title=_oM.title or"",Content=_oM.values or{},Default=_oM.default or "-",Multi=_oM.multi or false,Callback=_oM.callback or function()
                                      end,}_oN.Flag=_bG:GetNextFlag()
                                      local _oO={FValues={},FValue=_oN.Multi and{}or""}
                                      local _oP=_y.new("Frame")
                                      local _oQ=_y.new("TextLabel")_oP.Name=tostring(math.random(100,16030))_oP.Parent=_kD _oP.BackgroundColor3=_y.color(23,23,23)_oP.BackgroundTransparency=1 _oP.BorderColor3=_y.color(0,0,0)_oP.BorderSizePixel=0 _oP.Size=_y.udim2(1,0,0,40)_oP.ZIndex=11 _oQ.Name="DropdownTitle"_oQ.Parent=_oP _oQ.BackgroundColor3=_y.color(255,255,255)_oQ.BackgroundTransparency=1 _oQ.BorderColor3=_y.color(0,0,0)_oQ.BorderSizePixel=0 _oQ.Size=_y.udim2(1,0,0,13)_oQ.FontFace=_y.font _oQ.Text=_oN.Title _oQ.TextColor3=_y.color(255,255,255)_oQ.TextSize=11 _oQ.TextXAlignment=Enum.TextXAlignment.Left _oQ.ZIndex=11
                                      local _oR=_y.new("UIListLayout",_oP)_oR["Padding"]=UDim.new(0,5)_oR.SortOrder=Enum.SortOrder.LayoutOrder _oR.Name="ColumnListLayout"
                                      local _oS=_y.new("TextButton")
                                      local _oT=_y.new("UICorner")
                                      local _oU=_y.new("UIStroke")
                                      local _oV=_y.new("ImageLabel")
                                      local _oW=_y.new("TextLabel")_oS.Name="OpenButton"_oS.Parent=_oP _oS.ZIndex=12 _oS.Size=_y.udim2(1,0,0,20)_oS.BorderColor3=_y.color(43,49,61)_oS.BackgroundColor3=_y.color(21,21,21)_oS.AutoButtonColor=false _oS.TextColor3=_y.color(255,255,255)_oS.Text=""_oS.TextXAlignment=Enum.TextXAlignment.Left _oS.TextSize=11 _oS.TextTruncate=Enum.TextTruncate.AtEnd _oS.FontFace=_y.font _oT.Name="OpenButtonCorner"_oT.Parent=_oS _oT.CornerRadius=UDim.new(0,3)_oU.Name="OpenButtonStroke"_oU.Parent=_oS _oU.ApplyStrokeMode=Enum.ApplyStrokeMode.Border _oU.Color=_y.color(48,54,68)_oV.Name="DropdownImage"_oV.Parent=_oS _oV.ZIndex=13 _oV.Size=_y.udim2(0,9,0,6)_oV.BorderColor3=_y.color(0,0,0)_oV.BackgroundTransparency=1 _oV.Position=_y.udim2(0.9,0,0.35,0)_oV.BorderSizePixel=0 _oV.BackgroundColor3=_y.color(255,255,255)_oV.Image="rbxassetid://17830630301"_oW.Name="DropdownText"_oW.Parent=_oS _oW.ZIndex=13 _oW.Size=_y.udim2(0.85,0,1,0)_oW.BorderColor3=_y.color(0,0,0)_oW.BackgroundTransparency=1 _oW.Position=_y.udim2(0.04,0,0,0)_oW.BorderSizePixel=0 _oW.BackgroundColor3=_y.color(255,255,255)_oW.TextColor3=_y.color(255,255,255)_oW.Text=typeof(_oN.Default)=="table"and "-"or _oN.Default~=""and _oN.Default or "-"_oW.TextXAlignment=Enum.TextXAlignment.Left _oW.TextSize=11 _oW.FontFace=_y.font _oW.TextTruncate="AtEnd"
                                      local _oX=_y.new("Frame")
                                      local _oY=_y.new("UICorner")
                                      local _oZ=_y.new("UIStroke")
                                      local _pa=_y.new("UIListLayout")_oX.Name="Inline"_oX.Parent=_oS _oX.Size=_y.udim2(1,0,0,0)_oX.BorderColor3=_y.color(0,0,0)_oX.Position=_y.udim2(0,0,1,0)_oX.BorderSizePixel=0 _oX.BackgroundColor3=_y.color(15,15,15)_oX.Visible=false _oX.ZIndex=14 _oY.Name="InlineCorner"_oY.Parent=_oX _oY.CornerRadius=UDim.new(0,3)_oZ.Name="InlineStroke"_oZ.Parent=_oX _oZ.ApplyStrokeMode=Enum.ApplyStrokeMode.Border _oZ.Color=_y.color(48,54,68)_pa.Name="InlineList"_pa.Parent=_oX
                                      local _pb _pb={Open=function(_pc)_oX.Visible=true tweenService:Create(_oV,TweenInfo.new(0.1),{Rotation=180}):Play()tweenService:Create(_oX,TweenInfo.new(0.15),{BackgroundTransparency=0}):Play()_pc:FadeIn()
                                      end,FadeIn=function()
                                        for _pd,_pe in pairs(_oX:GetDescendants())do if _pe:IsA("Frame")then local _pf={BackgroundTransparency=0}tweenService:Create(_pe,TweenInfo.new(0.15),_pf):Play()
                                          elseif _pe:IsA("TextButton")then tweenService:Create(_pe,TweenInfo.new(0.15),{TextTransparency=0}):Play()
                                          elseif _pe:IsA("UIStroke")then tweenService:Create(_pe,TweenInfo.new(0.1),{Transparency=0}):Play()
                                          elseif _pe:IsA("TextLabel")then local _pg={TextTransparency=0}tweenService:Create(_pe,TweenInfo.new(0.15),_pg):Play()
                                          end
                                        end
                                      end,FadeOut=function()
                                        for _ph,_pi in pairs(_oX:GetDescendants())do if _pi:IsA("Frame")then tweenService:Create(_pi,TweenInfo.new(0.15),{BackgroundTransparency=1}):Play()
                                          elseif _pi:IsA("TextButton")then tweenService:Create(_pi,TweenInfo.new(0.15),{TextTransparency=1}):Play()
                                          elseif _pi:IsA("TextLabel")then tweenService:Create(_pi,TweenInfo.new(0.1),{TextTransparency=1}):Play()
                                          elseif _pi:IsA("UIStroke")then tweenService:Create(_pi,TweenInfo.new(0.15),{Transparency=1}):Play()
                                          end
                                        end
                                      end,Close=function()tweenService:Create(_oX,TweenInfo.new(0.15),{BackgroundTransparency=1}):Play()
                                        local _pj={Rotation=0}tweenService:Create(_oV,TweenInfo.new(0.15),_pj):Play()_pb:FadeOut()_y.wait_(0.1)_oX.Visible=false
                                      end,}
                                      local _pk=0 _oO.CreateValue=function(_pl,_pm)
                                        if not _oO.FValues[_pm]then local _pn={}
                                          local _po=_y.new("TextButton")
                                          local _pp=_y.new("UIStroke")
                                          local _pq=_y.new("UICorner")
                                          local _pr=_y.new("TextLabel")_po.Name="DropdownButton"_po.Parent=_oX _po.Size=_y.udim2(1,0,0,18)_po.BorderColor3=_y.color(0,0,0)_po.BackgroundTransparency=1 _po.BorderSizePixel=0 _po.BackgroundColor3=_y.color(21,21,21)_po.TextColor3=_y.color(255,255,255)_po.Text=""_po.TextXAlignment=Enum.TextXAlignment.Left _po.TextSize=11 _po.FontFace=_y.font _po.TextTransparency=1 _po.ZIndex=15 _pp.Name="DBStroke"_pp.Parent=_po _pp.ApplyStrokeMode=Enum.ApplyStrokeMode.Border _pp.Color=_y.color(18,24,24)_pq.Name="DBCorner"_pq.Parent=_po _pq.CornerRadius=UDim.new(0,3)_pr.Name="DBName"_pr.Parent=_po _pr.Size=_y.udim2(0.95,0,1,0)_pr.BorderColor3=_y.color(0,0,0)_pr.BackgroundTransparency=1 _pr.Position=_y.udim2(0.03,0,0,0)_pr.BorderSizePixel=0 _pr.BackgroundColor3=_y.color(255,255,255)_pr.TextColor3=_y.color(129,129,127)_pr.TextXAlignment=Enum.TextXAlignment.Left _pr.TextSize=11 _pr.FontFace=_y.font _pr.Text=_pm _pr.ZIndex=15 _pn.Name=_po _oX.Size=_oX.Size+_y.udim2(0,0,0,18)
                                          local function _ps()
                                            if _y.n27(3637)<14897 then _pr.TextColor3=theme.accent _oO.FValues[_pm].Selected=true
                                            else while true do end
                                            end
                                          end
                                          local function _pt()_pr.TextColor3=_y.color(129,129,127)_oO.FValues[_pm].Selected=false
                                          end _po.MouseButton1Down:Connect(function()_oO:Set(_pm)
                                          end)_pk+=1 _oO.FValues[_pm]={Click=_ps,Unclick=_pt,Objects=_pn,Selected=false}theme_event.Event:Connect(function()
                                            if _oO.FValues[_pm].Selected then _pr.TextColor3=theme.accent
                                            end
                                          end)
                                        end
                                        return _oO
                                      end _oO.Update=function()
                                        for _pu,_pv in pairs(_oO.FValues)do if _oO.FValue==_pu then _pv.Click()
                                          else _pv.Unclick()
                                          end
                                        end
                                        return _oO
                                      end _oO.Display=function()
                                        if _oN.Multi then local _pw={}
                                          if#_oO.FValue>0 then for _px,_py in pairs(_oO.FValue)do _pw[#_pw+1]=_py _oW.Text=table.concat(_pw,", ")
                                            end
                                          else _oW.Text="-"
                                          end
                                        else _oW.Text=_oO.FValue~=""and _oO.FValue or "-"
                                        end
                                        return _oO
                                      end _oO.Set=function(_pz,_pA)
                                        if _oN.Multi then if typeof(_pA)=="table"then table.clear(_oO.FValue)
                                            for _pB,_pC in ipairs(_pA)do _oO.FValue[#_oO.FValue+1]=_pC
                                            end
                                            for _pD,_pE in pairs(_oO.FValues)do if table.find(_oO.FValue,_pD)then _pE.Click()
                                              else _pE.Unclick()
                                              end
                                            end _oO:Display()pcall(_oN.Callback,_oO.FValue)_bG.Flags[_oN.Flag]=_oO.FValue
                                            return
                                          end
                                          local _pF=table.find(_oO.FValue,_pA)
                                          if _pF then table.remove(_oO.FValue,_pF)_oO:Display()_oO.FValues[_pA].Unclick()pcall(_oN.Callback,_oO.FValue)_bG.Flags[_oN.Flag]=_oO.FValue
                                          else _oO.FValue[#_oO.FValue+1]=_pA _oO:Display()_oO.FValues[_pA].Click()pcall(_oN.Callback,_oO.FValue)_bG.Flags[_oN.Flag]=_oO.FValue
                                          end
                                        else _oO.FValue=_pA _pz:Update()_oO:Display()pcall(_oN.Callback,_oO.FValue)_bG.Flags[_oN.Flag]=_oO.FValue
                                        end
                                        return _oO
                                      end _oO.Refresh=function(_pG,_pH)
                                        for _pI,_pJ in pairs(_oO.FValues)do _pJ.Objects.Name:Destroy()
                                        end _oX.Size=_y.udim2(1,0,0,0)table.clear(_oO.FValues)
                                        if _oN.Multi then table.clear(_oO.FValue)_pk=0
                                          for _pK,_pL in pairs(_pH)do _oO:CreateValue(_pL)
                                          end _oO:Display()pcall(_oN.Callback,_oO.FValue)_bG.Flags[_oN.Flag]=_oO.FValue
                                        else _pk=0
                                          for _pM,_pN in pairs(_pH)do _oO:CreateValue(_pN)
                                          end _oO.FValue=nil _oO:Update()_oO:Display()pcall(_oN.Callback,_oO.FValue)_bG.Flags[_oN.Flag]=_oO.FValue
                                        end
                                        for _pO,_pP in pairs(_pH)do _oO:CreateValue(_pP)
                                        end _oO:Set(_oN.Default)
                                        return _oO
                                      end
                                      for _pQ,_pR in pairs(_oN.Content)do _oO:CreateValue(_pR)
                                      end
                                      if _oN.Multi and typeof(_oN.Default)~="table"then _oO:Display()
                                      else _oO:Set(_oN.Default)
                                      end _oS.MouseButton1Click:Connect(function()
                                        if _oX.Visible then _pb:Close()_oX.ZIndex=16
                                        else _pb:Open()_oX.ZIndex=15
                                        end
                                      end)_bG.ConfigFlags[_oN.Flag]=function(_pS)_oO:Set(_pS)
                                      end
                                      return _oN,_oO
                                    end _kF.TextBox=function(_pT,_pU)
                                      local _pV={Title=_pU.title or "textbox",Default=_pU.default or"",Placeholder=_pU.placeholder or"",ClearTextOnFocus=_pU.cleartextonfocus or _pU.ctf or true,Callback=_pU.callback or function()
                                      end,Text="",}_pV.Flag=_bG:GetNextFlag()
                                      if _pV.Title~="NO TITLE"then _pT:Label(_pV.Title)
                                      end
                                      local _pW=_y.new("TextBox")
                                      local _pX=_y.new("UICorner")_pW.Parent=_kD _pW.BackgroundColor3=_y.color(23,23,23)_pW.BorderColor3=_y.color(0,0,0)_pW.BorderSizePixel=0 _pW.Size=_y.udim2(1,0,0,20)_pW.FontFace=_y.font _pW.PlaceholderText=_pV.Placeholder _pW.Text=""_pW.TextColor3=_y.color(255,255,255)_pW.TextSize=11 _pW.TextXAlignment=Enum.TextXAlignment.Left _pW.TextTruncate="AtEnd"_pW.ClearTextOnFocus=_pV.ClearTextOnFocus _pW.ZIndex=11 _pX.CornerRadius=UDim.new(0,3)_pX.Name="TextboxCorner"_pX.Parent=_pW
                                      local _pY=_y.new("UIStroke",_pW)_pY.ApplyStrokeMode=Enum.ApplyStrokeMode.Border _pY.Name="TextBoxStroke"_pY.Color=_y.color(48,54,68)_pY.ZIndex=11 _y.new("UIPadding",_pW).PaddingLeft=UDim.new(0,6)_pV.Set=function(_pZ,_qa)_pW.Text=_qa or""_pV.Text=_pW.Text _bG.Flags[_pV.Flag]=_pV.Text pcall(_pV.Callback,_pV.Text)
                                      end _pW.FocusLost:Connect(function()_pV.Text=_pW.Text _bG.Flags[_pV.Flag]=_pV.Text pcall(_pV.Callback,_pV.Text)
                                      end)_bG.ConfigFlags[_pV.Flag]=function(_qb)_pV:Set(_qb)
                                      end
                                      return _pV
                                    end _kF.ParentToggle=_jD
                                    return _kF
                                  end _jE.MouseButton1Click:Connect(function()_jD.state=not _jD.state _jD:Set(_jD.state)
                                  end)_jD:Set(_jD.default)_cX(15)_bG.ConfigFlags[_jD.Flag]=function(_qc)_jD:Set(_qc)
                                  end
                                  return _jD
                                end _cK.Container=_cV
                                return _cK
                              end
                              if 0<#_bS.Tabs then _bS.Tabs[1]:Select()
                              end table.insert(_bS.Tabs,#_bS.Tabs+1,_cn)
                              return _cn
                            end
                            local function _qd()
                              local _qe=_bH.b.AbsolutePosition
                              local _qf=_bH.b.AbsoluteSize
                              local _qg=playerService.LocalPlayer:GetMouse()
                              local _qh=_qg.X
                              local _qi=_qg.Y
                              if _qh>=_qe.X and _qh<=_qe.X+_qf.X and _qi>=_qe.Y and _qi<=_qe.Y+_qf.Y then return true
                              end
                              return false
                            end _bH["2"].InputBegan:Connect(function(_qj)
                              if _qj.UserInputType==Enum.UserInputType.MouseButton1 and not _qd()then _bN=_bH["2"]_bJ=true _bL=_qj.Position _bM=_bN.Position
                              end
                            end)_bH["2"].InputEnded:Connect(function(_qk)
                              if _qk.UserInputType==Enum.UserInputType.MouseButton1 then _bJ=false
                              end
                            end)_bH["2"].InputChanged:Connect(function(_ql)
                              if _bJ and _ql.UserInputType.Name=="MouseMovement"then _bK=_ql
                              end
                            end)inputService.InputChanged:Connect(function(_qm)
                              if _qm==_bK and _bJ then local _qn=_qm.Position-_bL
                                local _qo=_bM.Y.Offset+_qn.Y
                                local _qp
                                if _bN==_bH["2"]then _qp=_qo<-36 and-36 or _qo
                                else local _qq=-_bM.Y.Scale*_bH["1"].AbsoluteSize.Y+10 _qp=_qo<_qq and _qq or _qo
                                end _bN:TweenPosition(_y.udim2(_bM.X.Scale,_bM.X.Offset+_qn.X,_bM.Y.Scale,_qp),"Out","Quad",0.15,true)
                              end
                            end)
                            local _qr=false
                            local _qs=nil
                            local function _qt()
                              if _qs~=nil then return _qs
                              end pcall(function()_qs=require(game:GetService("ReplicatedStorage").Controllers.CameraController)
                              end)
                              return _qs
                            end
                            local function _qu(_qv)
                              local _qw=_qt()
                              if not _qw then return
                              end
                              if _qv then _qw.setForceLockOverride("e4l3g4nt",true)_qw.setMouseEnabled(true)
                              else _qw.setForceLockOverride("e4l3g4nt",false)
                              end
                            end getgenv().SetshizukuscriptsMouseUnlock=function(_qx)_qr=_qx and true or false pcall(function()inputService.MouseBehavior=_qx and Enum.MouseBehavior.Default or Enum.MouseBehavior.LockCenter inputService.MouseIconEnabled=_qx and true or false
                              end)task.spawn(_qu,_qx)
                            end
                            local function _qy()
                              if inputService.MouseBehavior~=Enum.MouseBehavior.Default then inputService.MouseBehavior=Enum.MouseBehavior.Default
                              end
                              if not inputService.MouseIconEnabled then inputService.MouseIconEnabled=true
                              end
                            end pcall(function()rsService:BindToRenderStep("e4l3g4ntMouseUnlock",Enum.RenderPriority.Camera.Value+1,function()
                                if not _qr then return
                                end _qy()
                              end)
                            end)rsService.Heartbeat:Connect(function(...)
                            end)getgenv().ToggleMenuVisibility=function()_bH["2"].Visible=not _bH["2"].Visible
                              if getgenv().SetshizukuscriptsMouseUnlock then local _qz=_bH["2"].Visible getgenv().SetshizukuscriptsMouseUnlock(_qz)
                              end
                              if not _bH["2"].Visible then _bG:RemovePopups()
                                for _qA,_qB in ipairs(_bH["1"]:GetDescendants())do if _qB:IsA("GuiObject")and _qB.Name=="InfoTooltip"then _qB.Visible=false
                                  end
                                end
                              end
                            end getgenv().MenuKeybindConnection=nil getgenv().CurrentMenuKey="RightShift"getgenv().SetMenuKeybind=function(_qC)
                              if getgenv().MenuKeybindConnection then getgenv().MenuKeybindConnection:Disconnect()getgenv().MenuKeybindConnection=nil
                              end
                              if not _qC or _qC==""or _qC=="none" then _qC="RightShift"
                              end getgenv().CurrentMenuKey=_qC
                              local _qD=inputService.InputBegan getgenv().MenuKeybindConnection=_qD:Connect(function(_qE,_qF)
                                if _qF then return
                                end
                                if _qE.KeyCode.Name==_qC or _qE.UserInputType.Name==(_qC=="MB2"and "MouseButton2" or _qC=="MB1"and "MouseButton1")then getgenv().ToggleMenuVisibility()
                                end
                              end)
                            end getgenv().SetMenuKeybind("RightShift")
                            if _bH["2"].Visible and getgenv().SetshizukuscriptsMouseUnlock then task.spawn(function()pcall(getgenv().SetshizukuscriptsMouseUnlock,true)
                              end)
                            end _bH["1"].Destroying:Connect(function()
                              if getgenv().MenuKeybindConnection then getgenv().MenuKeybindConnection:Disconnect()
                              end
                            end)_bG.RemovePopups=function()
                              if _bG.Popup then _bG.Popup:Remove()_bG.Popup=nil
                              end
                            end _bG.NewPopup=function(_qG,_qH)_bG.Popup={Remove=_qH.Remove,ID=_qH.ID}
                            end _bG.GetConfig=function()
                              local _qI={}
                              for _qJ in pairs(_bG.ConfigFlags)do local _qK=_bG.Flags[_qJ]
                                if typeof(_qK)=="EnumItem"then _qI[_qJ]=_qK
                                elseif typeof(_qK)=="Color3"then _qI[_qJ]={_qK:ToHex()}
                                else _qI[_qJ]=_qK
                                end
                              end _qI._SkinConfig={SkinConfig=getgenv().SkinConfig,SavedSkins=getgenv().SavedSkins}
                              return httpService:JSONEncode(_qI)
                            end _bG.LoadConfig=function(_qL,_qM)
                              local _qN=httpService:JSONDecode(_qM)
                              for _qO,_qP in pairs(_qN)do local _qQ=_bG.ConfigFlags[_qO]
                                if _qQ then _qQ(_qP)
                                end
                              end
                              if _qN._SkinConfig then local _qR=_qN._SkinConfig
                                if _qR.SkinConfig then local _qS=_qR.SkinConfig getgenv().SkinConfig=_qS
                                end
                                if _qR.SavedSkins then local _qT=_qR.SavedSkins getgenv().SavedSkins=_qT
                                end
                                if _bG.RefreshSkinGrid then task.defer(_bG.RefreshSkinGrid)
                                end
                              end
                            end _bG.GetSkinConfig=function()
                              return httpService:JSONEncode({SkinConfig=getgenv().SkinConfig,SavedSkins=getgenv().SavedSkins})
                            end _bG.LoadSkinConfig=function(_qU,_qV)
                              local _qW=httpService:JSONDecode(_qV)
                              local _qX=_qW._SkinConfig or _qW
                              if _qX.SkinConfig then local _qY=_qX.SkinConfig getgenv().SkinConfig=_qY
                              end
                              if _qX.SavedSkins then local _qZ=_qX.SavedSkins getgenv().SavedSkins=_qZ
                              end
                              if _bG.RefreshSkinGrid then task.defer(_bG.RefreshSkinGrid)
                              end
                            end _bG.Watermark=function(_ra,_rb)
                              local _rc=_y.new("Frame")
                              local _rd=_y.new("UICorner")
                              local _re=_y.new("TextLabel")
                              local _rf=_bI:GetTextBoundary("e4l3g4nt.club",Enum.Font.Code.Value,13)_rc.Name="Watermark"_rc.Parent=_bH["1"]_rc.BackgroundColor3=_y.color(23,21,21)_rc.BorderColor3=_y.color(0,0,0)_rc.BorderSizePixel=0 _rc.Position=_y.udim2(0,10,0,2)_rc.Size=_y.udim2(0,_rf+10,0,20)_rd.CornerRadius=UDim.new(0,4)_rd.Name="WatermarkCorner"_rd.Parent=_rc _re.Name="WatermarkTitle"_re.Parent=_rc _re.BackgroundColor3=_y.color(255,255,255)_re.BackgroundTransparency=1 _re.BorderColor3=_y.color(0,0,0)_re.BorderSizePixel=0 _re.Size=_y.udim2(1,0,1,0)_re.Font=Enum.Font.Code _re.Text=_rb _re.TextColor3=_y.color(255,255,255)_re.TextSize=12 _re.RichText=true
                              return{ChangeText=function(_rg,_rh)
                                if type(_rh)~="string"then return
                                end _re.Text=tostring(_rh)
                                local _ri=2 _rc.Size=_y.udim2(0,_bI:GetTextBoundary(_rh,Enum.Font.Code.Value,13)+_ri,0,20)
                              end,SetVisibility=function(_rj,_rk)_rc.Visible=_rk
                              end,SetPosition=function(_rl,_rm)_rc.Position=_y.udim2(0,_rm.X,0,_rm.Y)
                              end,}
                            end
                            return _bS
                          end
                          return _bG
                        end _z.v84=_bF()
                      end
                    end _z.tween=_z.v84:Create({title="shizukuscripts<font color=\"rgb(110, 180, 255)\">.ui</font>",})_H.combat=_z.tween:Tab("combat")_H.Players2=game:GetService("Players")_H.RunService2=game:GetService("RunService")_H.UserInputService=game:GetService("UserInputService")_H.currentCamera2=workspace.CurrentCamera _H.localPlayer3=_H.Players2.LocalPlayer _bd=game:GetService("CoreGui")_H.ReplicatedStorage=game:GetService("ReplicatedStorage")_I.HttpService=game:GetService("HttpService")_T=workspace:WaitForChild("Characters",10)do local function _rn(_ro)
                        if not _ro then return nil
                        end
                        local _rp=_ro:FindFirstChild("CharacterArmor")
                        if not _rp then return nil
                        end
                        if _rp:FindFirstChild("VestDetails")then return "Counter-Terrorists"
                        end
                        if _rp:FindFirstChild("Balaclava")then return "Terrorists"
                        end
                        return nil
                      end _I.fn31=function(_rq)
                        if not _T then return nil
                        end
                        local _rr=_T:FindFirstChild(_rq)
                        if _rr and _rr:IsA("Model")then return _rr
                        end
                        for _rs,_rt in ipairs(_T:GetChildren())do if _rt:IsA("Folder")or _rt:IsA("Model")then local _ru=_rt:FindFirstChild(_rq)
                            if _ru and _ru:IsA("Model")and _ru~=_rt then return _ru
                            end
                          end
                        end
                        return nil
                      end _U=function(_rv)
                        if not _T or not _rv then return nil
                        end
                        return _rn(_I.fn31(_rv.Name))
                      end
                    end
                  end getgenv().GetLocalCharacter=function()
                    local _rw=_H.Players2.LocalPlayer
                    if not _rw then return nil
                    end
                    local _rx=_rw.Character
                    if _rx and _rx.Parent then return _rx
                    end
                    if _T then return _T:FindFirstChild(_rw.Name)
                    end
                    return nil
                  end getgenv().shizukuscripts={SilentAim={Enabled=false,UseFOV=false,FOVRadius=120,DynamicFOV=true,FOVTransparency=1,TargetPart={"Head"},WallCheck=false,WallBang=false,TeamCheck=true,HitPartScale=0,ShowFOVCircle=true,ShowFOVOutline=true,ShowFOVFill=false,FOVThickness=1.8,FOVFillTransparency=0.15,FOVGradientRotation=90,FOVColor=Color3.fromRGB(120,200,255),FOVOutlineColor=Color3.fromRGB(180,230,255),FOVFillColor1=Color3.fromRGB(90,160,255),FOVFillColor2=Color3.fromRGB(140,120,255),FOVFillColor3=Color3.fromRGB(80,200,255),ShowTracer=false,TracerLinePosition="bottom",TracerThickness=1,TracerTransparency=1,TracerColor=Color3.fromRGB(255,138,255),TracerColorTransparency=1,TracerColorEnd=Color3.fromRGB(0,0,0),TracerColorEndTransparency=1,TracerOutlineColor=Color3.fromRGB(0,0,0),TracerOutlineThickness=1,TracerGradientRotation=180,HighlightHitPart=false,HighlightColor=Color3.fromRGB(179,239,103),HighlightTransparency=1,},AimAssist={Enabled=false,TargetPart={"Head"},HitPartScale=0,SmoothPitch=5,SmoothYaw=5,AimAfterShotsEnabled=false,AimAfterShotsCount=3,HumanLikeDelaysEnabled=false,HumanLikeDelayMin=2,HumanLikeDelayMax=4,MovementThresholdEnabled=false,MovementThresholdAngle=0.3,MovementThresholdTime=70,ShotCounter=0,LastAimTime=0,DelayUntil=0,CurrentTarget=nil,},Autoshoot={Enabled=false,Delay=0.05,SpecificPlayers=false,Names={},},Exploits={NoSpread=false,NoRecoil=false,RecoilReduction=100,InstantRevolver=false,InstantReload=false,RapidFire=false,RapidFireMultiplier=5,AutoReload=false,AutoReloadThreshold=1,AlwaysAuto=false,PersistentInspect=false,InstantEquip=false,NoSway=false,NoShootAnim=false,},History={Enabled=false,Mode="backtrack",Visualizer=false,VisualizerColor=Color3.fromRGB(130,200,255),VisualizerTransparency=0.35,VisualizerMaterial="ForceField",},}_I.silentAim=getgenv().shizukuscripts.SilentAim _I.aimAssist=getgenv().shizukuscripts.AimAssist _I.autoshoot=getgenv().shizukuscripts.Autoshoot _I.exploits=getgenv().shizukuscripts.Exploits _I.history=getgenv().shizukuscripts.History do local _ry={}_ry.__index=_ry _ry.CreateScreenGui=function(_rz,_rA,_rB)
                      local _rC=_bd:FindFirstChild(_rA)
                      if _rC then return _rC
                      end
                      local _rD=Instance.new("ScreenGui")_rD.Name=_rA _rD.IgnoreGuiInset=true _rD.DisplayOrder=_rB or 0 _rD.Parent=_bd
                      return _rD
                    end _ry.NewLine=function(_rE,_rF)
                      local _rG=_rF or{}
                      local _rH=#_rE.Lines+1
                      local _rI=Instance.new("Frame")_rI.Name="Line_".._rH _rI.AnchorPoint=Vector2.new(0.5,0.5)_rI.BorderSizePixel=0 _rI.BackgroundColor3=Color3.new(1,1,1)_rI.Parent=_rE.LineGui
                      local _rJ=Instance.new("UIGradient")
                      local _rK=ColorSequence.new
                      local _rL={}
                      local _rM=ColorSequenceKeypoint.new(0,_rG.Color or Color3.fromRGB(150,94,255))
                      local _rN=table.pack(ColorSequenceKeypoint.new(1,Color3.fromRGB(0,0,0)))_rL[1]=_rM do local _rO=table.pack(table.unpack(_rN,1,_rN.n))table.move(_rO,1,_rO.n,2,_rL)
                      end _rJ.Color=_rK(_rL)_rJ.Rotation=_rG.GradientRotation or 180 _rJ.Parent=_rI
                      local _rP=Instance.new("UIStroke")_rP.Color=_rG.OutlineColor or Color3.fromRGB(0,0,0)_rP.Thickness=_rG.OutlineThickness or 1 _rP.Parent=_rI
                      local _rQ={From=Vector2.zero,To=Vector2.zero,Thickness=_rG.Thickness or 2,Visible=_rG.Visible~=false,Transparency=_rG.Transparency or 0.6,ZIndex=_rG.ZIndex or 0,}_rQ.Color=_rG.Color or Color3.fromRGB(150,94,255)_rQ.OutlineColor=_rG.OutlineColor or Color3.fromRGB(0,0,0)_rQ.OutlineThickness=_rG.OutlineThickness or 1 _rQ.GradientColor=_rG.GradientColor
                      local function _rR()
                        local _rS=_rQ.To-_rQ.From
                        local _rT=_rQ.Thickness _rI.Size=UDim2.new(0,math.sqrt(_rS.X^2+_rS.Y^2),0,_rT)_rI.Position=UDim2.new(0,(_rQ.From.X+_rQ.To.X)/2,0,(_rQ.From.Y+_rQ.To.Y)/2)_rI.Rotation=math.deg(math.atan2(_rS.Y,_rS.X))_rI.Visible=_rQ.Visible _rI.ZIndex=_rQ.ZIndex _rI.BackgroundTransparency=math.clamp(1-_rQ.Transparency,0,1)
                        local _rU=_rJ
                        local _rV=ColorSequence.new
                        local _rW={}
                        local _rX=ColorSequenceKeypoint.new(0,_rQ.Color)
                        local _rY=ColorSequenceKeypoint.new
                        local _rZ=_rQ.GradientColor or Color3.fromRGB(0,0,0)
                        local _sa=table.pack(_rY(1,_rZ))_rW[1]=_rX do local _sb=table.pack(table.unpack(_sa,1,_sa.n))table.move(_sb,1,_sb.n,2,_rW)
                        end _rU.Color=_rV(_rW)_rP.Color=_rQ.OutlineColor _rP.Thickness=_rQ.OutlineThickness
                      end
                      local _sh=setmetatable({},{__newindex=function(_sc,_sd,_se)_rQ[_sd]=_se _rR()
                      end,__index=function(_sf,_sg)
                        if _sg=="Remove"or _sg=="Destroy"then return function()_rI:Destroy()
                          end
                        end
                        return _rQ[_sg]
                      end,})_rE.Lines[_rH]=_sh _rR()
                      return _sh
                    end _ry.NewCustomCircle=function(_si,_sj)
                      local _sk=_sj or{}
                      local _sl=#_si.Circles+1
                      local _sm=Instance.new("Frame")_sm.Name="Circle_".._sl _sm.AnchorPoint=Vector2.new(0.5,0.5)_sm.BorderSizePixel=0 _sm.Parent=_si.CircleGui
                      local _sn=Instance.new("UICorner")_sn.CornerRadius=UDim.new(1,0)_sn.Parent=_sm
                      local _so=Instance.new("UIStroke")_so.ApplyStrokeMode=Enum.ApplyStrokeMode.Border _so.LineJoinMode=Enum.LineJoinMode.Round _so.Parent=_sm
                      local _sp=Instance.new("UIGradient")_sp.Enabled=false _sp.Parent=_sm
                      local _sq={Radius=_sk.Radius or 150,Position=Vector2.zero,Thickness=_sk.Thickness or 1,Filled=_sk.Filled or false,}_sq.Color=_sk.Color or Color3.new(1,1,1)_sq.Transparency=_sk.Transparency or 1 _sq.FilledTransparency=_sk.FilledTransparency or 0.5 _sq.Visible=_sk.Visible~=false _sq.ZIndex=_sk.ZIndex or 0 _sq.Gradient=_sk.Gradient
                      local function _sr()
                        local _ss=math.clamp(1-_sq.Transparency,0,1)_sm.Size=UDim2.fromOffset(_sq.Radius*2,_sq.Radius*2)_sm.Position=UDim2.fromOffset(_sq.Position.X,_sq.Position.Y)_sm.Visible=_sq.Visible _sm.ZIndex=_sq.ZIndex _so.Thickness=_sq.Thickness _so.Color=_sq.Color _so.Transparency=_ss
                        if _sq.Filled then _sm.BackgroundTransparency=math.clamp(1-_sq.FilledTransparency,0,1)
                          if _sq.Gradient and typeof(_sq.Gradient)=="table"then _sp.Enabled=true _sp.Color=_sq.Gradient.Color _sp.Rotation=_sq.Gradient.Rotation or 0 _sp.Transparency=NumberSequence.new(0)_sm.BackgroundColor3=Color3.new(1,1,1)
                          else _sp.Enabled=false _sm.BackgroundColor3=_sq.Color
                          end
                        else _sm.BackgroundTransparency=1 _sp.Enabled=false
                        end
                      end
                      local _sy=setmetatable({},{__newindex=function(_st,_su,_sv)_sq[_su]=_sv _sr()
                      end,__index=function(_sw,_sx)
                        if _sx=="Remove"or _sx=="Destroy"then return function()_sm:Destroy()
                          end
                        end
                        return _sq[_sx]
                      end,})_si.Circles[_sl]=_sy _sr()
                      return _sy
                    end _ry.New=function()
                      local _sz=setmetatable({},_ry)_sz.LineGui=_sz:CreateScreenGui("e4l3g4ntLines",99)_sz.CircleGui=_sz:CreateScreenGui("e4l3g4ntCircles",100)_sz.Lines={}_sz.Circles={}
                      return _sz
                    end
                    local _sA=_ry:New()_I.circle=Drawing.new("Circle")_I.circle.Visible=false _I.circle.ZIndex=500 _I.circle2=Drawing.new("Circle")_I.circle2.Visible=false _I.circle2.ZIndex=499 _I.circle2.Color=Color3.fromRGB(1,1,1)_I.v96=_sA:NewCustomCircle({Filled=true,Color=Color3.new(1,1,1),Transparency=0,ZIndex=498,})_J.v97=_sA:NewLine({Color=_I.silentAim.TracerColor,OutlineColor=_I.silentAim.TracerOutlineColor,OutlineThickness=_I.silentAim.TracerOutlineThickness,Thickness=_I.silentAim.TracerThickness,Transparency=_I.silentAim.TracerTransparency,Visible=false,ZIndex=497,GradientRotation=_I.silentAim.TracerGradientRotation,})
                  end
                end
              end do _J.v98=nil _J.v99=nil _J.v100=nil _J.v101=false do local _sB=nil
                  local _sC=nil
                  local _sD=workspace:FindFirstChild("Ignore")or workspace
                  local function _sE()
                    if _sB then _sB:Destroy()_sB=nil _sC=nil
                    end
                  end
                  local function _sF(_sG,_sH)
                    if not _I.silentAim.HighlightHitPart then _sE()
                      return
                    end
                    if not _sG or not _sG.Parent then _sE()
                      return
                    end _sH=_sH or _sG.Position
                    local _sI,_sJ=_H.currentCamera2:WorldToViewportPoint(_sH)
                    if not _sJ then _sE()
                      return
                    end
                    if not _sB or not _sB.Parent then _sB=Instance.new("Part")_sB.Name="SilentTargetGradient"_sB.Anchored=true _sB.CanCollide=false _sB.Size=Vector3.new(0.001,0.001,0.001)_sB.Transparency=1 _sB.Parent=_sD
                      local _sK=Instance.new("BillboardGui")_sK.Name="GradientBillboard"_sK.Size=UDim2.new(1.5,0,1.5,0)_sK.AlwaysOnTop=true _sK.LightInfluence=0 _sK.Brightness=1 _sK.StudsOffset=Vector3.new(0,0,0)_sK.Parent=_sB
                      local _sL=Instance.new("ImageLabel")_sL.Name="GradientImage"_sL.Size=UDim2.new(1,0,1,0)_sL.BackgroundTransparency=1 _sL.Image="http://www.roblox.com/asset/?id=11999950713"_sL.ImageColor3=_I.silentAim.HighlightColor _sL.Parent=_sK _sC=_sK
                    end
                    if _sB and _sB.Parent then _sB.CFrame=CFrame.new(_sH)
                      if _sC then local _sM=_sC:FindFirstChild("GradientImage")
                        if _sM then _sM.ImageColor3=_I.silentAim.HighlightColor _sM.ImageTransparency=1-(_I.silentAim.HighlightTransparency or 1)
                        end
                      end
                    end
                  end
                end
              end do local _sN={Torso={"UpperTorso","LowerTorso","HumanoidRootPart",},LeftArm={"LeftUpperArm","LeftLowerArm","LeftHand",},RightArm={"RightUpperArm","RightLowerArm","RightHand",},LeftLeg={"LeftUpperLeg","LeftLowerLeg","LeftFoot",},RightLeg={"RightUpperLeg","RightLowerLeg","RightFoot",},Head={"Head"},}_J.fn32=function(_sO,_sP,_sQ)
                  if not _sO or not _sP then return nil
                  end
                  local _sR=math.clamp(_sQ or 0,0,100)/100
                  if _sR<=0 then return _sO.Position
                  end
                  local _sS=_H.currentCamera2:ViewportPointToRay(_sP.X,_sP.Y)
                  local _sT=_sO.CFrame
                  local _sU=_sO.Size/2
                  local _sV=_sT:PointToObjectSpace(_sS.Origin+_sS.Direction*(_sO.Position-_H.currentCamera2.CFrame.Position).Magnitude)
                  local _sW=math.clamp
                  local _sX=_sV.Z
                  local _sY=-_sU.Z
                  local _sZ=_sU.Z
                  local _ta=Vector3.new(math.clamp(_sV.X,-_sU.X,_sU.X),math.clamp(_sV.Y,-_sU.Y,_sU.Y),_sW(_sX,_sY,_sZ))
                  return _sO.Position:Lerp(_sT:PointToWorldSpace(_ta),_sR)
                end _J.fn33=function(_tb,_tc,_td)
                  local _te
                  if typeof(_tc)=="table"then _te={}
                    for _tf,_tg in ipairs(_tc)do if _sN[_tg]then for _th,_ti in ipairs(_sN[_tg])do table.insert(_te,_ti)
                        end
                      else table.insert(_te,_tg)
                      end
                    end
                  elseif _sN[_tc]then _te=_sN[_tc]
                  elseif _tc=="Head"then _te={"Head"}
                  elseif _tc=="HumanoidRootPart"then _te={"HumanoidRootPart"}
                  else _te={"Head"}
                  end
                  local _tj=math.huge
                  local _tk=nil
                  for _tl,_tm in ipairs(_te)do local _tn=_tb:FindFirstChild(_tm)
                    if _tn and _td then local _to=_H.currentCamera2:WorldToViewportPoint(_tn.Position)
                      local _tp=(Vector2.new(_to.X,_to.Y)-_td).Magnitude
                      if _tp<_tj then _tj=_tp _tk=_tn
                      end
                    elseif _tn and not _tk then _tk=_tn
                    end
                  end
                  return _tk
                end
              end _J.fn34=function(_tq)
                if _tq==_H.localPlayer3 then return false
                end
                local _tr=_T and _I.fn31(_tq.Name)or _tq.Character
                if not _tr or not _T or not _tr:IsDescendantOf(_T)then return false
                end
                local _ts=_tr:FindFirstChildOfClass("Humanoid")
                if _ts then if _ts.Health<=0 then return false
                  end
                else local _tt=_tr:FindFirstChild("HumanoidRootPart")
                  local _tu=_tr:GetAttribute("Health")or _tt and _tt:GetAttribute("Health")
                  if _tu~=nil and _tu<=0 then return false
                  end
                  if not _tt then return false
                  end
                end
                if _tr:GetAttribute("Dead")then return false
                end
                if _tr:GetAttribute("Invincible")then return false
                end
                if _I.silentAim.TeamCheck then local _tv=_U(_H.localPlayer3)
                  local _tw=_U(_tq)
                  if not _tv or _tv==_tw then return false
                  end
                end
                return true
              end
            end do local _tx=RaycastParams.new()_tx.FilterType=Enum.RaycastFilterType.Exclude _tx.IgnoreWater=true _J.fn35=function(_ty)_tx.FilterDescendantsInstances={_H.localPlayer3.Character or getgenv().GetLocalCharacter and getgenv().GetLocalCharacter()}
                local _tz=getgenv().ThirdPerson _tz=_tz and _tz.Enabled
                local _tA=nil
                if _tz then local _tB=_H.localPlayer3.Character or getgenv().GetLocalCharacter and getgenv().GetLocalCharacter()_tA=nil
                  if _tB then local _tC=_tB:FindFirstChild("HumanoidRootPart")or _tB:FindFirstChildOfClass("BasePart")_tA=nil
                    if _tC then _tA=_tC.Position
                    end
                  end
                end _tA=_tA or _H.currentCamera2.CFrame.Position
                local _tD=_ty.Position-_tA
                local _tE=_tD.Magnitude
                if _tE<=0 then return true
                end
                local _tF=_tD.Unit
                local _tG=_ty:FindFirstAncestorOfClass("Model")
                local _tH=_tA
                for _tI=1,25 do local _tJ=workspace:Raycast(_tH,_tF*(_tE-(_tH-_tA).Magnitude),_tx)
                  if not _tJ then return true
                  end
                  if _tJ.Instance:FindFirstAncestorOfClass("Model")==_tG then return true
                  end
                  if not(_tJ.Instance:IsA("BasePart")and _tJ.Instance.Transparency>0)then return false
                  end _tH=_tJ.Position+_tF*0.1
                end
                return true
              end
            end
          end
          local _tK,_tL do do local _tM={v83=_y.v83,new=_y.new,vector2=_y.vector2}do do _tM.tbl18={}_tM.tbl19={}_tM.verdantHistory=workspace:FindFirstChild("VerdantHistory")or _tM.new("Folder",workspace)_tM.verdantHistory.Name="VerdantHistory"_tM.fn37=function(_tN)
                    local _tO=_tM.tbl19[_tN]
                    if _tO then pcall(function()_tO:Destroy()
                      end)
                    end _tM.tbl19[_tN]=nil
                  end
                  local function _tP(_tQ,_tR)
                    local _tS=_tM.tbl18[_tQ.Name]
                    if not _tS then _tS={}_tM.tbl18[_tQ.Name]=_tS
                    end
                    local _tT={}
                    for _tU,_tV in ipairs(_tR:GetChildren())do if _tV:IsA("BasePart")then _tT[_tV.Name]=_tV.CFrame
                      end
                    end
                    local _tW=_tR:FindFirstChild("HumanoidRootPart")_tS[#_tS+1]={t=os.clock(),parts=_tT,vel=_tW and _tW.AssemblyLinearVelocity or _H.vector}
                    local _tX=os.clock()-1
                    while#_tS>0 and _tS[1].t<_tX do _H.remove2(_tS,1)
                    end
                  end
                end do local _tY do _tY=function(_tZ)
                      local _ua=_tM.tbl18[_tZ.Name]
                      if not _ua or#_ua==0 then return nil
                      end
                      local _ub=math.clamp(_H.localPlayer3:GetNetworkPing(),0.05,1)
                      local _uc=os.clock()-_ub
                      local _ud=_ua[1]
                      for _ue=#_ua,1,-1 do if _ua[_ue].t<=_uc then _ud=_ua[_ue]break
                        end
                      end
                      return _ud
                    end do local function _uf(_ug,_uh)
                        local _ui=_tM.tbl18[_ug.Name]_ui=_ui and _ui[#_ui]
                        if not _ui then return nil
                        end
                        local _uj=_ui.parts[_uh]or _ui.parts.Head or _ui.parts.HumanoidRootPart
                        if not _uj then return nil
                        end
                        return _uj.Position+_ui.vel*math.clamp(_H.localPlayer3:GetNetworkPing(),0,0.3)
                      end _tM.fn38=function(_uk)
                        if _I.history.Mode=="forwardtrack"then return _uf(_uk,"Head")
                        end
                        local _ul=_tY(_uk)
                        if not _ul then return nil
                        end
                        local _um=_ul.parts.Head or _ul.parts.HumanoidRootPart
                        return _um and _um.Position or nil
                      end
                    end
                  end
                  local function _un(_uo)
                    if _I.history.Mode=="forwardtrack"then local _up=_tM.tbl18[_uo.Name]_up=_up and _up[#_up]
                      if not _up then return nil
                      end
                      local _uq=_up.vel*math.clamp(_H.localPlayer3:GetNetworkPing(),0,0.3)
                      if _uq.Magnitude<0.01 then return _up.parts
                      end
                      local _ur={}
                      for _us,_ut in pairs(_up.parts)do _ur[_us]=_ut+_uq
                      end
                      return _ur
                    end
                    local _uu=_tY(_uo)
                    return _uu and _uu.parts or nil
                  end
                end
              end do local function _uv(_uw)
                  local _ux=_H.currentCamera2.ViewportSize/2
                  local _uy=_I.silentAim.FOVRadius
                  if _I.silentAim.DynamicFOV and _uy>0 then _uy*=70/_H.currentCamera2.FieldOfView
                  end
                  local _uz=_H.huge2
                  local _uA=nil
                  local _uB=nil
                  for _uC,_uD in pairs(_H.Players2:GetPlayers())do if _J.fn34(_uD)then local _uE=_I.fn31(_uD.Name)
                      if _uE then local _uF=_tM.fn38(_uE)
                        if _uF then local _uG,_uH=_H.currentCamera2:WorldToViewportPoint(_uF)
                          if _uH then local _uI=_tM.vector2(_uG.X,_uG.Y)
                            if not _I.silentAim.UseFOV or _uy<=0 or(_uI-_ux).Magnitude<=_uy then local _uJ=(_uI-_uw).Magnitude
                              if _uJ<_uz then _uz=_uJ _uA=_uE _uB=_uF
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                  return _uA,_uB
                end
              end do local function _uK(_uL)
                  local _uM,_uN=pcall(function()
                    return _uL:Clone()
                  end)
                  if not _uM or not _uN then return nil
                  end
                  for _uO,_uP in ipairs(_uN:GetDescendants())do if _uP:IsA("Script")or _uP:IsA("LocalScript")or _uP:IsA("ModuleScript")or _uP:IsA("AnimationController")or _uP:IsA("Animator")or _uP:IsA("SurfaceAppearance")or _uP:IsA("Texture")or _uP:IsA("Decal")then _uP:Destroy()
                    end
                  end _uN.Parent=_tM.verdantHistory
                  return _uN
                end
                local function _uQ(_uR,_uS)
                  local _uT=_uR.Name
                  local _uU=_tM.tbl19[_uT]
                  if not _uU or not _uU.Parent then local _uV=_I.fn31(_uT)
                    if not _uV then return
                    end _uU=_uK(_uV)
                    if not _uU then return
                    end _tM.tbl19[_uT]=_uU
                  end
                  local _uW=Enum.Material[_I.history.VisualizerMaterial]or Enum.Material.ForceField
                  local _uX=_I.history.VisualizerColor or Color3.fromRGB(130,200,255)
                  local _uY=math.clamp(_I.history.VisualizerTransparency or 0.35,0,1)
                  for _uZ,_va in ipairs(_uU:GetDescendants())do if _va:IsA("BasePart")then local _vb=_uS[_va.Name]
                      if _vb then _va.CFrame=_vb
                      end _va.Anchored=true _va.CanCollide=false _va.CanQuery=false _va.CanTouch=false _va.CastShadow=false _va.Color=_uX _va.Material=_uW
                      if _va.Name=="HumanoidRootPart"or _va.Name=="CameraPart"then _va.Transparency=1
                      else _va.Transparency=_uY
                      end
                    end
                  end
                end
              end task.spawn(function(...)
              end)_H.Players2.PlayerRemoving:Connect(function(_vc)_tM.tbl18[_vc.Name]=nil _tM.fn37(_vc.Name)
              end)
            end do local _vd do local _ve do _vd=function(_vf)
                    local _vg=_vf or _I.silentAim.TargetPart
                    local _vh=math.huge
                    local _vi=_H.currentCamera2.CFrame.Position
                    local _vj=nil
                    local _vk=nil
                    for _vl,_vm in pairs(_H.Players2:GetPlayers())do if _J.fn34(_vm)then local _vn=_J.fn33(_vm.Character,_vg,_H.UserInputService:GetMouseLocation())
                        if _vn then if not(_I.silentAim.WallCheck and not _I.silentAim.WallBang and not _J.fn35(_vn))then local _vo=(_vn.Position-_vi).Magnitude
                            if _vo<_vh then _vj=_vm.Character _vh=_vo _vk=_vn
                            end
                          end
                        end
                      end
                    end
                    return _vj,_vk
                  end _ve=function(_vp)
                    local _vq=_vp or _H.currentCamera2
                    local _vr=_I.silentAim.FOVRadius
                    if _I.silentAim.DynamicFOV and _vr>0 then return _vr*70/_vq.FieldOfView
                    end
                    return _vr
                  end do local function _vs(_vt,_vu)
                      local _vv=math.huge
                      local _vw=nil
                      local _vx=nil
                      for _vy,_vz in pairs(_H.Players2:GetPlayers())do if _J.fn34(_vz)then local _vA=_J.fn33(_vz.Character,_vu,_vt)
                          if _vA then if not(_I.silentAim.WallCheck and not _I.silentAim.WallBang and not _J.fn35(_vA))then local _vB,_vC=_H.currentCamera2:WorldToViewportPoint(_vA.Position)
                              if _vC then local _vD=(Vector2.new(_vB.X,_vB.Y)-_vt).Magnitude
                                if _vD<_vv then _vw=_vz.Character _vv=_vD _vx=_vA
                                end
                              end
                            end
                          end
                        end
                      end
                      return _vw,_vx
                    end
                    local function _vE(_vF,_vG)
                      local _vH=_vG or _I.silentAim.TargetPart
                      local _vI=_H.currentCamera2.ViewportSize/2
                      local _vJ=math.huge
                      if not _I.silentAim.UseFOV then local _vK,_vL=_vs(_vF,_vH)
                        if _vK then return _vK,_vL
                        end
                        return _vd(_vH)
                      end
                      local _vM=_ve()
                      local _vN=nil
                      local _vO=nil
                      for _vP,_vQ in pairs(_H.Players2:GetPlayers())do if _J.fn34(_vQ)then local _vR=_J.fn33(_vQ.Character,_vH,_vF)
                          if _vR then if not(_I.silentAim.WallCheck and not _I.silentAim.WallBang and not _J.fn35(_vR))then local _vS,_vT=_H.currentCamera2:WorldToViewportPoint(_vR.Position)
                              local _vU=Vector2.new(_vS.X,_vS.Y)
                              local _vV=(_vU-_vF).Magnitude
                              if not((_vU-_vI).Magnitude>_vM or not _vT)then if _vV<_vJ then _vN=_vQ.Character _vJ=_vV _vO=_vR
                                end
                              end
                            end
                          end
                        end
                      end
                      return _vN,_vO
                    end
                  end
                end _J.updateFov=function()
                  if not _I.silentAim.Enabled and not _I.aimAssist.Enabled or not _I.silentAim.UseFOV then _I.circle.Visible=false _I.circle2.Visible=false _I.v96.Visible=false
                    return
                  end
                  local _vW=workspace.CurrentCamera
                  if _I.silentAim.FOVRadius==0 then _I.circle.Visible=false _I.circle2.Visible=false _I.v96.Visible=false
                    return
                  end
                  local _vX=_ve(_vW)
                  local _vY=_vW.ViewportSize
                  local _vZ=Vector2.new(_vY.X/2,_vY.Y/2)_I.circle.Visible=_I.silentAim.ShowFOVCircle _I.circle.Position=_vZ _I.circle.Radius=_vX _I.circle.Color=_I.silentAim.FOVColor _I.circle.Thickness=_I.silentAim.FOVThickness _I.circle.NumSides=64 _I.circle.Filled=false _I.circle.Transparency=_I.silentAim.FOVTransparency or 1 _I.circle2.Visible=_I.silentAim.ShowFOVCircle and _I.silentAim.ShowFOVOutline _I.circle2.Position=_vZ _I.circle2.Radius=_vX _I.circle2.Thickness=_I.silentAim.FOVThickness+2 _I.circle2.NumSides=64 _I.circle2.Filled=false _I.circle2.Transparency=_I.silentAim.FOVTransparency or 1
                  if _I.silentAim.ShowFOVFill then _I.v96.Visible=true _I.v96.Position=_vZ _I.v96.Radius=_vX _I.v96.Thickness=_I.silentAim.FOVThickness
                    local _wa=_I.silentAim.FOVFillTransparency or 0.15
                    if _wa>0.4 then _wa=0.15
                    end _I.v96.FilledTransparency=_wa _I.v96.Gradient={Color=ColorSequence.new({ColorSequenceKeypoint.new(0,_I.silentAim.FOVFillColor1),ColorSequenceKeypoint.new(0.5,_I.silentAim.FOVFillColor2),ColorSequenceKeypoint.new(1,_I.silentAim.FOVFillColor3)}),Rotation=_I.silentAim.FOVGradientRotation,}
                  else _I.v96.Visible=false
                  end
                end
              end do do local function _wb()
                    local _wc=workspace.CurrentCamera
                    if _wc then for _wd,_we in ipairs(_wc:GetChildren())do if _we:IsA("Model")then local _wf=_we:FindFirstChild("Interactables")_wf=_wf and _wf:FindFirstChild("MuzzlePart")
                          if _wf and _wf:IsA("BasePart")then return _wf
                          end
                        end
                      end
                    end
                    return nil
                  end _J.updateTargetTracer=function(_wg,_wh)
                    if not _I.silentAim.ShowTracer or not _wg then _J.v97.Visible=false
                      return
                    end
                    local _wi,_wj=_H.currentCamera2:WorldToViewportPoint(_wh or _wg.Position)
                    if not _wj then _J.v97.Visible=false
                      return
                    end
                    local _wk=_I.silentAim.TracerLinePosition or "bottom"
                    local _wl
                    if _wk=="gun"then local _wm=getgenv().ThirdPerson _wm=_wm and _wm.Enabled
                      local _wn=false _wl=nil
                      if _wm then local _wo=_H.localPlayer3.Character or getgenv().GetLocalCharacter and getgenv().GetLocalCharacter()_wl=nil
                        if _wo then local _wp=_wo:FindFirstChild("RightHand")or _wo:FindFirstChild("RightLowerArm")or _wo:FindFirstChild("RightUpperArm")or _wo:FindFirstChild("Right Arm")
                          local _wq=_wp and _wp:IsA("BasePart")_wl=nil
                          if _wq then local _wr,_ws=_H.currentCamera2:WorldToViewportPoint(_wp.Position)_wl=nil
                            if _ws then _wl=Vector2.new(_wr.X,_wr.Y)_wn=true
                            end
                          end
                        end
                      end
                      if not _wn then local _wt=_wb()
                        if _wt then local _wu,_wv=_H.currentCamera2:WorldToViewportPoint(_wt.Position)
                          if _wv then _wl=Vector2.new(_wu.X,_wu.Y)
                          end
                        end
                      end _wl=_wl or Vector2.new(_H.currentCamera2.ViewportSize.X/2,_H.currentCamera2.ViewportSize.Y/2)
                    elseif _wk=="bottom"then _wl=Vector2.new(_H.currentCamera2.ViewportSize.X/2,_H.currentCamera2.ViewportSize.Y)
                    else _wl=Vector2.new(_H.currentCamera2.ViewportSize.X/2,_H.currentCamera2.ViewportSize.Y/2)
                    end _J.v97.Visible=true _J.v97.From=_wl _J.v97.To=Vector2.new(_wi.X,_wi.Y)_J.v97.Thickness=_I.silentAim.TracerThickness _J.v97.Transparency=_I.silentAim.TracerColorTransparency or 1 _J.v97.Color=_I.silentAim.TracerColor _J.v97.GradientColor=_I.silentAim.TracerColorEnd _J.v97.OutlineColor=_I.silentAim.TracerOutlineColor _J.v97.OutlineThickness=_I.silentAim.TracerOutlineThickness
                  end
                end
              end do _H.RunService2.RenderStepped:Connect(function()
                  if _J.updateFov then _J.updateFov()
                  end
                end)_H.RunService2.RenderStepped:Connect(function(_ww)
                  local _wx=workspace.CurrentCamera
                  if not _wx then return
                  end _H.currentCamera2=_wx
                  if not _I.silentAim.Enabled and not _I.aimAssist.Enabled then _J.v98,_J.v99,_J.v100=nil,nil,nil
                    if _J.updateTargetTracer then _J.updateTargetTracer(nil)
                    end
                    return
                  end
                  local _wy,_wz=_vd()
                  local _wA=_wz and _J.fn32(_wz,_H.UserInputService:GetMouseLocation(),_I.silentAim.HitPartScale)
                  if _wA and _I.silentAim.UseFOV and _I.silentAim.FOVRadius>0 then local _wB,_wC=_wx:WorldToViewportPoint(_wA)
                    local _wD=_wx.ViewportSize/2
                    local _wE=_I.silentAim.FOVRadius*(_I.silentAim.DynamicFOV and 70/_wx.FieldOfView or 1)
                    if not _wC or(Vector2.new(_wB.X,_wB.Y)-_wD).Magnitude>_wE then _wy,_wz,_wA=nil,nil,nil
                    end
                  end _J.v98,_J.v99,_J.v100=_wy,_wz,_wA
                  if _J.updateTargetTracer then _J.updateTargetTracer(_wz,_wA)
                  end
                end)do local function _wF()
                    local _wG=nil
                    for _wH,_wI in ipairs(getloadedmodules())do if _wI.Name~="Bullet"then _wG=nil continue
                      else local _wJ _wJ,_wG=pcall(require,_wI)
                        if not(_wJ and _wG and _wG._performRaycast)then _wG=nil continue
                        end
                      end break
                    end
                    if not _wG then for _wK,_wL in ipairs(game:GetDescendants())do if _wL:IsA("ModuleScript")and _wL.Name=="Bullet"then local _wM,_wN=pcall(require,_wL)
                          if _wM and _wN and _wN._performRaycast then _wG=_wN break
                          end
                        end
                      end
                    end
                    if not _wG then return
                    end
                    local _wO=_wG._performRaycast
                    local _wP=_wG.create
                    if _wP then _wG.create=function(_wQ,_wR,_wS,...)
                        local _wT=table.pack(...)
                        local _wU=_wP _wT.n=4+_wT.n-1 table.move(_wT,1,_wT.n,4,_wT)_wT[1]=_wQ _wT[2]=_wR _wT[3]=_wS
                        return(_wU(table.unpack(_wT,1,_wT.n)))
                      end
                    end _wG._performRaycast=function(_wV,_wW)
                      if not _I.silentAim.Enabled or not _J.v98 or not _J.v99 then return _wO(_wV,_wW)
                      end
                      local _wX=_J.v100 or _J.v99.Position
                      if _I.silentAim.WallBang or _J.v101 then return{Distance=(_wX-_H.currentCamera2.CFrame.Position).Magnitude,Origin=_H.currentCamera2.CFrame.Position,Direction=(_wX-_H.currentCamera2.CFrame.Position).Unit,Hits={{Position=_wX,Instance=_J.v99 or workspace.Terrain,Material=_J.v99 and _J.v99.Material.Name or "Plastic",Normal=-(_wX-_H.currentCamera2.CFrame.Position).Unit,Exit=false,},},}
                      end
                      local _wY=require(_H.ReplicatedStorage.Shared.Raycast)
                      local _wZ=_wY.cast
                      local _xa=_wY.castThrough
                      local _xb=require(_H.ReplicatedStorage.Components.Common.GetRayIgnore)
                      local _xc=_H.currentCamera2.CFrame.Position
                      local _xd=(_wX-_xc).Unit
                      local _xe=_wV.Properties.Penetration or 0
                      local _xf=_wV.Properties.Range or 500
                      local _xg=_xb()
                      local _xh={Distance=0,Origin=_xc,Direction=_xd,Hits={}}
                      local _xi=_wZ(_xc,_xd*_xf*8/8,nil,_xg)
                      if not _xi.instance then _xh.Distance=_xf
                        return _xh
                      end
                      local _xj=_xi.position _xh.Distance=(_xj-_xc).Magnitude
                      local _xk=_xa(_xj+_xd*-0.001,_xd*(_xe+0.001),_xe,_xg)
                      local _xl=_xh.Hits
                      for _xm=1,#_xk do local _xn=_xk[_xm]
                        if _xn.instance and _xn.material then _xl[#_xl+1]={Position=_xn.position,Instance=_xn.instance,Material=_xn.material.Name,Normal=_xn.normal or Vector3.new(0,0,0),Exit=_xm%2==0,}
                        end
                      end
                      return _xh
                    end
                  end _wF()
                end
              end do local _xo=nil pcall(function(...)
                end)_tK=nil _tL=function()
                  if not _xo and type(getgc)=="function"then local _xp,_xq=pcall(getgc,true)
                    if _xp and type(_xq)=="table"then for _xr,_xs in ipairs(_xq)do if type(_xs)=="table"and type(rawget(_xs,"peekCurrentEquippedForMovement"))=="function"then _xo=_xs break
                        end
                      end
                    end
                  end
                  if not _xo then return nil
                  end
                  local _xt,_xu=pcall(_xo.peekCurrentEquippedForMovement)
                  return _xt and _xu or nil
                end
              end task.spawn(function()
                while task.wait(1)do pcall(function()
                    local _xv=_tL()
                    if _xv then _tK=_xv
                    end
                  end)
                end
              end)task.spawn(function()
                while true do task.wait(_I.autoshoot.Delay or 0)pcall(function()
                    if not _I.autoshoot.Enabled then return
                    end _tK=_tL()
                    if not _tK or not _tK.IsEquipped then return
                    end
                    if _tK.Rounds and _tK.Rounds<=0 then return
                    end
                    local _xw=_H.UserInputService:GetMouseLocation()
                    local _xx,_xy
                    if _I.autoshoot.SpecificPlayers then _xx=nil _xy=nil
                      for _xz,_xA in ipairs(_I.autoshoot.Names)do local _xB=_H.Players2:FindFirstChild(_xA)
                        if not _xB or _xB==_H.localPlayer3 then _xx=nil _xy=nil
                        elseif not _J.fn34(_xB)then _xx=nil _xy=nil
                        else _xy=_J.fn33(_xB.Character,_I.silentAim.TargetPart,_xw)
                          if _xy then _xx=_xB.Character break
                          else _xx=nil _xy=nil
                          end
                        end
                      end
                    else _xx,_xy=_vd()
                      local _xC=_xx and _xy
                      local _xD=nil
                      local _xE=nil
                      if not _xC then _xy=_xD _xx=_xE
                      end
                    end
                    if not _xx or not _xy then return
                    end _J.v98=_xx _J.v99=_xy _J.v100=_J.fn32(_xy,_xw,_I.silentAim.HitPartScale)_tK:shoot()
                  end)
                end
              end)
            end
          end do local _xF do do local _xG={}
                local _xH={}pcall(function()
                  local _xI,_xJ,_xK=next,getgc(true);
                  for _xL,_xM in _xI,_xJ,_xK do if type(_xM)=="table"and(rawget(_xM,"FireRate"))then pcall(function()table.insert(_xG,table.clone(_xM));table.insert(_xH,_xM);
                      end);
                    end;
                    if type(_xM)=="table"and(rawget(_xM,"setWeaponRecoil"))then pcall(function()
                        local _xN;_xN=hookfunction(_xM.setWeaponRecoil,function(...)
                          if _I.exploits.NoRecoil and(_I.exploits.RecoilReduction or 100)>=100 then return;
                          end;
                          return _xN(...);
                        end);
                      end);
                    end;
                    if type(_xM)=="function"and debug.getinfo(_xM).name=="calculateRecoilOffset"then pcall(function()
                        local _xO;_xO=hookfunction(_xM,function(...)
                          if _I.exploits.NoRecoil and(_I.exploits.RecoilReduction or 100)>=100 then return UDim2.new();
                          end;
                          return _xO(...);
                        end);
                      end);
                    end;
                    if type(_xM)=="table"and(rawget(_xM,"weaponKick"))then pcall(function()
                        local _xP;_xP=hookfunction(_xM.weaponKick,function(_xQ,_xR)
                          if _I.exploits.NoRecoil then local _xS=_I.exploits.RecoilReduction or 100;
                            if _xS>=100 then return;
                            elseif _xS<=0 then return _xP(_xQ,_xR);
                            else local _xT,_xU=1-_xS/100,typeof(_xQ);
                              local _xV;
                              if _xU=="number"then _xV=_xQ*_xT;
                              else local _xW=typeof(_xQ);
                                if _xW=="Vector3"then _xV=_xQ*_xT;
                                elseif typeof(_xQ)=="table"then _xV={};
                                  for _xX,_xY in pairs(_xQ)do if typeof(_xY)=="number"then _xV[_xX]=_xY*_xT;
                                    elseif typeof(_xY)=="Vector3"then _xV[_xX]=_xY*_xT;
                                    else _xV[_xX]=_xY;
                                    end;
                                  end;
                                else _xV=_xQ;
                                end;
                              end;
                              return _xP(_xV,_xR);
                            end;
                          end;
                          return _xP(_xQ,_xR);
                        end);
                      end);
                    end;
                    if type(_xM)=="table"and(rawget(_xM,"getTrueSpread"))then pcall(function()
                        local _xZ;_xZ=hookfunction(_xM.getTrueSpread,function(_ya)
                          if _I.exploits.NoSpread then return 0;
                          end;
                          return _xZ(_ya);
                        end);
                      end);
                    end;
                  end;
                end)task.spawn(function()
                  while task.wait(0.05)do pcall(function()
                      if _I.exploits.RapidFire then local _yb=_I.exploits.RapidFireMultiplier or 5
                        for _yc,_yd in next,_xH,nil do pcall(function()setreadonly(_yd,false)rawset(_yd,"FireRate",_xG[_yc].FireRate*(5-_yb)/4)setreadonly(_yd,true)
                          end)
                        end
                      else for _ye,_yf in next,_xH,nil do pcall(function()setreadonly(_yf,false)rawset(_yf,"FireRate",_xG[_ye].FireRate)setreadonly(_yf,true)
                          end)
                        end
                      end
                    end)
                  end
                end)
              end task.spawn(function()
                local _yg=nil
                for _yh,_yi in ipairs(game:GetChildren())do local _yj=_yi:FindFirstChild("Components")
                  if _yj then local _yk=_yj:FindFirstChild("Weapon")
                    if _yk and _yk:IsA("ModuleScript")then local _yl _yl,_yg=pcall(function()
                        return require(_yk)
                      end)
                      if not(_yl and _yg and _yg.reload)then _yg=nil continue
                      end
                    else _yg=nil continue
                    end
                  else _yg=nil continue
                  end break
                end
                if _yg and _yg.reload then local _ym=_yg.reload _yg.reload=function(_yn)
                    if not _I.exploits.InstantReload then return _ym(_yn)
                    end
                    if _yn.IsDestroyed then return
                    end
                    local _yo=_yn.WeaponEquippedTick
                    if tick()-_yo<=1 then return
                    end
                    if _yn.IsChargeFiring then _yn:cancelRevolverCharge(false,false)
                    end _yn:stopRevolverSecondaryFire()
                    local _yp=_yn.IsAdjustingSuppressor
                    local _yq
                    if _yp then _yq=_yp
                    else _yq=_yn.IsReloading or _yn.IsShooting
                    end
                    if _yq then return
                    end
                    if _yn.Properties.Rounds==_yn.Rounds then if _yn.IsInspecting or _yn.IsInspectFadingOut then _yn:cancelInspect(0.25)
                      end
                      return
                    end
                    if _yn.Properties.RechargeTime then if _yn.IsInspecting or _yn.IsInspectFadingOut then _yn:cancelInspect(0.25)
                      end
                      return
                    end
                    local _yr=workspace:GetAttribute("Gamemode")=="Deathmatch"and _yn.Properties.ReloadAnimationCount==1
                    if _yn.Capacity<=0 and not _yr then if _yn.IsInspecting or _yn.IsInspectFadingOut then _yn:cancelInspect(0.25)
                      end
                      return
                    end
                    if _yn.IsAiming then _yn:unscope()
                    end
                    if not(_yn.Properties.Rounds and _yn.Properties.ReloadAnimationCount)then return
                    end
                    if _yn.IsInspecting or _yn.IsInspectFadingOut then _yn:cancelInspect(nil,nil,true)
                    end _yn:stopAllAnimations()_yn.ReloadStartTick=tick()_yn.IsBurstShooting=false _yn.IsInspecting=false _yn.IsReloading=true _yn.IsShooting=false _yn.CurrentWalkSpeedOverride=nil
                    local _ys=require(_H.ReplicatedStorage.Database.Security.Remotes)_ys.Spectate.ReplicateSpectateEvent.Send("Reload")
                    if 1<_yn.Properties.ReloadAnimationCount then local _yt=_yn.Properties.Rounds/_yn.Properties.ReloadAnimationCount
                      for _yu=1,math.ceil((_yn.Properties.Rounds-_yn.Rounds)/_yt)do if _yn.IsReloading then local _yv=_I.HttpService:GenerateGUID(false)_yn.CurrentReloadIdentity=_yv _ys.Inventory.CreateMagazine.Send(_yn.Identifier)_ys.Inventory.ReloadWeapon.Send({Identifier=_yn.Identifier,Capacity=_yn.Capacity,Rounds=_yn.Rounds})
                          local _yw=math.clamp(_yt,0,_yn.Capacity)
                          if _yn.CurrentReloadIdentity==_yv and _yw<=_yn.Capacity then _yn.Rounds=_yn.Rounds+_yw
                            if workspace:GetAttribute("Gamemode")~="Deathmatch"then _yn.Capacity=_yn.Capacity-_yw
                            end
                          end continue
                        end break
                      end _yn.IsReloading=false
                    else _yn.CurrentReloadIdentity=_I.HttpService:GenerateGUID(false)_ys.Inventory.CreateMagazine.Send(_yn.Identifier)_ys.Inventory.ReloadWeapon.Send({Identifier=_yn.Identifier,Rounds=_yn.Rounds,Capacity=_yn.Capacity})
                      local _yx=math.abs(_yn.Properties.Rounds-_yn.Rounds)
                      if _yr then _yn.Rounds=_yn.Properties.Rounds _yn.Capacity=_yn.Properties.Capacity
                      elseif _yn.Capacity-_yx>0 then _yn.Rounds=_yn.Properties.Rounds
                        if workspace:GetAttribute("Gamemode")~="Deathmatch"then _yn.Capacity=math.max(0,_yn.Capacity-_yx)
                        end
                      elseif _yn.Capacity-_yx<=0 then _yn.Rounds=_yn.Rounds+_yn.Capacity _yn.Capacity=0
                      end _yn.IsReloading=false
                    end
                    return nil
                  end
                end
              end)task.spawn(function()
                local _yy=nil
                if pcall(function()_yy=require(_H.ReplicatedStorage:WaitForChild("Components"):WaitForChild("Weapon"))
                  end)and _yy and _yy.startRevolverCharge then local _yz=_yy.startRevolverCharge _yy.startRevolverCharge=function(_yA,_yB)
                    if not(_I.exploits.InstantRevolver and _yA.Properties and _yA.Properties.ShootingOptions=="Revolver")then return _yz(_yA,_yB)
                    end
                    if _yA.ChargeThread then task.cancel(_yA.ChargeThread)_yA.ChargeThread=nil
                    end
                    if _yA.ChargeShoot_connection and _yA.ChargeShoot_connection.Connected then _yA.ChargeShoot_connection:Disconnect()
                    end _yA.ChargeShoot_connection=nil _yA.IsFireHeld=true _yA.FireInputBinding=_yB _yA.HasPendingChargeRequest=false _yA.IsChargeFiring=true _yA.ChargeStartTick=tick()_yA:shoot("Primary")
                  end
                end
              end)task.spawn(function()
                local _yC=nil
                local _yD=nil
                for _yE,_yF in ipairs(getloadedmodules())do if _yF.Name=="Weapon"and _yF.Parent and _yF.Parent.Name=="Components"then local _yG _yG,_yD=pcall(require,_yF)
                    if not(_yG and _yD and _yD.reload)then _yD=nil continue
                    end
                  else _yD=nil continue
                  end break
                end
                if not _yD then for _yH,_yI in ipairs(game:GetDescendants())do if _yI:IsA("ModuleScript")and _yI.Name=="Weapon"and _yI.Parent and _yI.Parent.Name=="Components"then local _yJ,_yK=pcall(require,_yI)
                      if _yJ and _yK and _yK.reload then _yD=_yK break
                      end
                    end
                  end
                end
                if _yD then local _yL,_yM=pcall(function()
                    return require(_H.ReplicatedStorage.Database.Security.Remotes)
                  end)
                  if _yL then _yC=_yM
                  end
                  local _yN=_yD.reload _yD.reload=function(_yO,...)
                    if not _I.exploits.InstantReload then return _yN(_yO,...)
                    end
                    local _yP=_yO.WeaponEquippedTick
                    if tick()-_yP<=1 then return
                    end
                    if _yO.IsChargeFiring then _yO:cancelRevolverCharge(false,false)
                    end _yO:stopRevolverSecondaryFire()
                    if _yO.Properties.Rounds and _yO.Rounds>=_yO.Properties.Rounds then if _yO.IsInspecting or _yO.IsInspectFadingOut then _yO:cancelInspect(0.25)
                      end
                      return
                    end
                    if _yO.Properties.RechargeTime then if _yO.IsInspecting or _yO.IsInspectFadingOut then _yO:cancelInspect(0.25)
                      end _yO.Rounds=_yO.Properties.Rounds or _yO.Rounds _yO.IsReloading=false
                      return
                    end
                    if(_yO.Capacity or 0)<=0 and workspace:GetAttribute("Gamemode")~="Deathmatch"then if _yO.IsInspecting or _yO.IsInspectFadingOut then _yO:cancelInspect(0.25)
                      end
                      return
                    end _yO.IsReloading=false _yO.CurrentReloadIdentity=nil
                    if _yO.ReloadTrackFinishedConnection and _yO.ReloadTrackFinishedConnection.Connected then _yO.ReloadTrackFinishedConnection:Disconnect()_yO.ReloadTrackFinishedConnection=nil
                    end
                    if _yO.Viewmodel and _yO.Viewmodel.Animation then pcall(function()_yO.Viewmodel.Animation:cancelCrossfade()
                      end)
                    end
                    local _yQ=(_yO.Properties.Rounds or 0)-_yO.Rounds
                    if _yQ<=0 then return
                    end
                    if _yC and _yC.Inventory and _yC.Inventory.ReloadWeapon then pcall(function()_yC.Inventory.ReloadWeapon.Send({Identifier=_yO.Identifier,Rounds=_yO.Rounds,Capacity=_yO.Capacity})
                      end)
                    end
                    if workspace:GetAttribute("Gamemode")=="Deathmatch"then _yO.Rounds=_yO.Properties.Rounds _yO.Capacity=_yO.Properties.Capacity or _yO.Capacity
                    elseif _yQ<=_yO.Capacity then _yO.Rounds=_yO.Properties.Rounds _yO.Capacity=_yO.Capacity-_yQ
                    else _yO.Rounds=_yO.Rounds+_yO.Capacity _yO.Capacity=0
                    end _yO.IsReloading=false _yO.CurrentWalkSpeedOverride=nil
                  end
                end
              end)task.spawn(function()
                local _yR=nil
                for _yS,_yT in ipairs(getloadedmodules())do if _yT.Name=="Weapon"and _yT.Parent and _yT.Parent.Name=="Components"then local _yU _yU,_yR=pcall(require,_yT)
                    if not(_yU and _yR and _yR.shoot)then _yR=nil continue
                    end
                  else _yR=nil continue
                  end break
                end
                if not _yR then for _yV,_yW in ipairs(game:GetDescendants())do if _yW:IsA("ModuleScript")and _yW.Name=="Weapon"and _yW.Parent and _yW.Parent.Name=="Components"then local _yX,_yY=pcall(require,_yW)
                      if _yX and _yY and _yY.shoot then _yR=_yY break
                      end
                    end
                  end
                end
                if _yR then local _yZ=_yR.cancelInspect _yR.cancelInspect=function(_za,...)
                    if _za._PreserveInspect then return
                    end
                    return _yZ(_za,...)
                  end
                  local _zb=_yR.stopAllAnimations _yR.stopAllAnimations=function(_zc,...)
                    if _zc._PreserveInspect then if not _zc.CharacterAnimator then return
                      end
                      if not(_zc.Viewmodel and _zc.Viewmodel.Animation)then return
                      end
                      local _zd=_zc.Viewmodel.Animation:pickInspectVariant()_zc.Viewmodel.Animation:cancelCrossfade()
                      for _ze,_zf in pairs(_zc.CharacterAnimator.Animations)do if _zf.IsPlaying and _zf.Name~="Idle"and _zf.Name~="Inspect"then _zc.CharacterAnimator:stop(_ze)
                        end
                      end
                      for _zg,_zh in pairs(_zc.Viewmodel.Animation.Animations)do if _zh.IsPlaying and _zh.Name~="Idle"and _zh.Name~=_zd then _zc.Viewmodel.Animation:stop(_zg)
                        end
                      end
                      return
                    end
                    return _zb(_zc,...)
                  end
                  local _zi=_yR.shoot _yR.shoot=function(_zj,_zk,...)
                    if not _I.exploits.PersistentInspect then return _zi(_zj,_zk,...)
                    end
                    local _zl=_zj.IsInspecting or _zj.IsInspectFadingOut
                    local _zm=0
                    local _zn=_zl and _zj.Viewmodel and _zj.Viewmodel.Animation
                    local _zo=nil
                    if _zn then _zo=_zj.Viewmodel.Animation:pickInspectVariant()
                      local _zp=_zj.Viewmodel.Animation:getAnimation(_zo)
                      if _zp then _zm=_zp.TimePosition or 0
                      end
                    end _zj._PreserveInspect=true
                    local _zq=_zi(_zj,_zk,...)_zj._PreserveInspect=nil
                    if _zl and not _zj.IsDestroyed and _zj.IsEquipped then _zj.IsInspecting=true _zj.IsInspectFadingOut=false
                      if _zo and _zj.Viewmodel and _zj.Viewmodel.Animation then local _zr=_zj.Viewmodel.Animation:getAnimation(_zo)
                        if not _zr or not _zr.IsPlaying then local _zs=_zj.Viewmodel.Animation:play(_zo)
                          if _zs and _zm>0 then pcall(function()_zs.TimePosition=_zm
                            end)
                          end
                        end
                      end
                      if _zj.CharacterAnimator then pcall(function()_zj.CharacterAnimator:play("Inspect")
                        end)
                      end
                    end
                    return _zq
                  end
                end
              end)task.spawn(function()
                local _zt=nil
                for _zu,_zv in ipairs(getloadedmodules())do if _zv.Name~="Viewmodel"then _zt=nil continue
                  else local _zw _zw,_zt=pcall(require,_zv)
                    if not(_zw and _zt and _zt.equip)then _zt=nil continue
                    end
                  end break
                end
                if not _zt then for _zx,_zy in ipairs(game:GetDescendants())do if _zy:IsA("ModuleScript")and _zy.Name=="Viewmodel"then local _zz,_zA=pcall(require,_zy)
                      if _zz and _zA and _zA.equip then _zt=_zA break
                      end
                    end
                  end
                end
                if _zt then local _zB=_zt.equip _zt.equip=function(_zC,_zD,...)
                    if _I.exploits.InstantEquip then return _zB(_zC,true,...)
                    end
                    return _zB(_zC,_zD,...)
                  end
                end
              end)task.spawn(function()
                local _zE=nil
                for _zF,_zG in ipairs(getloadedmodules())do if _zG.Name~="Viewmodel"then _zE=nil continue
                  else local _zH _zH,_zE=pcall(require,_zG)
                    if not(_zH and _zE and _zE.new)then _zE=nil continue
                    end
                  end break
                end
                if not _zE then for _zI,_zJ in ipairs(game:GetDescendants())do if _zJ:IsA("ModuleScript")and _zJ.Name=="Viewmodel"then local _zK,_zL=pcall(require,_zJ)
                      if _zK and _zL and _zL.new then _zE=_zL break
                      end
                    end
                  end
                end
                local _zM=nil
                for _zN,_zO in ipairs(getloadedmodules())do if _zO.Name=="Bobble"then local _zP _zP,_zM=pcall(require,_zO)
                    if not(_zP and _zM and _zM.new)then _zM=nil continue
                    end
                  else _zM=nil continue
                  end break
                end
                if _zE and _zM then local _zQ=_zM.new _zM.new=function(...)
                    local _zR=_zQ(...)
                    if _zR then _zR._originalGetNextCFrame=_zR.getNextCFrame _zR.getNextCFrame=function(_zS,_zT)
                        if _I.exploits.NoSway then return CFrame.identity,Vector3.zero,Vector2.zero
                        end
                        return _zR._originalGetNextCFrame(_zS,_zT)
                      end
                    end
                    return _zR
                  end
                  for _zU,_zV in ipairs(game:GetDescendants())do if _zV:IsA("ModuleScript")and _zV.Name=="Viewmodel"then local _zW,_zX=pcall(require,_zV)
                      if _zW and _zX and _zX.Bobble and _zX.Bobble.getNextCFrame then if not _zX.Bobble._noBobblePatched then _zX.Bobble._originalGetNextCFrame=_zX.Bobble.getNextCFrame _zX.Bobble.getNextCFrame=function(_zY,_zZ)
                            if _I.exploits.NoSway then return CFrame.identity,Vector3.zero,Vector2.zero
                            end
                            return _zX.Bobble._originalGetNextCFrame(_zY,_zZ)
                          end _zX.Bobble._noBobblePatched=true
                        end
                      end
                    end
                  end game.DescendantAdded:Connect(function(_Aa)
                    if _Aa:IsA("ModuleScript")and _Aa.Name=="Viewmodel"then task.wait(0.1)
                      local _Ab,_Ac=pcall(require,_Aa)
                      if _Ab and _Ac and _Ac.Bobble and _Ac.Bobble.getNextCFrame then if not _Ac.Bobble._noBobblePatched then _Ac.Bobble._originalGetNextCFrame=_Ac.Bobble.getNextCFrame _Ac.Bobble.getNextCFrame=function(_Ad,_Ae)
                            if _I.exploits.NoSway then return CFrame.identity,Vector3.zero,Vector2.zero
                            end
                            return _Ac.Bobble._originalGetNextCFrame(_Ad,_Ae)
                          end _Ac.Bobble._noBobblePatched=true
                        end
                      end
                    end
                  end)
                end
              end)task.spawn(function()
                local _Af=nil
                for _Ag,_Ah in ipairs(game:GetDescendants())do if _Ah:IsA("ModuleScript")and _Ah.Name=="Animation"then local _Ai=_Ah.Parent
                    if _Ai and _Ai.Name=="Classes"then local _Aj=_Ai.Parent
                      if _Aj and _Aj.Name=="Viewmodel"then local _Ak _Ak,_Af=pcall(require,_Ah)
                        if not(_Ak and _Af and _Af.play)then _Af=nil continue
                        end
                      else _Af=nil continue
                      end
                    else _Af=nil continue
                    end
                  else _Af=nil continue
                  end break
                end
                if not _Af then for _Al,_Am in ipairs(getloadedmodules())do if _Am.Name=="Animation"then local _An,_Ao=pcall(require,_Am)
                      if _An and _Ao and _Ao.play then _Af=_Ao break
                      end
                    end
                  end
                end
                if _Af then local _Ap={"NoSuppressorShoot","SuppressorShoot","Shoot","Fire","Shot"}
                  local function _Aq(_Ar)
                    if not _Ar then return false
                    end
                    local _As=_Ar:lower()
                    for _At,_Au in ipairs(_Ap)do if _As==_Au:lower()then return true
                      end
                    end
                    return false
                  end
                  local _Av=_Af.play _Af.play=function(_Aw,_Ax,...)
                    if _I.exploits.NoShootAnim and _Aq(_Ax)then return
                    end
                    local _Ay=table.pack(...)
                    local _Az=_Av _Ay.n=3+_Ay.n-1 table.move(_Ay,1,_Ay.n,3,_Ay)_Ay[1]=_Aw _Ay[2]=_Ax
                    return _Az(table.unpack(_Ay,1,_Ay.n))
                  end
                  local _AA=_Af.pickVariant
                  if _AA then _Af.pickVariant=function(_AB,_AC,...)
                      if _I.exploits.NoShootAnim and _Aq(_AC)then return nil
                      end
                      local _AD=table.pack(...)
                      local _AE=_AA _AD.n=3+_AD.n-1 table.move(_AD,1,_AD.n,3,_AD)_AD[1]=_AB _AD[2]=_AC
                      return _AE(table.unpack(_AD,1,_AD.n))
                    end
                  end
                end
              end)do local _AF=_H.combat:Section("bullet control","left")
                local _AG=game:GetService("Players")
                local _AH={double_tap=false,trigger_head_only=false,last_trigger=0,firing_internal=false,hitchance=100,global_weapons=true}getgenv().SHIZUKUSCRIPTS_HVH_COMBAT=getgenv().SHIZUKUSCRIPTS_HVH_COMBAT or{force_head=true,priority="Crosshair",sticky=true,sticky_time=0.35,prediction=true,pred_scale=0.12,auto_wallbang=false,rage_fov=true,ignore_friends=true,resolver=true,resolver_mode="Body",multipoint=true,force_shot=false,backward=true,_sticky_target=nil,_sticky_until=0,}
                local function _AI()
                  local _AJ=getgenv()
                  return _AJ.shizukuscripts and _AJ.shizukuscripts.SilentAim and _AJ.shizukuscripts.SilentAim.Enabled==true
                end
                local function _AK()
                  local _AL=game:GetService("Players")
                  local _AM=game:GetService("UserInputService")
                  local _AN=_AL.LocalPlayer
                  local _AO=workspace.CurrentCamera
                  if not _AN or not _AO then return nil
                  end
                  local _AP=_AM:GetMouseLocation()
                  local _AQ,_AR=nil,18
                  for _AS,_AT in ipairs(_AL:GetPlayers())do if _AT~=_AN and _AT.Character then local _AU=_AT.Character:FindFirstChildOfClass("Humanoid")
                      local _AV=_AT.Character:FindFirstChild("Head")
                      local _AW=_AT.Team~=nil and _AN.Team~=nil and _AT.Team==_AN.Team
                      if _AU and _AU.Health>0 and _AV and not _AW then local _AX,_AY=_AO:WorldToViewportPoint(_AV.Position)
                        if _AY then local _AZ=(Vector2.new(_AX.X,_AX.Y)-_AP).Magnitude
                          if _AZ<=_AR then _AR,_AQ=_AZ,_AT
                          end
                        end
                      end
                    end
                  end
                  return _AQ
                end
                local function _Ba()
                  if _AH.firing_internal then return
                  end _AH.firing_internal=true pcall(function()
                    if mouse1click then mouse1click()
                    elseif mouse1press and mouse1release then mouse1press();task.wait(0.025);mouse1release()
                    else local _Bb=_AG.LocalPlayer:GetMouse();_Bb:TriggerButton1Down();task.wait(0.025);_Bb:TriggerButton1Up()
                    end
                  end)_AH.firing_internal=false
                end
                local _Bc=game:GetService("UserInputService")
                local _Bd=game:GetService("RunService")_Bc.InputBegan:Connect(function(_Be,_Bf)
                  local _Bg=getgenv().SHIZUKUSCRIPTS_HVH_COMBAT
                  local _Bh=_AH.double_tap or(_Bg and _Bg.double_tap)
                  if _Bf or _AH.firing_internal or not _Bh then return
                  end
                  if _Be.UserInputType~=Enum.UserInputType.MouseButton1 and _Be.UserInputType~=Enum.UserInputType.Touch then return
                  end
                  if not _AI()then return
                  end
                  local _Bi=_AK()
                  if not _Bi then return
                  end task.delay(0.07,function()
                    if not _AI()or not _Bi.Character then return
                    end
                    local _Bj=_Bi.Character:FindFirstChildOfClass("Humanoid")
                    if _Bj and _Bj.Health>0 and _Bi.Character:FindFirstChild("Head")then _Ba()
                    end
                  end)
                end)_Bd.RenderStepped:Connect(function()
                  local _Bk=getgenv().SHIZUKUSCRIPTS_HVH_COMBAT
                  local _Bl=_AH.trigger_head_only or(_Bk and _Bk.rapid_trigger)
                  if not _Bl or _AH.firing_internal then return
                  end
                  local _Bm=os.clock()
                  local _Bn=(_Bk and _Bk.rapid_trigger)and 0.045 or 0.08
                  if _Bm-_AH.last_trigger<_Bn then return
                  end
                  if _AK()then local _Bo=tonumber(_AH.hitchance)or 100
                    if math.random(1,100)<=_Bo then _AH.last_trigger=_Bm _Ba()
                    else _AH.last_trigger=_Bm
                    end
                  end
                end)
                local _Bq=_AF:Toggle({title="enable",default=false,risky=false,info=true,infotext="just redirects ur bullets right to the hitpart that u selected",callback=function(_Bp)getgenv().shizukuscripts.SilentAim.Enabled=_Bp pcall(function()
                    if getgenv().SHIZUKUSCRIPTS_SILENT_AIM and getgenv().SHIZUKUSCRIPTS_SILENT_AIM.toggle then getgenv().SHIZUKUSCRIPTS_SILENT_AIM:toggle(_Bp==true)
                    end
                  end)
                end,})_AF:Toggle({title="double tap",default=false,risky=true,info=true,infotext="when Silent Aim is enabled, fires one extra shot toward the head",callback=function(_Br)_AH.double_tap=_Br
                end,})_AF:Toggle({title="trig head",default=false,risky=true,info=true,infotext="triggerbot fires only on enemy heads",callback=function(_Bs)_AH.trigger_head_only=_Bs
                end,})_AF:Slider({title="hitchance",min=1,max=100,default=100,suffix="%",callback=function(_Bt)_AH.hitchance=_Bt
                end,})_AF:Toggle({title="global guns",default=true,risky=false,info=true,infotext="apply silent/trigger settings to all guns",callback=function(_Bu)_AH.global_weapons=_Bu==true getgenv().SHIZUKUSCRIPTS_GLOBAL_WEAPONS=_Bu==true
                end,})_AF:Slider({title="hitpart scale",min=0,max=100,default=0,suffix="%",mintext="disabled",callback=function(_Bv)getgenv().shizukuscripts.SilentAim.HitPartScale=_Bv
                end,})_AF:Toggle({title="highlight hitpart",default=false,risky=false,callback=function(_Bw)getgenv().shizukuscripts.SilentAim.HighlightHitPart=_Bw
                end,}):Colorpicker({title="highlight color",default=Color3.fromRGB(235,0,0),transparency=1,callback=function(_Bx,_By)getgenv().shizukuscripts.SilentAim.HighlightColor=_Bx getgenv().shizukuscripts.SilentAim.HighlightTransparency=_By
                end,})
                local _BE=_AF:Toggle({title="draw line",default=false,risky=false,callback=function(_Bz)getgenv().shizukuscripts.SilentAim.ShowTracer=_Bz
                end,}):Settings({callback=function()
                end}):Colorpicker({title="line color",default=Color3.fromRGB(255,138,255),transparency=1,callback=function(_BA,_BB)getgenv().shizukuscripts.SilentAim.TracerColor=_BA getgenv().shizukuscripts.SilentAim.TracerColorTransparency=_BB
                end,}):Colorpicker({title="line color end",default=Color3.fromRGB(179,239,103),transparency=1,callback=function(_BC,_BD)getgenv().shizukuscripts.SilentAim.TracerColorEnd=_BC getgenv().shizukuscripts.SilentAim.TracerColorEndTransparency=_BD
                end,})_BE:Dropdown({title="line position",values={"center","bottom"},default="bottom",callback=function(_BF)getgenv().shizukuscripts.SilentAim.TracerLinePosition=_BF
                end,})_BE:Slider({title="thickness",min=1,max=5,default=1,suffix="%",callback=function(_BG)getgenv().shizukuscripts.SilentAim.TracerThickness=_BG
                end,})_AF:Toggle({title="rotate viewmodel  ",default=false,risky=false,info=true,infotext="rotates your viewmodel x/y to where the bullet went on every shot",callback=function(_BH)getgenv().GunSettings.RotateOnShot=_BH
                  if not _BH then local _BI=false getgenv().GunSettings.ViewModelShotActive=_BI getgenv().GunSettings.ViewModelRotX=0
                    local _BJ=0 getgenv().GunSettings.ViewModelRotY=_BJ
                  end
                  local _BK=getgenv().GunSettingsApplyViewmodels
                  if _BK then _BK()
                  end
                end,})_AF:Toggle({title="auto shoot",default=false,risky=false,info=true,infotext="auto fire + wallcheck",callback=function(_BL)getgenv().shizukuscripts.Autoshoot.Enabled=_BL==true pcall(function()
                    local _BM=getgenv().SHIZUKUSCRIPTS_AUTOSHOOT
                    if _BM and _BM.toggle then _BM:toggle(_BL==true)
                    end
                  end)
                end,})pcall(function()_AF:Slider({title="as delay",min=0,max=1,float=0.01,default=0.05,suffix="s",callback=function(_BN)pcall(function()getgenv().SHIZUKUSCRIPTS_AUTOSHOOT.shot_cooldown=_BN
                    end)pcall(function()getgenv().shizukuscripts.Autoshoot.Delay=_BN
                    end)
                  end,})_AF:Slider({title="as wait",min=0,max=0.8,float=0.01,default=0.1,suffix="s",callback=function(_BO)pcall(function()getgenv().SHIZUKUSCRIPTS_AUTOSHOOT.death_wait=_BO
                    end)
                  end,})_AF:Slider({title="as fov",min=20,max=1000,float=1,default=250,callback=function(_BP)pcall(function()getgenv().SHIZUKUSCRIPTS_AUTOSHOOT.fov=_BP
                    end)
                  end,})_AF:Toggle({title="as wallcheck",default=true,callback=function(_BQ)pcall(function()getgenv().SHIZUKUSCRIPTS_AUTOSHOOT.wallcheck=_BQ==true
                    end)
                  end,})_AF:Toggle({title="as bots",default=true,callback=function(_BR)pcall(function()getgenv().SHIZUKUSCRIPTS_AUTOSHOOT.target_bots=_BR==true
                    end)
                  end,})_AF:Toggle({title="sa bots",default=true,info=true,infotext="silent aim targets NPC bots",callback=function(_BS)pcall(function()
                      if getgenv().SHIZUKUSCRIPTS_SILENT_AIM then getgenv().SHIZUKUSCRIPTS_SILENT_AIM.target_bots=_BS==true
                      end
                    end)
                  end,})
                end)_xF=_AF
              end
            end
            local _BT do pcall(function()_xF:Toggle({title="prioritize",default=false,risky=false,info=true,infotext="prioritize specific players",callback=function(_BU)getgenv().shizukuscripts.Autoshoot.SpecificPlayers=_BU
                end,})
                local _BV={}
                for _BW,_BX in ipairs(_H.Players2:GetPlayers())do if _BX.Name~=_H.localPlayer3.Name then table.insert(_BV,_BX.Name)
                  end
                end
                local _BY _BY,_BT=_xF:Dropdown({title="player",values=_BV,default="",multi=true,callback=function(_BZ)
                  local _Ca={}
                  if type(_BZ)=="table"then for _Cb,_Cc in ipairs(_BZ)do if _Cc~=_H.localPlayer3.Name then _Ca[#_Ca+1]=_Cc
                      end
                    end
                  end getgenv().shizukuscripts.Autoshoot.Names=_Ca
                end,})
              end)
            end do local _Cd=_H.combat:Section("global","right")_Cd:Dropdown({title="hitpart",values={"Head","Torso","LeftArm","RightArm","LeftLeg","RightLeg","HumanoidRootPart",},default="Head",multi=true,callback=function(_Ce)getgenv().shizukuscripts.SilentAim.TargetPart=_Ce getgenv().shizukuscripts.AimAssist.TargetPart=_Ce
              end,})
              local _Ci=_Cd:Toggle({title="use fov",default=false,risky=false,callback=function(_Cf)getgenv().shizukuscripts.SilentAim.UseFOV=_Cf
              end,}):Settings({callback=function()
              end}):Colorpicker({title="fov color",default=Color3.fromRGB(255,190,255),transparency=1,callback=function(_Cg,_Ch)getgenv().shizukuscripts.SilentAim.FOVColor=_Cg getgenv().shizukuscripts.SilentAim.FOVTransparency=_Ch
              end,})_Ci:Toggle({title="draw fov",default=true,callback=function(_Cj)getgenv().shizukuscripts.SilentAim.ShowFOVCircle=_Cj
              end,})_Ci:Toggle({title="draw outline",default=true,callback=function(_Ck)getgenv().shizukuscripts.SilentAim.ShowFOVOutline=_Ck
              end,})_Ci:Slider({title="fov radius",min=1,max=500,default=500,suffix=" px",callback=function(_Cl)getgenv().shizukuscripts.SilentAim.FOVRadius=_Cl
              end,})_Ci:Toggle({title="dynamic fov",default=true,callback=function(_Cm)getgenv().shizukuscripts.SilentAim.DynamicFOV=_Cm
              end,})_Cd:Toggle({title="wallcheck",default=false,callback=function(_Cn)getgenv().shizukuscripts.SilentAim.WallCheck=_Cn
              end,})_Cd:Toggle({title="teamcheck",default=true,callback=function(_Co)getgenv().shizukuscripts.SilentAim.TeamCheck=_Co
              end,})
            end
          end do do local _Cp=_H.combat:Section("exploits","left")_Cp:Toggle({title="wallbang",default=false,risky=false,info=false,infotext="will still work if u have wallcheck on, also this is an actual wallbang exploit",callback=function(_Cq)getgenv().shizukuscripts.SilentAim.WallBang=_Cq
              end,})_Cp:Toggle({title="no spread",default=false,risky=false,callback=function(_Cr)getgenv().shizukuscripts.Exploits.NoSpread=_Cr
              end,})_Cp:Toggle({title="no recoil",default=false,risky=false,callback=function(_Cs)getgenv().shizukuscripts.Exploits.NoRecoil=_Cs
              end,}):Settings({callback=function()
              end}):Slider({title="recoil reduction",min=0,max=100,default=100,suffix="%",mintext="disabled",callback=function(_Ct)getgenv().shizukuscripts.Exploits.RecoilReduction=_Ct
              end,})_Cp:Toggle({title="instant revolver",default=false,risky=false,callback=function(_Cu)getgenv().shizukuscripts.Exploits.InstantRevolver=_Cu
              end,})_Cp:Toggle({title="revolver auto alt-shot",default=true,risky=true,info=true,infotext="auto switches R8 to fast alt-fire for trigger/silent",callback=function(_Cv)getgenv().SHIZUKUSCRIPTS_REVOLVER_ALT=_Cv==true
              end,})_Cp:Toggle({title="instant reload",default=false,risky=false,callback=function(_Cw)getgenv().shizukuscripts.Exploits.InstantReload=_Cw
              end,})_Cp:Toggle({title="rapid fire",default=false,risky=false,callback=function(_Cx)getgenv().shizukuscripts.Exploits.RapidFire=_Cx
              end,}):Settings({callback=function()
              end}):Slider({title="multiplier",min=1,max=5,default=5,suffix="x",callback=function(_Cy)getgenv().shizukuscripts.Exploits.RapidFireMultiplier=_Cy
              end,})_Cp:Toggle({title="auto reload",default=false,risky=false,callback=function(_Cz)getgenv().shizukuscripts.Exploits.AutoReload=_Cz
              end,}):Settings({callback=function()
              end}):Slider({title="reload threshold",min=0,max=5,default=1,suffix=" bullets",callback=function(_CA)getgenv().shizukuscripts.Exploits.AutoReloadThreshold=_CA
              end,})
              local _CB=nil
              for _CC,_CD in ipairs(game:GetChildren())do local _CE=_CD:FindFirstChild("Components")
                if _CE then local _CF=_CE:FindFirstChild("Weapon")
                  if _CF and _CF:IsA("ModuleScript")then local _CG _CG,_CB=pcall(function()
                      return require(_CF)
                    end)
                    if _CG and _CB and _CB.reload and _CB.shoot then break
                    else _CB=nil
                    end
                  else _CB=nil
                  end
                else _CB=nil
                end
              end
              if _CB and not getgenv()._AutoReloadShootHooked then getgenv()._AutoReloadShootHooked=true do local _CH=_CB.shoot _CB.shoot=function(_CI,...)
                    local _CJ=table.pack(...)
                    local _CK=_CH _CJ.n=2+_CJ.n-1 table.move(_CJ,1,_CJ.n,2,_CJ)_CJ[1]=_CI
                    local _CL=_CK(table.unpack(_CJ,1,_CJ.n))
                    if getgenv().shizukuscripts.Exploits.AutoReload then local _CM=math.floor(getgenv().shizukuscripts.Exploits.AutoReloadThreshold or 1)
                      local _CN=_CI.Rounds or 0
                      if _CN>0 and _CN<=_CM and not _CI.IsReloading then task.spawn(function()pcall(function()_CI:reload()
                          end)
                        end)
                      end
                    end
                    return _CL
                  end
                end
              end _Cp:Toggle({title="always auto",default=false,risky=false,callback=function(_CO)getgenv().shizukuscripts.Exploits.AlwaysAuto=_CO
              end,})pcall(function()
                local _CP=_H.combat:Section("silent aim","left")_CP:Toggle({title="enable",default=false,callback=function(_CQ)
                  local _CR=getgenv()
                  if _CR.shizukuscripts and _CR.shizukuscripts.SilentAim then _CR.shizukuscripts.SilentAim.Enabled=_CQ
                  end
                  if _CR.SHIZUKUSCRIPTS_SILENT_AIM and type(_CR.SHIZUKUSCRIPTS_SILENT_AIM.toggle)=="function"then pcall(function()_CR.SHIZUKUSCRIPTS_SILENT_AIM:toggle(_CQ)
                    end)
                  end
                end})_CP:Toggle({title="wallbang",default=false,callback=function(_CS)
                  local _CT=getgenv()
                  if _CT.shizukuscripts and _CT.shizukuscripts.SilentAim then _CT.shizukuscripts.SilentAim.WallBang=_CS
                  end
                  if _CT.SHIZUKUSCRIPTS_SILENT_AIM then _CT.SHIZUKUSCRIPTS_SILENT_AIM.wallbang=_CS
                  end
                end})_CP:Toggle({title="teamcheck",default=true,callback=function(_CU)
                  local _CV=getgenv()
                  if _CV.shizukuscripts and _CV.shizukuscripts.SilentAim then _CV.shizukuscripts.SilentAim.TeamCheck=_CU
                  end
                  if _CV.SHIZUKUSCRIPTS_SILENT_AIM then _CV.SHIZUKUSCRIPTS_SILENT_AIM.teamcheck=_CU
                  end
                end})_CP:Toggle({title="wallcheck",default=false,callback=function(_CW)
                  local _CX=getgenv()
                  if _CX.shizukuscripts and _CX.shizukuscripts.SilentAim then _CX.shizukuscripts.SilentAim.WallCheck=_CW
                  end
                  if _CX.SHIZUKUSCRIPTS_SILENT_AIM then _CX.SHIZUKUSCRIPTS_SILENT_AIM.wallcheck=_CW
                  end
                end})_CP:Slider({title="fov",min=1,max=500,default=500,suffix=" px",callback=function(_CY)
                  local _CZ=getgenv()
                  if _CZ.SHIZUKUSCRIPTS_SILENT_AIM then _CZ.SHIZUKUSCRIPTS_SILENT_AIM.fov=_CY
                  end
                  if _CZ.shizukuscripts and _CZ.shizukuscripts.SilentAim then _CZ.shizukuscripts.SilentAim.FOVRadius=_CY
                  end
                end})_CP:Dropdown({title="hitpart",values={"Head","Torso","HumanoidRootPart","LeftArm","RightArm","LeftLeg","RightLeg"},default="Head",multi=false,callback=function(_Da)
                  local _Db=getgenv()
                  if _Db.SHIZUKUSCRIPTS_SILENT_AIM then _Db.SHIZUKUSCRIPTS_SILENT_AIM.hitpart=_Da
                  end
                  if _Db.shizukuscripts and _Db.shizukuscripts.SilentAim then _Db.shizukuscripts.SilentAim.TargetPart=_Da
                  end
                end})
              end)
            end game:GetService("UserInputService")
            local function _Dc()
              if _tL then local _Dd,_De=pcall(_tL)
                if _Dd then return _De
                end
              end
              return _tK
            end
          end
        end
        local _Df do if not getgenv().AA_Conn then getgenv().AA_Conn=game:GetService("RunService").Heartbeat:Connect(function(...)
            end)
          end players_tab=_z.tween:Tab("visuals")_G.players_tab=players_tab
          local _Dg=players_tab:Section("skybox","left")
          local _Dh={enabled=false,name="Cloudy Skies",original=nil,}
          local _Di={["Cloudy Skies"]={SkyboxBk="rbxassetid://151165214",SkyboxDn="rbxassetid://151165197",SkyboxFt="rbxassetid://151165224",SkyboxLf="rbxassetid://151165191",SkyboxRt="rbxassetid://151165206",SkyboxUp="rbxassetid://151165227"},["Elegant Morning"]={SkyboxBk="rbxassetid://153767241",SkyboxDn="rbxassetid://153767216",SkyboxFt="rbxassetid://153767266",SkyboxLf="rbxassetid://153767200",SkyboxRt="rbxassetid://153767231",SkyboxUp="rbxassetid://153767288"},["Fade Blue"]={SkyboxBk="rbxassetid://153695414",SkyboxDn="rbxassetid://153695352",SkyboxFt="rbxassetid://153695452",SkyboxLf="rbxassetid://153695320",SkyboxRt="rbxassetid://153695383",SkyboxUp="rbxassetid://153695471"},["Neptune"]={SkyboxBk="rbxassetid://218955819",SkyboxDn="rbxassetid://218953419",SkyboxFt="rbxassetid://218954524",SkyboxLf="rbxassetid://218958493",SkyboxRt="rbxassetid://218957134",SkyboxUp="rbxassetid://218950090"},["Night Sky"]={SkyboxBk="rbxassetid://12064107",SkyboxDn="rbxassetid://12064152",SkyboxFt="rbxassetid://12064121",SkyboxLf="rbxassetid://12063984",SkyboxRt="rbxassetid://12064115",SkyboxUp="rbxassetid://12064131"},["Purple And Blue"]={SkyboxBk="rbxassetid://149397692",SkyboxDn="rbxassetid://149397686",SkyboxFt="rbxassetid://149397697",SkyboxLf="rbxassetid://149397684",SkyboxRt="rbxassetid://149397688",SkyboxUp="rbxassetid://149397702"},["Purple Clouds"]={SkyboxBk="rbxassetid://151165214",SkyboxDn="rbxassetid://151165197",SkyboxFt="rbxassetid://151165224",SkyboxLf="rbxassetid://151165191",SkyboxRt="rbxassetid://151165206",SkyboxUp="rbxassetid://151165227"},["Purple Galaxy"]={SkyboxBk="http://www.roblox.com/Asset/?ID=14543264135",SkyboxDn="http://www.roblox.com/asset/?ID=14543358958",SkyboxFt="http://www.roblox.com/asset/?ID=14543257810",SkyboxLf="http://www.roblox.com/asset/?ID=14543275895",SkyboxRt="http://www.roblox.com/asset/?ID=14543280890",SkyboxUp="http://www.roblox.com/asset/?ID=14543371676"},["Purple Nebula"]={SkyboxBk="rbxassetid://159454299",SkyboxDn="rbxassetid://159454296",SkyboxFt="rbxassetid://159454293",SkyboxLf="rbxassetid://159454286",SkyboxRt="rbxassetid://159454300",SkyboxUp="rbxassetid://159454288"},["Red Night Sky"]={SkyboxBk="http://www.roblox.com/Asset/?ID=401664839",SkyboxDn="http://www.roblox.com/asset/?ID=401664862",SkyboxFt="http://www.roblox.com/asset/?ID=401664960",SkyboxLf="http://www.roblox.com/asset/?ID=401664881",SkyboxRt="http://www.roblox.com/asset/?ID=401664901",SkyboxUp="http://www.roblox.com/asset/?ID=401664936"},["Redshift"]={SkyboxBk="rbxassetid://401664839",SkyboxDn="rbxassetid://401664862",SkyboxFt="rbxassetid://401664960",SkyboxLf="rbxassetid://401664881",SkyboxRt="rbxassetid://401664901",SkyboxUp="rbxassetid://401664936"},["Setting Sun"]={SkyboxBk="rbxassetid://626460377",SkyboxDn="rbxassetid://626460216",SkyboxFt="rbxassetid://626460513",SkyboxLf="rbxassetid://626473032",SkyboxRt="rbxassetid://626458639",SkyboxUp="rbxassetid://626460625"},["Twighlight"]={SkyboxBk="rbxassetid://264908339",SkyboxDn="rbxassetid://264907909",SkyboxFt="rbxassetid://264909420",SkyboxLf="rbxassetid://264909758",SkyboxRt="rbxassetid://264908886",SkyboxUp="rbxassetid://264907379"},["Vaporwave"]={SkyboxBk="rbxassetid://1417494030",SkyboxDn="rbxassetid://1417494146",SkyboxFt="rbxassetid://1417494253",SkyboxLf="rbxassetid://1417494402",SkyboxRt="rbxassetid://1417494499",SkyboxUp="rbxassetid://1417494643"},["Vivid Skies"]={SkyboxBk="rbxassetid://271042516",SkyboxDn="rbxassetid://271077243",SkyboxFt="rbxassetid://271042556",SkyboxLf="rbxassetid://271042310",SkyboxRt="rbxassetid://271042467",SkyboxUp="rbxassetid://271077958"},}
          local function _Dj(_Dk)
            local _Dl=_Di[_Dk]or _Di["Cloudy Skies"]
            if not _Dl then return
            end _Dh.name=_Dk
            if not _Dh.enabled then return
            end
            local _Dm=game:GetService("Lighting")
            local _Dn=_Dm:FindFirstChildOfClass("Sky")
            if _Dn and _Dn.Name~="SHIZUKUSCRIPTS_Skybox"and not _Dh.original then _Dh.original=_Dn:Clone()
            end
            if _Dn then _Dn:Destroy()
            end
            local _Do=Instance.new("Sky")_Do.Name="SHIZUKUSCRIPTS_Skybox"_Do.SkyboxBk=_Dl.SkyboxBk _Do.SkyboxDn=_Dl.SkyboxDn _Do.SkyboxFt=_Dl.SkyboxFt _Do.SkyboxLf=_Dl.SkyboxLf _Do.SkyboxRt=_Dl.SkyboxRt _Do.SkyboxUp=_Dl.SkyboxUp _Do.Parent=_Dm
          end
          local function _Dp()
            local _Dq=game:GetService("Lighting")
            local _Dr=_Dq:FindFirstChild("SHIZUKUSCRIPTS_Skybox")
            if _Dr then _Dr:Destroy()
            end
            if _Dh.original then _Dh.original:Clone().Parent=_Dq
            end
          end _Dg:Toggle({title="skybox",default=false,risky=false,callback=function(_Ds)_Dh.enabled=_Ds
            if _Ds then _Dj(_Dh.name)
            else _Dp()
            end
          end,})_Dg:Dropdown({title="skybox style",values={"Cloudy Skies","Elegant Morning","Fade Blue","Neptune","Night Sky","Purple And Blue","Purple Clouds","Purple Galaxy","Purple Nebula","Red Night Sky","Redshift","Setting Sun","Twighlight","Vaporwave","Vivid Skies"},default="Cloudy Skies",multi=false,callback=function(_Dt)
            if _Di[_Dt]then _Dh.name=_Dt
              if _Dh.enabled then _Dj(_Dt)
              end
            end
          end,})do local _Du=cloneref(game:GetService("Players"))_B.v86=cloneref(game:GetService("RunService"))_Df=cloneref(game:GetService("HttpService"))_B.v87=cloneref(game:GetService("Workspace"))_B.currentCamera=workspace.CurrentCamera _B.localPlayer2=_Du.LocalPlayer
          end
        end _B.floor2=math.floor _B.max=math.max _B.huge=math.huge _B.clamp=math.clamp _B.sqrt=math.sqrt _B.tan=math.tan _C.rad=math.rad _C.udim22=UDim2.new _C.color2=Color3.new _C.color3=Color3.fromRGB _C.new2=Instance.new _C.vector22=Vector2.new do local _Dv=CFrame.new _C.v88=tostring _C.v89=_C.color2(1,1,1)_C.v90=_C.color2(0,0,0)_C.n32=0 _D.n33=0 _D.n34=0 _D.n35=0 _D.n36=0 _D.n37=0 _D.v91=0 _D.n38=0 _D.n39=0 _D.n40=0 _D.n41=0 _E.v92=0 _E.n42=0 _E.v93=0 _E.n43=0 _E.n44=0 _E.n45=1 _E.v94=0 _E.v95=0 _E.rect=Rect.new(_C.vector22(21,21),_C.vector22(79,79))_Dv()
        end _E.font2=Font.new("rbxasset://fonts/families/RobotoMono.json")_F=Font.new("rbxasset://fonts/families/RobotoMono.json")pcall(function()
          local function _Dw(_Dx,_Dy,_Dz,_DA,_DB)
            if isfile(_DA)then delfile(_DA)
            end writefile(_DA,_DB)task.wait(0.1)
            local _DC=_Dx..".font"
            if isfile(_DC)then delfile(_DC)
            end writefile(_DC,_Df:JSONEncode({name=_Dx,faces={{name="Regular",weight=_Dy,style=_Dz,assetId=getcustomasset(_DA)}},}))task.wait(0.1)
            return getcustomasset(_DC)
          end
          local _DD=game:HttpGet("https://gist.githubusercontent.com/index987745/cbe1120f297fc9e7a31568f290a36c30/raw/6dbbb378feffbebb2af51cc8b0125b837f590f7a/SmallestPixel.tff")_E.font2=Font.new(_Dw("SmallestPixel.ttf",100,"normal","SmallestPixelAsset.ttf",crypt.base64.decode(_DD)))
          local _DE=game:HttpGet("https://github.com/f1nobe7650/Nebula/raw/refs/heads/main/fs-tahoma-8px.ttf")_F=Font.new(_Dw("Tahoma.ttf",400,"normal","TahomaAsset.ttf",_DE))
        end)
      end do do do local _DF,_DG,_DH do local _DI do _B.v87:WaitForChild("Characters",10)do local _DJ={"Head","UpperTorso","LowerTorso","LeftUpperArm","LeftLowerArm","LeftHand","RightUpperArm","RightLowerArm","RightHand","LeftUpperLeg","LeftLowerLeg","LeftFoot","RightUpperLeg","RightLowerLeg","RightFoot",}
                  local _DK={"Head","Torso","Left Arm","Right Arm","Left Leg","Right Leg",}
                  local _DL={Head=0.05,LeftHand=0.02,RightHand=0.02,LeftFoot=0.03,RightFoot=0.03,}
                  local _DM={Head=0.05,Torso=0,["Left Arm"]=0,["Right Arm"]=0,["Left Leg"]=0.04,["Right Leg"]=0.04,}
                  local _DN={Head=true,LeftHand=true,RightHand=true,LeftFoot=true,RightFoot=true,["Left Arm"]=true,["Right Arm"]=true,Torso=true,["Left Leg"]=true,["Right Leg"]=true,}_DI=function(_DO)
                    local _DP=0
                    local _DQ={Filter=_DO,TeamCheck=true,Enabled=true,Font="Tahoma",FontSize=12,FontType="normal",MaxDistance=500,RefreshRate=144,Highlight={Enabled=false,FillColor=_C.color3(216,126,157),OutlineColor=_C.color3(0,0,0),FillTransparency=0.5,OutlineTransparency=0.5,DepthMode=Enum.HighlightDepthMode.AlwaysOnTop,},Box={Enabled=true,Rotation=90,Color={_C.color3(216,126,157),_C.color3(255,255,255)},Transparency={0,0},Glow={Enabled=false,Rotation=90,Color={_C.color3(216,126,157),_C.color3(216,126,_DP)},Transparency={0.75,0.75},},Fill={Enabled=false,Rotation=90,Color={_C.color3(216,126,157),_C.color3(216,126,157)},Transparency={0,0},},},}
                    local _DR={}
                    local _DS={Enabled=false,Position="Left"}
                    local _DT={}
                    local _DU=_C.color3(131,245,78)
                    local _DV=_C.color3(255,255,0)_DT[1]=_DU _DT[2]=_DV do local _DW=table.pack(_C.color3(252,71,77))table.move(_DW,1,_DW.n,3,_DT)
                    end _DS.Color=_DT _DS.Text={Enabled=false,FollowBar=true,Ending="HP",Position="Left",Color=_C.color3(255,255,255),Transparency=0,}_DR.HealthBar=_DS _DQ.Bars=_DR _DQ.Name={Enabled=true,UseDisplay=true,Position="Bottom",Color=_C.color3(255,255,255),Transparency=0,}_DQ.Distance={Enabled=false,Ending="m>",Position="Bottom",Color=_C.color3(255,255,255),Transparency=0,FollowBar=false,}
                    return _DQ
                  end _DF=function(_DX)
                    local _DY=_DX.Bars.HealthBar.Color[3].R
                    local _DZ=_DX.Bars.HealthBar.Color[3].G
                    local _Ea=_DX.Bars.HealthBar.Color[3].B
                    local function _Eb()
                      if not _DX then return _F
                      end
                      return _DX.Font=="Tahoma"and _F or _E.font2
                    end
                    local function _Ec()
                      if not _DX then return 12
                      end
                      return _DX.FontSize or 12
                    end
                    local function _Ed(_Ee)
                      if not _DX then return _Ee
                      end
                      if _DX.FontType=="uppercase"then return string.upper(_Ee)
                      end
                      if _DX.FontType=="lowercase"then return string.lower(_Ee)
                      end
                      return _Ee
                    end
                    local _Ef=ColorSequenceKeypoint.new
                    local _Eg=1
                    local _Eh=_DX.Box.Color[2]
                    local _Ei=ColorSequence.new({ColorSequenceKeypoint.new(0,_DX.Box.Color[1]),_Ef(_Eg,_Eh)})
                    local _Ej=ColorSequenceKeypoint.new
                    local _Ek=_DX.Box.Fill.Color[2]
                    local _El=ColorSequence.new({ColorSequenceKeypoint.new(0,_DX.Box.Fill.Color[1]),_Ej(1,_Ek)})
                    local _Em=ColorSequence.new
                    local _En={}
                    local _Eo=ColorSequenceKeypoint.new(0,_DX.Bars.HealthBar.Color[1])
                    local _Ep=ColorSequenceKeypoint.new(0.5,_DX.Bars.HealthBar.Color[2])
                    local _Eq=ColorSequenceKeypoint.new
                    local _Er=_DX.Bars.HealthBar.Color[3]_En[1]=_Eo _En[2]=_Ep do local _Es=table.pack(_Eq(1,_Er))table.move(_Es,1,_Es.n,3,_En)
                    end
                    local _Et=_Em(_En)
                    local _Eu=NumberSequence.new
                    local _Ev={}
                    local _Ew=NumberSequenceKeypoint.new(0,0)
                    local _Ex=NumberSequenceKeypoint.new(0.5,_DX.Box.Glow.Transparency[1])
                    local _Ey=NumberSequenceKeypoint.new _Ev[1]=_Ew _Ev[2]=_Ex do local _Ez=table.pack(_Ey(1,1))table.move(_Ez,1,_Ez.n,3,_Ev)
                    end
                    local _EA=_Eu(_Ev)
                    local _EB=NumberSequence.new
                    local _EC={}
                    local _ED=NumberSequenceKeypoint.new(0,1)
                    local _EE=NumberSequenceKeypoint.new(0.5,_DX.Box.Glow.Transparency[2])
                    local _EF=NumberSequenceKeypoint.new _EC[1]=_ED _EC[2]=_EE do local _EG=table.pack(_EF(1,0))table.move(_EG,1,_EG.n,3,_EC)
                    end
                    local _EH=_EB(_EC)
                    local _EI={Cache={},List={},Connections={},Object={},ForceUpdate=false}getgenv().AetherEsp=_EI _EI.ScreenGui=_C.new2("ScreenGui")_EI.ScreenGui.Name="AetherEsp_"..(_DX.Filter=="enemy"and "Enemies"or "Team")_EI.ScreenGui.ResetOnSpawn=false _EI.ScreenGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling _EI.ScreenGui.IgnoreGuiInset=true _EI.ScreenGui.Parent=gethui()
                    local function _EJ(_EK,_EL)
                      local _EM=_C.new2(_EK)
                      for _EN,_EO in pairs(_EL)do _EM[_EN]=_EO
                      end
                      return _EM
                    end _EI.Object.StrokeSolid=function(_EP,_EQ,_ER)
                      local _ES=_EJ("Frame",{BackgroundTransparency=1,BorderSizePixel=0,ZIndex=_ER,Visible=false,Size=_C.udim22(0,0,0,0),Parent=_EP,})_EJ("UIStroke",{Color=_EQ,Thickness=1,LineJoinMode=Enum.LineJoinMode.Miter,ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Transparency=0,Parent=_ES,})
                      return _ES
                    end _EI.Object.StrokeGradient=function(_ET,_EU)
                      local _EV=_EJ("Frame",{BackgroundTransparency=1,BorderSizePixel=0,ZIndex=_EU,Visible=false,Size=_C.udim22(0,0,0,0),Parent=_ET,})_EJ("UIGradient",{Color=_Ei,Rotation=_DX.Box.Rotation,Parent=_EJ("UIStroke",{Color=_C.color2(1,1,1),Thickness=1,LineJoinMode=Enum.LineJoinMode.Miter,ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Parent=_EV,}),})
                      return _EV
                    end _EI.Object.InnerCover=function(_EW,_EX)
                      return _EJ("Frame",{BackgroundColor3=_C.v90,BackgroundTransparency=1,BorderSizePixel=0,ZIndex=_EX,Visible=false,Size=_C.udim22(0,0,0,0),Parent=_EW,})
                    end _EI.Object.Frame=function(_EY,_EZ,_Fa)
                      return _EJ("Frame",{BackgroundColor3=_EZ,BackgroundTransparency=0,BorderSizePixel=0,ZIndex=_Fa,Visible=false,Size=_C.udim22(0,0,0,0),Parent=_EY,})
                    end _EI.Object.Label=function(_Fb,_Fc,_Fd,_Fe)
                      local _Ff=_EJ("TextLabel",{BackgroundTransparency=1,BorderSizePixel=0,ClipsDescendants=false,ZIndex=_Fc,Visible=false,Size=_C.udim22(0,300,0,_Fe+5),AnchorPoint=_C.vector22(0.5,0),Position=_C.udim22(0,-9999,0,-9999),FontFace=_Eb(),TextSize=_Fe,TextColor3=_Fd,TextStrokeTransparency=1,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Top,TextTruncate=Enum.TextTruncate.None,TextScaled=false,RichText=false,Text="",Parent=_Fb,})_EJ("UIStroke",{Color=_C.v90,Thickness=1,LineJoinMode=Enum.LineJoinMode.Miter,ApplyStrokeMode=Enum.ApplyStrokeMode.Contextual,Transparency=0,Parent=_Ff,})
                      return _Ff
                    end _EI.Object.Fill=function(_Fg,_Fh)
                      local _Fi=_EJ("Frame",{BackgroundColor3=_C.v89,BackgroundTransparency=0,BorderSizePixel=0,ZIndex=_Fh,Visible=false,Size=_C.udim22(0,0,0,0),AnchorPoint=_C.vector22(0,0),Parent=_Fg,})
                      local _Fj=NumberSequenceKeypoint.new
                      local _Fk=1
                      local _Fl=_DX.Box.Fill.Transparency[1]_EJ("UIGradient",{Color=_El,Rotation=_DX.Box.Fill.Rotation,Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,1),_Fj(_Fk,_Fl)}),Parent=_Fi,})
                      return _Fi
                    end _EI.Object.Glow=function(_Fm,_Fn,_Fo)
                      local _Fp=_EJ("ImageLabel",{Image="rbxassetid://18245826428",ImageColor3=_Fn,ImageTransparency=_DX.Box.Glow.Transparency[1],ScaleType=Enum.ScaleType.Slice,SliceCenter=_E.rect,BackgroundTransparency=1,BorderSizePixel=0,ZIndex=2,Visible=false,Size=_C.udim22(0,0,0,0),Parent=_Fm,})_EJ("UIGradient",{Transparency=_Fo,Rotation=_DX.Box.Glow.Rotation,Parent=_Fp})
                      return _Fp
                    end _EI.Object.BarFill=function(_Fq)
                      local _Fr=_EJ("Frame",{BackgroundColor3=_C.v89,BackgroundTransparency=0,BorderSizePixel=0,ZIndex=11,Visible=false,Size=_C.udim22(0,0,0,0),Parent=_Fq,})_EJ("UIGradient",{Color=_Et,Rotation=270,Parent=_Fr})
                      return _Fr
                    end _EI.Object.Highlight=function(_Fs)
                      if not _Fs or not _Fs.Parent then return nil
                      end
                      local _Ft=_C.new2("Highlight")
                      if not(_y.n24<9059)then _Ft.FillColor=_DX.Highlight.FillColor _Ft.OutlineColor=_DX.Highlight.OutlineColor _Ft.FillTransparency=_DX.Highlight.FillTransparency _Ft.OutlineTransparency=_DX.Highlight.OutlineTransparency _Ft.DepthMode=_DX.Highlight.DepthMode _Ft.Adornee=_Fs _Ft.Parent=_EI.ScreenGui
                        return _Ft
                      end
                      while true do end
                    end _EI.UpdateBoxGradient=function()
                      local _Fu=ColorSequenceKeypoint.new
                      local _Fv=_DX.Box.Color[2]_Ei=ColorSequence.new({ColorSequenceKeypoint.new(0,_DX.Box.Color[1]),_Fu(1,_Fv)})
                      for _Fw,_Fx in ipairs(_EI.List)do if _Fx.BorderStroke then local _Fy=_Fx.BorderStroke:FindFirstChildOfClass("UIStroke")
                          if _Fy then local _Fz=_Fy:FindFirstChildOfClass("UIGradient")
                            if _Fz then pcall(function()_Fz.Color=_Ei
                              end)
                            end
                          end
                        end
                      end
                    end _EI.UpdateBoxRotation=function()
                      for _FA,_FB in ipairs(_EI.List)do if _FB.BorderStroke then local _FC=_FB.BorderStroke:FindFirstChildOfClass("UIStroke")
                          if _FC then local _FD=_FC:FindFirstChildOfClass("UIGradient")
                            if _FD then pcall(function()_FD.Rotation=_DX.Box.Rotation
                              end)
                            end
                          end
                        end
                        if _FB.GlowTop then local _FE=_FB.GlowTop:FindFirstChildOfClass("UIGradient")
                          if _FE then pcall(function()_FE.Rotation=_DX.Box.Glow.Rotation
                            end)
                          end
                        end
                        if _FB.GlowBot then local _FF=_FB.GlowBot:FindFirstChildOfClass("UIGradient")
                          if _FF then pcall(function()_FF.Rotation=_DX.Box.Glow.Rotation
                            end)
                          end
                        end
                      end
                    end _EI.UpdateFillGradient=function()
                      local _FG=ColorSequenceKeypoint.new
                      local _FH=_DX.Box.Fill.Color[2]_El=ColorSequence.new({ColorSequenceKeypoint.new(0,_DX.Box.Fill.Color[1]),_FG(1,_FH)})
                      for _FI,_FJ in ipairs(_EI.List)do if _FJ.BoxFill then local _FK=_FJ.BoxFill:FindFirstChildOfClass("UIGradient")
                          if _FK then pcall(function()_FK.Color=_El _FK.Rotation=_DX.Box.Fill.Rotation
                              local _FL=NumberSequenceKeypoint.new
                              local _FM=_DX.Box.Fill.Transparency[1]_FK.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,1),_FL(1,_FM)})
                            end)
                          end
                        end
                      end
                    end _EI.UpdateHpGradient=function()
                      local _FN=ColorSequence.new
                      local _FO={}
                      local _FP=ColorSequenceKeypoint.new(0,_DX.Bars.HealthBar.Color[1])
                      local _FQ=ColorSequenceKeypoint.new(0.5,_DX.Bars.HealthBar.Color[2])
                      local _FR=ColorSequenceKeypoint.new
                      local _FS=_DX.Bars.HealthBar.Color[4]_FO[1]=_FP _FO[2]=_FQ do local _FT=table.pack(_FR(1,_FS))table.move(_FT,1,_FT.n,3,_FO)
                      end _Et=_FN(_FO)
                      for _FU,_FV in ipairs(_EI.List)do if _FV.BarFill then local _FW=_FV.BarFill:FindFirstChildOfClass("UIGradient")
                          if _FW then pcall(function()_FW.Color=_Et
                            end)
                          end
                        end
                      end
                    end _EI.UpdateHighlights=function()
                      for _FX,_FY in ipairs(_EI.List)do if _FY.Highlight then pcall(function()_FY.Highlight.FillColor=_DX.Highlight.FillColor _FY.Highlight.OutlineColor=_DX.Highlight.OutlineColor _FY.Highlight.FillTransparency=_DX.Highlight.FillTransparency _FY.Highlight.OutlineTransparency=_DX.Highlight.OutlineTransparency _FY.Highlight.DepthMode=_DX.Highlight.DepthMode
                          end)
                        end
                      end
                    end _EI.UpdateHighlightVisibility=function()
                      for _FZ,_Ga in ipairs(_EI.List)do if _DX.Highlight.Enabled then if not _Ga.Highlight or not _Ga.Highlight.Parent then if _Ga.Character and _Ga.Character.Parent then _Ga.Highlight=_EI.Object.Highlight(_Ga.Character)
                            end
                          end
                          if _Ga.Highlight then pcall(function()_Ga.Highlight.Enabled=true
                            end)
                          end
                        elseif _Ga.Highlight then pcall(function()_Ga.Highlight.Enabled=false
                          end)
                        end
                      end
                    end _EI.UpdateLabelColor=function(_Gb,_Gc)
                      for _Gd,_Ge in ipairs(_EI.List)do local _Gf=_Ge[_Gb]
                        if _Gf then pcall(function()_Gf.TextColor3=_Gc
                          end)
                        end
                      end
                    end _EI.UpdateLabelTransparency=function(_Gg,_Gh)
                      for _Gi,_Gj in ipairs(_EI.List)do local _Gk=_Gj[_Gg]
                        if _Gk then pcall(function()_Gk.TextTransparency=_Gh
                            local _Gl=_Gk:FindFirstChildOfClass("UIStroke")
                            if _Gl then _Gl.Transparency=_Gh
                            end
                          end)
                        end
                      end
                    end _EI.UpdateFonts=function()
                      local _Gm=_Eb()
                      local _Gn=_Ec()
                      for _Go,_Gp in ipairs(_EI.List)do for _Gq,_Gr in ipairs({"LabelHp","LabelName","LabelDist"})do local _Gs=_Gp[_Gr]
                          if _Gs then pcall(function()_Gs.FontFace=_Gm _Gs.TextSize=_Gn _Gs.Size=_C.udim22(0,300,0,_Gn+4)
                            end)
                          end
                        end
                      end
                    end _EI.InvalidateTextCaches=function()
                      for _Gt,_Gu in ipairs(_EI.List)do _Gu.PrevNameStr=""_Gu.PrevDistStr=""_Gu.PrevHpStr=""
                      end
                    end _EI.HideBoxes=function()
                      for _Gv,_Gw in ipairs(_EI.List)do _Gw.OuterStroke.Visible=false _Gw.BorderStroke.Visible=false _Gw.InnerCover.Visible=false _Gw.InnerStroke.Visible=false _Gw.BoxFill.Visible=false _Gw.GlowTop.Visible=false _Gw.GlowBot.Visible=false
                      end
                    end _EI.HideNames=function()
                      for _Gx,_Gy in ipairs(_EI.List)do _Gy.LabelName.Visible=false
                      end
                    end _EI.HideHealthbars=function()
                      for _Gz,_GA in ipairs(_EI.List)do _GA.BarOutline.Visible=false _GA.BarBackground.Visible=false _GA.BarFill.Visible=false _GA.LabelHp.Visible=false
                      end
                    end _EI.HideDistances=function()
                      for _GB,_GC in ipairs(_EI.List)do _GC.LabelDist.Visible=false
                      end
                    end _EI.HideHighlights=function()
                      for _GD,_GE in ipairs(_EI.List)do if _GE.Highlight then pcall(function()_GE.Highlight.Enabled=false
                          end)
                        end
                      end
                    end _EI.HideFills=function()
                      for _GF,_GG in ipairs(_EI.List)do _GG.BoxFill.Visible=false
                      end
                    end _EI.UpdateBorderTransparency=function()
                      for _GH,_GI in ipairs(_EI.List)do if _GI.BorderStroke then local _GJ=_GI.BorderStroke:FindFirstChildOfClass("UIStroke")
                          if _GJ then pcall(function()_GJ.Transparency=_DX.Box.Transparency[1]
                            end)
                          end
                        end
                        if _GI.OuterStroke then local _GK=_GI.OuterStroke:FindFirstChildOfClass("UIStroke")
                          if _GK then pcall(function()_GK.Transparency=_DX.Box.Transparency[1]
                            end)
                          end
                        end
                        if _GI.InnerStroke then local _GL=_GI.InnerStroke:FindFirstChildOfClass("UIStroke")
                          if _GL then pcall(function()_GL.Transparency=_DX.Box.Transparency[2]
                            end)
                          end
                        end
                      end
                    end _EI.UpdateGlowTransparency=function()
                      for _GM,_GN in ipairs(_EI.List)do if _GN.GlowTop then pcall(function()_GN.GlowTop.ImageTransparency=_DX.Box.Glow.Transparency[1]
                          end)
                        end
                        if _GN.GlowBot then pcall(function()_GN.GlowBot.ImageTransparency=_DX.Box.Glow.Transparency[2]
                          end)
                        end
                      end
                    end _EI.UpdateGlowColors=function()
                      for _GO,_GP in ipairs(_EI.List)do if _GP.GlowTop then pcall(function()_GP.GlowTop.ImageColor3=_DX.Box.Glow.Color[1]
                          end)
                        end
                        if _GP.GlowBot then pcall(function()_GP.GlowBot.ImageColor3=_DX.Box.Glow.Color[2]
                          end)
                        end
                      end
                    end _EI.UpdateBarTransparency=function()
                      for _GQ,_GR in ipairs(_EI.List)do if _GR.BarFill then pcall(function()_GR.BarFill.BackgroundTransparency=_DX.Bars.HealthBar.Transparency or 0
                          end)
                        end
                      end
                    end _EI.ExpandScreenBounds=function(_GS,_GT,_GU)
                      if _GS<=0 then return
                      end
                      local _GV=_E.n45/_GS
                      local _GW=_E.v94+_GT*_GV
                      local _GX=_E.v95-_GU*_GV
                      if _GW<_C.n32 then _C.n32=_GW
                      end
                      if _D.n34<_GW then _D.n34=_GW
                      end
                      if _GX<_D.n33 then _D.n33=_GX
                      end
                      if _D.n35<_GX then _D.n35=_GX
                      end
                    end _EI.ProjectObb=function(_GY,_GZ,_Ha,_Hb,_Hc,_Hd,_He,_Hf,_Hg,_Hh,_Hi,_Hj,_Hk,_Hl,_Hm)
                      local _Hn=_Hb*_Hk
                      local _Ho=_Hc*_Hk
                      local _Hp=_Hd*_Hk
                      local _Hq=_He*_Hl
                      local _Hr=_Hf*_Hl
                      local _Hs=_Hg*_Hl
                      local _Ht=_Hh*_Hm
                      local _Hu=_Hi*_Hm
                      local _Hv=_Hj*_Hm
                      local _Hw=_GY-_E.v93
                      local _Hx=_GZ-_E.n43
                      local _Hy=_Ha-_E.n44
                      local _Hz=_D.n41*_Hw+_E.v92*_Hx+_E.n42*_Hy
                      local _HA=_D.n36*_Hw+_D.n37*_Hx+_D.v91*_Hy
                      local _HB=_D.n38*_Hw+_D.n39*_Hx+_D.n40*_Hy
                      local _HC=_D.n41*_Hn+_E.v92*_Ho+_E.n42*_Hp
                      local _HD=_D.n36*_Hn+_D.n37*_Ho+_D.v91*_Hp
                      local _HE=_D.n38*_Hn+_D.n39*_Ho+_D.n40*_Hp
                      local _HF=_D.n41*_Hq+_E.v92*_Hr+_E.n42*_Hs
                      local _HG=_D.n36*_Hq+_D.n37*_Hr+_D.v91*_Hs
                      local _HH=_D.n38*_Hq+_D.n39*_Hr+_D.n40*_Hs
                      local _HI=_D.n41*_Ht+_E.v92*_Hu+_E.n42*_Hv
                      local _HJ=_D.n36*_Ht+_D.n37*_Hu+_D.v91*_Hv
                      local _HK=_D.n38*_Ht+_D.n39*_Hu+_D.n40*_Hv _EI.ExpandScreenBounds(_Hz+_HC+_HF+_HI,_HA+_HD+_HG+_HJ,_HB+_HE+_HH+_HK)_EI.ExpandScreenBounds(_Hz+_HC+_HF-_HI,_HA+_HD+_HG-_HJ,_HB+_HE+_HH-_HK)_EI.ExpandScreenBounds(_Hz+_HC-_HF+_HI,_HA+_HD-_HG+_HJ,_HB+_HE-_HH+_HK)_EI.ExpandScreenBounds(_Hz+_HC-_HF-_HI,_HA+_HD-_HG-_HJ,_HB+_HE-_HH-_HK)_EI.ExpandScreenBounds(_Hz-_HC+_HF+_HI,_HA-_HD+_HG+_HJ,_HB-_HE+_HH+_HK)_EI.ExpandScreenBounds(_Hz-_HC+_HF-_HI,_HA-_HD+_HG-_HJ,_HB-_HE+_HH-_HK)_EI.ExpandScreenBounds(_Hz-_HC-_HF+_HI,_HA-_HD-_HG+_HJ,_HB-_HE-_HH+_HK)_EI.ExpandScreenBounds(_Hz-_HC-_HF-_HI,_HA-_HD-_HG-_HJ,_HB-_HE-_HH-_HK)
                    end _EI.EntryNew=function(_HL)
                      local _HM=_C.new2("Frame")_HM.Name=_C.v88(_HL).."_esp"_HM.BackgroundTransparency=1 _HM.BorderSizePixel=0 _HM.Size=_C.udim22(1,0,1,0)_HM.ZIndex=1 _HM.Parent=_EI.ScreenGui
                      local _HN=_Ec()
                      return{Player=_HL,PlayerName=_HL.Name,Container=_HM,OuterStroke=_EI.Object.StrokeSolid(_HM,_C.v90,4),BorderStroke=_EI.Object.StrokeGradient(_HM,5),InnerCover=_EI.Object.InnerCover(_HM,6),InnerStroke=_EI.Object.StrokeSolid(_HM,_C.v90,5),BoxFill=_EI.Object.Fill(_HM,8),BarOutline=_EI.Object.Frame(_HM,_C.v90,12),BarBackground=_EI.Object.Frame(_HM,_C.color3(5,10,25),10),BarFill=_EI.Object.BarFill(_HM),GlowTop=_EI.Object.Glow(_HM,_DX.Box.Glow.Color[1],_EA),GlowBot=_EI.Object.Glow(_HM,_DX.Box.Glow.Color[2],_EH),LabelHp=_EI.Object.Label(_HM,12,_DX.Bars.HealthBar.Text.Color,_HN),LabelName=_EI.Object.Label(_HM,12,_DX.Name.Color,_HN),LabelDist=_EI.Object.Label(_HM,12,_DX.Distance.Color,_HN),Highlight=nil,Character=nil,RootPart=nil,Humanoid=nil,IsDead=false,IsR6=false,Health=1,MaxHealth=100,TopOffset=4,BotOffset=4,Parts={},PartHalfW={},PartHalfH={},PartHalfD={},PartCount=0,IsVisible=false,BoxX=0,BoxY=0,BoxW=0,BoxH=0,PrevBoxX=-1,PrevBoxY=-1,PrevBoxW=-1,PrevBoxH=-1,PrevFillH=-1,PrevHpStr="",PrevNameStr="",PrevDistStr="",PrevHpLabelX=-1,PrevHpLabelY=-1,PrevNmLabelX=-1,PrevNmLabelY=-1,PrevDtLabelX=-1,PrevDtLabelY=-1,PrevDistance=-1,BarX=0,BarY=0,BarH=0,BarLabelX=0,BarLabelY=0,HpString="100",PlayerConnections={},CharacterConnections={},ModelConnection=nil,}
                    end _EI.EntryHide=function(_HO)_HO.OuterStroke.Visible=false _HO.BorderStroke.Visible=false _HO.InnerCover.Visible=false _HO.InnerStroke.Visible=false _HO.BoxFill.Visible=false _HO.BarOutline.Visible=false _HO.BarBackground.Visible=false _HO.BarFill.Visible=false _HO.GlowTop.Visible=false _HO.GlowBot.Visible=false _HO.LabelHp.Visible=false _HO.LabelName.Visible=false _HO.LabelDist.Visible=false _HO.IsVisible=false
                      if _HO.Highlight then pcall(function()_HO.Highlight.Enabled=false
                        end)
                      end _HO.PrevBoxX=-1 _HO.PrevBoxY=-1 _HO.PrevBoxW=-1 _HO.PrevBoxH=-1 _HO.PrevFillH=-1 _HO.PrevHpStr=""_HO.PrevNameStr=""_HO.PrevDistStr=""_HO.PrevHpLabelX=-1 _HO.PrevHpLabelY=-1 _HO.PrevNmLabelX=-1 _HO.PrevNmLabelY=-1 _HO.PrevDtLabelX=-1 _HO.PrevDtLabelY=-1 _HO.PrevDistance=-1
                    end _EI.EntryDestroy=function(_HP)_EI.EntryHide(_HP)
                      for _HQ,_HR in ipairs(_HP.PlayerConnections)do pcall(_HR.Disconnect,_HR)
                      end
                      if _y.n24>9091 then while true do end
                      end
                      for _HS,_HT in ipairs(_HP.CharacterConnections)do pcall(_HT.Disconnect,_HT)
                      end
                      if _HP.Highlight then pcall(_HP.Highlight.Destroy,_HP.Highlight)
                      end
                      if _HP.ModelConnection then pcall(_HP.ModelConnection.Disconnect,_HP.ModelConnection)_HP.ModelConnection=nil
                      end pcall(_HP.Container.Destroy,_HP.Container)
                    end _EI.EntryBuild=function(_HU)
                      local _HV=_HU.Character
                      if not _HV then return
                      end
                      local _HW=_HU.IsR6 and _DK or _DJ
                      local _HX=_HU.IsR6 and _DM or _DL
                      local _HY=_HU.RootPart.Position.Y
                      local _HZ=-_B.huge
                      local _Ia={}
                      local _Ib={}
                      local _Ic={}
                      local _Id={}
                      local _Ie=_B.huge
                      local _If=0
                      for _Ig=1,#_HW do local _Ih=_HV:FindFirstChild(_HW[_Ig])
                        if not(not _Ih or not _Ih:IsA("BasePart"))then local _Ii=_HX[_HW[_Ig]]or 0.04
                          local _Ij=_Ih.Size
                          local _Ik=_Ij.X*0.5+_Ii
                          local _Il=_Ij.Y*0.5
                          local _Im=_Ij.Z*0.5+_Ii
                          local _In=_Ih.Position.Y-_HY
                          if _HZ<_In+_Il then _HZ=_In+_Il
                          end
                          if _In-_Il<_Ie then _Ie=_In-_Il
                          end _If+=1 _Ia[_If]=_Ih _Ib[_If]=_Ik _Ic[_If]=_Il _Id[_If]=_Im
                        end
                      end _HU.TopOffset=_HZ==-_B.huge and 3 or _HZ+0.08 _HU.BotOffset=_Ie==_B.huge and 4 or-_Ie+0.08 _HU.Parts=_Ia _HU.PartHalfW=_Ib _HU.PartHalfH=_Ic _HU.PartHalfD=_Id _HU.PartCount=_If
                    end _EI.EntryClear=function(_Io)
                      for _Ip,_Iq in ipairs(_Io.CharacterConnections)do pcall(_Iq.Disconnect,_Iq)
                      end _Io.CharacterConnections={}_Io.Character=nil _Io.RootPart=nil _Io.Humanoid=nil _Io.IsDead=false _Io.Parts={}_Io.PartHalfW={}_Io.PartHalfH={}_Io.PartHalfD={}_Io.PartCount=0 _Io.HpString="100"
                      if _Io.Highlight then pcall(_Io.Highlight.Destroy,_Io.Highlight)_Io.Highlight=nil
                      end
                    end
                    local function _Ir(_Is)
                      local _It=_Is:FindFirstChild("HumanoidRootPart")
                      if _It and _It:IsA("BasePart")then return _It
                      end
                      return _Is:FindFirstChild("HumanoidRootPart",true)
                    end
                    local function _Iu(_Iv)
                      local _Iw=_Iv:FindFirstChild("Humanoid")
                      if _Iw and _Iw:IsA("Humanoid")then return _Iw
                      end
                      local _Ix=_Iv:FindFirstChild("frog")
                      if _Ix and _Ix:IsA("Humanoid")then return _Ix
                      end
                      local _Iy=_Iv:FindFirstChildOfClass("Humanoid")
                      if _Iy then return _Iy
                      end
                      return _Iv:FindFirstChildWhichIsA("Humanoid",true)
                    end _EI.EntryLink=function(_Iz,_IA)_EI.EntryClear(_Iz)_EI.EntryHide(_Iz)
                      if not _IA then return
                      end
                      local _IB=_Ir(_IA)
                      local _IC=_Iu(_IA)
                      if not _IB then return
                      end
                      if not _IC then local function _ID()
                          return _IA:GetAttribute("Health")or _IB:GetAttribute("Health")
                        end
                        local function _IE()
                          if _y.n26(1994)<7655 then return _IA:GetAttribute("MaxHealth")or _IB:GetAttribute("MaxHealth")
                          end
                          while true do end
                        end
                        local _IF=_ID()or 100
                        local _IG=_IE()or math.max(1,_IF)
                        local function _IH()
                          local _II _II={_callbacks={},Connect=function(_IJ,_IK)_II._callbacks[#_II._callbacks+1]=_IK
                            return{Connected=true}
                          end,Fire=function(_IL,...)
                            for _IM,_IN in ipairs(_II._callbacks)do task.spawn(_IN,...)
                            end
                          end,}
                          return _II
                        end _IC={Health=_IF,MaxHealth=_IG,MoveDirection=Vector3.new(),Jump=false,HealthChanged=_IH(),Died=_IH(),StateChanged=_IH(),Running=_IH(),GetPropertyChangedSignal=function()
                          return{Connect=function()
                            return{Connected=true}
                          end}
                        end,}
                        local _IO=_IA:GetAttribute("Health")and _IA:GetAttributeChangedSignal("Health")or _IB:GetAttribute("Health")and _IB:GetAttributeChangedSignal("Health")
                        if _IO then _IO:Connect(function()
                            local _IP=_ID()
                            if _IP then _IC.Health=_IP _IC.HealthChanged:Fire(_IP)
                            end
                          end)
                        end
                      end
                      if not _IA:FindFirstChild("UpperTorso")and not _IA:FindFirstChild("Torso")then task.wait(0.5)
                      end _Iz.IsR6=_IA:FindFirstChild("Torso")~=nil _Iz.Character=_IA _Iz.RootPart=_IB _Iz.Humanoid=_IC _Iz.IsDead=false _Iz.MaxHealth=_IC.MaxHealth _Iz.Health=_B.clamp(_IC.Health/_IC.MaxHealth,0,1)_Iz.HpString=_C.v88(_B.floor2(_IC.Health))
                      local _IQ=_Iz.CharacterConnections _IQ[#_IQ+1]=_IC.HealthChanged:Connect(function(_IR)
                        if _y.n28(1955)>376 then _Iz.Health=_B.clamp(_IR/_Iz.MaxHealth,0,1)_Iz.HpString=_C.v88(_B.floor2(_IR))_Iz.PrevFillH=-1 _Iz.PrevHpStr=""
                          return
                        end
                        while true do end
                      end)_IQ[#_IQ+1]=_IC:GetPropertyChangedSignal("MaxHealth"):Connect(function()_Iz.MaxHealth=_IC.MaxHealth
                      end)_IQ[#_IQ+1]=_IC.Died:Connect(function()_Iz.IsDead=true
                        if _Iz.Highlight then pcall(function()_Iz.Highlight.Enabled=false
                          end)
                        end _EI.EntryHide(_Iz)task.delay(1,function()
                          if _Iz.Character and not _Iz.Character.Parent then local _IS=_Iz.Character
                            if _EI.Cache[_IS]then _EI.RemoveModel(_IS)
                            end
                          end
                        end)
                      end)_IQ[#_IQ+1]=_IA.DescendantAdded:Connect(function(_IT)
                        if not _IT:IsA("BasePart")or not _DN[_IT.Name]then return
                        end
                        local _IU=_IT.Parent
                        while _IU and _IU~=_IA do if _IU:IsA("Tool")then return
                          end _IU=_IU.Parent
                        end task.defer(_EI.EntryBuild,_Iz)
                      end)_IQ[#_IQ+1]=_IA.DescendantRemoving:Connect(function(_IV)
                        if _IV:IsA("BasePart")and _DN[_IV.Name]then task.defer(_EI.EntryBuild,_Iz)
                        end
                      end)_EI.EntryBuild(_Iz)
                      if _DX.Highlight.Enabled then task.defer(function()
                          if _Iz.Character and _Iz.Character.Parent then if _Iz.Highlight then pcall(_Iz.Highlight.Destroy,_Iz.Highlight)
                            end _Iz.Highlight=_EI.Object.Highlight(_Iz.Character)
                            if _Iz.Highlight then pcall(function()_Iz.Highlight.Enabled=true
                              end)
                            end
                          end
                        end)
                      end
                    end
                    local function _IW(_IX)_EI.LocalPlayerRoot=_IX and _IX:WaitForChild("HumanoidRootPart",5)or nil
                    end
                    local _IY=_B.localPlayer2.Character or getgenv().GetLocalCharacter and getgenv().GetLocalCharacter()
                    if _IY then task.spawn(_IW,_IY)
                    end _EI.Connections[#_EI.Connections+1]=_B.localPlayer2.CharacterAdded:Connect(_IW)_EI.Connections[#_EI.Connections+1]=_B.localPlayer2.CharacterRemoving:Connect(function()_EI.LocalPlayerRoot=nil
                    end)_EI.Connections[#_EI.Connections+1]=_B.v86.RenderStepped:Connect(function()
                      local _IZ=workspace.CurrentCamera
                      if not _IZ then return
                      end
                      local _Ja=_EI.LocalPlayerRoot
                      local function _Jb(_Jc)
                        local _Jd=tostring(_Jc)
                        if _DX.FontType=="uppercase"then return string.upper(_Jd)
                        end
                        if _DX.FontType=="lowercase"then return string.lower(_Jd)
                        end
                        return _Jd
                      end
                      for _Je,_Jf in ipairs(_EI.List)do local _Jg=_Jf.RootPart
                        local _Jh=_Jf.Character
                        if not _DX.Enabled or not _Jg or not _Jg.Parent or not _Jh or _Jf.IsDead then _EI.EntryHide(_Jf)continue
                        end
                        local _Ji=_Ja and(_Jg.Position-_Ja.Position).Magnitude or 0
                        if _DX.MaxDistance>0 and _Ji>_DX.MaxDistance then _EI.EntryHide(_Jf)continue
                        end
                        local _Jj,_Jk=_IZ:WorldToViewportPoint(_Jg.Position+Vector3.new(0,_Jf.TopOffset,0))
                        local _Jl,_Jm=_IZ:WorldToViewportPoint(_Jg.Position-Vector3.new(0,_Jf.BotOffset,0))
                        if not _Jk or not _Jm or _Jj.Z<=0 or _Jl.Z<=0 then _EI.EntryHide(_Jf)continue
                        end
                        local _Jn=math.max(2,math.floor(math.abs(_Jl.Y-_Jj.Y)+0.5))
                        local _Jo=math.max(2,math.floor(_Jn*0.5+0.5))
                        local _Jp=math.floor((_Jj.X+_Jl.X-_Jo)*0.5+0.5)
                        local _Jq=math.floor(math.min(_Jj.Y,_Jl.Y)+0.5)
                        local _Jr=UDim2.fromOffset(_Jp,_Jq)
                        local _Js=UDim2.fromOffset(_Jo,_Jn)_Jf.BoxX,_Jf.BoxY,_Jf.BoxW,_Jf.BoxH=_Jp,_Jq,_Jo,_Jn _Jf.IsVisible=true
                        local _Jt=_DX.Box.Enabled _Jf.BorderStroke.Visible=_Jt _Jf.BorderStroke.Position=_Jr _Jf.BorderStroke.Size=_Js _Jf.OuterStroke.Visible=_Jt _Jf.OuterStroke.Position=UDim2.fromOffset(_Jp-1,_Jq-1)_Jf.OuterStroke.Size=UDim2.fromOffset(_Jo+2,_Jn+2)_Jf.InnerStroke.Visible=_Jt _Jf.InnerStroke.Position=UDim2.fromOffset(_Jp+1,_Jq+1)_Jf.InnerStroke.Size=UDim2.fromOffset(math.max(0,_Jo-2),math.max(0,_Jn-2))_Jf.InnerCover.Visible=_Jt _Jf.InnerCover.Position=UDim2.fromOffset(_Jp+1,_Jq+1)_Jf.InnerCover.Size=UDim2.fromOffset(math.max(0,_Jo-2),math.max(0,_Jn-2))_Jf.BoxFill.Visible=_DX.Box.Fill.Enabled _Jf.BoxFill.Position=_Jr _Jf.BoxFill.Size=_Js
                        local _Ju=_Jt and _DX.Box.Glow.Enabled _Jf.GlowTop.Visible=_Ju _Jf.GlowBot.Visible=_Ju
                        if _Ju then _Jf.GlowTop.Position=UDim2.fromOffset(_Jp-6,_Jq-6)_Jf.GlowBot.Position=UDim2.fromOffset(_Jp-6,_Jq-6)_Jf.GlowTop.Size=UDim2.fromOffset(_Jo+12,_Jn+12)_Jf.GlowBot.Size=_Jf.GlowTop.Size
                        end
                        local _Jv=_DX.Bars.HealthBar
                        local _Jw=_Jv.Enabled
                        local _Jx=_Jv.Position=="Right"and _Jp+_Jo+4 or _Jp-6 _Jf.BarOutline.Visible=_Jw _Jf.BarBackground.Visible=_Jw _Jf.BarFill.Visible=_Jw
                        if _Jw then local _Jy=math.clamp(_Jf.Health or 0,0,1)
                          local _Jz=math.floor(_Jn*_Jy+0.5)_Jf.BarOutline.Position=UDim2.fromOffset(_Jx,_Jq-1)_Jf.BarOutline.Size=UDim2.fromOffset(4,_Jn+2)_Jf.BarBackground.Position=UDim2.fromOffset(_Jx+1,_Jq)_Jf.BarBackground.Size=UDim2.fromOffset(2,_Jn)_Jf.BarFill.Position=UDim2.fromOffset(_Jx+1,_Jq+_Jn-_Jz)_Jf.BarFill.Size=UDim2.fromOffset(2,_Jz)
                        end
                        local _JA=_Jp+_Jo*0.5 _Jf.LabelName.Visible=_DX.Name.Enabled
                        if _DX.Name.Enabled then local _JB=game:GetService("Players"):GetPlayerFromCharacter(_Jh)
                          local _JC=_JB and _DX.Name.UseDisplay and _JB.DisplayName or _Jf.PlayerName _Jf.LabelName.Text=_Jb(_JC)_Jf.LabelName.Position=UDim2.fromOffset(_JA,_Jq-_Jf.LabelName.TextSize-3)
                        end _Jf.LabelDist.Visible=_DX.Distance.Enabled
                        if _DX.Distance.Enabled then _Jf.LabelDist.Text=_Jb(tostring(math.floor(_Ji+0.5))..(_DX.Distance.Ending or""))_Jf.LabelDist.Position=UDim2.fromOffset(_JA,_Jq+_Jn+3)
                        end _Jf.LabelHp.Visible=_Jw and _Jv.Text.Enabled
                        if _Jf.LabelHp.Visible then _Jf.LabelHp.Text=_Jb((_Jf.HpString or "0")..(_Jv.Text.Ending or""))_Jf.LabelHp.Position=UDim2.fromOffset(_Jx+2,_Jq+_Jn*(1-math.clamp(_Jf.Health or 0,0,1))-_Jf.LabelHp.TextSize)
                        end
                        if _Jf.Highlight then _Jf.Highlight.Enabled=_DX.Highlight.Enabled
                        end
                      end
                    end)
                    local _JD=_B.v87:WaitForChild("Characters",2)
                    local function _JE(_JF)
                      if not _JF then return nil
                      end
                      local _JG=_JF.Parent
                      if _JG and(_JG.Name=="Counter-Terrorists"or _JG.Name=="Terrorists")then return _JG.Name
                      end
                      local _JH=_JF:FindFirstChild("CharacterArmor")
                      if not _JH then return nil
                      end
                      if _JH:FindFirstChild("VestDetails")then return "Counter-Terrorists"
                      end
                      if _JH:FindFirstChild("Balaclava")then return "Terrorists"
                      end
                      return nil
                    end
                    local function _JI(_JJ)
                      local _JK=_JD:FindFirstChild(_JJ)
                      if _JK and _JK:IsA("Model")then return _JK
                      end
                      for _JL,_JM in ipairs(_JD:GetChildren())do if _JM:IsA("Folder")then local _JN=_JM:FindFirstChild(_JJ)
                          if _JN and _JN:IsA("Model")then return _JN
                          end
                        end
                      end
                      return nil
                    end
                    local function _JO()
                      return _JE(_JI(_B.localPlayer2.Name)or _B.localPlayer2.Character)
                    end
                    local function _JP(_JQ)
                      if not _JQ:IsA("Model")then return false
                      end
                      if _JQ.Name==_B.localPlayer2.Name then return false
                      end
                      local _JR=_JO()
                      local _JS=_JE(_JQ)
                      if not _JR or not _JS then return false
                      end
                      if _DX.Filter=="enemy"then return _JS~=_JR
                      end
                      return _JS==_JR
                    end _EI.AddModel=function(_JT)
                      if _EI.Cache[_JT]then return
                      end
                      if not _JP(_JT)then return
                      end
                      local _JU=_EI.EntryNew(_JT)_EI.Cache[_JT]=_JU
                      local _JV=_EI.List _JV[#_JV+1]=_JU task.spawn(_EI.EntryLink,_JU,_JT)_JU.ModelConnection=_JT.AncestryChanged:Connect(function(_JW,_JX)
                        if _JX==nil or not _JP(_JT)then _EI.RemoveModel(_JT)
                        end
                      end)
                    end _EI.RemoveModel=function(_JY)
                      local _JZ=_EI.Cache[_JY]
                      if not _JZ then return
                      end _EI.Cache[_JY]=nil
                      local _Ka=_EI.List
                      for _Kb=1,#_Ka do if _Ka[_Kb]==_JZ then _Ka[_Kb]=_Ka[#_Ka]_Ka[#_Ka]=nil break
                        end
                      end _EI.EntryDestroy(_JZ)
                    end
                    local function _Kc()
                      for _Kd in pairs(_EI.Cache)do _EI.RemoveModel(_Kd)
                      end
                      for _Ke,_Kf in ipairs(_JD:GetChildren())do if _Kf:IsA("Model")then _EI.AddModel(_Kf)
                        elseif _Kf:IsA("Folder")then for _Kg,_Kh in ipairs(_Kf:GetChildren())do if _Kh:IsA("Model")then _EI.AddModel(_Kh)
                            end
                          end
                        end
                      end
                    end _EI.RescanAll=_Kc task.spawn(_Kc)_EI.Connections[#_EI.Connections+1]=_JD.ChildAdded:Connect(function(_Ki)
                      if _Ki:IsA("Model")then _EI.AddModel(_Ki)
                      end
                    end)_EI.Connections[#_EI.Connections+1]=_JD.DescendantAdded:Connect(function(_Kj)
                      if _Kj:IsA("Model")and _Kj.Name~=_B.localPlayer2.Name then _EI.AddModel(_Kj)
                      elseif _Kj.Name=="CharacterArmor"or _Kj.Name=="VestDetails"or _Kj.Name=="Balaclava"then task.delay(0.1,_Kc)
                      end
                    end)_EI.Connections[#_EI.Connections+1]=_JD.ChildRemoved:Connect(function(_Kk)task.delay(0.1,_EI.RemoveModel,_Kk)
                    end)_EI.Connections[#_EI.Connections+1]=_JD.DescendantRemoving:Connect(function(_Kl)
                      if _Kl:IsA("Model")and _EI.Cache[_Kl]then _EI.RemoveModel(_Kl)
                      end
                    end)_EI.Connections[#_EI.Connections+1]=_B.localPlayer2.CharacterAdded:Connect(function()task.wait(0.5)_Kc()
                    end)_EI.Connections[#_EI.Connections+1]=_B.localPlayer2:GetPropertyChangedSignal("Team"):Connect(_Kc)
                    if _DX.Filter=="enemy"then local _Km=workspace:FindFirstChild("Bots")
                      if _Km then local _Kn={}
                        local function _Ko(_Kp)
                          if not _Kp:IsA("Model")or _Kn[_Kp]then return
                          end
                          local _Kq=_EI.EntryNew({Name=_Kp.Name})_Kq.PlayerName=_Kp.Name _Kn[_Kp]=_Kq
                          local _Kr=_EI.List _Kr[#_Kr+1]=_Kq task.spawn(_EI.EntryLink,_Kq,_Kp)
                        end
                        local function _Ks(_Kt)
                          local _Ku=_Kn[_Kt]
                          if not _Ku then return
                          end _Kn[_Kt]=nil
                          local _Kv=_EI.List
                          for _Kw=1,#_Kv do if _Kv[_Kw]==_Ku then _Kv[_Kw]=_Kv[#_Kv]_Kv[#_Kv]=nil break
                            end
                          end _EI.EntryDestroy(_Ku)
                        end
                        for _Kx,_Ky in ipairs(_Km:GetChildren())do task.spawn(_Ko,_Ky)
                        end _EI.Connections[#_EI.Connections+1]=_Km.ChildAdded:Connect(_Ko)_EI.Connections[#_EI.Connections+1]=_Km.ChildRemoved:Connect(_Ks)
                      end
                    end
                    return _EI
                  end
                end
              end do _DG=function(_Kz,_KA,_KB)
                  local function _KC(_KD)
                    return 1-_KD
                  end
                  local _KG=_Kz:Toggle({title="enable",default=_KB.Enabled,callback=function(_KE)_KB.Enabled=_KE
                    if not _KE then for _KF=1,#_KA.List do _KA.EntryHide(_KA.List[_KF])
                      end
                    end
                  end,}):Settings({callback=function()
                  end})_KG:Slider({title="refresh rate",min=1,max=240,default=_KB.RefreshRate,suffix=" fps",callback=function(_KH)_KB.RefreshRate=_KH
                  end,})_KG:Slider({title="max distance",min=50,max=500,default=_KB.MaxDistance,suffix="studs",maxtext="disabled",callback=function(_KI)_KB.MaxDistance=_KI
                  end,})_KG:Dropdown({title="font",values={"Tahoma","Pixel"},default=_KB.Font,multi=false,callback=function(_KJ)_KB.Font=_KJ _KA.UpdateFonts()_KA.ForceUpdate=true
                  end,})_KG:Dropdown({title="font case",values={"lowercase","uppercase","normal"},default=_KB.FontType,multi=false,callback=function(_KK)_KB.FontType=_KK _KA.InvalidateTextCaches()_KA.ForceUpdate=true
                  end,})_KG:Slider({title="text size",min=8,max=24,default=_KB.FontSize,suffix="px",callback=function(_KL)_KB.FontSize=_KL _KA.UpdateFonts()_KA.ForceUpdate=true
                  end,})
                  local _KN=_Kz:Toggle({title="name",default=_KB.Name.Enabled,risky=false,callback=function(_KM)_KB.Name.Enabled=_KM
                    if not _KM then _KA.HideNames()
                    end _KA.ForceUpdate=true
                  end,}):Settings({callback=function()
                  end})_KN:Toggle({title="use display name",default=_KB.Name.UseDisplay,risky=false,callback=function(_KO)_KB.Name.UseDisplay=_KO _KA.InvalidateTextCaches()_KA.ForceUpdate=true
                  end,})_KN:Colorpicker({title="text color",default=_KB.Name.Color,transparency=1-_KB.Name.Transparency,callback=function(_KP,_KQ)_KB.Name.Color=_KP _KB.Name.Transparency=_KC(_KQ)_KA.UpdateLabelColor("LabelName",_KP)_KA.UpdateLabelTransparency("LabelName",_KC(_KQ))
                  end,})_Kz:Toggle({title="box",default=_KB.Box.Enabled,risky=false,callback=function(_KR)_KB.Box.Enabled=_KR
                    if not _KR then _KA.HideBoxes()
                    end _KA.ForceUpdate=true
                  end,}):Settings({callback=function()
                  end}):Colorpicker({title="color",default=_KB.Box.Color[1],transparency=1-_KB.Box.Transparency[1],callback=function(_KS,_KT)_KB.Box.Color[1]=_KS _KB.Box.Transparency[1]=_KC(_KT)_KB.Box.Glow.Color[1]=_KS _KB.Box.Glow.Color[2]=_KS _KA.UpdateBoxGradient()_KA.UpdateBorderTransparency()_KA.UpdateGlowColors()
                  end,}):Colorpicker({title="color 2",default=_KB.Box.Color[2],transparency=1-_KB.Box.Transparency[2],callback=function(_KU,_KV)_KB.Box.Color[2]=_KU _KB.Box.Transparency[2]=_KC(_KV)_KA.UpdateBoxGradient()_KA.UpdateBorderTransparency()_KA.UpdateGlowColors()
                  end,}):Slider({title="gradient rotation",min=-90,max=90,default=_KB.Box.Rotation,suffix="*",callback=function(_KW)_KB.Box.Rotation=_KW _KA.UpdateBoxRotation()
                  end,})_Kz:Toggle({title="box fill",default=_KB.Box.Fill.Enabled,risky=false,callback=function(_KX)_KB.Box.Fill.Enabled=_KX
                    if not _KX then _KA.HideFills()
                    end _KA.ForceUpdate=true
                  end,}):Settings({callback=function()
                  end}):Colorpicker({title="color",default=_KB.Box.Fill.Color[1],transparency=1-_KB.Box.Fill.Transparency[1],callback=function(_KY,_KZ)_KB.Box.Fill.Color[1]=_KY _KB.Box.Fill.Color[2]=_KY _KB.Box.Fill.Transparency[1]=_KC(_KZ)_KA.UpdateFillGradient()
                  end,}):Slider({title="gradient rotation",min=-90,max=90,default=_KB.Box.Fill.Rotation,suffix="*",callback=function(_La)_KB.Box.Fill.Rotation=_La _KA.UpdateFillGradient()
                  end,})_Kz:Toggle({title="highlight",default=_KB.Highlight.Enabled,risky=false,callback=function(_Lb)_KB.Highlight.Enabled=_Lb _KA.UpdateHighlightVisibility()
                    if not _Lb then _KA.HideHighlights()
                    end
                  end,}):Settings({callback=function()
                  end}):Colorpicker({title="fill color",default=_KB.Highlight.FillColor,transparency=1-_KB.Highlight.FillTransparency,callback=function(_Lc,_Ld)_KB.Highlight.FillColor=_Lc _KB.Highlight.FillTransparency=_KC(_Ld)_KA.UpdateHighlights()
                  end,}):Colorpicker({title="outline color",default=_KB.Highlight.OutlineColor,transparency=1-_KB.Highlight.OutlineTransparency,callback=function(_Le,_Lf)_KB.Highlight.OutlineColor=_Le _KB.Highlight.OutlineTransparency=_KC(_Lf)_KA.UpdateHighlights()
                  end,}):Dropdown({title="depth",values={"AlwaysOnTop","Occluded"},default=_KB.Highlight.DepthMode==Enum.HighlightDepthMode.AlwaysOnTop and "AlwaysOnTop"or "Occluded",multi=false,callback=function(_Lg)_KB.Highlight.DepthMode=_Lg=="AlwaysOnTop"and Enum.HighlightDepthMode.AlwaysOnTop or Enum.HighlightDepthMode.Occluded _KA.UpdateHighlights()
                  end,})
                  local _Li=_Kz:Toggle({title="healthbar",default=_KB.Bars.HealthBar.Enabled,risky=false,callback=function(_Lh)_KB.Bars.HealthBar.Enabled=_Lh
                    if not _Lh then _KA.HideHealthbars()
                    end _KA.ForceUpdate=true
                  end,})_Li:Colorpicker({title="color 1",default=_KB.Bars.HealthBar.Color[1],transparency=1,callback=function(_Lj)_KB.Bars.HealthBar.Color[1]=_Lj _KA.UpdateHpGradient()
                  end,})_Li:Colorpicker({title="color 2",default=_KB.Bars.HealthBar.Color[2],transparency=1,callback=function(_Lk)_KB.Bars.HealthBar.Color[2]=_Lk _KA.UpdateHpGradient()
                  end,})_Li:Colorpicker({title="color 3",default=_KB.Bars.HealthBar.Color[4],transparency=1,callback=function(_Ll)_KB.Bars.HealthBar.Color[3]=_Ll _KA.UpdateHpGradient()
                  end,})
                  local _Lp=_Kz:Toggle({title="healthbar text",default=_KB.Bars.HealthBar.Text.Enabled,risky=false,callback=function(_Lm)_KB.Bars.HealthBar.Text.Enabled=_Lm
                    if not _Lm then for _Ln,_Lo in ipairs(_KA.List)do _Lo.LabelHp.Visible=false
                      end
                    end _KA.ForceUpdate=true
                  end,}):Settings({callback=function()
                  end})_Lp:Colorpicker({title="text color",default=_KB.Bars.HealthBar.Text.Color,transparency=1-_KB.Bars.HealthBar.Text.Transparency,callback=function(_Lq,_Lr)_KB.Bars.HealthBar.Text.Color=_Lq _KB.Bars.HealthBar.Text.Transparency=_KC(_Lr)_KA.UpdateLabelColor("LabelHp",_Lq)_KA.UpdateLabelTransparency("LabelHp",_KC(_Lr))
                  end,})_Lp:TextBox({title="ending",default=_KB.Bars.HealthBar.Text.Ending,callback=function(_Ls)_KB.Bars.HealthBar.Text.Ending=_Ls _KA.InvalidateTextCaches()_KA.ForceUpdate=true
                  end,})_Lp:Toggle({title="follow bar",default=_KB.Bars.HealthBar.Text.FollowBar,risky=false,callback=function(_Lt)_KB.Bars.HealthBar.Text.FollowBar=_Lt _KA.ForceUpdate=true
                  end,})
                  local _Lv=_Kz:Toggle({title="distance",default=_KB.Distance.Enabled,risky=false,callback=function(_Lu)_KB.Distance.Enabled=_Lu
                    if not _Lu then _KA.HideDistances()
                    end _KA.ForceUpdate=true
                  end,}):Settings({callback=function()
                  end})_Lv:Colorpicker({title="text color",default=_KB.Distance.Color,transparency=1-_KB.Distance.Transparency,callback=function(_Lw,_Lx)_KB.Distance.Color=_Lw _KB.Distance.Transparency=_KC(_Lx)_KA.UpdateLabelColor("LabelDist",_Lw)_KA.UpdateLabelTransparency("LabelDist",_KC(_Lx))
                  end,})_Lv:TextBox({title="ending",default=_KB.Distance.Ending,callback=function(_Ly)_KB.Distance.Ending=_Ly _KA.InvalidateTextCaches()_KA.ForceUpdate=true
                  end,})
                end do local _Lz=_DI("enemy")
                  local _LA=_DF(_Lz)_DG(players_tab:Section("esp","left"),_LA,_Lz)
                end
              end _DH=_DI("team")
            end
            local _LB=_DF(_DH)_DG(players_tab:Section("team","left"),_LB,_DH)
          end do local _LC={}do _LC.Lighting=game:GetService("Lighting")do local _LD=game:GetService("RunService")_LC.tbl18={Ambient=_LC.Lighting.Ambient,OutdoorAmbient=_LC.Lighting.OutdoorAmbient,ExposureCompensation=_LC.Lighting.ExposureCompensation,Brightness=_LC.Lighting.Brightness,ClockTime=_LC.Lighting.ClockTime,}_LC.tbl19={atmosphere=nil}_LC.tbl20={haze_strength=1.5,glare_strength=1.4,exposure_value=0,brightness_value=_LC.tbl18.Brightness,clocktime_value=_LC.tbl18.ClockTime,}_LC.fn31=function()
                  if not _LC.tbl19.atmosphere or not _LC.tbl19.atmosphere.Parent then _LC.tbl19.atmosphere=_LC.Lighting:FindFirstChildOfClass("Atmosphere")
                    if not _LC.tbl19.atmosphere then _LC.tbl19.atmosphere=Instance.new("Atmosphere")_LC.tbl19.atmosphere.Parent=_LC.Lighting
                    end
                  end
                  return _LC.tbl19.atmosphere
                end _LC.fn32=function()
                  if not _LC.tbl20.haze and not _LC.tbl20.glare then if _LC.tbl19.atmosphere and _LC.tbl19.atmosphere.Parent then _LC.tbl19.atmosphere:Destroy()
                    end _LC.tbl19.atmosphere=nil
                  end
                end _LD.Heartbeat:Connect(function(...)
                end)
              end
            end
            local _LE do _LE=players_tab:Section("world visuals","right")_LE:Toggle({title="indoor ambience",default=false,risky=false,callback=function(_LF)_LC.tbl20.indoor_ambience=_LF
                if not _LF then _LC.Lighting.Ambient=_LC.tbl18.Ambient
                else _LC.Lighting.Ambient=_LC.tbl20.indoor_ambience_color or Color3.fromRGB(100,155,255)
                end
              end,}):Colorpicker({title="ambience",default=Color3.fromRGB(100,155,255),transparency=1,callback=function(_LG)_LC.tbl20.indoor_ambience_color=_LG
                if _LC.tbl20.indoor_ambience then _LC.Lighting.Ambient=_LG
                end
              end,})_LE:Toggle({title="outdoor ambience",default=false,risky=false,callback=function(_LH)_LC.tbl20.outdoor_ambience=_LH
                if not _LH then _LC.Lighting.OutdoorAmbient=_LC.tbl18.OutdoorAmbient
                else _LC.Lighting.OutdoorAmbient=_LC.tbl20.outdoor_ambience_color or Color3.fromRGB(100,155,255)
                end
              end,}):Colorpicker({title="outdoor",default=Color3.fromRGB(100,155,255),transparency=1,callback=function(_LI)_LC.tbl20.outdoor_ambience_color=_LI
                if _LC.tbl20.outdoor_ambience then _LC.Lighting.OutdoorAmbient=_LI
                end
              end,})do local _LL=_LE:Toggle({title="haze",default=false,risky=false,callback=function(_LJ)_LC.tbl20.haze=_LJ
                  if _LJ then local _LK=_LC.fn31()_LK.Haze=_LC.tbl20.haze_strength or 1.5 _LK.Color=_LC.tbl20.haze_color or Color3.fromRGB(141,255,60)
                  else if _LC.tbl19.atmosphere and _LC.tbl19.atmosphere.Parent then _LC.tbl19.atmosphere.Haze=0
                    end _LC.fn32()
                  end
                end,}):Settings({callback=function()
                end})_LL:Colorpicker({title="haze color",default=Color3.fromRGB(141,255,60),transparency=1,callback=function(_LM)_LC.tbl20.haze_color=_LM
                  if _LC.tbl20.haze and _LC.tbl19.atmosphere and _LC.tbl19.atmosphere.Parent then _LC.tbl19.atmosphere.Color=_LM
                  end
                end,})_LL:Slider({title="strength",suffix="%",min=0,max=2,float=0.1,default=1.5,callback=function(_LN)_LC.tbl20.haze_strength=_LN
                  if _LC.tbl20.haze and _LC.tbl19.atmosphere and _LC.tbl19.atmosphere.Parent then _LC.tbl19.atmosphere.Haze=_LN
                  end
                end,})
              end
            end do local _LQ=_LE:Toggle({title="glare",default=false,risky=false,callback=function(_LO)_LC.tbl20.glare=_LO
                if _LO then local _LP=_LC.fn31()_LP.Glare=_LC.tbl20.glare_strength or 1.4 _LP.Decay=_LC.tbl20.glare_color or Color3.fromRGB(100,155,255)
                else if _LC.tbl19.atmosphere and _LC.tbl19.atmosphere.Parent then _LC.tbl19.atmosphere.Glare=0
                  end _LC.fn32()
                end
              end,}):Settings({callback=function()
              end})_LQ:Colorpicker({title="glare color",default=Color3.fromRGB(100,155,255),transparency=1,callback=function(_LR)_LC.tbl20.glare_color=_LR
                if _LC.tbl20.glare and _LC.tbl19.atmosphere and _LC.tbl19.atmosphere.Parent then _LC.tbl19.atmosphere.Decay=_LR
                end
              end,})_LQ:Slider({title="strength",suffix="%",min=0,max=10,float=0.1,default=1.4,callback=function(_LS)_LC.tbl20.glare_strength=_LS
                if _LC.tbl20.glare and _LC.tbl19.atmosphere and _LC.tbl19.atmosphere.Parent then _LC.tbl19.atmosphere.Glare=_LS
                end
              end,})
            end _LE:Toggle({title="exposure",default=false,risky=false,callback=function(_LT)_LC.tbl20.exposure=_LT
              if not _LT then _LC.Lighting.ExposureCompensation=_LC.tbl18.ExposureCompensation
              else _LC.Lighting.ExposureCompensation=_LC.tbl20.exposure_value or 0
              end
            end,}):Settings({callback=function()
            end}):Slider({title="exposure",suffix="%",min=-5,max=5,float=0.1,default=0,callback=function(_LU)_LC.tbl20.exposure_value=_LU
              if _LC.tbl20.exposure then _LC.Lighting.ExposureCompensation=_LU
              end
            end,})_LE:Toggle({title="brightness",default=false,risky=false,callback=function(_LV)_LC.tbl20.brightness=_LV
              if not _LV then _LC.Lighting.Brightness=_LC.tbl18.Brightness
              else _LC.Lighting.Brightness=_LC.tbl20.brightness_value or _LC.tbl18.Brightness
              end
            end,}):Settings({callback=function()
            end}):Slider({title="brightness",suffix="%",min=0,max=2,float=0.1,callback=function(_LW)_LC.tbl20.brightness_value=_LW
              if _LC.tbl20.brightness then _LC.Lighting.Brightness=_LW
              end
            end,})_LE:Toggle({title="clock time",default=false,risky=false,callback=function(_LX)_LC.tbl20.clocktime=_LX
              if not _LX then _LC.Lighting.ClockTime=_LC.tbl18.ClockTime
              else _LC.Lighting.ClockTime=_LC.tbl20.clocktime_value or _LC.tbl18.ClockTime
              end
            end,}):Settings({callback=function()
            end}):Slider({title="time",suffix=" t",min=0,max=18,float=0.1,callback=function(_LY)_LC.tbl20.clocktime_value=_LY
              if _LC.tbl20.clocktime then _LC.Lighting.ClockTime=_LY
              end
            end,})
          end do _z.misc=_z.tween:Tab("misc")getgenv().GunSettings=getgenv().GunSettings or{NoRecoil=false,ViewModelEnabled=false,ViewModelX=0.13,ViewModelY=-0.155,ViewModelZ=0.075,ViewModelRoll=0,ViewModelRotX=0,ViewModelRotY=0,ViewModelShotActive=false,ViewModelShotToken=0,RotateOnShot=false,}getgenv().Settings=getgenv().Settings or{speed={enabled=false,method="on jump",value=25},fakeLag={enabled=false,strength=5,fakechar=false,onlyThirdPerson=false,fakecharColor=Color3.fromRGB(255,155,255),fakecharTransparency=0,fakecharMaterial="Neon",},}getgenv().RemovalsEnabled=false do local _LZ={flashbang=true}getgenv().RemovalsSelection=_LZ
            end
          end do local _Ma=false
            local _Mb={}
            local _Mc=nil _Mc=function()
              if not _Ma then return
              end
              local _Md=nil
              for _Me,_Mf in ipairs(game:GetDescendants())do if _Mf:IsA("ModuleScript")and _Mf.Name=="FlashEffect"then local _Mg _Mg,_Md=pcall(require,_Mf)
                  if not(_Mg and type(_Md)=="table"and _Md.Flash)then _Md=nil continue
                  end
                else _Md=nil continue
                end break
              end
              if not _Md then task.delay(2,_Mc)
                return
              end
              if not _Mb.Flash then _Mb.Flash=_Md.Flash _Mb.IsFlashed=_Md.IsFlashed _Mb.GetAudioFadeMultiplier=_Md.GetAudioFadeMultiplier _Mb.CancelFlash=_Md.CancelFlash _Mb.CalculateFlashDuration=_Md.CalculateFlashDuration
              end _Md.Flash=function()
                return false
              end _Md.IsFlashed=function()
                return false
              end _Md.GetAudioFadeMultiplier=function()
                return 1
              end
              if _Md.CancelFlash then pcall(_Md.CancelFlash)
              end
              if _Md.CalculateFlashDuration then _Md.CalculateFlashDuration=function()
                  return 0,0,0,"blocked",0
                end
              end
            end game.DescendantAdded:Connect(function(_Mh)
              if _Mh:IsA("ModuleScript")and _Mh.Name=="FlashEffect"then task.wait(0.1)
                if _Ma then _Mc()
                end
              end
            end)
          end
        end do local _Mi,_Mj,_Mk do do do local _Ml=false
                local _Mm={}
                local _Mn=false
                local _Mo=nil _Mo=function()
                  if not _Ml then return
                  end
                  local _Mp=nil
                  for _Mq,_Mr in ipairs(game:GetDescendants())do if _Mr:IsA("ModuleScript")and _Mr.Name=="CreateVoxelSmoke"then local _Ms,_Mt=pcall(require,_Mr)
                      if _Ms and type(_Mt)=="table"and _Mt.Create then _Mp=_Mt break
                      end
                    end
                  end
                  if not _Mp then task.delay(2,_Mo)
                    return
                  end
                  if not _Mm.Create then _Mm.Create=_Mp.Create _Mm.DestroyAll=_Mp.DestroyAll
                  end _Mp.Create=function()
                  end pcall(_Mp.DestroyAll)
                  for _Mu,_Mv in ipairs(workspace:GetDescendants())do if _Mv:IsA("BasePart")and _Mv.Name=="SmokeVoxel"then _Mv:Destroy()
                    end
                    if _Mv:IsA("Folder")and _Mv.Name:match("^VoxelSmoke_")then _Mv:Destroy()
                    end
                  end _Mn=true task.spawn(function()
                    while _Mn do for _Mw,_Mx in ipairs(workspace:GetDescendants())do if _Mx:IsA("BasePart")and _Mx.Name=="SmokeVoxel"then _Mx:Destroy()
                        end
                        if _Mx:IsA("Folder")and _Mx.Name:match("^VoxelSmoke_")then _Mx:Destroy()
                        end
                      end pcall(_Mp.DestroyAll)task.wait(0.5)
                    end
                  end)
                end game.DescendantAdded:Connect(function(_My)
                  if _My:IsA("ModuleScript")and _My.Name=="CreateVoxelSmoke"then task.wait(0.1)
                    if _Ml then _Mo()
                    end
                  end
                end)
              end do local _Mz=nil _Mi=function(_MA,_MB)
                  if _Mz then _Mz:Disconnect()_Mz=nil
                  end
                  if _MA then local _MC=workspace.CurrentCamera _Mz=game:GetService("RunService").RenderStepped:Connect(function()_MC.CFrame=_MC.CFrame*CFrame.new(0,0,0,1,0,0,0,_MB,0,0,0,1);
                    end)
                  end
                end
              end
            end do local _MD=nil _Mj=function(_ME,_MF)
                if _MD then _MD:Disconnect()_MD=nil
                end
                if _ME then local _MG=workspace.CurrentCamera _MD=game:GetService("RunService").RenderStepped:Connect(function()_MG.FieldOfView=_MF;
                  end)
                else workspace.CurrentCamera.FieldOfView=70
                end
              end
            end do local _MH=workspace.CurrentCamera
              local _MI={}
              local function _MJ(_MK)
                if _MK:IsA("Model")then local _ML=_MK:FindFirstChild("Stats")
                  if _ML then local _MM=_ML:FindFirstChild("Default")
                    local _MN=_ML:FindFirstChild("Rotation")
                    if _MM and _MN and not _MI[_MK]then _MI[_MK]={default=_MM.Value,rotation=_MN.Value}
                    end
                  end
                end
              end
              local function _MO(_MP)
                if _MP:IsA("Model")then if _y.n26(753)<2323 then local _MQ=_MP:FindFirstChild("CameraShake")
                    if _MQ then local _MR=_MQ:FindFirstChild("Position")
                      if _MR then local _MS=_MR:FindFirstChild("PositionDampen")
                        if _MS then _MS.Value=getgenv().GunSettings.NoRecoil and-500 or 1
                          if _y.n25>2327 then while true do end
                          end
                        end
                      end
                    end
                    local _MT=_MP:FindFirstChild("Stats")
                    if _MT then local _MU=_MT:FindFirstChild("Default")
                      local _MV=_MT:FindFirstChild("Rotation")
                      local _MW=getgenv().GunSettings
                      if _MW.ViewModelEnabled then if _MU then _MU.Value=Vector3.new(_MW.ViewModelX,_MW.ViewModelY,_MW.ViewModelZ)
                        end
                      elseif _MI[_MP]and _MU then _MU.Value=_MI[_MP].default
                      end
                      if _MV then local _MX=_MI[_MP]
                        local _MY=_MX and _MX.rotation.X or _MV.Value.X
                        local _MZ=_MX and _MX.rotation.Y or _MV.Value.Y
                        local _Na=_MX and _MX.rotation.Z or _MV.Value.Z
                        if _MW.ViewModelEnabled then _Na=_MW.ViewModelRoll
                        end
                        if _MW.RotateOnShot and _MW.ViewModelShotActive then _MY=_MW.ViewModelRotX _MZ=_MW.ViewModelRotY
                        end _MV.Value=Vector3.new(_MY,_MZ,_Na)
                      end
                    end
                  else while true do end
                  end
                end
              end _Mk=function()
                for _Nb,_Nc in ipairs(_MH:GetChildren())do _MO(_Nc)
                end
              end getgenv().GunSettingsApplyViewmodels=_Mk _MH.ChildAdded:Connect(function(_Nd)task.wait()_MJ(_Nd)_MO(_Nd)
              end)
              for _Ne,_Nf in ipairs(_MH:GetChildren())do _MJ(_Nf)
              end
            end
          end do do _A.RunService=game:GetService("RunService")game:GetService("UserInputService")_A.Players=game:GetService("Players")do local _Ng=nil
                local _Nh=nil
                local _Ni=nil
                local function _Nj()
                  local _Nk=game:GetService("ReplicatedStorage")
                  local _Nl,_Nm=pcall(require,_Nk.Classes.Character)
                  if not _Nl or type(_Nm)~="table"then return
                  end
                  local _Nn=debug and debug.getupvalue
                  if _Nn then local _No=_Nm.new or _Nm.MoveFunction
                    if _No then for _Np=1,300 do local _Nq,_Nr,_Ns=pcall(_Nn,_No,_Np)
                        if not(not _Nq or _Nr==nil)then if type(_Ns)=="table"and _Ns.Character and _Ns.HumanoidRootPart and _Ns.MovementState then _Ng=_Ns break
                          else continue
                          end
                        end break
                      end
                    end
                  end
                  local _Nt,_Nu=pcall(require,_Nk.Movement.Simulator)
                  local _Nv,_Nw=pcall(require,_Nk.Movement.RuntimeKinematics)
                  if _Nv and type(_Nw)=="table"and type(_Nw.write)=="function"then _Ni=_Nw
                  end
                  if _Nt and type(_Nu)=="table"then for _Nx,_Ny in ipairs({"requestJump","RequestJump","jump"})do local _Nz=_Nu[_Ny]
                      if type(_Nz)=="function"then _Nh=function()pcall(_Nz,_Nu,_Ng.MovementState,tick())
                        end break
                      end
                    end
                  end
                  if not _Nh and _Ng and _Ng.MovementJumpInput then local _NA=_Ng.MovementJumpInput
                    for _NB,_NC in ipairs({"push","Push","SetHeld","setHeld","AddJump","addJump","tap","Tap","press","Press"})do local _ND=_NA[_NC]
                      if type(_ND)=="function"then _Nh=function()pcall(_ND,_NA,tick())
                        end break
                      end
                    end
                  end
                  if not _Nh then _Nh=function()pcall(function()game:GetService("UserInputService").JumpRequest:Fire()
                      end)
                    end
                  end
                end pcall(function()_Nj()
                end)getgenv().GetLocalMovement=function()
                  return _Ng
                end
              end
            end do do local function _NE()
                  local _NF=game:GetService("ReplicatedStorage")
                  local _NG,_NH=pcall(require,_NF.Classes.Character)
                  if _NG and type(_NH)=="table"and type(_NH.ApplyMovementCorrection)=="function"and not _NH.__shizukuscriptsNoCorrChar then _NH.__shizukuscriptsNoCorrChar=true
                    local _NI=_NH.ApplyMovementCorrection _NH.ApplyMovementCorrection=function(...)
                      local _NJ=getgenv().Settings
                      if _NJ and _NJ.speed and _NJ.speed.enabled then return
                      end
                      if getgenv().BS_Settings and getgenv().BS_Settings.autohop then return
                      end
                      return _NI(...)
                    end
                  end
                  local _NK,_NL=pcall(require,_NF.Movement.ClientRuntime)
                  if _NK and type(_NL)=="table"and type(_NL.applyCorrection)=="function"and not _NL.__shizukuscriptsNoCorrRT then _NL.__shizukuscriptsNoCorrRT=true
                    local _NM=_NL.applyCorrection _NL.applyCorrection=function(...)
                      local _NN=getgenv().Settings
                      if _NN and _NN.speed and _NN.speed.enabled then return
                      end
                      if getgenv().BS_Settings and getgenv().BS_Settings.autohop then return
                      end
                      return _NM(...)
                    end
                  end
                end pcall(function()_NE()
                end)
              end
            end do local function _NO()
                local _NP,_NQ=pcall(require,game:GetService("ReplicatedStorage").Movement.SpeedProfile)
                if not _NP or type(_NQ)~="table"or type(_NQ.resolveBaseMoveSpeed)~="function"or _NQ.__shizukuscriptsSpeed then return
                end _NQ.__shizukuscriptsSpeed=true
                local _NR=_NQ.resolveBaseMoveSpeed _NQ.resolveBaseMoveSpeed=function(...)
                  local _NS=_NR(...)
                  local _NT=getgenv().Settings
                  local _NU=_NT and _NT.speed and _NT.speed.enabled
                  local _NV=1
                  if _NU then _NV=1+(_NT.speed.value or 0)/40
                  end
                  return _NS*_NV
                end
              end pcall(function()_NO()
              end)
            end
          end do local _NW,_NX,_NY do local _NZ=game:GetService("ReplicatedStorage")_NW=require(_NZ.Controllers.CharacterController)_NX=require(_NZ.Classes.Character)_NY=game:GetService("UserInputService")
              if getgenv().BS_OldStep then pcall(function()require(_NZ.Movement.Simulator).step=getgenv().BS_OldStep
                end)getgenv().BS_OldStep=nil
              end
            end do if getgenv().BS_HopConn then getgenv().BS_HopConn:Disconnect()getgenv().BS_HopConn=nil
              end
              if getgenv().BS_OldSample then pcall(function()setreadonly(_NX,false)_NX.SampleInput=getgenv().BS_OldSample setreadonly(_NX,true)
                end)getgenv().BS_OldSample=nil
              end getgenv().BS_Settings=getgenv().BS_Settings or{autohop=false,strafe=false}do local _Oa=false getgenv().BS_PrevJump=_Oa
              end
            end do local _Ob=_NX.SampleInput getgenv().BS_OldSample=_Ob setreadonly(_NX,false)_NX.SampleInput=function(_Oc,_Od,...)
                if getgenv().BS_Settings.autohop and _Oc==_NW.getCurrentCharacter()then local _Oe=_NY:IsKeyDown(Enum.KeyCode.Space)and not getgenv().BS_PrevJump;getgenv().BS_PrevJump=_Oe;_Oc.JumpInputDown=_Oe;
                end;
                local _Of=_Ob(_Oc,_Od,...);
                if _Of and getgenv().BS_Settings.strafe and getgenv().BS_Settings.autohop and _Oc and not _Oc.OnGround and _Of.Move and _Oc.GlobalVelocity then _Od=_Oc.GlobalVelocity;
                  local _Og=math.sqrt(_Od.X*_Od.X+_Od.Z*_Od.Z);
                  if _Og>0.5 then local _Oh,_Oi,_Oj,_Ok,_Ol=_Od.X/_Og,_Od.Z/_Og,_Of.LookYaw,_Of.Move.X,_Of.Move.Y;
                    local _Om,_On=math.cos(_Oj),math.sin(_Oj);
                    local _Oo,_Op=_Om*_Ok+_On*_Ol,-_On*_Ok+_Om*_Ol;_Ok=math.sqrt(_Oo*_Oo+_Op*_Op);
                    if _Ok<0.01 then return _Of;
                    end;_Oo/=_Ok;_Op/=_Ok;_Ok,_Ol=-_Oi,-_Oh;
                    local _Oq,_Or=_Ok*_Oo+_Oh*_Op,_Oi*_Oo+_Ol*_Op;_Oj,_Oo=_Or>_Oq and _Oi or _Ok,_Or>_Oq and _Ol or _Oh;
                    if isreadonly(_Of)then pcall(setreadonly,_Of,false);
                    end;_Of.Move=Vector2.new(_Om*_Oj-_On*_Oo,_On*_Oj+_Om*_Oo);
                  end;
                end;
                return _Of;
              end
            end setreadonly(_NX,true)
          end do _A.fn30=function()
            end _A.fn29=function()
            end _A.camera=_z.misc:Section("camera","left")do local _Ot=_A.camera:Toggle({title="custom viewmodel",default=false,risky=false,callback=function(_Os)getgenv().GunSettings.ViewModelEnabled=_Os _Mk()
              end,}):Settings({callback=function()
              end})_Ot:Slider({title="x",suffix="*",min=-1,max=1,float=0.01,default=0.05,callback=function(_Ou)getgenv().GunSettings.ViewModelX=_Ou
                if getgenv().GunSettings.ViewModelEnabled then _Mk()
                end
              end,})_Ot:Slider({title="y",suffix="*",min=-1,max=1,float=0.01,default=-0.27,callback=function(_Ov)getgenv().GunSettings.ViewModelY=_Ov
                if getgenv().GunSettings.ViewModelEnabled then _Mk()
                end
              end,})_Ot:Slider({title="z",suffix="*",min=-1,max=1,float=0.01,default=-0.15,callback=function(_Ow)
                if not(_y.n24<9052)then getgenv().GunSettings.ViewModelZ=_Ow
                  if getgenv().GunSettings.ViewModelEnabled then _Mk()
                  end
                  return
                end
                while true do end
              end,})_Ot:Slider({title="roll",suffix="*",min=-1,max=1,float=0.01,default=0,callback=function(_Ox)getgenv().GunSettings.ViewModelRoll=_Ox
                if getgenv().GunSettings.ViewModelEnabled then _Mk()
                end
              end,})
            end
          end _A.camera:Toggle({title="aspect ratio",default=false,risky=false,callback=function(_Oy)getgenv().AspectRatioEnabled=_Oy _Mi(_Oy,getgenv().AspectRatioValue or 0.8)
          end,}):Settings({callback=function()
          end}):Slider({title="resolution",suffix="%",min=0.1,max=1.2,float=0.01,default=0.9,callback=function(_Oz)getgenv().AspectRatioValue=_Oz
            if getgenv().AspectRatioEnabled then _Mi(true,_Oz)
            end
          end,})_A.camera:Toggle({title="camera fov",default=false,risky=false,callback=function(_OA)getgenv().FovEnabled=_OA _Mj(_OA,getgenv().FovValue or 90)
          end,}):Settings({callback=function()
          end}):Slider({title="fov",suffix=" fov",min=30,max=120,float=1,default=85,callback=function(_OB)getgenv().FovValue=_OB
            if getgenv().FovEnabled then _Mj(true,_OB)
            end
          end,})
        end getgenv().ThirdPerson=getgenv().ThirdPerson or{Enabled=false,Distance=15,RemoveArms=true,DisableOnShot=false,_shotSuppressed=false,_shotDisableToken=0,}getgenv().ThirdPerson.DisableOnShot=getgenv().ThirdPerson.DisableOnShot or false
        if getgenv().ThirdPerson._shotSuppressed==nil then getgenv().ThirdPerson._shotSuppressed=false
        end
        if getgenv().ThirdPerson._shotDisableToken==nil then getgenv().ThirdPerson._shotDisableToken=0
        end getgenv().HandleThirdPersonShotDisable=function()
          local _OC=getgenv().ThirdPerson
          if not _OC.DisableOnShot then return
          end
          local _OD=game:GetService("UserInputService")
          if not _OC.Enabled and not _OC._shotSuppressed then return
          end
          if _OC.Enabled and not _OC._shotSuppressed then _OC._shotSuppressed=true _OC.Enabled=false
          end
          local _OE=(_OC._shotDisableToken or 0)+1 _OC._shotDisableToken=_OE task.delay(0.35,function()
            if _OC._shotDisableToken~=_OE then return
            end
            if not _OC._shotSuppressed then return
            end
            if _OC.DisableOnShot and not _OD:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)then _OC.Enabled=true _OC._shotSuppressed=false
            else task.spawn(function()
                while _OC.DisableOnShot and _OC._shotSuppressed and _OD:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)do task.wait(0.05)
                end
                if _OC._shotDisableToken==_OE and _OC._shotSuppressed and _OC.DisableOnShot then _OC.Enabled=true _OC._shotSuppressed=false
                end
              end)
            end
          end)
        end do local _OF=game:GetService("UserInputService")_OF.InputEnded:Connect(function(_OG)
            if _OG.UserInputType==Enum.UserInputType.MouseButton1 then local _OH=getgenv().ThirdPerson
              if _OH.DisableOnShot and _OH._shotSuppressed then task.delay(0.12,function()
                  if _OH._shotSuppressed and _OH.DisableOnShot and not _OF:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)then _OH.Enabled=true _OH._shotSuppressed=false _OH._shotDisableToken=(_OH._shotDisableToken or 0)+1
                  end
                end)
              end
            end
          end)
        end
      end
    end
    local _OI={RunService=game:GetService("RunService"),Players=game:GetService("Players"),camera=_A.camera,fn29=_A.fn29,fn30=_A.fn30}do local _OJ,_OK do do local _OL do do local _OM,_ON,_OO do do local _OP=nil
                  local _OQ=nil _OM=workspace.CurrentCamera
                  local function _OR(_OS,_OT)
                    if _OP then _OP(false,_OT)
                    end
                  end
                  local _OU=nil _OU=function()
                    for _OV,_OW in ipairs(getloadedmodules())do if _OW.Name=="CameraController"then local _OX,_OY=pcall(require,_OW)
                        if _OX and _OY and type(_OY.setPerspective)=="function"then _OQ=_OY break
                        end
                      end
                    end
                    if not _OQ then for _OZ,_Pa in ipairs(game:GetDescendants())do if _Pa:IsA("ModuleScript")and _Pa.Name=="CameraController"then local _Pb,_Pc=pcall(require,_Pa)
                          if _Pb and _Pc and type(_Pc.setPerspective)=="function"then _OQ=_Pc break
                          end
                        end
                      end
                    end
                    if not _OQ then task.delay(2,_OU)
                      return
                    end
                    if not _OP then _OP=_OQ.setPerspective
                    end _OQ.setPerspective=function(_Pd,_Pe)
                      if not getgenv().ThirdPerson.Enabled then return _OP(_Pd,_Pe)
                      end _OR(_Pd,_Pe)
                    end
                  end _OU()game.DescendantAdded:Connect(function(_Pf)
                    if _Pf:IsA("ModuleScript")and _Pf.Name=="CameraController"then task.wait(0.1)
                      if not _OQ then pcall(function()_OU()
                        end)
                      end
                    end
                  end)
                end _OI.RunService.RenderStepped:Connect(function()
                  if not getgenv().ThirdPerson.Enabled then return;
                  end;_OI.Players.LocalPlayer.CameraMode=Enum.CameraMode.Classic;
                  local _Pg=getgenv().GetLocalCharacter and(getgenv().GetLocalCharacter());
                  if not _Pg then return;
                  end;
                  local _Ph=_Pg:FindFirstChild("HumanoidRootPart")or(_Pg:FindFirstChildOfClass("BasePart"));
                  if not _Ph then return;
                  end;
                  local _Pi,_Pj=_OM.CFrame,getgenv().ThirdPerson.Distance;_OM.CFrame=CFrame.new(_Ph.Position-_Pi.LookVector*_Pj+Vector3.new(0,1.5,0))*_Pi.Rotation;
                end)_ON={}do local function _Pk(_Pl)
                    if _ON[_Pl]then return
                    end _ON[_Pl]={}
                    for _Pm,_Pn in _Pl:GetDescendants()do if _Pn:IsA("BasePart")or _Pn:IsA("MeshPart")then _ON[_Pl][_Pn]=_Pn.Transparency
                      end
                      if _Pn:IsA("Texture")then _ON[_Pl][_Pn]=_Pn.Transparency
                      end
                    end
                  end _OO=function(_Po)_Pk(_Po)
                    for _Pp,_Pq in _Po:GetDescendants()do if _Pq:IsA("BasePart")or _Pq:IsA("MeshPart")then _Pq.Transparency=1
                      end
                      if _Pq:IsA("Texture")then _Pq.Transparency=1
                      end
                    end
                  end
                end
              end do do local function _Pr(_Ps)
                    local _Pt=_ON[_Ps]
                    if not _Pt then return
                    end
                    for _Pu,_Pv in _Ps:GetDescendants()do if _Pv:IsA("BasePart")or _Pv:IsA("MeshPart")then local _Pw=_Pt[_Pv]
                        if _Pw~=nil then _Pv.Transparency=_Pw
                        end
                      end
                      if _Pv:IsA("Texture")then local _Px=_Pt[_Pv]
                        if _Px~=nil then _Pv.Transparency=_Px
                        end
                      end
                    end _ON[_Ps]=nil
                  end
                end do local function _Py(_Pz)
                    return _Pz:FindFirstChild("Left Arm")or _Pz:FindFirstChild("Right Arm")
                  end _OM.ChildAdded:Connect(function(_PA)task.wait(0.1)
                    if not _PA:IsA("Model")then return
                    end
                    if getgenv().ThirdPerson.Enabled and getgenv().ThirdPerson.RemoveArms and _Py(_PA)then _OO(_PA)
                    end
                  end)
                end
              end
            end do _OI.RunService.Heartbeat:Connect(function(...)
              end)do local _PC=_OI.camera:Toggle({title="third person",default=getgenv().ThirdPerson.Enabled,risky=false,callback=function(_PB)getgenv().ThirdPerson.Enabled=_PB
                  if _PB then _OI.Players.LocalPlayer.CameraMode=Enum.CameraMode.Classic
                  end
                end,})_PC:Keybind({title="third person",callback=function(_PD)
                  if type(_PD)=="boolean"then _PC:Set(_PD)
                  end
                end,})
                local _PE=_PC:Settings({callback=function()
                end})
                local _PF={["Default"]=false,["Kotost Car"]=114132337052745,["Backrooms Monster"]=9921746699,["Tung Sahur"]=138151705692565,}
                local _PG=getgenv().SHIZUKUSCRIPTS_PLAYER_MODEL or{selected="Default"}getgenv().SHIZUKUSCRIPTS_PLAYER_MODEL=_PG _PG.hiddenParts=_PG.hiddenParts or{}
                local function _PH()
                  local _PI=_OI.Players.LocalPlayer
                  if not _PI then return nil
                  end
                  local _PJ=_PI.Character
                  if _PJ and _PJ:FindFirstChild("HumanoidRootPart")then return _PJ
                  end
                  local _PK=workspace:FindFirstChild(_PI.Name)
                  if _PK and _PK:IsA("Model")then return _PK
                  end
                  return _PJ
                end
                local function _PL()
                  if _PG.visual then pcall(function()_PG.visual:Destroy()
                    end)
                  end _PG.visual=nil
                  for _PM,_PN in pairs(_PG.hiddenParts)do pcall(function()
                      if _PM and _PM.Parent then _PM.Transparency=_PN
                      end
                    end)
                  end _PG.hiddenParts={}
                end
                local function _PO(_PP)
                  local _PQ
                  local _PR=pcall(function()_PQ=game:GetObjects("rbxassetid://"..tostring(_PP))
                  end)
                  if(not _PR or type(_PQ)~="table"or not _PQ[1])and type(getobjects)=="function"then _PR=pcall(function()_PQ=getobjects("rbxassetid://"..tostring(_PP))
                    end)
                  end
                  if not _PR or type(_PQ)~="table"or not _PQ[1]then return nil
                  end
                  local _PS=_PQ[1]
                  local _PT=Instance.new("Model")_PT.Name="SHIZUKUSCRIPTS_PlayerModelVisual"
                  local function _PU(_PV)
                    local _PW=_PV:Clone()
                    for _PX,_PY in ipairs(_PW:GetDescendants())do if _PY:IsA("Script")or _PY:IsA("LocalScript")or _PY:IsA("ModuleScript")then _PY:Destroy()
                      end
                    end _PW.Anchored=false _PW.CanCollide=false _PW.CanTouch=false _PW.CanQuery=false _PW.Massless=true _PW.Parent=_PT
                    return _PW
                  end
                  if _PS:IsA("BasePart")then _PU(_PS)
                  else for _PZ,_Qa in ipairs(_PS:GetDescendants())do if _Qa:IsA("BasePart")then _PU(_Qa)
                      end
                    end
                  end pcall(function()_PS:Destroy()
                  end)
                  if#_PT:GetChildren()==0 then _PT:Destroy();
                    return nil
                  end
                  return _PT
                end
                local function _Qb(_Qc)_PG.selected=_Qc or "Default"_PL()
                  if _PG.selected=="Default"then return
                  end
                  local _Qd=_PH()
                  local _Qe=_Qd and _Qd:FindFirstChild("HumanoidRootPart")
                  local _Qf=_PF[_PG.selected]
                  if not _Qd or not _Qe or not _Qf then warn("[SHIZUKUSCRIPTS Player Model] Character/root or asset id unavailable")
                    return
                  end
                  local _Qg=_PO(_Qf)
                  if not _Qg then warn("[SHIZUKUSCRIPTS Player Model] Asset could not load or contains no BaseParts: "..tostring(_Qf))
                    return
                  end _Qg.Parent=_Qd
                  local _Qh={}
                  for _Qi,_Qj in ipairs(_Qg:GetDescendants())do if _Qj:IsA("BasePart")then table.insert(_Qh,_Qj)
                    end
                  end
                  local _Qk,_Ql=_Qg:GetBoundingBox()
                  local _Qm=_Qe.CFrame*CFrame.Angles(0,math.pi,0)
                  local _Qn=_Qm*CFrame.new(0,math.max(0,_Ql.Y*0.15),0)*_Qk:Inverse()
                  for _Qo,_Qp in ipairs(_Qh)do _Qp.CFrame=_Qn*_Qp.CFrame
                    local _Qq=Instance.new("WeldConstraint")_Qq.Part0=_Qe _Qq.Part1=_Qp _Qq.Parent=_Qp
                  end
                  for _Qr,_Qs in ipairs(_Qd:GetDescendants())do if _Qs:IsA("BasePart")and _Qs~=_Qe and not _Qs:IsDescendantOf(_Qg)then _PG.hiddenParts[_Qs]=_Qs.Transparency _Qs.Transparency=1
                    elseif _Qs:IsA("Decal")or _Qs:IsA("Texture")then _PG.hiddenParts[_Qs]=_Qs.Transparency _Qs.Transparency=1
                    end
                  end _PG.visual=_Qg _PG.character=_Qd
                end
                local _Qt=getgenv().SHIZUKUSCRIPTS_FREECAM or{enabled=false}getgenv().SHIZUKUSCRIPTS_FREECAM=_Qt
                local _Qu
                local function _Qv(_Qw)
                  local _Qx=game:GetService("RunService")
                  local _Qy=game:GetService("UserInputService")
                  local _Qz=workspace.CurrentCamera _Qt.enabled=_Qw
                  if _Qu then _Qu:Disconnect();_Qu=nil
                  end
                  if not _Qw then if _Qt.oldCameraType then _Qz.CameraType=_Qt.oldCameraType
                    end
                    if _Qt.oldSubject then _Qz.CameraSubject=_Qt.oldSubject
                    end
                    return
                  end _Qt.oldCameraType=_Qz.CameraType _Qt.oldSubject=_Qz.CameraSubject _Qz.CameraType=Enum.CameraType.Scriptable
                  local _QA=1.2 _Qu=_Qx.RenderStepped:Connect(function(_QB)
                    local _QC=_Qz.CFrame
                    local _QD=Vector3.zero
                    if _Qy:IsKeyDown(Enum.KeyCode.W)then _QD+=_QC.LookVector
                    end
                    if _Qy:IsKeyDown(Enum.KeyCode.S)then _QD-=_QC.LookVector
                    end
                    if _Qy:IsKeyDown(Enum.KeyCode.D)then _QD+=_QC.RightVector
                    end
                    if _Qy:IsKeyDown(Enum.KeyCode.A)then _QD-=_QC.RightVector
                    end
                    if _Qy:IsKeyDown(Enum.KeyCode.E)then _QD+=Vector3.yAxis
                    end
                    if _Qy:IsKeyDown(Enum.KeyCode.Q)then _QD-=Vector3.yAxis
                    end
                    if _QD.Magnitude>0 then _Qz.CFrame=_QC+_QD.Unit*_QA*30*_QB
                    end
                  end)
                end
                local _QE=_z.misc:Section("camera tools","right")_QE:Toggle({title="freecam (WASD / Q-E)",default=false,callback=function(_QF)_Qv(_QF==true)
                end,})
                local _QG=_z.misc:Section("player model","right")
                local _QI=_QG:Dropdown({title="player model",values={"Default","Kotost Car","Backrooms Monster","Tung Sahur"},default=_PG.selected or "Default",multi=false,callback=function(_QH)
                  if _PF[_QH]~=nil then task.spawn(_Qb,_QH)
                  end
                end,})task.defer(function()
                  local _QJ pcall(function()
                    if type(shizukuscripts_get_parent)=="function"then _QJ=shizukuscripts_get_parent()
                    elseif type(gethui)=="function"then _QJ=gethui()
                    else _QJ=game:GetService("CoreGui")
                    end
                  end)
                  if not _QJ then pcall(function()_QJ=game:GetService("CoreGui")
                    end)
                  end
                  if not _QJ then return
                  end
                  local _QK={_QJ}
                  local _QL=_QJ:FindFirstChild("SHIZUKUSCRIPTS")or _QJ:FindFirstChild("shizukuscripts")
                  if _QL then table.insert(_QK,_QL)
                  end
                  for _QM,_QN in ipairs(_QK)do if _QN then for _QO,_QP in ipairs(_QN:GetDescendants())do if _QP.Name=="Inline"or _QP.Name=="DropdownButton"or _QP.Name=="DropdownText"or _QP.Name=="DropdownImage"then _QP.ZIndex=math.max(_QP.ZIndex,40)
                          for _QQ,_QR in ipairs(_QP:GetDescendants())do if _QR:IsA("GuiObject")then _QR.ZIndex=math.max(_QR.ZIndex,41)
                            end
                          end
                        end
                      end
                    end
                  end
                end)
                if not _PG.respawnConnection then _PG.respawnConnection=_OI.Players.LocalPlayer.CharacterAdded:Connect(function()task.wait(1)
                    if _PG.selected and _PG.selected~="Default"then _Qb(_PG.selected)
                    end
                  end)
                end _PE:Slider({title="third person distance",suffix=" studs",min=1,max=50,float=1,default=getgenv().ThirdPerson.Distance,callback=function(_QS)getgenv().ThirdPerson.Distance=_QS
                end,})_PE:Toggle({title="disable on shot",default=getgenv().ThirdPerson.DisableOnShot or false,risky=false,callback=function(_QT)getgenv().ThirdPerson.DisableOnShot=_QT
                  if not _QT and getgenv().ThirdPerson._shotSuppressed then getgenv().ThirdPerson.Enabled=true
                    local _QU=false getgenv().ThirdPerson._shotSuppressed=_QU getgenv().ThirdPerson._shotDisableToken=(getgenv().ThirdPerson._shotDisableToken or 0)+1
                  end
                end,})
              end
            end _OL=_z.misc:Section("movement","left")_OL:Toggle({title="bunnyhop",default=false,risky=false,callback=function(_QV)getgenv().BS_Settings.autohop=_QV
              if _QV then _OI.fn30()
              else _OI.fn29()
              end
            end,}):Settings({callback=function()
            end})
            local _QW=nil
            local _QX=nil
            local _QY=3600
            local _QZ=getgenv().SHIZUKUSCRIPTS_SPIN_SETTINGS or{mode="Jitter",angle=75,jitter_rate=12,elapsed=0,yaw=0}
            if type(_QZ.mode)~="string"then _QZ.mode="Jitter"
            end getgenv().SHIZUKUSCRIPTS_SPIN_SETTINGS=_QZ getgenv().SHIZUKUSCRIPTS_SPIN_SPEED=_QY getgenv().SHIZUKUSCRIPTS_SPINBOT_ON=false
            local _Ra
            local _Rb={"Jitter","Up","Down","Horizontal","Random","Backwards","Sine"}
            local function _Rc()getgenv().SHIZUKUSCRIPTS_SPINBOT_ON=false
              if _QW then pcall(function()_QW:Disconnect()
                end)_QW=nil
              end pcall(function()game:GetService("RunService"):UnbindFromRenderStep("SHIZUKUSCRIPTS_SpinBot")
              end)
              if _QX then pcall(function()_QX:Destroy()
                end)_QX=nil
              end pcall(function()
                local _Rd=game:GetService("Players").LocalPlayer
                local _Re=_Rd and _Rd.Character
                local _Rf=_Re and _Re:FindFirstChildOfClass("Humanoid")
                local _Rg=_Re and _Re:FindFirstChild("HumanoidRootPart")
                if _Rf then _Rf.AutoRotate=true
                end
                if _Rg then _Rg.AssemblyAngularVelocity=Vector3.zero
                end
              end)
            end
            local function _Rh()_Rc()_QZ.elapsed=0 _QZ.yaw=0 getgenv().SHIZUKUSCRIPTS_SPINBOT_ON=true getgenv().SHIZUKUSCRIPTS_SPIN_SPEED=_QY getgenv().SHIZUKUSCRIPTS_SPIN_SETTINGS=_QZ
              local _Ri=game:GetService("Players")
              local _Rj=game:GetService("RunService")
              local function _Rk(_Rl)
                if not getgenv().SHIZUKUSCRIPTS_SPINBOT_ON then return
                end
                if type(_Rl)~="number"or _Rl~=_Rl or _Rl<=0 or _Rl>0.05 then _Rl=1/60
                end
                local _Rm=_Ri.LocalPlayer and _Ri.LocalPlayer.Character
                if not _Rm then return
                end
                local _Rn=_Rm:FindFirstChild("HumanoidRootPart")
                local _Ro=_Rm:FindFirstChildOfClass("Humanoid")
                if not _Rn then return
                end
                if _Ro then _Ro.AutoRotate=false
                end _QZ.elapsed=(_QZ.elapsed or 0)+_Rl
                local _Rp=_QZ.mode or "Horizontal"
                local _Rq=tonumber(_QY)or 2880
                if _Rq<720 then _Rq=720
                end
                if _Rq>7200 then _Rq=7200
                end getgenv().SHIZUKUSCRIPTS_SPIN_SPEED=_Rq
                local _Rr=math.rad(_Rq)*_Rl
                local _Rs=math.max(1,_QZ.jitter_rate or 12)
                if _Rp=="Jitter"then if math.sin(_QZ.elapsed*_Rs*2)<0 then _Rr=-_Rr
                  end
                elseif _Rp=="Sine"then _Rr=_Rr*math.max(0.25,math.abs(math.sin(_QZ.elapsed*6)))
                elseif _Rp=="Random"then if math.random()<0.04 then _QZ._dir=-(_QZ._dir or 1)
                  end _Rr=_Rr*(_QZ._dir or 1)
                elseif _Rp=="Up"or _Rp=="Down"then end _QZ.yaw=(_QZ.yaw or 0)+_Rr
                local _Rt=_QZ.yaw
                if _Rp=="Backwards"then _Rt=_Rt+math.pi
                end getgenv().SHIZUKUSCRIPTS_SPIN_YAW=_Rt getgenv().SHIZUKUSCRIPTS_SPIN_SETTINGS=_QZ
                local _Ru=workspace.CurrentCamera
                local _Rv=_Ru and _Ru.CFrame
                local _Rw=_Rm:FindFirstChild("HumanoidRootPart")
                if _Rw and _Rw:IsA("BasePart")then local _Rx=0
                  local _Ry=math.rad(_QZ.angle or 45)
                  if _Rp=="Up"then _Rx=-_Ry
                  elseif _Rp=="Down"then _Rx=_Ry
                  elseif _Rp=="Jitter"then _Rx=_Ry*(math.sin(_QZ.elapsed*_Rs*3)>=0 and 1 or-1)*0.35
                  elseif _Rp=="Sine"then _Rx=_Ry*math.sin(_QZ.elapsed*_Rs)*0.35
                  elseif _Rp=="Horizontal"then _Rx=0
                  end
                  local _Rz=_Rw.Position
                  local _RA=_Rw.AssemblyLinearVelocity _Rw.CFrame=CFrame.new(_Rz)*CFrame.Angles(_Rx,_Rt,0)_Rw.AssemblyLinearVelocity=_RA
                end
                local _RB=_Rm:FindFirstChild("Neck",true)
                if _RB and _RB:IsA("Motor6D")then _RB.C0=CFrame.new(_RB.C0.Position)*CFrame.Angles(0,_Rt*1.5,0)
                end
                if _Ru and _Rv then _Ru.CFrame=_Rv
                end
              end pcall(function()_Rj:BindToRenderStep("SHIZUKUSCRIPTS_SpinBot",Enum.RenderPriority.Camera.Value+5,_Rk)_QW={Disconnect=function()pcall(function()_Rj:UnbindFromRenderStep("SHIZUKUSCRIPTS_SpinBot")
                  end)
                end,}
              end)
              if not _QW then _QW=_Rj.RenderStepped:Connect(_Rk)
              end
            end _Ra=_OL:Toggle({title="anti-aim (spin)",default=false,risky=false,callback=function(_RC)
              if _RC then _Rh()
              else _Rc()
              end
            end,})
            local _RD=_Ra:Settings({callback=function()
            end})_RD:Dropdown({title="spin mode",values=_Rb,default=_QZ.mode or "Horizontal",multi=false,callback=function(_RE)
              if type(_RE)=="string"and _RE~=""then _QZ.mode=_RE getgenv().SHIZUKUSCRIPTS_SPIN_SETTINGS.mode=_RE
              end
            end,})_RD:Slider({title="spin speed",suffix=" \194\176/s",min=720,max=7200,float=1,default=_QY,callback=function(_RF)_QY=_RF getgenv().SHIZUKUSCRIPTS_SPIN_SPEED=_RF
            end,})_RD:Slider({title="pitch angle",suffix=" \194\176",min=5,max=180,float=1,default=_QZ.angle or 75,callback=function(_RG)_QZ.angle=_RG getgenv().SHIZUKUSCRIPTS_SPIN_SETTINGS.angle=_RG
            end,})_RD:Slider({title="jitter rate",suffix="",min=2,max=40,float=1,default=_QZ.jitter_rate or 12,callback=function(_RH)_QZ.jitter_rate=_RH getgenv().SHIZUKUSCRIPTS_SPIN_SETTINGS.jitter_rate=_RH
            end,})do local _RI=getgenv().SHIZUKUSCRIPTS_GHOST_HAND
              if type(_RI)~="table"then _RI={enabled=false,color=Color3.fromRGB(80,220,255),transparency=0.15,hide_arms=true,_conn=nil,_applied={},}getgenv().SHIZUKUSCRIPTS_GHOST_HAND=_RI
              end
              local function _RJ(_RK)
                if not _RK or not _RK:IsA("BasePart")then return
                end
                if _RI._applied[_RK]then return
                end _RI._applied[_RK]={Color=_RK.Color,Material=_RK.Material,Transparency=_RK.Transparency,LocalTransparencyModifier=_RK.LocalTransparencyModifier,}_RK.Material=Enum.Material.Neon _RK.Color=_RI.color _RK.Transparency=_RI.transparency pcall(function()_RK.LocalTransparencyModifier=0
                end)
                local _RL=_RK:FindFirstAncestorOfClass("Model")
                if _RL and not _RL:FindFirstChild("SHIZUKUSCRIPTS_GhostHL")then local _RM=Instance.new("Highlight")_RM.Name="SHIZUKUSCRIPTS_GhostHL"_RM.FillColor=_RI.color _RM.OutlineColor=Color3.fromRGB(180,240,255)_RM.FillTransparency=0.55 _RM.OutlineTransparency=0.2 _RM.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop _RM.Parent=_RL
                end
              end
              local function _RN()
                for _RO,_RP in pairs(_RI._applied)do if _RO and _RO.Parent then pcall(function()_RO.Color=_RP.Color _RO.Material=_RP.Material _RO.Transparency=_RP.Transparency _RO.LocalTransparencyModifier=_RP.LocalTransparencyModifier or 0
                    end)
                  end _RI._applied[_RO]=nil
                end pcall(function()
                  local _RQ=workspace.CurrentCamera
                  if _RQ then for _RR,_RS in ipairs(_RQ:GetDescendants())do if _RS.Name=="SHIZUKUSCRIPTS_GhostHL"then _RS:Destroy()
                      end
                    end
                  end
                  local _RT=game:GetService("Players").LocalPlayer
                  local _RU=_RT and _RT.Character
                  if _RU then for _RV,_RW in ipairs(_RU:GetDescendants())do if _RW.Name=="SHIZUKUSCRIPTS_GhostHL"then _RW:Destroy()
                      end
                    end
                  end
                end)
              end
              local function _RX()
                if not _RI.enabled then return
                end
                local _RY=workspace.CurrentCamera
                local _RZ=game:GetService("Players").LocalPlayer
                local _Sa=_RZ and _RZ.Character
                if _RY then for _Sb,_Sc in ipairs(_RY:GetDescendants())do if _Sc:IsA("BasePart")then local _Sd=string.lower(_Sc.Name)
                      if _Sd:find("hand")or _Sd:find("arm")or _Sd:find("glove")then if _RI.hide_arms then _Sc.LocalTransparencyModifier=1 _Sc.Transparency=1
                        end
                      elseif _Sd:find("knife")or _Sd:find("blade")or _Sd:find("weapon")or _Sd:find("gun")or _Sd:find("tool")or _Sd:find("mesh")then _RJ(_Sc)
                      else if _Sc.Size.Magnitude<4 and _Sc.Transparency<0.9 then local _Se=_Sc:FindFirstAncestorOfClass("Model")
                          if _Se and(_Se.Name:lower():find("view")or _Se.Name:lower():find("weapon")or _Se.Name:lower():find("knife")or _Se.Name:lower():find("arm"))then if _Sd:find("hand")or _Sd:find("arm")then if _RI.hide_arms then _Sc.Transparency=1
                              end
                            else _RJ(_Sc)
                            end
                          end
                        end
                      end
                    end
                  end
                end
                if _Sa then for _Sf,_Sg in ipairs(_Sa:GetDescendants())do if _Sg:IsA("Tool")or _Sg:IsA("Model")then local _Sh=string.lower(_Sg.Name)
                      if _Sh:find("knife")or _Sh:find("weapon")or _Sh:find("gun")or _Sg:IsA("Tool")then for _Si,_Sj in ipairs(_Sg:GetDescendants())do if _Sj:IsA("BasePart")then local _Sk=string.lower(_Sj.Name)
                            if _RI.hide_arms and(_Sk:find("hand")or _Sk:find("arm"))then _Sj.Transparency=1
                            else _RJ(_Sj)
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end function _RI:set(_Sl)self.enabled=_Sl==true
                if self._conn then self._conn:Disconnect()self._conn=nil
                end
                if self.enabled then local _Sm=0 self._conn=game:GetService("RunService").Heartbeat:Connect(function()
                    local _Sn=tick()
                    if _Sn-_Sm<0.08 then return
                    end _Sm=_Sn _RX()
                  end)_RX()
                else _RN()
                end
              end _OL:Toggle({title="ghost hand",default=false,risky=false,callback=function(_So)_RI:set(_So==true)
              end,}):Colorpicker({title="ghost color",default=Color3.fromRGB(80,220,255),transparency=0.15,callback=function(_Sp,_Sq)_RI.color=_Sp
                if type(_Sq)=="number"then _RI.transparency=math.clamp(_Sq,0,0.8)
                end
                for _Sr in pairs(_RI._applied)do if _Sr and _Sr.Parent then _Sr.Color=_RI.color _Sr.Transparency=_RI.transparency
                  end
                end
              end,})
            end _OL:Toggle({title="airstrafe",default=false,callback=function(_Ss)getgenv().BS_Settings.strafe=_Ss
            end,})do local _St=false
              local _Su=60
              local _Sv
              local _Sw=1
              local _Sx=0
              local function _Sy()
                if _Sv then _Sv:Disconnect()_Sv=nil
                end
              end
              local function _Sz()_Sy()
                local _SA=game:GetService("RunService")
                local _SB=game:GetService("Players")_Sv=_SA.RenderStepped:Connect(function(_SC)
                  if not _St then return
                  end
                  local _SD=_SB.LocalPlayer
                  local _SE=_SD and _SD.Character
                  local _SF=_SE and _SE:FindFirstChildOfClass("Humanoid")
                  local _SG=_SE and _SE:FindFirstChild("HumanoidRootPart")
                  local _SH=workspace.CurrentCamera
                  if not _SF or not _SG or not _SH then return
                  end
                  local _SI=_SF:GetState()
                  local _SJ=_SI==Enum.HumanoidStateType.Freefall or _SI==Enum.HumanoidStateType.Jumping
                  if not _SJ then return
                  end _Sx+=_SC
                  if _Sx>=0.12 then _Sx=0 _Sw=-_Sw
                  end
                  local _SK=_SH.CFrame.RightVector
                  local _SL=Vector3.new(_SK.X,0,_SK.Z)
                  if _SL.Magnitude<=0 then return
                  end _SL=_SL.Unit
                  local _SM=_SL*_Sw
                  local _SN=_SG.AssemblyLinearVelocity
                  local _SO=_SM*_Su
                  local _SP=math.clamp(_SC*10,0,1)_SG.AssemblyLinearVelocity=Vector3.new(_SN.X+(_SO.X-_SN.X)*_SP,_SN.Y,_SN.Z+(_SO.Z-_SN.Z)*_SP)
                end)
              end
              local _SR=_OL:Toggle({title="auto strafe",default=false,risky=false,callback=function(_SQ)_St=_SQ
                if _SQ then _Sz()
                else _Sy()
                end
              end,}):Settings({callback=function()
              end})_SR:Slider({title="strafe speed",suffix=" studs/s",min=10,max=150,float=1,default=60,callback=function(_SS)_Su=_SS
              end,})
            end do local _SU=_OL:Toggle({title="fakelag",default=false,risky=false,callback=function(_ST)getgenv().Settings.fakeLag.enabled=_ST
              end,})_SU:Keybind({title="fake lag",callback=function(_SV)
                if type(_SV)=="boolean"then _SU:Set(_SV)
                end
              end,})
            end
          end do do local _SX=_OL:Toggle({title="show position",default=false,risky=false,callback=function(_SW)getgenv().Settings.fakeLag.fakechar=_SW
              end,}):Settings({callback=function()
              end})_SX:Colorpicker({title="color",default=Color3.fromRGB(255,155,255),transparency=1,callback=function(_SY,_SZ)getgenv().Settings.fakeLag.fakecharColor=_SY
                local _Ta=1-_SZ getgenv().Settings.fakeLag.fakecharTransparency=_Ta
              end,})_SX:Dropdown({title="material",values={"Neon","Glass","Metal","SmoothPlastic","Marble",},default="Neon",multi=false,callback=function(_Tb)getgenv().Settings.fakeLag.fakecharMaterial=_Tb
              end,})_SX:Slider({title="strength",min=0,max=5,float=1,default=5,callback=function(_Tc)getgenv().Settings.fakeLag.strength=_Tc
              end,})_SX:Toggle({title="only thirdperson",default=false,callback=function(_Td)getgenv().Settings.fakeLag.onlyThirdPerson=_Td
              end,})
            end do local _Te={}do if not _x then return
                end _Te.NetworkClient=game:GetService("NetworkClient")do local _Tf=game:GetService("Players").LocalPlayer _Te.Workspace=game:GetService("Workspace")_Te.n32=0 _Te.createFolder=function()
                    local _Tg=_Te.Workspace:FindFirstChild("_securefolder")
                    if _Tg then return _Tg
                    end
                    local _Th=Instance.new("Folder",_Te.Workspace)_Th.Name="_securefolder"
                    return _Th
                  end _Te.fn36=function()
                    local _Ti=_Te.Workspace:FindFirstChild("Characters")
                    local _Tj=_Tf.Character or _Ti and _Ti:FindFirstChild(_Tf.Name)
                    if not _Tj then return false
                    end
                    local _Tk=_Tj:FindFirstChildOfClass("Humanoid")
                    if _Tk then return _Tk.Health>0
                    end
                    local _Tl=_Tj:FindFirstChild("HumanoidRootPart")
                    local _Tm=_Tj:GetAttribute("Health")or _Tl and _Tl:GetAttribute("Health")
                    if _Tm~=nil then return _Tm>0
                    end
                    return _Tl~=nil
                  end
                end
              end do local function _Tn(_To,_Tp)
                  local _Tq=Instance.new("Model",_To)_Tq.Name=_Tp
                  local _Tr=getgenv().GetLocalCharacter and getgenv().GetLocalCharacter()
                  if not _Tr then return _Tq
                  end
                  local _Ts=getgenv().Settings.fakeLag
                  local _Tt=Enum.Material[_Ts.fakecharMaterial or "Neon"]or Enum.Material.Neon
                  local _Tu=_Ts.fakecharColor or Color3.fromRGB(255,155,255)
                  local _Tv=_Ts.fakecharTransparency or 0
                  for _Tw,_Tx in _Tr:GetDescendants()do if _Tx:IsA("BasePart")and _Tx.Name~="HumanoidRootPart"then local _Ty=_Tx:Clone()_Ty.CanCollide=false _Ty.Parent=_Tq _Tx.CanQuery=false _Ty.Anchored=true _Ty.Color=_Tu _Ty.Material=_Tt _Ty.Transparency=_Tv _Ty.Reflectance=0 _Ty.CollisionGroup="Smoke"
                      if _Ty:IsA("MeshPart")then _Ty.TextureID=""
                      end
                      for _Tz,_TA in _Ty:GetChildren()do if _TA:IsA("SpecialMesh")then _TA.TextureId=""
                        else _TA:Destroy()
                        end
                      end
                    end
                  end
                  return _Tq
                end task.spawn(function()
                  while task.wait(0.05)do local _TB=getgenv().Settings.fakeLag
                    if _TB then local _TC=_TB.strength or 12 _Te.n32=math.clamp(_Te.n32+1,0,_TC)
                      if _TB.enabled and _Te.fn36()then if _Te.n32>=_TC then _Te.NetworkClient:SetOutgoingKBPSLimit(9e9)
                          local _TD=_Te.createFolder()
                          local _TE=_TD:FindFirstChild("FakeChar2")
                          if _TE then _TE:Destroy()
                          end _Te.n32=0
                          if _TB.fakechar and(not _TB.onlyThirdPerson or getgenv().ThirdPerson and getgenv().ThirdPerson.Enabled)then _Tn(_TD,"FakeChar2")
                          end
                        else _Te.NetworkClient:SetOutgoingKBPSLimit(1)
                        end
                      else local _TF=_Te.Workspace:FindFirstChild("_securefolder")
                        if _TF then local _TG=_TF:FindFirstChild("FakeChar2")
                          if _TG then _TG:Destroy()
                          end
                        end _Te.NetworkClient:SetOutgoingKBPSLimit(9e9)
                      end
                    end
                  end
                end)
              end
            end
          end
        end do local _TH do _z.v85=players_tab:Section("hit effects","right")do local _TI=game:GetService("Players")_TH=game:GetService("SoundService")_OJ=game:GetService("RunService")_OK=game:GetService("CoreGui")game:GetService("Workspace")_OI.localPlayer2=_TI.LocalPlayer
            end
          end do local _TJ=nil pcall(function()writefile("smallest_pixel.ttf",game:HttpGet("https://github.com/f1nobe7650/Nebula/raw/refs/heads/main/fs-tahoma-8px.ttf"))
              local _TK={name="SmallestPixel7",faces={{name="Regular",weight=Enum.FontWeight.Light,style="Normal",assetId=getcustomasset("smallest_pixel.ttf"),},},}writefile("fontface.font",game:GetService("HttpService"):JSONEncode(_TK))
              local _TL=Enum.FontWeight.Light _TJ=Font.new(getcustomasset("fontface.font"),_TL)
            end)
            if not _TJ then _TJ=Font.new _TJ=_TJ("rbxasset://fonts/families/TitilliumWeb.json",Enum.FontWeight.Regular)
            end
          end _z.tbl17={Neverlose="8679627751",Primordial="97511223764004",Rifk7="76064874887167",Bameware="3124331820",Fatality="115982072912004",Pop="140515349341063",Pop2="132948338000932",Bubble="5852470908",Bubble2="77120543307812",BitchBot="5709456554",BitchBotBody="3744371342",Csgo="7269900245",OSU="7147454322",Rust="3744371091",Ding="8462659577",MinecraftHit="4018616850",MinecraftXP="105481174280038",MinecraftHurt="105332058",MinecraftBreak="12222216",MinecraftBow="12222208",MinecraftClick="12222059",MinecraftDoor="12222225",MinecraftExplode="12222243",MinecraftSplash="12222255",Bonk="3765682170",Bruh="2806629530",VineBoom="6332571019",Oof="1785144325",WindowsXP="1548269085",WindowsError="142376088",MLGAirhorn="2119341039",Headshot="3041740404",Quake="160210445",TF2Crit="296102734",TF2Hit="3445786213",CodHit="3041740404",Bell="9114221281",Click="6895079853",Laser="6026984224",Swoosh="9113849754",Punch="9119571589",Bass="1846522898",Coin="131961136",LevelUp="3415632583",Notification="4590662766",Beep="138081500",Metal="9114226952",Glass="9113889127",Whoosh="9114226952",Killstreak="2868332143",Skeet="5356707489",Fart="130777214",MinecraftEat="12222235",MinecraftStep="12221967",MinecraftAnvil="12222054",}getgenv().HitVisualsConfig={SoundEnabled=false,SoundId="rbxassetid://4018616850",Volume=4,HitOverlay=false,HitOverlayColor=Color3.fromRGB(100,200,250),HitOverlayTransparency=1,HitInfo=false,HitInfoColor=Color3.fromRGB(255,255,255),HitInfoDataColor=Color3.fromRGB(55,255,55),HitInfoDataTransparency=1,HitInfoPosition="center",HitInfoDuration=1.5,Hitmarker=false,HitmarkerColor=Color3.fromRGB(255,170,170),HitmarkerTransparency=1,HitmarkerModes={"Screen"},HitmarkerDuration=1,HitSkeleton=false,HitSkeletonColor=Color3.fromRGB(255,255,255),HitSkeletonTransparency=1,HitSkeletonDuration=2,HitParticles=false,HitParticlesColorStart=Color3.fromRGB(255,255,255),HitParticlesColorEnd=Color3.fromRGB(255,100,100),HitParticlesEndTransparency=1,HitParticlesDuration=5,}_OI.fn31=function()
            local _TM=getgenv().HitVisualsConfig
            if not _TM.SoundEnabled then return
            end
            local _TN=Instance.new("Sound")_TN.SoundId=_TM.SoundId
            local _TO=tonumber(_TM.Volume)or 1
            if _TO>10 then _TO=_TO/100
            end _TN.Volume=math.clamp(_TO,0,10)_TN.RollOffMode=Enum.RollOffMode.Linear _TN.RollOffMaxDistance=100000 _TN.EmitterSize=100000 _TN.Parent=_TH _TN:Play()_TN.Ended:Connect(function()_TN:Destroy()
            end)
          end
        end do local _TP=Instance.new("ScreenGui")_TP.ResetOnSpawn=false _TP.IgnoreGuiInset=true _TP.ZIndexBehavior=Enum.ZIndexBehavior.Global _TP.Parent=_OK
          local _TQ=Instance.new("ImageLabel")_TQ.Name="HitOverlay"_TQ.Size=UDim2.new(1,0,1,0)_TQ.BackgroundTransparency=1 _TQ.Image="rbxassetid://105567484364046"_TQ.ImageTransparency=1 _TQ.ZIndex=10 _TQ.Parent=_TP
        end
      end
      local _TR do do do do local _TS=0 _OJ.RenderStepped:Connect(function(...)
              end)_OI.fn33=function()
                if not getgenv().HitVisualsConfig.HitOverlay then return
                end
                local _TT=0.1 _TS=tick()+_TT
              end
            end do local _TU=Instance.new("ScreenGui")_TU.ResetOnSpawn=false _TU.IgnoreGuiInset=true _TU.ZIndexBehavior=Enum.ZIndexBehavior.Global _TU.Parent=_OK
            end
          end do local _TV do _TV={}
              local function _TW(_TX)
                local _TY=math.floor(_TX.R*255)
                local _TZ=math.floor(_TX.G*255)
                local _Ua=math.floor(_TX.B*255)
                return string.format("<font color=\"rgb(%d, %d, %d)\">",_TY,_TZ,_Ua)
              end
            end
            local function _Ub(_Uc)
              local _Ud=getgenv().HitVisualsConfig
              local _Ue=workspace.CurrentCamera
              local _Uf=_Ue.ViewportSize
              if _Ud.HitInfoPosition=="bottom"then return Vector2.new(_Uf.X/2,_Uf.Y-86)
              end
              if _Ud.HitInfoPosition=="target"then if _Uc and _Uc.Parent then local _Ug=_Uc:FindFirstChild("Head")or _Uc:FindFirstChild("HumanoidRootPart")or _Uc:FindFirstChildWhichIsA("BasePart")
                  if _Ug then local _Uh,_Ui=_Ue:WorldToViewportPoint(_Ug.Position)
                    if _Ui and _Uh.Z>0 then return Vector2.new(_Uh.X,_Uh.Y)
                    end
                  end
                end
                return Vector2.new(_Uf.X/2,_Uf.Y/2-60)
              end
              return Vector2.new(_Uf.X/2,_Uf.Y/2-60)
            end _OJ.RenderStepped:Connect(function(...)
            end)_OI.fn32=function(_Uj,_Uk,_Ul)
              if not getgenv().HitVisualsConfig.HitInfo then return
              end table.insert(_TV,{playerName=_Uj,hitPart=_Uk,character=_Ul})
            end
          end
        end do local _Um,_Un do _Um=Drawing.new do local _Uo=2 _TR={}_Un={}
              local _Up={Vector2.new(-_Uo,-_Uo),Vector2.new(-3,-3)}
              local _Uq={Vector2.new(3,3),Vector2.new(_Uo,_Uo)}
              local _Ur={Vector2.new(_Uo,-_Uo),Vector2.new(3,-3)}
              local _Us={Vector2.new(-3,3),Vector2.new(-_Uo,_Uo)}_Un[1]=_Up _Un[2]=_Uq _Un[3]=_Ur _Un[4]=_Us
            end
          end
          local function _Ut()
            local _Uu={}
            local _Uv={}
            for _Uw=1,4 do local _Ux=_Um("Line")_Ux.Thickness=3 _Ux.Color=Color3.fromRGB(0,0,0)_Ux.Transparency=1 _Ux.ZIndex=499 _Ux.Visible=false _Uu[_Uw]=_Ux
              local _Uy=_Um("Line")_Uy.Thickness=1.2 _Uy.Color=getgenv().HitVisualsConfig.HitmarkerColor _Uy.Transparency=1 _Uy.ZIndex=500 _Uy.Visible=false _Uv[_Uw]=_Uy
            end
            return{o=_Uu,t=_Uv,Hide=function(_Uz)
              for _UA=1,4 do _Uz.o[_UA].Visible=false _Uz.t[_UA].Visible=false
              end
            end,DrawAt=function(_UB,_UC,_UD,_UE,_UF)
              for _UG=1,4 do local _UH=_Un[_UG]
                local _UI=Vector2.new(_UC+_UH[1].X,_UD+_UH[1].Y)
                local _UJ=Vector2.new(_UC+_UH[2].X,_UD+_UH[2].Y)_UB.o[_UG].From=_UI _UB.o[_UG].To=_UJ _UB.t[_UG].From=_UI _UB.t[_UG].To=_UJ _UB.o[_UG].Visible=true _UB.t[_UG].Visible=true _UB.o[_UG].Transparency=_UE _UB.t[_UG].Transparency=_UE _UB.t[_UG].Color=_UF
              end
            end,Remove=function(_UK)
              for _UL=1,5 do _UK.o[_UL]:Remove()_UK.t[_UL]:Remove()
              end
            end,}
          end
        end
      end do _OJ.RenderStepped:Connect(function(...)
        end)_OI.fn35=function(_UM)
          local _UN=getgenv().HitVisualsConfig
          local _UO=tick()table.insert(_TR,{startTime=_UO,endTime=_UO+math.clamp(_UN.HitmarkerDuration or 1,0.1,5),worldPos=_UM,sets={},})
        end do local _UP={{"Head","UpperTorso"},{"UpperTorso","LowerTorso"},{"UpperTorso","LeftUpperArm"},{"LeftUpperArm","LeftLowerArm"},{"LeftLowerArm","LeftHand"},{"UpperTorso","RightUpperArm"},{"RightUpperArm","RightLowerArm"},{"RightLowerArm","RightHand"},{"LowerTorso","LeftUpperLeg"},{"LeftUpperLeg","LeftLowerLeg"},{"LeftLowerLeg","LeftFoot"},{"LowerTorso","RightUpperLeg"},{"RightUpperLeg","RightLowerLeg"},{"RightLowerLeg","RightFoot"},}
          local _UQ={}
          local function _UR(_US)
            local _UT={}
            for _UU,_UV in ipairs(_UP)do local _UW=_US:FindFirstChild(_UV[1])
              local _UX=_US:FindFirstChild(_UV[2])
              if _UW and _UX and _UW:IsA("BasePart")and _UX:IsA("BasePart")then table.insert(_UT,{aPos=_UW.Position,bPos=_UX.Position})
              end
            end
            return _UT
          end _OI.fn34=function(_UY)
            local _UZ=getgenv().HitVisualsConfig
            if not _UZ.HitSkeleton then return
            end
            local _Va=_UR(_UY)
            if#_Va==0 then return
            end
            local _Vb={}
            for _Vc,_Vd in ipairs(_Va)do local _Ve=Drawing.new("Line")_Ve.Thickness=2.5 _Ve.Color=Color3.fromRGB(0,0,0)_Ve.Transparency=1 _Ve.ZIndex=498 _Ve.Visible=false
              local _Vf=Drawing.new("Line")_Vf.Thickness=1.2 _Vf.Color=_UZ.HitSkeletonColor _Vf.Transparency=1 _Vf.ZIndex=499 _Vf.Visible=false table.insert(_Vb,{outline=_Ve,line=_Vf,aPos=_Vd.aPos,bPos=_Vd.bPos})
            end table.insert(_UQ,{lines=_Vb,startTime=tick(),duration=_UZ.HitSkeletonDuration})
          end _OJ.RenderStepped:Connect(function()
            local _Vg,_Vh,_Vi=tick(),workspace.CurrentCamera,getgenv().HitVisualsConfig;
            local _Vj=_Vi.HitSkeletonTransparency;
            for _Vk=#_UQ,1,-1 do local _Vl=_UQ[_Vk];
              local _Vm=(_Vg-_Vl.startTime)/_Vl.duration;
              if _Vm>=1 then for _Vn,_Vo in ipairs(_Vl.lines)do _Vo.line:Remove();_Vo.outline:Remove();
                end;table.remove(_UQ,_Vk);continue;
              end;_Vk=1-_Vm;
              for _Vp,_Vq in ipairs(_Vl.lines)do _Vm,_Vp=_Vh:WorldToViewportPoint(_Vq.aPos);
                local _Vr,_Vs=_Vh:WorldToViewportPoint(_Vq.bPos);
                if _Vp and _Vs then local _Vt,_Vu=Vector2.new(_Vm.X,_Vm.Y),Vector2.new(_Vr.X,_Vr.Y);_Vq.line.From=_Vt;_Vq.line.To=_Vu;_Vq.line.Transparency=_Vj*_Vk;_Vq.line.Color=_Vi.HitSkeletonColor;_Vq.line.Visible=true;_Vq.outline.From=_Vt;_Vq.outline.To=_Vu;_Vq.outline.Transparency=_Vj*_Vk;_Vq.outline.Visible=true;
                else _Vq.line.Visible=false;_Vq.outline.Visible=false;
                end;
              end;
            end;
          end)
        end
      end
    end
    local _Vv do local _Vw do _Vw={}do local _Vx=false
          local function _Vy()
            if _Vx then return
            end _Vx=true
            local _Vz=Instance.new("Attachment")
            local _VA=Instance.new("ParticleEmitter")_VA.Name="Bubble"_VA.Brightness=1 _VA.LightEmission=0.55 _VA.LightInfluence=0 _VA.Orientation=Enum.ParticleOrientation.FacingCamera _VA.Texture="rbxassetid://9295449811"_VA.ZOffset=1
            local _VB=ColorSequenceKeypoint.new
            local _VC=Color3.fromRGB _VA.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),_VB(1,_VC(255,100,100))})
            local _VD=NumberSequenceKeypoint.new _VA.Size=NumberSequence.new({NumberSequenceKeypoint.new(0,1),_VD(1,1)})
            local _VE=NumberSequence.new
            local _VF={}
            local _VG=NumberSequenceKeypoint.new(0,1)
            local _VH=NumberSequenceKeypoint.new(0.503,0)
            local _VI=NumberSequenceKeypoint.new(0.926,0.0109)
            local _VJ=NumberSequenceKeypoint.new _VF[1]=_VG _VF[2]=_VH _VF[3]=_VI do local _VK=table.pack(_VJ(1,1))table.move(_VK,1,_VK.n,4,_VF)
            end _VA.Transparency=_VE(_VF)_VA.EmissionDirection=Enum.NormalId.Top _VA.Rate=100 _VA.Lifetime=NumberRange.new(1,1)_VA.Speed=NumberRange.new(50,60)_VA.SpreadAngle=Vector2.new(-90,90)_VA.Rotation=NumberRange.new(-12,12)_VA.RotSpeed=NumberRange.new(-360,-360)_VA.Shape=Enum.ParticleEmitterShape.Disc _VA.ShapeInOut=Enum.ParticleEmitterShapeInOut.InAndOut _VA.ShapePartial=1 _VA.ShapeStyle=Enum.ParticleEmitterShapeStyle.Volume _VA.FlipbookLayout=Enum.ParticleFlipbookLayout.Grid4x4 _VA.FlipbookMode=Enum.ParticleFlipbookMode.OneShot _VA.FlipbookStartRandom=false _VA.WindAffectsDrag=true _VA.Drag=1 _VA.TimeScale=1 _VA.VelocityInheritance=0 _VA.LockedToPart=false _VA.Acceleration=Vector3.new(0,0,0)_VA.Enabled=false _VA.Parent=_Vz _Vw.Bubble=_Vz
            local _VL=Instance.new("Attachment")
            local _VM=Instance.new("ParticleEmitter")_VM.Name="Dots1"_VM.LightEmission=1 _VM.Color=ColorSequence.new(Color3.fromRGB(255,255,255))_VM.LockedToPart=false _VM.ZOffset=10 _VM.Texture="rbxassetid://7216849075"_VM.VelocitySpread=360
            local _VN=NumberSequence.new
            local _VO={}
            local _VP=NumberSequenceKeypoint.new(0,0)
            local _VQ=NumberSequenceKeypoint.new(0.5,0.1)
            local _VR=NumberSequenceKeypoint.new
            local _VS=1 _VO[1]=_VP _VO[2]=_VQ do local _VT=table.pack(_VR(_VS,0.8))table.move(_VT,1,_VT.n,3,_VO)
            end _VM.Transparency=_VN(_VO)_VM.Lifetime=NumberRange.new(0.5,2)_VM.Speed=NumberRange.new(1,150)_VM.SpreadAngle=Vector2.new(360,-360)_VM.Rate=60
            local _VU=NumberSequence.new
            local _VV={}
            local _VW=NumberSequenceKeypoint.new(0,0.1)
            local _VX=NumberSequenceKeypoint.new(0.428,0.3)
            local _VY=NumberSequenceKeypoint.new _VV[1]=_VW _VV[2]=_VX do local _VZ=table.pack(_VY(1,0.05))table.move(_VZ,1,_VZ.n,3,_VV)
            end _VM.Size=_VU(_VV)_VM.Rotation=NumberRange.new(0,360)_VM.RotSpeed=NumberRange.new(-90,90)_VM.Enabled=false _VM.Parent=_VL
            local _Wa=Instance.new("ParticleEmitter")_Wa.Name="Dots2"_Wa.LightEmission=1 _Wa.Color=ColorSequence.new(Color3.fromRGB(255,255,255))_Wa.LockedToPart=false _Wa.ZOffset=2 _Wa.Texture="rbxassetid://7216849075"_Wa.VelocitySpread=360
            local _Wb=NumberSequence.new
            local _Wc={}
            local _Wd=NumberSequenceKeypoint.new(0,0)
            local _We=NumberSequenceKeypoint.new(0.5,0.05)
            local _Wf=NumberSequenceKeypoint.new _Wc[1]=_Wd _Wc[2]=_We do local _Wg=table.pack(_Wf(1,0.7))table.move(_Wg,1,_Wg.n,3,_Wc)
            end _Wa.Transparency=_Wb(_Wc)_Wa.Lifetime=NumberRange.new(0.8,2.5)_Wa.Speed=NumberRange.new(1,120)_Wa.SpreadAngle=Vector2.new(360,-360)_Wa.Rate=100
            local _Wh=NumberSequence.new
            local _Wi={}
            local _Wj=NumberSequenceKeypoint.new(0,0.1)
            local _Wk=NumberSequenceKeypoint.new(0.3,1)
            local _Wl=NumberSequenceKeypoint.new(0.6,0.8)
            local _Wm=NumberSequenceKeypoint.new _Wi[1]=_Wj _Wi[2]=_Wk _Wi[3]=_Wl do local _Wn=table.pack(_Wm(1,0.2))table.move(_Wn,1,_Wn.n,4,_Wi)
            end _Wa.Size=_Wh(_Wi)_Wa.Rotation=NumberRange.new(0,360)_Wa.RotSpeed=NumberRange.new(-120,120)_Wa.Orientation=Enum.ParticleOrientation.FacingCamera _Wa.Enabled=false _Wa.Parent=_VL _Vw.Dots=_VL
          end _Vy()
        end
      end do do local function _Wo(_Wp)
            local _Wq=getgenv().HitVisualsConfig
            if not _Wq.HitParticles then return
            end
            local _Wr=_Wp:FindFirstChild("HumanoidRootPart")
            if not _Wr then return
            end
            local _Ws=_Wr.Position
            local _Wt=_Wq.HitParticlesDuration/5
            local _Wu=Instance.new("Part")_Wu.Name="HitParticlesHolder"_Wu.Anchored=true _Wu.CanCollide=false _Wu.Transparency=1 _Wu.Size=Vector3.new(1,1,1)_Wu.CFrame=CFrame.new(_Ws)_Wu.Parent=workspace.Terrain
            for _Wv,_Ww in ipairs({"Bubble","Dots"})do local _Wx=_Vw[_Ww]
              if _Wx then local _Wy=_Wx:Clone()
                local _Wz=_Wy:FindFirstChildOfClass("Attachment")or _Wy
                local _WA={}
                for _WB,_WC in pairs(_Wy:GetDescendants())do if _WC:IsA("ParticleEmitter")then table.insert(_WA,{emitter=_WC,originalTransparency=_WC.Transparency,originalRate=_WC.Rate,originalLifetime=_WC.Lifetime,originalSize=_WC.Size,originalSpeed=_WC.Speed,})
                    local _WD=_Wq.HitParticlesColorStart
                    local _WE=_Wq.HitParticlesColorEnd
                    if _WD and _WE then if _Ww=="Bubble"then local _WF=ColorSequenceKeypoint.new _WC.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,_WD),_WF(1,_WE)})
                      else local _WG=ColorSequence.new
                        local _WH={}
                        local _WI=ColorSequenceKeypoint.new(0,_WD)
                        local _WJ=ColorSequenceKeypoint.new(0.5,Color3.new((_WD.R+_WE.R)/2,(_WD.G+_WE.G)/2,(_WD.B+_WE.B)/2))
                        local _WK=ColorSequenceKeypoint.new _WH[1]=_WI _WH[2]=_WJ do local _WL=table.pack(_WK(1,_WE))table.move(_WL,1,_WL.n,3,_WH)
                        end _WC.Color=_WG(_WH)
                      end
                    end
                    if _WC.Lifetime then local _WM=_WC.Lifetime _WC.Lifetime=NumberRange.new(_WM.Min*_Wt,_WM.Max*_Wt)
                    end _WC.Enabled=true
                    if _WC.Parent~=_Wz then _WC.Parent=_Wz
                    end
                    if _Ww=="Dots"then _WC.LightEmission=0.9 _WC.Brightness=1.5
                    end
                  end
                end _Wz.Position=Vector3.new(0,0,0)_Wz.Parent=_Wu task.spawn(function()
                  local _WN=1.5*_Wt
                  if _Ww=="Bubble"then _WN=1*_Wt
                  end
                  local _WO=0.5*_Wt task.wait(_WN)
                  local _WP=os.clock()
                  local _WQ=_WP+_WO
                  while os.clock()<_WQ do local _WR=(os.clock()-_WP)/_WO
                    for _WS,_WT in ipairs(_WA)do local _WU=_WT.emitter
                      if _WU and _WU.Parent then local _WV=_WT.originalRate
                        if type(_WV)=="number"then _WU.Rate=math.max(0,_WV*(1-_WR))
                        end
                        local _WW=_WT.originalTransparency
                        if _WW then if _WW.Keypoints then local _WX={}
                            for _WY,_WZ in ipairs(_WW.Keypoints)do local _Xa=math.min(1,_WZ.Value+_WR*0.8)table.insert(_WX,NumberSequenceKeypoint.new(_WZ.Time,_Xa))
                            end _WU.Transparency=NumberSequence.new(_WX)
                          else local _Xb=math.min(1,_WW+_WR)
                            local _Xc=NumberSequence.new
                            local _Xd={}
                            local _Xe=NumberSequenceKeypoint.new(0,_Xb)
                            local _Xf=NumberSequenceKeypoint.new
                            local _Xg=1 _Xd[1]=_Xe do local _Xh=table.pack(_Xf(_Xg,1))table.move(_Xh,1,_Xh.n,2,_Xd)
                            end _WU.Transparency=_Xc(_Xd)
                          end
                        end
                        if _WT.originalSize then local _Xi=1-_WR*0.5
                          local _Xj=_WT.originalSize
                          if _Xj.Keypoints then local _Xk={}
                            for _Xl,_Xm in ipairs(_Xj.Keypoints)do table.insert(_Xk,NumberSequenceKeypoint.new(_Xm.Time,_Xm.Value*_Xi))
                            end _WU.Size=NumberSequence.new(_Xk)
                          end
                        end
                        if _WT.originalSpeed then local _Xn=1-_WR*0.7
                          local _Xo=_WT.originalSpeed
                          if type(_Xo)=="table"and _Xo.Min and _Xo.Max then _WU.Speed=NumberRange.new(_Xo.Min*_Xn,_Xo.Max*_Xn)
                          end
                        end
                      end
                    end task.wait(0.05)
                  end
                  for _Xp,_Xq in ipairs(_WA)do local _Xr=_Xq.emitter
                    if _Xr and _Xr.Parent then _Xr.Enabled=false
                    end
                  end task.wait(0.2)
                  if _Wz and _Wz.Parent then _Wz:Destroy()
                  end
                end)
              end
            end task.delay(4*_Wt,function()
              if _Wu and _Wu.Parent then _Wu:Destroy()
              end
            end)
          end _Vv=function(_Xs,_Xt,_Xu,_Xv)_OI.fn31()_OI.fn33()_OI.fn35(_Xv)_OI.fn32(_Xs,_Xt,_Xu)_OI.fn34(_Xu)_Wo(_Xu)
          end
        end
      end
    end
    local _Xw=nil _Xw=function()
      local _Xx=nil
      for _Xy,_Xz in ipairs(getloadedmodules())do if _Xz.Name~="Bullet"then _Xx=nil continue
        else local _XA _XA,_Xx=pcall(require,_Xz)
          if not(_XA and _Xx and(_Xx.create or _Xx._performRaycast))then _Xx=nil continue
          end
        end break
      end
      if not _Xx then for _XB,_XC in ipairs(game:GetDescendants())do if _XC:IsA("ModuleScript")and _XC.Name=="Bullet"then local _XD,_XE=pcall(require,_XC)
            if _XD and _XE and(_XE.create or _XE._performRaycast)then _Xx=_XE break
            end
          end
        end
      end
      if not _Xx then task.delay(2,_Xw)
        return
      end
      if _Xx.create then local _XF=_Xx.create _Xx.create=function(_XG,_XH,_XI,...)
          local _XJ=table.pack(...)
          local _XK=_XF _XJ.n=4+_XJ.n-1 table.move(_XJ,1,_XJ.n,4,_XJ)_XJ[1]=_XG _XJ[2]=_XH _XJ[3]=_XI
          local _XL=_XK(table.unpack(_XJ,1,_XJ.n))
          if _XL and _XL.Hits then for _XM,_XN in ipairs(_XL.Hits)do if _XN.Instance and _XN.Instance:IsA("BasePart")then local _XO=_XN.Instance:FindFirstAncestorOfClass("Model")
                if _XO then local _XP=workspace
                  local _XQ=false
                  if _XO.Parent==_XP:WaitForChild("Characters")then _XQ=true
                  end
                  if _XQ then local _XR=_XO==_OI.localPlayer2.Character
                    if not _XR then _XR=_XO==(getgenv().GetLocalCharacter and getgenv().GetLocalCharacter())
                    end
                    if not _XR then _Vv(_XO.Name,_XN.Instance.Name,_XO,_XN.Position)break
                    end
                  end
                end
              end
            end
          end
          return _XL
        end
      end
    end _Xw()
  end
  local _XS={}do local _XT={}do local _XU={}do local _XV,_XW,_XX do local _XY={v83=_y.v83,n28=function()
            return 0
          end,tbl24={},grenadeLZActiveLineSets={}}do local _XZ={grenadeLZFadingLineSets={}}do local _Ya,_Yb,_Yc do do do do local _Ye=_z.v85:Toggle({title="hit sound",default=false,risky=false,callback=function(_Yd)getgenv().HitVisualsConfig.SoundEnabled=_Yd
                      end,}):Settings({callback=function()
                      end})_Ye:Slider({title="volume",suffix="%",min=1,max=2,float=1,default=4,callback=function(_Yf)getgenv().HitVisualsConfig.Volume=_Yf
                      end,})_Ye:Dropdown({title="HitSounds",values={"MinecraftHit","MinecraftXP","MinecraftHurt","MinecraftBreak","MinecraftBow","MinecraftClick","MinecraftDoor","MinecraftExplode","MinecraftSplash","MinecraftEat","MinecraftStep","MinecraftAnvil","Neverlose","Primordial","Rifk7","Bameware","Fatality","Pop","Pop2","Bubble","Bubble2","BitchBot","BitchBotBody","Csgo","OSU","Rust","Ding","Bonk","Bruh","VineBoom","Oof","WindowsXP","WindowsError","MLGAirhorn","Headshot","Quake","TF2Crit","TF2Hit","CodHit","Bell","Click","Laser","Swoosh","Punch","Bass","Coin","LevelUp","Notification","Beep","Metal","Glass","Killstreak","Skeet","Fart",},default="MinecraftHit",multi=false,callback=function(_Yg)
                        local _Yh=_Yg
                        if type(_Yh)=="table"then _Yh=_Yh[1]
                          if not _Yh then for _Yi,_Yj in pairs(_Yg)do if _Yj==true or type(_Yj)=="string"then _Yh=(type(_Yi)=="string"and _Yi)or _Yj break
                              end
                            end
                          end
                        end _Yh=tostring(_Yh or"")
                        local _Yk=_z.tbl17[_Yh]
                        if not _Yk then for _Yl,_Ym in pairs(_z.tbl17)do if string.lower(_Yl)==string.lower(_Yh)then _Yk=_Ym _Yh=_Yl break
                            end
                          end
                        end
                        if _Yk then getgenv().HitVisualsConfig.SoundId="rbxassetid://"..tostring(_Yk)getgenv().HitVisualsConfig.SoundName=_Yh getgenv().HitVisualsConfig.SoundEnabled=true print("[shizukuscripts] HitSound:",_Yh)pcall(function()
                            local _Yn=Instance.new("Sound")_Yn.SoundId="rbxassetid://"..tostring(_Yk)
                            local _Yo=tonumber(getgenv().HitVisualsConfig.Volume)or 50
                            if _Yo>10 then _Yo=_Yo/100
                            end _Yn.Volume=math.clamp(_Yo,0,10)_Yn.Parent=game:GetService("SoundService")game:GetService("SoundService"):PlayLocalSound(_Yn)task.delay(3,function()
                              if _Yn then _Yn:Destroy()
                              end
                            end)
                          end)
                        else warn("[shizukuscripts] HitSound not found:",_Yh,type(_Yg))
                        end
                      end,})
                    end pcall(function()_z.v85:Dropdown({title="HitSounds list",values={"MinecraftHit","MinecraftXP","MinecraftHurt","MinecraftBreak","MinecraftBow","MinecraftClick","MinecraftDoor","MinecraftExplode","MinecraftSplash","MinecraftEat","MinecraftStep","MinecraftAnvil","Neverlose","Primordial","Rifk7","Bameware","Fatality","Pop","Pop2","Bubble","Bubble2","BitchBot","BitchBotBody","Csgo","OSU","Rust","Ding","Bonk","Bruh","VineBoom","Oof","WindowsXP","WindowsError","MLGAirhorn","Headshot","Quake","TF2Crit","TF2Hit","CodHit","Bell","Click","Laser","Swoosh","Punch","Bass","Coin","LevelUp","Notification","Beep","Metal","Glass","Killstreak","Skeet","Fart",},default="MinecraftHit",multi=false,callback=function(_Yp)
                        local _Yq=_Yp
                        if type(_Yq)=="table"then _Yq=_Yq[1]
                          if not _Yq then for _Yr,_Ys in pairs(_Yp)do if _Ys==true or type(_Ys)=="string"then _Yq=(type(_Yr)=="string"and _Yr)or _Ys break
                              end
                            end
                          end
                        end _Yq=tostring(_Yq or"")
                        local _Yt=_z.tbl17[_Yq]
                        if not _Yt then for _Yu,_Yv in pairs(_z.tbl17)do if string.lower(_Yu)==string.lower(_Yq)then _Yt=_Yv;_Yq=_Yu;break
                            end
                          end
                        end
                        if _Yt then getgenv().HitVisualsConfig.SoundId="rbxassetid://"..tostring(_Yt)getgenv().HitVisualsConfig.SoundName=_Yq getgenv().HitVisualsConfig.SoundEnabled=true print("[shizukuscripts] HitSound:",_Yq)pcall(function()
                            local _Yw=Instance.new("Sound")_Yw.SoundId="rbxassetid://"..tostring(_Yt)
                            local _Yx=tonumber(getgenv().HitVisualsConfig.Volume)or 50
                            if _Yx>10 then _Yx=_Yx/100
                            end _Yw.Volume=math.clamp(_Yx,0,10)_Yw.Parent=game:GetService("SoundService")game:GetService("SoundService"):PlayLocalSound(_Yw)task.delay(3,function()
                              if _Yw then _Yw:Destroy()
                              end
                            end)
                          end)
                        end
                      end,})
                    end)_z.v85:Toggle({title="hit overlay",default=false,risky=false,callback=function(_Yy)getgenv().HitVisualsConfig.HitOverlay=_Yy
                    end,}):Colorpicker({title="hitoverlay",default=Color3.fromRGB(100,200,250),transparency=1,callback=function(_Yz,_YA)getgenv().HitVisualsConfig.HitOverlayColor=_Yz getgenv().HitVisualsConfig.HitOverlayTransparency=_YA
                    end,})do local _YC=_z.v85:Toggle({title="hit info",default=false,risky=false,callback=function(_YB)getgenv().HitVisualsConfig.HitInfo=_YB
                      end,})
                      local _YD=_YC:Settings({callback=function()
                      end})_YD:Dropdown({title="position",values={"center","target","bottom"},default="target",multi=false,callback=function(_YE)getgenv().HitVisualsConfig.HitInfoPosition=_YE
                      end,})_YD:Slider({title="duration",suffix="s",min=0.1,max=5,float=0.1,default=2,callback=function(_YF)getgenv().HitVisualsConfig.HitInfoDuration=_YF
                      end,})_YC:Colorpicker({title="hitinfo data color",default=Color3.fromRGB(55,255,55),transparency=1,callback=function(_YG,_YH)getgenv().HitVisualsConfig.HitInfoDataColor=_YG getgenv().HitVisualsConfig.HitInfoDataTransparency=_YH
                      end,})
                    end
                  end do local _YJ=_z.v85:Toggle({title="hit marker",default=false,risky=false,callback=function(_YI)getgenv().HitVisualsConfig.Hitmarker=_YI
                    end,})
                    local _YK=_YJ:Settings({callback=function()
                    end})_YK:Dropdown({title="mode",values={"Screen","World"},default="Screen",multi=true,callback=function(_YL)getgenv().HitVisualsConfig.HitmarkerModes=_YL
                    end,})_YK:Slider({title="duration",suffix="s",min=0.1,max=5,float=0.1,default=1,callback=function(_YM)getgenv().HitVisualsConfig.HitmarkerDuration=_YM
                    end,})_YJ:Colorpicker({title="hitmarker color",default=Color3.fromRGB(255,86,170),transparency=1,callback=function(_YN,_YO)getgenv().HitVisualsConfig.HitmarkerColor=_YN getgenv().HitVisualsConfig.HitmarkerTransparency=_YO
                    end,})
                  end
                end do do local _YQ=_z.v85:Toggle({title="hit skeleton",default=false,risky=false,callback=function(_YP)getgenv().HitVisualsConfig.HitSkeleton=_YP
                    end,}):Settings({callback=function()
                    end})_YQ:Colorpicker({title="hitskeleton color",default=Color3.fromRGB(255,255,255),transparency=1,callback=function(_YR,_YS)getgenv().HitVisualsConfig.HitSkeletonColor=_YR getgenv().HitVisualsConfig.HitSkeletonTransparency=_YS
                    end,})_YQ:Slider({title="duration",suffix="%",min=1,max=10,float=1,default=5,callback=function(_YT)getgenv().HitVisualsConfig.HitSkeletonDuration=_YT
                    end,})
                  end do local _YV=_z.v85:Toggle({title="hit particles",default=false,risky=false,callback=function(_YU)getgenv().HitVisualsConfig.HitParticles=_YU
                    end,}):Settings({callback=function()
                    end})_YV:Colorpicker({title="particles end color",default=Color3.fromRGB(255,100,100),transparency=1,callback=function(_YW,_YX)getgenv().HitVisualsConfig.HitParticlesColorEnd=_YW getgenv().HitVisualsConfig.HitParticlesEndTransparency=_YX
                    end,})_YV:Colorpicker({title="particles start color",default=Color3.fromRGB(255,255,255),transparency=1,callback=function(_YY,_YZ)getgenv().HitVisualsConfig.HitParticlesColorStart=_YY getgenv().HitVisualsConfig.HitParticlesStartTransparency=_YZ
                    end,})_YV:Slider({title="duration",suffix="%",min=1,max=10,float=1,default=5,callback=function(_Za)getgenv().HitVisualsConfig.HitParticlesDuration=_Za
                    end,})
                  end
                end do if _G.GrenadeLZConnection then _G.GrenadeLZConnection:Disconnect()_G.GrenadeLZConnection=nil
                  end
                  if _G.GrenadeLZSpawnConn then _G.GrenadeLZSpawnConn()_G.GrenadeLZSpawnConn=nil
                  end
                  if _G.GrenadeLZResolveConn then _G.GrenadeLZResolveConn()_G.GrenadeLZResolveConn=nil
                  end
                  if _G.GrenadeLZChildAddedConn then _G.GrenadeLZChildAddedConn:Disconnect()_G.GrenadeLZChildAddedConn=nil
                  end
                  if _G.GrenadeLZDebrisRemovedConn then _G.GrenadeLZDebrisRemovedConn:Disconnect()_G.GrenadeLZDebrisRemovedConn=nil
                  end _XY.n32=typeof(getthreadidentity)=="function"and getthreadidentity()or 8 _XZ.fn37=function(_Zb)
                    if not _Zb then return
                    end
                    if _Zb.lines then for _Zc,_Zd in ipairs(_Zb.lines)do _Zd:Remove()
                      end
                    end
                    if _Zb.pulseTween then _Zb.pulseTween:Cancel()
                    end
                    if _Zb.anchor then if typeof(setthreadidentity)=="function"then setthreadidentity(2)
                      end _Zb.anchor:Destroy()
                      if typeof(setthreadidentity)=="function"then setthreadidentity(_XY.n32)
                      end
                    end
                  end
                  if _G.GrenadeLZActiveLineSets then for _Ze,_Zf in pairs(_G.GrenadeLZActiveLineSets)do _XZ.fn37(_Zf)
                    end _G.GrenadeLZActiveLineSets=nil
                  end
                  if _G.GrenadeLZFadingLineSets then for _Zg,_Zh in pairs(_G.GrenadeLZFadingLineSets)do _XZ.fn37(_Zh)
                    end _G.GrenadeLZFadingLineSets=nil
                  end do local _Zi=game:GetService("Players")_XY.RunService=game:GetService("RunService")_XY.TweenService=game:GetService("TweenService")
                    local _Zj=game:GetService("ReplicatedStorage")_Ya=_Zi.LocalPlayer _XY.currentCamera=workspace.CurrentCamera _XY.debris=workspace:WaitForChild("Debris")_Yb=require(_Zj:WaitForChild("Shared"):WaitForChild("GrenadeSimulator"))_Yc=require(_Zj:WaitForChild("Database"):WaitForChild("Security"):WaitForChild("Remotes"))
                  end
                end
                if typeof(setthreadidentity)=="function"then setthreadidentity(_XY.n32)
                end getgenv().HETrajectory={enabledWeapons={["HE Grenade"]={enabled=true,color=Color3.fromRGB(255,62,134),icon="rbxassetid://111110976385167",gradientFrom=Color3.fromRGB(255,255,255),gradientTo=Color3.fromRGB(255,62,134),pulseColor=Color3.fromRGB(255,62,134),},["Smoke Grenade"]={enabled=true,color=Color3.fromRGB(60,106,255),icon="rbxassetid://137305344844339",gradientFrom=Color3.fromRGB(255,255,255),gradientTo=Color3.fromRGB(60,106,255),pulseColor=Color3.fromRGB(60,106,255),},Flashbang={enabled=true,color=Color3.fromRGB(157,255,0),icon="rbxassetid://132038996524430",gradientFrom=Color3.fromRGB(255,255,255),gradientTo=Color3.fromRGB(0,255,0),pulseColor=Color3.fromRGB(157,255,0),},["Decoy Grenade"]={enabled=true,color=Color3.fromRGB(0,255,0),icon="rbxassetid://81385239843859",gradientFrom=Color3.fromRGB(255,255,255),gradientTo=Color3.fromRGB(157,255,0),pulseColor=Color3.fromRGB(157,255,0),},Molotov={enabled=true,color=Color3.fromRGB(255,62,134),icon="rbxassetid://95390644612614",gradientFrom=Color3.fromRGB(255,255,255),gradientTo=Color3.fromRGB(255,62,134),pulseColor=Color3.fromRGB(255,62,134),},["Incendiary Grenade"]={enabled=true,color=Color3.fromRGB(157,255,0),icon="rbxassetid://81255981095065",gradientFrom=Color3.fromRGB(255,255,255),gradientTo=Color3.fromRGB(157,255,0),pulseColor=Color3.fromRGB(0,255,0),},},thickness=1,totalSegments=48,driftReanchorDist=4,sustainLines=true,tweenSpeed=1.5,showIcons=true,iconFollowGrenade=false,iconSize=35,gradientFrom=Color3.fromRGB(255,255,255),gradientTo=Color3.fromRGB(255,0,0),gradientSpeed=3,gradientBand=0.35,gradientMode="pingpong",pulseColor=Color3.fromRGB(255,0,0),showFuseText=true,fuseOverride={["Smoke Grenade"]=2,["Decoy Grenade"]=2,Flashbang=1.45,["HE Grenade"]=1.55,Molotov=nil,["Incendiary Grenade"]=nil,},}do local _Zk=_z.misc:Section("throwables","left")
                  local _Zt=_Zk:Toggle({title="enable",default=false,risky=false,callback=function(_Zl)getgenv().HETrajectory.enabled=_Zl
                    if not _Zl then for _Zm in pairs(_XY.tbl24)do pcall(function()_XY.tbl24[_Zm]=nil
                        end)
                      end
                      for _Zn,_Zo in pairs(_XY.grenadeLZActiveLineSets)do pcall(_XZ.fn37,_Zo)
                      end
                      for _Zp,_Zq in pairs(_XZ.grenadeLZFadingLineSets)do pcall(_XZ.fn37,_Zq)
                      end
                      for _Zr in pairs(_XY.grenadeLZActiveLineSets)do _XY.grenadeLZActiveLineSets[_Zr]=nil
                      end
                      for _Zs in pairs(_XZ.grenadeLZFadingLineSets)do _XZ.grenadeLZFadingLineSets[_Zs]=nil
                      end
                    end
                  end,}):Settings({callback=function()
                  end})_Zt:Toggle({title="sustain lines",default=getgenv().HETrajectory.sustainLines,callback=function(_Zu)getgenv().HETrajectory.sustainLines=_Zu
                  end,})_Zt:Toggle({title="show icons",default=getgenv().HETrajectory.showIcons,callback=function(_Zv)getgenv().HETrajectory.showIcons=_Zv
                  end,})_Zt:Toggle({title="follow grenade",default=getgenv().HETrajectory.iconFollowGrenade,callback=function(_Zw)getgenv().HETrajectory.iconFollowGrenade=_Zw
                  end,})_Zt:Slider({title="fade speed",min=0.1,max=5,float=0.1,default=getgenv().HETrajectory.tweenSpeed,callback=function(_Zx)getgenv().HETrajectory.tweenSpeed=_Zx
                  end,})_Zt:Slider({title="gradient speed",min=0.1,max=5,float=0.1,default=getgenv().HETrajectory.gradientSpeed,callback=function(_Zy)getgenv().HETrajectory.gradientSpeed=_Zy
                  end,})_Zt:Dropdown({title="gradient mode",values={"pingpong","follow"},default=getgenv().HETrajectory.gradientMode,callback=function(_Zz)getgenv().HETrajectory.gradientMode=_Zz
                  end,})_Zt:Slider({title="icon size",min=10,max=50,float=1,default=getgenv().HETrajectory.iconSize,callback=function(_ZA)getgenv().HETrajectory.iconSize=_ZA
                  end,})
                  for _ZB,_ZC in ipairs({"HE Grenade","Smoke Grenade","Flashbang","Decoy Grenade","Molotov","Incendiary Grenade",})do do local _ZD=getgenv().HETrajectory.enabledWeapons[_ZC]
                      if _ZD then local _ZE=_ZC:lower()
                        local _ZI=_Zk:Toggle({title=_ZE,default=_ZD.enabled,callback=function(_ZF)_ZD.enabled=_ZF
                          if not _ZF then for _ZG,_ZH in pairs(_XY.tbl24)do if _ZH.Weapon==_ZC then pcall(function()_XY.tbl24[_ZG]=nil
                                end)
                              end
                            end
                          end
                        end,})_ZI:Colorpicker({title=_ZE.." pulse",default=_ZD.pulseColor,transparency=1,callback=function(_ZJ,_ZK)_ZD.pulseColor=_ZJ _ZD.pulseAlpha=_ZK
                        end,})_ZI:Colorpicker({title=_ZE.." gradient",default=_ZD.gradientTo,transparency=1,callback=function(_ZL,_ZM)_ZD.gradientTo=_ZL _ZD.gradientToAlpha=_ZM
                        end,})_ZI:Colorpicker({title=_ZE.." base",default=_ZD.gradientFrom,transparency=1,callback=function(_ZN,_ZO)_ZD.gradientFrom=_ZN _ZD.gradientFromAlpha=_ZO
                        end,})
                      end
                    end
                  end
                end
              end do _G.GrenadeLZFuseCache={}_XY.tbl24={}_XY.grenadeLZActiveLineSets={}_XZ.grenadeLZFadingLineSets={}_G.GrenadeLZActiveLineSets=_XY.grenadeLZActiveLineSets _G.GrenadeLZFadingLineSets=_XZ.grenadeLZFadingLineSets do local function _ZP()
                    local _ZQ=RaycastParams.new()_ZQ.FilterType=Enum.RaycastFilterType.Exclude
                    local _ZR={_XY.debris}
                    local _ZS=_Ya.Character
                    if _ZS then table.insert(_ZR,_ZS)
                    end _ZQ.FilterDescendantsInstances=_ZR _ZQ.RespectCanCollide=false _ZQ.IgnoreWater=true
                    return _ZQ
                  end
                  local _ZT={}
                  local function _ZU(_ZV)
                    for _ZW,_ZX in pairs(_XY.tbl24)do if _ZW.Name==_ZV then return _ZW,_ZX
                      end
                    end
                    return nil
                  end
                  local function _ZY(_ZZ)
                    if not getgenv().HETrajectory.enabled then return
                    end
                    local _baa=_ZZ.Weapon
                    local _bab=getgenv().HETrajectory.enabledWeapons[_baa]
                    if not _bab then return
                    end
                    if not _bab.enabled then return
                    end
                    local _bac=_ZZ.State
                    local _bad=_ZZ.Physics table.insert(_ZT,{weapon=_ZZ.Weapon,color=_bab.color,icon=_bab.icon,gradientFrom=_bab.gradientFrom,gradientTo=_bab.gradientTo,pulseColor=_bab.pulseColor,gradientFromAlpha=_bab.gradientFromAlpha,gradientToAlpha=_bab.gradientToAlpha,pulseAlpha=_bab.pulseAlpha,pos=_bac and _bac.Position or Vector3.zero,vel=_bac and _bac.Velocity or Vector3.zero,isJumpThrow=_bac and _bac.IsJumpThrow or false,fuse=_bad and _bad.FuseTime or 0,radius=_bad and _bad.Radius or 0.5,restitution=_bad and _bad.Restitution or 0.4,maxBounces=_bad and _bad.MaxBounces or 20,t=os.clock(),})
                    if#_ZT>12 then table.remove(_ZT,1)
                    end
                  end pcall(function()_G.GrenadeLZSpawnConn=_Yc.Projectile.Spawn.Listen(_ZY)
                  end)pcall(function()_G.GrenadeLZResolveConn=_Yc.Projectile.Resolve.Listen(function(_bae)
                      local _baf,_bag=_ZU(_bae.Id)
                      if not _bag then return
                      end
                      local _bah=os.clock()-(_bag.StartClock or os.clock())
                      if _bah>0.1 and _bah<15 then _G.GrenadeLZFuseCache[_bag.Weapon]=_bah _bag.Fuse=_bah
                      end
                    end)
                  end)_XZ.fn38=function(_bai)
                    for _baj=#_ZT,1,-1 do local _bak=_ZT[_baj]
                      local _bal=_bak.t
                      if os.clock()-_bal<3 and(_bak.pos-_bai).Magnitude<8 then table.remove(_ZT,_baj)
                        return _bak
                      end
                    end
                    return nil
                  end _XZ.fn39=function(_bam)
                    local _ban=_bam.weapon=="Molotov"or _bam.weapon=="Incendiary Grenade"
                    local _bao={rangeScale=1,isNearThrow=false,radius=_bam.radius,restitution=_bam.restitution,maxBounces=_bam.maxBounces,fuseTime=_bam.fuse>0 and _bam.fuse or nil,minimumFuseTime=_ban and 0.1 or nil,explodeOnFloorImpact=_ban and true or nil,}
                    local _bap={angularVelocity=Vector3.zero,simulationTime=0,bounceCount=0,isGrounded=false,isAtRest=false,hasTouched=false,accumulatedTime=0,position=_bam.pos,velocity=_bam.vel,timestamp=workspace:GetServerTimeNow(),isJumpThrow=_bam.isJumpThrow,}
                    local _baq=_ZP()
                    local _bar={{t=0,p=_bap.position}}
                    if not pcall(function()
                        while not _bap.isAtRest do _bap=_Yb.simulate(_bap,_bao,_baq,0.016666666666666666).state _bar[#_bar+1]={t=_bap.simulationTime,p=_bap.position}
                          if not(#_bar>600)then continue
                          end break
                        end
                      end)or#_bar<2 then return nil
                    end
                    return _bar
                  end
                end
              end
            end
            local _bas do do local function _bat(_bau,_bav)
                  local _baw=_bau.weapon=="Molotov"or _bau.weapon=="Incendiary Grenade"
                  if _bau.fuse and _bau.fuse>0 then return _bau.fuse
                  end
                  local _bax=_G.GrenadeLZFuseCache[_bau.weapon]
                  if _bax then return _bax
                  end
                  local _bay=_bau.weapon
                  local _baz=getgenv().HETrajectory.fuseOverride[_bay]
                  if _baz then return _baz
                  end
                  if _baw then return _bav[#_bav].t
                  end
                  return 0
                end _bas=function(_baA)
                  if not _baA or _XY.tbl24[_baA]then return
                  end
                  if not _baA:IsA("Model")and not _baA:IsA("BasePart")then return
                  end
                  if not _baA:HasTag("Grenade")then return
                  end
                  local _baB=_baA:IsA("Model")and(_baA.PrimaryPart or _baA:FindFirstChildOfClass("BasePart"))or _baA
                  if not _baB then return
                  end
                  local _baC=_baB.Position
                  local _baD=_XZ.fn38(_baC)
                  if not _baD then return
                  end
                  local _baE=_XZ.fn39(_baD)
                  if not _baE or#_baE<2 then return
                  end
                  local _baF={Primary=_baB,Path=_baE,AnchorClock=os.clock(),StartClock=os.clock(),Weapon=_baD.weapon,Color=_baD.color,Icon=_baD.icon,gradientFrom=_baD.gradientFrom,gradientTo=_baD.gradientTo,pulseColor=_baD.pulseColor,gradientFromAlpha=_baD.gradientFromAlpha,gradientToAlpha=_baD.gradientToAlpha,pulseAlpha=_baD.pulseAlpha,Fuse=_bat(_baD,_baE),}_XY.tbl24[_baA]=_baF
                  local _baG=math.huge
                  local _baH=0
                  for _baI,_baJ in ipairs(_baF.Path)do local _baK=(_baJ.p-_baC).Magnitude
                    if _baK<_baG then _baH=_baJ.t _baG=_baK
                    end
                  end _baF.AnchorClock=os.clock()-_baH
                end
              end
            end do local function _baL(_baM)
                if _XZ.grenadeLZFadingLineSets[_baM]then return
                end
                local _baN=_XY.grenadeLZActiveLineSets[_baM]
                local _baO=_XY.tbl24[_baM]
                if _baN and _baO then local _baP={}
                  if getgenv().HETrajectory.sustainLines then for _baQ,_baR in ipairs(_baO.Path)do _baP[#_baP+1]=_baR.p
                    end
                  else local _baS=_baO.AnchorClock
                    local _baT=os.clock()-_baS
                    for _baU,_baV in ipairs(_baO.Path)do if _baT<=_baV.t then _baP[#_baP+1]=_baV.p
                      end
                    end
                  end
                  if#_baP<2 then for _baW,_baX in ipairs(_baO.Path)do _baP[#_baP+1]=_baX.p
                    end
                  end _XZ.grenadeLZFadingLineSets[_baM]={lines=_baN.lines,text=_baN.text,icon=_baN.icon,shadow=_baN.shadow,anchor=_baN.anchor,billboard=_baN.billboard,color=_baN.color,fadeStart=os.clock(),worldPoints=_baP,}_XY.grenadeLZActiveLineSets[_baM]=nil
                elseif _baN then _XZ.grenadeLZFadingLineSets[_baM]={lines=_baN.lines,text=_baN.text,icon=_baN.icon,shadow=_baN.shadow,anchor=_baN.anchor,billboard=_baN.billboard,color=_baN.color,fadeStart=os.clock(),worldPoints={},}_XY.grenadeLZActiveLineSets[_baM]=nil
                end _XY.tbl24[_baM]=nil
              end
              local function _baY(_baZ)
                local _bba=_XY.grenadeLZActiveLineSets[_baZ]
                if getgenv().HETrajectory.sustainLines then _baL(_baZ)
                else if _bba then _XZ.fn37(_bba)_XY.grenadeLZActiveLineSets[_baZ]=nil
                  end
                  local _bbb=_XZ.grenadeLZFadingLineSets[_baZ]
                  if _bbb then _XZ.fn37(_bbb)_XZ.grenadeLZFadingLineSets[_baZ]=nil
                  end _XY.tbl24[_baZ]=nil
                end
              end _G.GrenadeLZChildAddedConn=_XY.debris.ChildAdded:Connect(function(_bbc)task.defer(_bas,_bbc)
              end)_G.GrenadeLZDebrisRemovedConn=_XY.debris.ChildRemoved:Connect(function(_bbd)_baY(_bbd)
              end)
            end
          end
          local _bbe={}do do local _bbf,_bbg do _bbf=function(_bbh,_bbi)
                  local _bbj=Drawing.new("Line")_bbj.Visible=false _bbj.Color=_bbh _bbj.Thickness=_bbi _bbj.Transparency=1
                  return _bbj
                end _bbg=function(_bbk)
                  if typeof(_bbk)~="Vector3"then return nil,false
                  end
                  local _bbl,_bbm,_bbn=pcall(function()
                    return _XY.currentCamera:WorldToViewportPoint(_bbk)
                  end)
                  if not _bbl or typeof(_bbm)~="Vector3"then return nil,false
                  end
                  return _bbm,_bbn==true and _bbm.Z>0
                end
                local function _bbo(_bbp,_bbq)
                  local _bbr=_bbp.Path
                  if _bbq<=_bbr[1].t then return _bbr[1].p
                  end
                  for _bbs=#_bbr,1,-1 do if _bbr[_bbs].t<=_bbq then local _bbt=_bbr[_bbs+1]
                      if _bbt then local _bbu=_bbt.t-_bbr[_bbs].t
                        return _bbr[_bbs].p:Lerp(_bbt.p,math.clamp(_bbu>0 and(_bbq-_bbr[_bbs].t)/_bbu or 0,0,1))
                      end
                      return _bbr[_bbs].p
                    end
                  end
                  return _bbr[#_bbr].p
                end
              end do local function _bbv(_bbw,_bbx)
                  local _bby=getgenv().HETrajectory
                  if not _bby.enabled then return
                  end
                  if _bby.showIcons and not _bbw.anchor then if typeof(setthreadidentity)=="function"then setthreadidentity(2)
                    end
                    local _bbz=Instance.new("Part")_bbz.Size=Vector3.new(1,1,1)_bbz.Anchored=true _bbz.CanCollide=false _bbz.CanQuery=false _bbz.CanTouch=false _bbz.CastShadow=false _bbz.Transparency=1 _bbz.Parent=_XY.debris
                    local _bbA=Instance.new("BillboardGui")_bbA.Adornee=_bbz _bbA.Size=UDim2.new(0,_bby.iconSize,0,_bby.iconSize)_bbA.StudsOffset=Vector3.new(0,0,0)_bbA.AlwaysOnTop=true _bbA.ResetOnSpawn=false _bbA.Parent=_bbz
                    local _bbB=Instance.new("ImageLabel")_bbB.Image=_bbx or""_bbB.Size=UDim2.new(1,0,1,0)_bbB.BackgroundTransparency=1 _bbB.ImageTransparency=1-(_bbw.pulseAlpha or _bby.pulseAlpha or 1)_bbB.ImageColor3=Color3.new(1,1,1)_bbB.ScaleType=Enum.ScaleType.Fit _bbB.ZIndex=2 _bbB.Parent=_bbA
                    local _bbC=Instance.new("ImageLabel")_bbC.Image=_bbx or""_bbC.Size=UDim2.new(1,0,1,0)_bbC.Position=UDim2.new(0,1,0,1)_bbC.BackgroundTransparency=1 _bbC.ImageTransparency=0 _bbC.ImageColor3=Color3.new(0,0,0)_bbC.ScaleType=Enum.ScaleType.Fit _bbC.ZIndex=1 _bbC.Parent=_bbA _bbw.anchor=_bbz _bbw.billboard=_bbA _bbw.icon=_bbB _bbw.shadow=_bbC
                    local _bbD=_XY.TweenService:Create(_bbB,TweenInfo.new(0.4,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,-1,true),{ImageColor3=_bbw and _bbw.pulseColor or _bby.pulseColor})_bbD:Play()_bbw.pulseTween=_bbD
                    if typeof(setthreadidentity)=="function"then setthreadidentity(_XY.n32)
                    end
                  end
                end
                local function _bbE(_bbF,_bbG,_bbH,_bbI)
                  local _bbJ=getgenv().HETrajectory
                  if not _bbJ.enabled then return
                  end _bbH=_bbH or 1
                  local _bbK=_bbF.color or Color3.new(1,1,1)
                  local _bbL={}
                  local _bbM=0
                  for _bbN=1,#_bbG-1 do local _bbO=(_bbG[_bbN+1]-_bbG[_bbN]).Magnitude _bbL[_bbN]=_bbO _bbM+=_bbO
                  end
                  local _bbP={}
                  if _bbM>=0.05 and#_bbG>=2 then local _bbQ=_bbM/_bbJ.totalSegments
                    for _bbR=1,#_bbG-1 do local _bbS=_bbG[_bbR]
                      local _bbT=_bbG[_bbR+1]
                      local _bbU=math.max(1,math.floor(_bbL[_bbR]/_bbQ+0.5))
                      for _bbV=0,_bbU-1 do local _bbW=#_bbP+1
                        local _bbX=_bbS.Lerp _bbP[_bbW]={_bbS:Lerp(_bbT,_bbV/_bbU),_bbX(_bbS,_bbT,(_bbV+1)/_bbU)}
                      end
                    end
                  end
                  while#_bbF.lines<#_bbP do table.insert(_bbF.lines,_bbf(_bbK,_bbJ.thickness))
                  end
                  local _bbY=#_bbP
                  if not(_bbJ.gradientMode=="follow"and _bbI~=nil)then local _bbZ=_bbJ.gradientSpeed
                    local _bca=0.5 _bbI=math.sin(os.clock()*_bbZ)*0.5+_bca
                  end
                  local _bcb=math.max(_bbJ.gradientBand,0.001)
                  local _bcc=1
                  for _bcd,_bce in ipairs(_bbP)do local _bcf,_bcg=_bbg(_bce[1])
                    local _bch,_bci=_bbg(_bce[2])
                    if _bcf and _bch and _bcg and _bci then local _bcj=_bbF.lines[_bcc]_bcj.From=Vector2.new(_bcf.X,_bcf.Y)_bcj.To=Vector2.new(_bch.X,_bch.Y)
                      local _bck=math.max(0,1-math.abs((_bcc-1)/math.max(_bbY-1,1)-_bbI)/_bcb)_bcj.Color=(_bbF.gradientFrom or _bbJ.gradientFrom):Lerp(_bbF.gradientTo or _bbJ.gradientTo,_bck)_bcj.Transparency=((_bbF.gradientFromAlpha or 1)+((_bbF.gradientToAlpha or 1)-(_bbF.gradientFromAlpha or 1))*_bck)*_bbH _bcj.Visible=true
                    else _bbF.lines[_bcc].Visible=false
                    end _bcc+=1
                  end
                  while _bcc<=#_bbF.lines do _bbF.lines[_bcc].Visible=false _bcc+=1
                  end
                end
                local function _bcl(_bcm,_bcn,_bco)
                  local _bcp=_XY.grenadeLZActiveLineSets[_bcm]
                  if not _bcp then _bcp={lines={},color=_XY.tbl24[_bcm]and _XY.tbl24[_bcm].Color,gradientFrom=_XY.tbl24[_bcm]and _XY.tbl24[_bcm].gradientFrom,gradientTo=_XY.tbl24[_bcm]and _XY.tbl24[_bcm].gradientTo,pulseColor=_XY.tbl24[_bcm]and _XY.tbl24[_bcm].pulseColor,gradientFromAlpha=_XY.tbl24[_bcm]and _XY.tbl24[_bcm].gradientFromAlpha,gradientToAlpha=_XY.tbl24[_bcm]and _XY.tbl24[_bcm].gradientToAlpha,pulseAlpha=_XY.tbl24[_bcm]and _XY.tbl24[_bcm].pulseAlpha,}_XY.grenadeLZActiveLineSets[_bcm]=_bcp
                  end _bbv(_bcp,_XY.tbl24[_bcm]and _XY.tbl24[_bcm].Icon)_bbE(_bcp,_bcn,nil,_bco)
                end
              end
            end do do _G.GrenadeLZConnection=_XY.RunService.RenderStepped:Connect(function(...)
                end)
                if typeof(setthreadidentity)=="function"then setthreadidentity(_XY.n32)
                end _bbe.gameplay=_z.misc:Section("gameplay","right")_XU.Players=game:GetService("Players")_XU.service=game:GetService("RunService")getgenv().GrenadeRemovals=getgenv().GrenadeRemovals or{flashbang=false,smoke=false}_bbe.gameplay:Toggle({title="remove flashbang",default=false,risky=false,callback=function(_bcq)getgenv().GrenadeRemovals.flashbang=_bcq
                end,})_bbe.gameplay:Toggle({title="remove smokes",default=false,risky=false,callback=function(_bcr)getgenv().GrenadeRemovals.smoke=_bcr
                end,})pcall(function()
                  local _bcs,_bct,_bcu=next,getgc(true);
                  for _bcv,_bcw in _bcs,_bct,_bcu do if type(_bcw)=="function"and debug.getinfo(_bcw).name=="Flash"then pcall(function()
                        local _bcx;_bcx=hookfunction(_bcw,function(...)
                          if getgenv().GrenadeRemovals.flashbang then return;
                          end;
                          return _bcx(...);
                        end);
                      end);
                    end;
                    if type(_bcw)=="function"and debug.getinfo(_bcw).name=="CreateVoxel"and(debug.getupvalue(_bcw,1))and tostring(debug.getupvalue(_bcw,1))=="Smoke"then pcall(function()
                        local _bcy;_bcy=hookfunction(_bcw,function(...)
                          if getgenv().GrenadeRemovals.smoke then return;
                          end;
                          return _bcy(...);
                        end);
                      end);
                    end;
                  end;
                end)_XX={middle=nil,sniperScope=nil,sharp=nil,blur=nil,bloodLabel=nil,crosshair=nil,}_XW=function(_bcz)
                  if _bcz==nil then return false
                  end
                  local _bcA,_bcB=pcall(function()
                    return _bcz.Parent
                  end)
                  return _bcA and _bcB~=nil
                end _XV=function()
                  if _XW(_XX.middle)then return _XX.middle
                  end
                  local _bcC=_XU.Players.LocalPlayer
                  if not _bcC then return nil
                  end
                  local _bcD=_bcC:FindFirstChild("PlayerGui")
                  if not _bcD then return nil
                  end
                  local _bcE=_bcD:FindFirstChild("MainGui")
                  if not _bcE then return nil
                  end
                  local _bcF=_bcE:FindFirstChild("Gameplay")
                  if not _bcF then return nil
                  end
                  local _bcG=_bcF:FindFirstChild("Middle")_XX.middle=_bcG _XX.sniperScope=nil _XX.sharp=nil _XX.blur=nil _XX.bloodLabel=nil _XX.crosshair=nil
                  return _bcG
                end getgenv().bulletVisualizer={enabled=false,zeus=false,style="beam",segments=17,fadeTime=2,color=Color3.fromRGB(179,239,103),color2=Color3.fromRGB(255,255,255),thickness=1,opacity=1,beamTexture="rbxassetid://7151778302",beamWidth=0.3,beamTextureLength=15,beamLightEmission=1,showPenetration=true,penetrationColor=Color3.fromRGB(255,0,0),fadePenetration=true,}getgenv().enemyBulletVisualizer={enabled=false,style="beam",segments=17,fadeTime=2,color=Color3.fromRGB(255,50,50),color2=Color3.fromRGB(255,255,255),thickness=1,opacity=1,beamTexture="rbxassetid://7151778302",beamWidth=0.3,beamTextureLength=15,beamLightEmission=1,showPenetration=true,penetrationColor=Color3.fromRGB(255,255,255),maxDistance=500,}do local _bcI=_bbe.gameplay:Toggle({title="local bullet tracers",default=false,risky=false,callback=function(_bcH)getgenv().bulletVisualizer.enabled=_bcH
                    if not _bcH then _v()
                    end
                  end,}):Settings({callback=function()
                  end})_bcI:Colorpicker({title="bullet color",default=Color3.fromRGB(107,109,255),transparency=1,callback=function(_bcJ,_bcK)getgenv().bulletVisualizer.color=_bcJ getgenv().bulletVisualizer.opacity=_bcK
                  end,})_bcI:Colorpicker({title="bullet end color",default=Color3.fromRGB(243,0,255),transparency=1,callback=function(_bcL)getgenv().bulletVisualizer.color2=_bcL
                  end,})_bcI:Dropdown({title="style",values={"drawing","beam"},default="beam",multi=false,callback=function(_bcM)getgenv().bulletVisualizer.style=_bcM
                  end,})_bcI:Slider({title="duration",suffix="%",min=1,max=10,float=1,default=2,callback=function(_bcN)getgenv().bulletVisualizer.fadeTime=_bcN
                  end,})_bcI:Toggle({title="use zeus beam",default=false,risky=false,callback=function(_bcO)getgenv().bulletVisualizer.zeus=_bcO
                  end,})
                end
              end do local _bcQ=_bbe.gameplay:Toggle({title="global bullet tracers",default=false,risky=false,callback=function(_bcP)getgenv().enemyBulletVisualizer.enabled=_bcP
                  if not _bcP then _v()
                  end
                end,}):Settings({callback=function()
                end})_bcQ:Colorpicker({title="global bullet color",default=Color3.fromRGB(255,50,50),transparency=1,callback=function(_bcR,_bcS)getgenv().enemyBulletVisualizer.color=_bcR getgenv().enemyBulletVisualizer.opacity=_bcS
                end,})_bcQ:Colorpicker({title="global bullet end color",default=Color3.fromRGB(255,100,100),transparency=1,callback=function(_bcT)getgenv().enemyBulletVisualizer.color2=_bcT
                end,})_bcQ:Dropdown({title="style",values={"drawing","beam"},default="beam",multi=false,callback=function(_bcU)getgenv().enemyBulletVisualizer.style=_bcU
                end,})_bcQ:Slider({title="duration",suffix="%",min=1,max=10,float=1,default=2,callback=function(_bcV)
                  if 4760>_XY.n28(297)then getgenv().enemyBulletVisualizer.fadeTime=_bcV
                    return
                  end
                  while true do end
                end,})
              end
            end getgenv().removescope=getgenv().removescope or{enabled=false,imageenabled=false,selected="Ashley",size=70,}_XU.tbl20={Ashley="rbxassetid://134679108826722",HelloKitty="rbxassetid://134505916551371",Portal="rbxassetid://12661773255",ShadeCrosshair="rbxassetid://15690879457",Ancient="rbxassetid://117207135164502",PinkScope="rbxassetid://93025361362953",Megumi="rbxassetid://78921526609260",McPurple="rbxassetid://124237844113325",Glow="rbxassetid://18500717968",MilkAndMocha="rbxassetid://71131540969062",TF2Crosshair="rbxassetid://102666834321873",Clean="rbxassetid://139250625376291",IDontEvenKnow="rbxassetid://82819788705709",}_bbe.tbl25={hurtscreen={enabled=false,color=Color3.fromRGB(249,233,153),},forcecrosshair={enabled=false},}do local function _bcW()
                if _XW(_XX.bloodLabel)then return _XX.bloodLabel
                end
                local _bcX=_XV()
                if not _bcX then return nil
                end
                local _bcY=_bcX:FindFirstChild("BloodScreen")
                if not _bcY then return nil
                end _XX.bloodLabel=_bcY:FindFirstChild("ImageLabel")
                return _XX.bloodLabel
              end _bbe.fn37=function()
                if _XW(_XX.crosshair)then return _XX.crosshair
                end
                local _bcZ=_XV()
                if not _bcZ then return nil
                end _XX.crosshair=_bcZ:FindFirstChild("Crosshair")
                return _XX.crosshair
              end
              local _bda=nil _bbe.fn38=function()
                local _bdb=_bcW()
                if not _bdb then return
                end
                if _bda==nil then _bda=_bdb.ImageColor3
                end _bdb.ImageColor3=_bbe.tbl25.hurtscreen.color
              end _bbe.fn39=function()
                local _bdc=_bcW()
                if not _bdc then return
                end
                if _bda then _bdc.ImageColor3=_bda
                end _bda=nil
              end
            end
          end do local _bdd,_bde do local _bdf=nil _bdd=function()
                if _bdf then return
                end
                local _bdg=_bbe.fn37()
                if not _bdg then return
                end _bdg.Visible=true _bdf=_bdg:GetPropertyChangedSignal("Visible"):Connect(function()
                  if _bbe.tbl25.forcecrosshair.enabled and not _bdg.Visible then _bdg.Visible=true
                  end
                end)
              end _bde=function()
                if _bdf then _bdf:Disconnect()_bdf=nil
                end
              end
            end do local _bdp=_bbe.gameplay:Toggle({title="modify scope",default=false,risky=false,callback=function(_bdh)getgenv().removescope.masterEnabled=_bdh
                if not _bdh then for _bdi,_bdj in ipairs({{"fn33","tbl21"},{"fn34","tbl22"}})do local _bdk=_XU[_bdj[1]]
                    local _bdl=_XU[_bdj[2]]
                    local _bdm=_bdk and _bdk()
                    if _bdm and _bdl then for _bdn,_bdo in pairs(_bdl)do _bdm[_bdn]=_bdo
                      end _XU[_bdj[2]]=nil
                    end
                  end
                end
              end,}):Settings({callback=function()
              end})_bdp:Toggle({title="remove scope",default=true,risky=false,callback=function(_bdq)getgenv().removescope.enabled=_bdq
              end,})_bdp:Toggle({title="scope image",default=true,risky=false,callback=function(_bdr)getgenv().removescope.imageenabled=_bdr
              end,})_bdp:Dropdown({title="image",values={"Ashley","HelloKitty","Portal","ShadeCrosshair","Ancient","PinkScope","Megumi","McPurple","Glow","MilkAndMocha","TF2Crosshair","Clean","IDontEvenKnow",},default="Megumi",multi=false,callback=function(_bds)getgenv().removescope.selected=_bds
              end,})_bdp:Slider({title="image size",suffix="px",min=1,max=500,float=1,default=70,callback=function(_bdt)getgenv().removescope.size=_bdt
              end,})
            end _bbe.gameplay:Toggle({title="force crosshair",default=false,risky=false,info=true,infotext="forces ur crosshair to be visible even when scoped",callback=function(_bdu)_bbe.tbl25.forcecrosshair.enabled=_bdu
              if _bdu then _bdd()
              else _bde()
              end
            end,})
          end do _bbe.gameplay:Toggle({title="hurt screen color",default=false,risky=false,callback=function(_bdv)_bbe.tbl25.hurtscreen.enabled=_bdv
              if _bdv then _bbe.fn38()
              else _bbe.fn39()
              end
            end,}):Colorpicker({title="hurt color",default=Color3.fromRGB(240,0,244),transparency=1,callback=function(_bdw)_bbe.tbl25.hurtscreen.color=_bdw
            end,})getgenv().AgreeLoop=getgenv().AgreeLoop or{Enabled=false,AnimationId="rbxassetid://10921261968",FPS=60,}do local _bdy=_bbe.gameplay:Toggle({title="animation changer",default=getgenv().AgreeLoop.Enabled,risky=false,callback=function(_bdx)getgenv().AgreeLoop.Enabled=_bdx
                if getgenv()._AgreeLoopEnsure then pcall(getgenv()._AgreeLoopEnsure)
                end
              end,}):Settings({callback=function()
              end})
              local _bdz={["adorable walk"]="85887415033585",backflips="112134081988873",backwards="79480770273758",caramell="102908521825429",["chinese dance"]="71292563614996",crouch="87115802065234",["flipped animation"]="93477017949252",fly="117974515239518",["funny floating"]="125958974379561",gmod="101197238583271",["hide glitch"]="86822553111241",["laying down"]="84112287597268",["loading emote"]="111251252458517",["model squat"]="105017661172917",["rubberband teleport"]="111847225664742",["slow aura run"]="124754472736145",spin="100005170153013",spin2="107195495586449",tall="90070641491562",walk="10921261968",}_bdy:Dropdown({title="animation",values={"adorable walk","backflips","backwards","caramell","chinese dance","crouch","flipped animation","fly","funny floating","gmod","hide glitch","laying down","loading emote","model squat","rubberband teleport","slow aura run","spin","spin2","tall","walk",},default="walk",multi=false,callback=function(_bdA)
                local _bdB=_bdz[_bdA]
                if _bdB then getgenv().AgreeLoop.AnimationId="rbxassetid://".._bdB
                  if getgenv().AgreeLoop.Enabled then if getgenv()._AgreeLoopPlay then pcall(getgenv()._AgreeLoopPlay)
                    elseif getgenv()._AgreeLoopEnsure then pcall(getgenv()._AgreeLoopEnsure)
                    end
                  end
                end
              end,})_bdy:Slider({title="fps",suffix=" fps",min=1,max=120,float=1,default=getgenv().AgreeLoop.FPS,callback=function(_bdC)getgenv().AgreeLoop.FPS=_bdC
              end,})
            end
          end
        end
        local _bdD do task.spawn(function()
            local _bez,_beA=pcall(function()
              local _bdE=game:GetService("Players")
              local _bdF=game:GetService("RunService")
              local _bdG=game:GetService("Debris")
              local _bdH=game:GetService("ContentProvider")
              local _bdI=_bdE.LocalPlayer
              if not _bdI then return
              end
              local _bdJ=nil
              local _bdK=tick()
              local _bdL=nil
              local function _bdM(_bdN)
                if not _bdN then return nil
                end
                local _bdO=_bdN:FindFirstChild("AnimationController")
                if _bdO then local _bdP=_bdO:FindFirstChildOfClass("Animator")
                  if _bdP then return _bdP
                  end
                  local _bdQ,_bdR=pcall(function()
                    return _bdO:WaitForChild("Animator",2)
                  end)
                  if _bdQ and _bdR then return _bdR
                  end
                end
                local _bdS=_bdN:FindFirstChildOfClass("Humanoid")
                if _bdS then local _bdT=_bdS:FindFirstChildOfClass("Animator")
                  if _bdT then return _bdT
                  end
                  local _bdU,_bdV=pcall(function()
                    return _bdS:WaitForChild("Animator",2)
                  end)
                  if _bdU and _bdV then return _bdV
                  end
                  local _bdX,_bdY=pcall(function()
                    local _bdW=Instance.new("Animator")_bdW.Parent=_bdS
                    return _bdW
                  end)
                  if _bdX then return _bdY
                  end
                end
                local _bdZ,_bea=pcall(function()
                  return _bdN:FindFirstChild("Animator",true)
                end)
                if _bdZ and _bea then return _bea
                end
                return nil
              end
              local function _beb()
                if not getgenv().AgreeLoop.Enabled then return
                end
                local _bec=_bdI.Character or workspace:FindFirstChild("Characters")and workspace.Characters:FindFirstChild(_bdI.Name)
                if not _bec then return
                end
                local _bed=_bdM(_bec)
                if not _bed then return
                end
                if _bdJ then pcall(function()_bdJ:Stop(0)
                  end)_bdJ=nil
                end
                local _bee=Instance.new("Animation")_bee.AnimationId=getgenv().AgreeLoop.AnimationId pcall(function()_bdH:PreloadAsync({_bee})
                end)
                local _bef,_beg=pcall(function()
                  return _bed:LoadAnimation(_bee)
                end)
                if not _bef or not _beg then local _beh=_bec:FindFirstChildOfClass("Humanoid")
                  if _beh then _bef,_beg=pcall(function()
                      return _beh:LoadAnimation(_bee)
                    end)
                  end
                end
                if not _bef or not _beg then pcall(function()_bee:Destroy()
                  end)
                  return
                end _bdJ=_beg pcall(function()_bdJ.Priority=Enum.AnimationPriority.Action4
                end)pcall(function()_bdJ.Looped=true
                end)pcall(function()
                  for _bei,_bej in ipairs(_bed:GetPlayingAnimationTracks())do if _bej~=_bdJ then pcall(function()_bej:Stop(0)
                      end)
                    end
                  end
                end)pcall(function()_bdJ:Play(0,1,1)
                end)pcall(function()_bdJ.TimePosition=0
                end)_bdK=tick()
                local _bek=0
                while _bdJ and _bdJ.Length==0 and _bek<17 do task.wait(0.05)_bek+=1
                end pcall(function()_bdJ:AdjustSpeed(0)
                end)_bdG:AddItem(_bee,5)
              end
              local function _bel()
                if not getgenv().AgreeLoop.Enabled or not _bdJ then return
                end
                local _bem,_ben=pcall(function()
                  return _bdJ.Length
                end)
                if not _bem or not _ben or _ben==0 then return
                end
                local _beo=1/math.max(1,getgenv().AgreeLoop.FPS)
                local _bep=tick()
                local _beq=_bep-_bdK
                if _beo<=_beq then local _ber,_bes=pcall(function()
                    return _bdJ.TimePosition
                  end)
                  if _ber and _bes~=nil then pcall(function()_bdJ.TimePosition=(_bes+_beq)%_ben
                    end)
                  end _bdK=_bep
                end
              end
              local function _bet()
                if not getgenv().AgreeLoop.Enabled then return
                end
                local _beu=false pcall(function()_beu=_bdJ and _bdJ.IsPlaying
                end)
                if not _beu then _beb()
                else pcall(function()_bdJ:AdjustWeight(1,0.05)
                  end)
                end
              end
              local function _bev()
                if _bdL then _bdL:Disconnect()_bdL=nil
                end
                if getgenv().AgreeLoop.Enabled then _bdK=tick()_beb()_bdL=_bdF.RenderStepped:Connect(function(...)
                  end)
                elseif _bdJ then pcall(function()_bdJ:Stop(0.1)
                  end)_bdJ=nil
                end
              end getgenv()._AgreeLoopEnsure=_bev getgenv()._AgreeLoopPlay=_beb
              local function _bew(_bex)pcall(function()_bex:GetAttributeChangedSignal("Health"):Connect(function()
                    if(_bex:GetAttribute("Health")or 100)<=0 then _bdJ=nil
                    end
                  end)_bex:GetAttributeChangedSignal("Dead"):Connect(function()
                    if _bex:GetAttribute("Dead")then _bdJ=nil
                    end
                  end)
                end)
                if getgenv().AgreeLoop.Enabled then task.wait(0.6)_beb()
                end
              end
              if _bdI.Character then pcall(function()_bew(_bdI.Character)
                end)
              end pcall(function()_bdI.CharacterAdded:Connect(function(_bey)task.wait(0.6)_bew(_bey)
                  if getgenv().AgreeLoop.Enabled then _bev()
                  end
                end)
              end)
              if getgenv().AgreeLoop.Enabled then _bev()
              end
            end)
            if not _bez then warn("[AgreeLoop] init failed: "..tostring(_beA))
            end
          end)do local function _beB()
              if _XW(_XX.sniperScope)then return _XX.sniperScope
              end
              local _beC=_XV()
              if not _beC then return nil
              end _XX.sniperScope=_beC:FindFirstChild("SniperScope")_XX.sharp=nil _XX.blur=nil
              return _XX.sniperScope
            end _XU.fn33=function()
              if _XW(_XX.sharp)then return _XX.sharp
              end
              local _beD=_beB()
              if not _beD then return nil
              end _XX.sharp=_beD:FindFirstChild("Sharp")
              return _XX.sharp
            end _XU.fn34=function()
              if _XW(_XX.blur)then return _XX.blur
              end
              local _beE=_beB()
              if not _beE then return nil
              end _XX.blur=_beE:FindFirstChild("Blur")
              return _XX.blur
            end _bdD={}_XU.tbl21=nil _XU.tbl22=nil
            local function _beF()
              local _beG=_beB()
              if not _beG then return
              end _bdD={}
              for _beH,_beI in ipairs(_beG:GetChildren())do if _beI.Name~="Blur"and _beI.Name~="Sharp"then table.insert(_bdD,{instance=_beI,parent=_beG})_beI.Parent=nil
                end
              end
              for _beJ,_beK in ipairs({"Blur","Sharp"})do local _beL=_beG:FindFirstChild(_beK)
                if _beL then for _beM,_beN in ipairs(_beL:GetChildren())do table.insert(_bdD,{instance=_beN,parent=_beL})_beN.Parent=nil
                  end
                end
              end
            end
          end
        end
        local function _beO()
          for _beP,_beQ in ipairs(_bdD)do if _beQ.instance and _beQ.parent then _beQ.instance.Parent=_beQ.parent
            end
          end _bdD={}
        end
      end do do local _beR={}do do local _beS,_beT do do local function _beU()
                    local _beV=_XU.tbl20[getgenv().removescope.selected]
                    if not _beV then return
                    end
                    local _beW=_XU.fn33()
                    if not _beW then return
                    end
                    if _XU.tbl21==nil then _XU.tbl21={Image=_beW.Image,ImageTransparency=_beW.ImageTransparency,Size=_beW.Size,Position=_beW.Position,AnchorPoint=_beW.AnchorPoint,}
                    end
                    local _beX=getgenv().removescope.size or 70 _beW.Image=_beV _beW.ImageTransparency=0.5 _beW.AnchorPoint=Vector2.new(0.5,0.5)_beW.Position=UDim2.new(0.5,0,0.5,0)_beW.Size=UDim2.new(0,_beX,0,_beX)
                  end _beS=function()
                    local _beY=_XU.fn33()
                    if _beY and _XU.tbl21 then _beY.Image=_XU.tbl21.Image _beY.ImageTransparency=_XU.tbl21.ImageTransparency _beY.Size=_XU.tbl21.Size _beY.Position=_XU.tbl21.Position _beY.AnchorPoint=_XU.tbl21.AnchorPoint _XU.tbl21=nil
                    end
                  end
                  local function _beZ()
                    local _bfa=_XU.tbl20[getgenv().removescope.selected]
                    if not _bfa then return
                    end
                    local _bfb=_XU.fn34()
                    if not _bfb then return
                    end
                    if _XU.tbl22==nil then _XU.tbl22={Image=_bfb.Image,ImageTransparency=_bfb.ImageTransparency,Size=_bfb.Size,Position=_bfb.Position,AnchorPoint=_bfb.AnchorPoint,}
                    end
                    local _bfc=getgenv().removescope.size or 70 _bfb.Image=_bfa _bfb.ImageTransparency=0.5 _bfb.AnchorPoint=Vector2.new(0.5,0.5)_bfb.Position=UDim2.new(0.5,0,0.5,0)_bfb.Size=UDim2.new(0,_bfc,0,_bfc)
                  end _beT=function()
                    local _bfd=_XU.fn34()
                    if _bfd and _XU.tbl22 then _bfd.Image=_XU.tbl22.Image _bfd.ImageTransparency=_XU.tbl22.ImageTransparency _bfd.Size=_XU.tbl22.Size _bfd.Position=_XU.tbl22.Position _bfd.AnchorPoint=_XU.tbl22.AnchorPoint _XU.tbl22=nil
                    end
                  end
                  local function _bfe()_beU()_beZ()
                  end
                end
              end
              local function _bff()_beS()_beT()
              end
            end do local _bfg do _XU.service.Heartbeat:Connect(function(...)
                end)_beR.localPlayer2=_XU.Players.LocalPlayer _beR.currentCamera=workspace.CurrentCamera _beR.Workspace=game:GetService("Workspace")_beR.ReplicatedStorage=game:GetService("ReplicatedStorage")_beR.tbl23={}_v=function()
                  for _bfh,_bfi in ipairs(_beR.tbl23)do if _bfi.segments then for _bfj,_bfk in ipairs(_bfi.segments)do if _bfk.line then pcall(_bfk.line.Remove,_bfk.line)
                        end
                      end
                    end
                    if _bfi.hostA then pcall(_bfi.hostA.Destroy,_bfi.hostA)
                    end
                    if _bfi.hostB then pcall(_bfi.hostB.Destroy,_bfi.hostB)
                    end
                  end table.clear(_beR.tbl23)
                end _bfg=nil do local _bfl,_bfm=pcall(function()
                    return require(_beR.ReplicatedStorage.Components.Common.VFXLibary.CreateZeusBeam)
                  end)
                  if _bfl and _bfm then _bfg=_bfm
                  end
                end
              end _beR.createLine=function(_bfn)
                local _bfo=Drawing.new("Line")_bfo.Visible=false _bfo.Color=_bfn.color _bfo.Thickness=_bfn.thickness _bfo.Transparency=_bfn.opacity or 1
                return _bfo
              end
              local function _bfp(_bfq)
                local _bfr,_bfs=_beR.currentCamera:WorldToViewportPoint(_bfq)
                return _bfs and _bfr.Z>0,_bfr
              end _beR.createPart=function(_bft)
                local _bfu=Instance.new("Part")_bfu.Size=Vector3.new(0.1,0.1,0.1)_bfu.CFrame=CFrame.new(_bft)_bfu.Transparency=1 _bfu.Anchored=true _bfu.CanCollide=false _bfu.CanQuery=false _bfu.CastShadow=false _bfu.Parent=_beR.Workspace
                return _bfu
              end _beR.fn35=function(_bfv)
                local _bfw=NumberSequenceKeypoint.new
                return NumberSequence.new({NumberSequenceKeypoint.new(0,_bfv),_bfw(1,_bfv)})
              end _beR.fn36=function(_bfx,_bfy)
                if not _bfg then return
                end
                local _bfz=Instance.new("Part")_bfz.Size=Vector3.new(0.1,0.1,0.1)_bfz.CFrame=CFrame.lookAt(_bfx,_bfx+_bfy)_bfz.Anchored=true _bfz.CanCollide=false _bfz.CanQuery=false _bfz.Transparency=1 _bfz.CastShadow=false _bfz.Parent=_beR.Workspace pcall(_bfg,_bfz)task.delay(0.6,function()
                  if _bfz and _bfz.Parent then _bfz:Destroy()
                  end
                end)
              end
            end
          end do local _bfA do do local function _bfB(_bfC,_bfD,_bfE,_bfF)
                  local _bfG={style="drawing",startTime=tick(),lifeTime=_bfF.fadeTime,segments={},config=_bfF}
                  local _bfH=(_bfD-_bfC).Unit
                  local _bfI=(_bfD-_bfC).Magnitude/_bfF.segments
                  local _bfJ=_bfE or _bfF.color
                  local _bfK=_bfE or _bfF.color2 or _bfF.color
                  for _bfL=1,_bfF.segments do local _bfM=_bfC+_bfH*_bfI*(_bfL-1)
                    local _bfN=_bfL==_bfF.segments and _bfD or _bfC+_bfH*_bfI*_bfL
                    local _bfO=_beR.createLine(_bfF)_bfO.Color=_bfJ:lerp(_bfK,_bfF.segments>1 and(_bfL-1)/(_bfF.segments-1)or 0)table.insert(_bfG.segments,{line=_bfO,from=_bfM,to=_bfN})
                  end table.insert(_beR.tbl23,_bfG)
                  return _bfG
                end
                local function _bfP(_bfQ,_bfR,_bfS,_bfT)
                  local _bfU=_beR.createPart(_bfQ)
                  local _bfV=_beR.createPart(_bfR)
                  local _bfW=Instance.new("Attachment",_bfU)
                  local _bfX=Instance.new("Attachment",_bfV)
                  local _bfY=Instance.new("Beam")_bfY.Attachment0=_bfW _bfY.Attachment1=_bfX
                  local _bfZ=_bfS or _bfT.color _bfS=_bfS or _bfT.color2 or _bfT.color
                  local _bga=ColorSequence.new
                  local _bgb={}
                  local _bgc=ColorSequenceKeypoint.new(0,_bfZ)
                  local _bgd=ColorSequenceKeypoint.new
                  local _bge=1 _bgb[1]=_bgc do local _bgf=table.pack(_bgd(_bge,_bfS))table.move(_bgf,1,_bgf.n,2,_bgb)
                  end _bfY.Color=_bga(_bgb)_bfY.Width0=_bfT.beamWidth _bfY.Width1=_bfT.beamWidth _bfY.LightInfluence=0 _bfY.LightEmission=_bfT.beamLightEmission _bfY.Texture=_bfT.beamTexture _bfY.TextureMode=Enum.TextureMode.Wrap _bfY.TextureLength=_bfT.beamTextureLength _bfY.FaceCamera=true _bfY.Transparency=_beR.fn35(1-(_bfT.opacity or 1))_bfY.TextureSpeed=2 _bfY.Parent=_bfU
                  local _bgg={style="beam",startTime=tick(),lifeTime=_bfT.fadeTime,hostA=_bfU,hostB=_bfV,beam=_bfY,isFading=false,fadeStartTime=nil,config=_bfT,}table.insert(_beR.tbl23,_bgg)
                  return _bgg
                end _bfA=function(_bgh,_bgi,_bgj,_bgk)
                  local _bgl=_bgk and getgenv().enemyBulletVisualizer or getgenv().bulletVisualizer
                  if not _bgl.enabled then return
                  end
                  if _bgk then local _bgm=_y.localPlayer.Character or getgenv().GetLocalCharacter and getgenv().GetLocalCharacter()
                    local _bgn=_bgm and _bgm:FindFirstChild("HumanoidRootPart")and _bgm.HumanoidRootPart.Position
                    if _bgn and(_bgh-_bgn).Magnitude>_bgl.maxDistance and(_bgi-_bgn).Magnitude>_bgl.maxDistance then return
                    end
                  end
                  if _bgl.style=="beam"then return _bfP(_bgh,_bgi,_bgj,_bgl)
                  end
                  return _bfB(_bgh,_bgi,_bgj,_bgl)
                end
              end
            end _XU.service.RenderStepped:Connect(function()
              local _bgo=workspace.CurrentCamera
              local _bgp=tick()
              for _bgq=#_beR.tbl23,1,-1 do local _bgr=_beR.tbl23[_bgq]
                local _bgs=math.max(tonumber(_bgr.lifeTime)or 0.5,0.01)
                local _bgt=math.clamp((_bgp-_bgr.startTime)/_bgs,0,1)
                if _bgt>=1 then if _bgr.segments then for _bgu,_bgv in ipairs(_bgr.segments)do if _bgv.line then pcall(_bgv.line.Remove,_bgv.line)
                      end
                    end
                  end
                  if _bgr.hostA then _bgr.hostA:Destroy()
                  end
                  if _bgr.hostB then _bgr.hostB:Destroy()
                  end table.remove(_beR.tbl23,_bgq)
                elseif _bgr.style=="drawing"and _bgo then for _bgw,_bgx in ipairs(_bgr.segments)do local _bgy,_bgz=_bgo:WorldToViewportPoint(_bgx.from)
                    local _bgA,_bgB=_bgo:WorldToViewportPoint(_bgx.to)_bgx.line.Visible=_bgz and _bgB and _bgy.Z>0 and _bgA.Z>0
                    if _bgx.line.Visible then _bgx.line.From=Vector2.new(_bgy.X,_bgy.Y)_bgx.line.To=Vector2.new(_bgA.X,_bgA.Y)_bgx.line.Transparency=(_bgr.config.opacity or 1)*(1-_bgt)
                    end
                  end
                elseif _bgr.style=="beam"and _bgr.beam then _bgr.beam.Transparency=_beR.fn35(1-(_bgr.config.opacity or 1)*(1-_bgt))
                end
              end
            end)do local function _bgC()
                local _bgD=nil
                for _bgE,_bgF in ipairs(getloadedmodules())do if _bgF.Name~="Bullet"then _bgD=nil continue
                  else local _bgG _bgG,_bgD=pcall(require,_bgF)
                    if not(_bgG and _bgD and _bgD.create)then _bgD=nil continue
                    end
                  end break
                end
                if not _bgD then for _bgH,_bgI in ipairs(game:GetDescendants())do if _bgI:IsA("ModuleScript")and _bgI.Name=="Bullet"then local _bgJ,_bgK=pcall(require,_bgI)
                      if _bgJ and _bgK and _bgK.create then _bgD=_bgK break
                      end
                    end
                  end
                end
                if not _bgD then return
                end
                local _bgL=_bgD.create _bgD.create=function(_bgM,_bgN,_bgO,...)
                  local _bgP=table.pack(...)
                  local _bgQ=_bgL _bgP.n=4+_bgP.n-1 table.move(_bgP,1,_bgP.n,4,_bgP)_bgP[1]=_bgM _bgP[2]=_bgN _bgP[3]=_bgO
                  local _bgR=_bgQ(table.unpack(_bgP,1,_bgP.n))
                  if not _bgR then return _bgR
                  end pcall(function()
                    if getgenv().HandleThirdPersonShotDisable then getgenv().HandleThirdPersonShotDisable()
                    end
                  end)
                  local _bgS=getgenv().bulletVisualizer
                  local _bgT=getgenv().GunSettings.RotateOnShot
                  if not _bgS.enabled and not _bgS.zeus and not _bgT then return _bgR
                  end
                  local _bgU=_bgR.Origin
                  local _bgV=_bgR.Hits or{}
                  local _bgW=_bgR.Direction
                  local _bgX=getgenv().ThirdPerson _bgX=_bgX and _bgX.Enabled
                  local _bgY=false
                  if _bgX then local _bgZ=_beR.localPlayer2.Character or getgenv().GetLocalCharacter and getgenv().GetLocalCharacter()and getgenv().GetLocalCharacter()
                    if _bgZ then local _bha=_bgZ:FindFirstChild("RightHand")or _bgZ:FindFirstChild("RightLowerArm")or _bgZ:FindFirstChild("RightUpperArm")or _bgZ:FindFirstChild("Right Arm")
                      if _bha and _bha:IsA("BasePart")then _bgU=_bha.Position _bgY=true
                      else local _bhb=_bgZ:FindFirstChild("HumanoidRootPart")
                        if _bhb then _bgU=_bhb.Position _bgY=true
                        end
                      end
                    end
                  end
                  if not _bgY then local _bhc=workspace.CurrentCamera
                    if _bhc then for _bhd,_bhe in ipairs(_bhc:GetChildren())do if _bhe:IsA("Model")then local _bhf=_bhe:FindFirstChild("Interactables")_bhf=_bhf and _bhf:FindFirstChild("MuzzlePart")
                          if _bhf and _bhf:IsA("BasePart")then _bgU=_bhf.Position _bgY=true break
                          end
                        end
                      end
                    end
                  end
                  if not _bgY then local _bhg=_beR.localPlayer2.Character and _beR.localPlayer2.Character:FindFirstChild("Head")
                    local _bhh
                    if _bhg then _bhh=_bhg
                    else _bhh=getgenv().GetLocalCharacter and getgenv().GetLocalCharacter()and getgenv().GetLocalCharacter():FindFirstChild("Head")
                    end
                    if _bhh then _bgU=_bgU+_bhh.CFrame.RightVector*0.1-_bhh.CFrame.UpVector*0.1
                    else _bgU=_bgU+_beR.currentCamera.CFrame.RightVector*0.1-_beR.currentCamera.CFrame.UpVector*0.1
                    end
                  end
                  if _bgT then local _bhi
                    if#_bgV>0 and _bgV[#_bgV].Position then _bhi=(_bgV[#_bgV].Position-_bgU).Unit
                    else _bhi=_bgW
                    end
                    if _bhi then local _bhj=_beR.currentCamera.CFrame:VectorToObjectSpace(_bhi)
                      local _bhk=-math.atan2(_bhj.X,-_bhj.Z)
                      local _bhl=math.asin(math.clamp(_bhj.Y,-1,1))
                      local _bhm=getgenv().GunSettings _bhm.ViewModelRotX=_bhl _bhm.ViewModelRotY=_bhk _bhm.ViewModelShotActive=true
                      local _bhn=getgenv().GunSettingsApplyViewmodels
                      if _bhn then _bhn()
                      end
                      local _bho=os.clock()_bhm.ViewModelShotToken=_bho task.delay(0.5,function()
                        if _bhm.ViewModelShotToken==_bho then _bhm.ViewModelShotActive=false _bhm.ViewModelRotX=0 _bhm.ViewModelRotY=0
                          local _bhp=getgenv().GunSettingsApplyViewmodels
                          if _bhp then _bhp()
                          end
                        end
                      end)
                    end
                  end
                  if _bgS.zeus and _bgW then _beR.fn36(_bgU,_bgW)
                  end
                  if _bgS.enabled then local _bhq=_bgU
                    for _bhr,_bhs in ipairs(_bgV)do if _bhs.Position then _bfA(_bhq,_bhs.Position,(_bhr>1 or _bhs.Exit)and _bgS.showPenetration and _bgS.penetrationColor or nil,false)_bhq=_bhs.Position
                      end
                    end
                    if#_bgV==0 and _bgW then local _bht=_bgR.Distance
                      local _bhu
                      if _bht then _bhu=_bht
                      else _bhu=_bgM.Properties and _bgM.Properties.Range
                      end _bfA(_bgU,_bgU+_bgW*(_bhu or 500),nil,false)
                    end
                  end
                  return _bgR
                end
              end
              local function _bhv()
                local _bhw=getgenv().enemyBulletVisualizer
                local function _bhx(_bhy)
                  local _bhz={}
                  if typeof(_bhy[1])=="Vector3"and typeof(_bhy[2])=="Vector3"then _bhz.v86=_bhy[1]
                    if(_bhy[2]-_bhy[1]).Magnitude>10 then _bhz.end_=_bhy[2]_bhz.direction=nil _bhz.hits=nil
                    else _bhz.direction=_bhy[2]_bhz.end_=nil _bhz.hits=nil
                    end
                  else _bhz.v86=nil _bhz.end_=nil _bhz.direction=nil _bhz.hits=nil
                    if typeof(_bhy[1])=="table"then local _bhA=_bhy[1]
                      local _bhB=_bhA.Origin or _bhA.origin or _bhA.Start or _bhA.start _bhz.direction=_bhA.Direction or _bhA.direction or _bhA.Dir or _bhA.dir _bhz.hits=_bhA.Hits or _bhA.hits or _bhA.HitPositions or _bhA.impacts _bhz.end_=_bhA.End or _bhA.endPos or _bhA.Target
                      if _bhz.end_ then _bhz.v86=_bhB
                      else _bhz.end_=_bhA.target _bhz.v86=_bhB
                      end
                    end
                  end
                  if _bhz.v86 then if _bhz.end_ then _bfA(_bhz.v86,_bhz.end_,nil,true)
                    elseif _bhz.direction then local _bhC=500
                      if typeof(_bhy[3])=="number"then _bhC=_bhy[3]
                      end _bfA(_bhz.v86,_bhz.v86+_bhz.direction*_bhC,nil,true)
                    elseif _bhz.hits and typeof(_bhz.hits)=="table"and#_bhz.hits>0 then for _bhD,_bhE in ipairs(_bhz.hits)do local _bhF=typeof(_bhE)=="Vector3"and _bhE or _bhE.Position
                        if _bhF then _bfA(_bhz.v86,_bhF,nil,true)_bhz.v86=_bhF
                        end
                      end
                    end
                  end
                end
                local function _bhG()
                  for _bhH,_bhI in ipairs(_beR.ReplicatedStorage:GetDescendants())do if _bhI:IsA("RemoteEvent")then _bhI.OnClientEvent:Connect(function(...)
                        if not _bhw.enabled then return
                        end _bhx({...},_bhI.Name)
                      end)
                    elseif _bhI:IsA("UnreliableRemoteEvent")then _bhI.OnClientEvent:Connect(function(...)
                        if not _bhw.enabled then return
                        end _bhx({...},_bhI.Name)
                      end)
                    end
                  end
                end
                local function _bhJ()_beR.Workspace.DescendantAdded:Connect(function(_bhK)
                    if _bhK:IsA("Sound")and _bhK.Parent and _bhK.Parent:IsA("Tool")then local _bhL=_bhK.Parent
                      local _bhM=_bhL:FindFirstAncestorOfClass("Model")
                      local _bhN=_beR.localPlayer2.Character or getgenv().GetLocalCharacter and getgenv().GetLocalCharacter()
                      if _bhM and _bhM~=_bhN then local _bhO=_bhL:FindFirstChild("Handle")or _bhL:FindFirstChildWhichIsA("BasePart")
                        if _bhO then task.delay(0.05,function()
                            local _bhP=_bhM:FindFirstChild("Head")
                            if _bhP then _bfA(_bhO.Position,_bhP.Position+_bhP.CFrame.LookVector*500,nil,true)
                            end
                          end)
                        end
                      end
                    end
                  end)
                end
                local function _bhQ()_beR.Workspace.DescendantAdded:Connect(function(_bhR)
                    if _bhR:IsA("Decal")or _bhR:IsA("Texture")then local _bhS=_bhR.Name:lower()
                      if _bhS:find("bullet")or _bhS:find("hole")or _bhS:find("impact")then local _bhT=_bhR.Parent
                        if _bhT and _bhT:IsA("BasePart")then local _bhU=_bhT.Position
                          for _bhV,_bhW in ipairs(_XU.Players:GetPlayers())do if _bhW~=_beR.localPlayer2 and _bhW.Character then local _bhX=_bhW.Character:FindFirstChild("Head")
                              if _bhX and(_bhX.Position-_bhU).Magnitude<500 then _bfA(_bhX.Position,_bhU,nil,true)break
                              end
                            end
                          end
                        end
                      end
                    end
                  end)
                end _bhG()_bhJ()_bhQ()_beR.ReplicatedStorage.DescendantAdded:Connect(function(_bhY)
                  if _bhY:IsA("RemoteEvent")or _bhY:IsA("UnreliableRemoteEvent")then task.wait(0.1)_bhY.OnClientEvent:Connect(function(...)
                      if not _bhw.enabled then return
                      end _bhx({...},_bhY.Name)
                    end)
                  end
                end)
              end _XU.service.Heartbeat:Connect(function(...)
              end)_XU.service.RenderStepped:Connect(function(...)
              end)_bgC()_bhv()
            end
          end
        end
        local _bhZ={}do _bhZ.camera=game:GetService("Workspace"):WaitForChild("Camera")getgenv().weaponchanger={GunEnabled=false,GunMaterial=Enum.Material.ForceField,GunColor=Color3.fromRGB(249,233,159),GunTransparency=0,ArmEnabled=false,ArmMaterial=Enum.Material.ForceField,ArmColor=Color3.fromRGB(249,233,159),ArmTransparency=0,GloveEnabled=false,GloveMaterial=Enum.Material.ForceField,GloveColor=Color3.fromRGB(249,233,153),GloveTransparency=0,CharacterEnabled=false,CharacterMaterial=Enum.Material.ForceField,CharacterColor=Color3.fromRGB(249,233,153),CharacterTransparency=0,}_bhZ.tbl23={}_bhZ.tbl24={}do local function _bia(_bib)
              if not _bhZ.tbl23[_bib]then _bhZ.tbl23[_bib]={Material=_bib.Material,Color=_bib.Color,Transparency=_bib.Transparency}
              end
            end _bhZ.fn35=function(_bic)
              if not(_y.n24>9085)then local _bid=_bhZ.tbl23[_bic]
                if _bid then pcall(function()_bic.Material=_bid.Material _bic.Color=_bid.Color _bic.Transparency=_bid.Transparency
                  end)
                end
                return
              end
              while true do end
            end _bhZ.fn36=function(_bie,_bif,_big,_bih)
              if _bie.Name=="HumanoidRootPart"then return
              end _bia(_bie)
              for _bii,_bij in ipairs(_bie:GetChildren())do if _bij:IsA("SurfaceAppearance")or _bij:IsA("Texture")or _bij:IsA("Decal")then pcall(function()_bij:Destroy()
                  end)
                end
              end pcall(function()_bie.Material=_bif _bie.Color=_big
                if _bih~=nil then _bie.Transparency=_bih
                end
              end)
            end
          end
        end do local function _bik(_bil)_bhZ.fn35(_bil)
          end _bhZ.fn32=function()
            local _bim=game:GetService("Players").LocalPlayer
            if getgenv().GetLocalCharacter then local _bin,_bio=pcall(getgenv().GetLocalCharacter)
              if _bin and _bio and _bio.Parent then return _bio
              end
            end
            if _bim.Character and _bim.Character.Parent then return _bim.Character
            end
            local _bip=workspace:FindFirstChild("Characters")
            if _bip then local _biq=_bip:FindFirstChild(_bim.Name)
              if _biq then return _biq
              end
            end
            return nil
          end _bhZ.fn31=function(_bir)
            local _bis=_bir or _bhZ.fn32()
            if not _bis then return
            end
            local _bit=getgenv().weaponchanger
            if _bit.CharacterEnabled then for _biu,_biv in ipairs(_bis:GetDescendants())do if _biv:IsA("BasePart")then _bhZ.fn36(_biv,_bit.CharacterMaterial,_bit.CharacterColor,_bit.CharacterTransparency)
                end
              end
            else for _biw,_bix in ipairs(_bis:GetDescendants())do if _bix:IsA("BasePart")and _bhZ.tbl23[_bix]then _bik(_bix)
                end
              end
            end
          end
        end _bhZ.fn30=function(_biy)
          if not _biy or _bhZ.tbl24[_biy]then return
          end _bhZ.tbl24[_biy]=true
          local _biz={}table.insert(_biz,_biy.DescendantAdded:Connect(function(_biA)
            if not getgenv().weaponchanger.CharacterEnabled then return
            end
            if _biA:IsA("BasePart")then local _biB=getgenv().weaponchanger task.defer(function()
                if _biA.Parent and _biA:IsDescendantOf(_biy)then _bhZ.fn36(_biA,_biB.CharacterMaterial,_biB.CharacterColor,_biB.CharacterTransparency)
                end
              end)
            elseif _biA:IsA("SurfaceAppearance")or _biA:IsA("Texture")or _biA:IsA("Decal")then if _biA.Parent and _biA.Parent:IsA("BasePart")and _biA.Parent:IsDescendantOf(_biy)then pcall(function()_biA:Destroy()
                end)
              end
            end
          end))table.insert(_biz,_biy.AncestryChanged:Connect(function(_biC,_biD)
            if _biD==nil then for _biE,_biF in ipairs(_biz)do pcall(function()_biF:Disconnect()
                end)
              end _bhZ.tbl24[_biy]=nil
              for _biG in pairs(_bhZ.tbl23)do if _biG.Parent then local _biH=false
                  local _biI=_biG:IsDescendantOf(_biy)==_biH
                end
              end
            end
          end))_bhZ.fn31(_biy)
        end _XT.fn30=_bhZ.fn30 _XT.fn31=_bhZ.fn31 _XT.fn32=_bhZ.fn32 _XT.camera=_bhZ.camera
      end
    end do local _biJ={}do do _biJ.fn33=function()
            local _biK=_XT.fn32()
            if _biK then _XT.fn31(_biK)
            end
          end do local _biL=game:GetService("Players").LocalPlayer
            local _biM=workspace:FindFirstChild("Characters")
            local function _biN(_biO)
              if _biO and _biO.Name==_biL.Name then _XT.fn30(_biO)
              end
            end
            local _biP=_XT.fn32()
            if _biP then _XT.fn30(_biP)
            end
            if _biL.Character then _XT.fn30(_biL.Character)
            end _biL.CharacterAdded:Connect(function(_biQ)task.wait(0.5)_XT.fn30(_biQ)
            end)
            if _biM then _biM.ChildAdded:Connect(function(_biR)task.wait(0.3)_biN(_biR)
              end)_biM.DescendantAdded:Connect(function(_biS)
                if _biS:IsA("Model")and _biS.Name==_biL.Name then task.wait(0.3)_XT.fn30(_biS)
                end
              end)
            end _biL:GetPropertyChangedSignal("Character"):Connect(function()task.wait(0.5)
              local _biT=_XT.fn32()
              if _biT then _XT.fn30(_biT)
              end
            end)
          end
        end do _biJ.tbl20={}_biJ.tbl21={}_biJ.fn34=function(_biU)
            return _biU:IsA("Texture")or _biU:IsA("Decal")or _biU:IsA("SpecialMesh")or _biU:IsA("SurfaceAppearance")
          end do local function _biV(_biW)
              for _biX,_biY in ipairs(_biW:GetChildren())do if _biJ.fn34(_biY)then _biY:Destroy()
                end
              end
            end
            local function _biZ(_bja)
              if not _biJ.tbl20[_bja]then _biJ.tbl20[_bja]={Material=_bja.Material,Color=_bja.Color,Transparency=_bja.Transparency}
              end
            end
            local function _bjb(_bjc)
              local _bjd=_biJ.tbl20[_bjc]
              if _bjd then _bjc.Material=_bjd.Material _bjc.Color=_bjd.Color _bjc.Transparency=_bjd.Transparency
              end
            end _biJ.fn35=function(_bje,_bjf,_bjg,_bjh)
              if _bje.Transparency>0 then return
              end _biZ(_bje)_biV(_bje)_bje.Material=_bjf _bje.Color=_bjg
              if _bjh~=nil then _bje.Transparency=_bjh
              end
            end _biJ.fn36=function(_bji)_bjb(_bji)
            end
          end
        end _biJ.fn37=function(_bjj,_bjk)
          if _bjj.Name=="ViewmodelLight"then return nil
          end
          if not _bjj:IsA("BasePart")then return nil
          end
          local _bjl=_bjk:FindFirstChild("Weapon")
          if _bjl and _bjj:IsDescendantOf(_bjl)then return "gun"
          end
          local _bjm=_bjk:FindFirstChild("Left Arm")
          if _bjm and _bjj:IsDescendantOf(_bjm)then local _bjn=_bjm:FindFirstChild("Glove")
            if _bjn then _bjn=_bjj==_bjn or _bjj:IsDescendantOf(_bjn)
            end
            if _bjn then return "glove"
            end
            return "arm"
          end
          local _bjo=_bjk:FindFirstChild("Right Arm")
          if _bjo and _bjj:IsDescendantOf(_bjo)then local _bjp=_bjo:FindFirstChild("Glove")
            local _bjq
            if _bjp then _bjq=_bjj==_bjp or _bjj:IsDescendantOf(_bjp)
            else _bjq=_bjp
            end
            if _bjq then return "glove"
            end
            return "arm"
          end
          return nil
        end do local function _bjr(_bjs)
            local _bjt=getgenv().weaponchanger
            if _bjs:IsA("BasePart")and _bjs.Name~="ViewmodelLight"then _biJ.fn35(_bjs,_bjt.GunMaterial,_bjt.GunColor,_bjt.GunTransparency)
            end
            for _bju,_bjv in ipairs(_bjs:GetDescendants())do if _bjv:IsA("BasePart")and _bjv.Name~="ViewmodelLight"then _biJ.fn35(_bjv,_bjt.GunMaterial,_bjt.GunColor,_bjt.GunTransparency)
              end
            end
          end
          local function _bjw(_bjx)
            if _bjx:IsA("BasePart")and _bjx.Name~="ViewmodelLight"then _biJ.fn36(_bjx)
            end
            for _bjy,_bjz in ipairs(_bjx:GetDescendants())do if _bjz:IsA("BasePart")and _bjz.Name~="ViewmodelLight"then _biJ.fn36(_bjz)
              end
            end
          end
          local function _bjA(_bjB)
            local _bjC=getgenv().weaponchanger
            local _bjD=_bjB:FindFirstChild("Glove")
            if _bjB:IsA("BasePart")then _biJ.fn35(_bjB,_bjC.ArmMaterial,_bjC.ArmColor,_bjC.ArmTransparency)
            end
            for _bjE,_bjF in ipairs(_bjB:GetDescendants())do if _bjF:IsA("BasePart")then if _bjD and(_bjF==_bjD or _bjF:IsDescendantOf(_bjD))then if _bjC.GloveEnabled then _biJ.fn35(_bjF,_bjC.GloveMaterial,_bjC.GloveColor,_bjC.GloveTransparency)
                  else _biJ.fn36(_bjF)
                  end
                else _biJ.fn35(_bjF,_bjC.ArmMaterial,_bjC.ArmColor,_bjC.ArmTransparency)
                end
              end
            end
          end
          local function _bjG(_bjH)
            if _bjH:IsA("BasePart")then _biJ.fn36(_bjH)
            end
            for _bjI,_bjJ in ipairs(_bjH:GetDescendants())do if _bjJ:IsA("BasePart")then _biJ.fn36(_bjJ)
              end
            end
          end _biJ.fn38=function(_bjK)
            local _bjL=getgenv().weaponchanger
            local _bjM=_bjK:FindFirstChild("Weapon")
            local _bjN=_bjK:FindFirstChild("Right Arm")
            local _bjO=_bjK:FindFirstChild("Left Arm")
            if _bjL.GunEnabled then if _bjM then _bjr(_bjM)
              end
            elseif _bjM then _bjw(_bjM)
            end
            if _bjL.ArmEnabled then if _bjN then _bjA(_bjN)
              end
              if _bjO then _bjA(_bjO)
              end
            else if _bjN then _bjG(_bjN)
              end
              if _bjO then _bjG(_bjO)
              end
            end
          end
        end
      end
      local _bjP do local _bjQ do do do local function _bjR(_bjS)
                if _biJ.tbl21[_bjS]then return
                end _biJ.tbl21[_bjS]=true
                local _bjT={}table.insert(_bjT,_bjS.DescendantAdded:Connect(function(_bjU)
                  local _bjV=getgenv().weaponchanger
                  local _bjW=_biJ.fn37(_bjU,_bjS)
                  if _bjW=="gun"then if _bjV.GunEnabled then _biJ.fn35(_bjU,_bjV.GunMaterial,_bjV.GunColor,_bjV.GunTransparency)
                    else _biJ.fn36(_bjU)
                    end
                  elseif _bjW=="arm"then if _bjV.ArmEnabled then _biJ.fn35(_bjU,_bjV.ArmMaterial,_bjV.ArmColor,_bjV.ArmTransparency)
                    else _biJ.fn36(_bjU)
                    end
                  elseif _bjW=="glove"then if _bjV.GloveEnabled then _biJ.fn35(_bjU,_bjV.GloveMaterial,_bjV.GloveColor,_bjV.GloveTransparency)
                    else _biJ.fn36(_bjU)
                    end
                  end
                  if not _bjU:IsA("BasePart")then if _biJ.fn34(_bjU)then local _bjX=_bjS:FindFirstChild("Weapon")
                      if _bjX and _bjU:IsDescendantOf(_bjX)then _bjU:Destroy()
                      end
                    end
                    return
                  end
                end))table.insert(_bjT,_bjS.AncestryChanged:Connect(function()
                  if not _bjS:IsDescendantOf(_XT.camera)then for _bjY,_bjZ in ipairs(_bjT)do _bjZ:Disconnect()
                    end _bjT=nil _biJ.tbl21[_bjS]=nil
                    for _bka,_bkb in ipairs(_bjS:GetDescendants())do _biJ.tbl20[_bkb]=nil
                    end
                  end
                end))table.insert(_bjT,_bjS.ChildAdded:Connect(function(_bkc)
                  if _bkc.Name=="Weapon"or _bkc.Name=="Right Arm"or _bkc.Name=="Left Arm"then _biJ.fn38(_bjS)
                  end
                end))_biJ.fn38(_bjS)
              end
              for _bkd,_bke in ipairs(_XT.camera:GetChildren())do if _bke:IsA("Model")then _bjR(_bke)
                end
              end _XT.camera.ChildAdded:Connect(function(_bkf)
                if _bkf:IsA("Model")then _bjR(_bkf)
                end
              end)
            end
          end _bjQ=function()
            for _bkg in pairs(_biJ.tbl21)do if _bkg and _bkg.Parent then _biJ.fn38(_bkg)
              end
            end
          end _bjP=_z.misc:Section("viewmodel","right")do local _bki=_bjP:Toggle({title="gun appearance",default=false,risky=false,callback=function(_bkh)getgenv().weaponchanger.GunEnabled=_bkh _bjQ()
            end,}):Settings({callback=function()
            end})_bki:Colorpicker({title="appearance color",default=Color3.fromRGB(72,116,255),transparency=1,callback=function(_bkj,_bkk)getgenv().weaponchanger.GunColor=_bkj getgenv().weaponchanger.GunTransparency=1-_bkk _bjQ()
            end,})_bki:Dropdown({title="material",values={"Neon","ForceField","Glass","Metal","SmoothPlastic","Marble",},default="Neon",multi=false,callback=function(_bkl)
              local _bkm=Enum.Material[_bkl]getgenv().weaponchanger.GunMaterial=_bkm _bjQ()
            end,})
          end
        end do local _bko=_bjP:Toggle({title="arm appearance",default=false,risky=false,callback=function(_bkn)getgenv().weaponchanger.ArmEnabled=_bkn _bjQ()
          end,}):Settings({callback=function()
          end})_bko:Colorpicker({title="appearance color",default=Color3.fromRGB(72,116,255),transparency=0.5,callback=function(_bkp,_bkq)getgenv().weaponchanger.ArmColor=_bkp
            local _bkr=1-_bkq getgenv().weaponchanger.ArmTransparency=_bkr _bjQ()
          end,})_bko:Dropdown({title="material",values={"Neon","ForceField","Glass","Metal","SmoothPlastic","Marble",},default="Glass",multi=false,callback=function(_bks)
            local _bkt=Enum.Material[_bks]getgenv().weaponchanger.ArmMaterial=_bkt _bjQ()
          end,})
        end
        local _bkv=_bjP:Toggle({title="sleeve appearance",default=false,risky=false,callback=function(_bku)getgenv().weaponchanger.GloveEnabled=_bku _bjQ()
        end,}):Settings({callback=function()
        end})_bkv:Colorpicker({title="appearance color",default=Color3.fromRGB(72,116,255),transparency=0.5,callback=function(_bkw,_bkx)getgenv().weaponchanger.GloveColor=_bkw getgenv().weaponchanger.GloveTransparency=1-_bkx _bjQ()
        end,})_bkv:Dropdown({title="material",values={"Neon","ForceField","Glass","Metal","SmoothPlastic","Marble",},default="Glass",multi=false,callback=function(_bky)
          local _bkz=Enum.Material[_bky]getgenv().weaponchanger.GloveMaterial=_bkz _bjQ()
        end,})
      end do local _bkB=_bjP:Toggle({title="character appearance",default=false,risky=false,callback=function(_bkA)getgenv().weaponchanger.CharacterEnabled=_bkA _biJ.fn33()
        end,}):Settings({callback=function()
        end})_bkB:Colorpicker({title="appearance color",default=Color3.fromRGB(255,165,199),transparency=1,callback=function(_bkC,_bkD)getgenv().weaponchanger.CharacterColor=_bkC
          local _bkE=1-_bkD getgenv().weaponchanger.CharacterTransparency=_bkE _biJ.fn33()
        end,})_bkB:Dropdown({title="material",values={"Neon","ForceField","Glass","Metal","SmoothPlastic","Marble",},default="ForceField",multi=false,callback=function(_bkF)
          local _bkG=Enum.Material[_bkF]getgenv().weaponchanger.CharacterMaterial=_bkG _biJ.fn33()
        end,})
      end _bjP:Toggle({title="persistent inspect",default=false,risky=false,callback=function(_bkH)getgenv().shizukuscripts.Exploits.PersistentInspect=_bkH
      end,})_bjP:Toggle({title="instant equip",default=false,risky=false,callback=function(_bkI)getgenv().shizukuscripts.Exploits.InstantEquip=_bkI
      end,})_bjP:Toggle({title="no sway",default=false,risky=false,callback=function(_bkJ)getgenv().shizukuscripts.Exploits.NoSway=_bkJ
      end,})_bjP:Toggle({title="no shooting animation",default=false,risky=false,callback=function(_bkK)getgenv().shizukuscripts.Exploits.NoShootAnim=_bkK
      end,})
    end _XS.skins=_z.tween:Tab("skins",true):Section("skins")_XS.tbl18={{name="Karambit",id="rbxassetid://82907878723922"},{name="M9 Bayonet",id="rbxassetid://114729507457381"},{name="Flip Knife",id="rbxassetid://114406663788910"},{name="Stiletto Knife",id="rbxassetid://71577885407500"},{name="Butterfly Knife",id="rbxassetid://84468069917481"},{name="Skeleton Knife",id="rbxassetid://96909576027112"},{name="Gut Knife",id="rbxassetid://83563180039816"},}_XS.tbl19={{id="rbxassetid://96868141739315",type="knives"},{id="rbxassetid://115310643323427",type="gloves"},{id="rbxassetid://122613466279170",type="ak47"},{id="rbxassetid://112569776588537",type="m4a1s"},{id="rbxassetid://106381346822905",type="awp"},{id="rbxassetid://102210032007604",type="famas"},{id="rbxassetid://138912757184897",type="ssg08"},{id="rbxassetid://88699722017830",type="m4a4"},{id="rbxassetid://103853751877652",type="dualbarettas"},{id="rbxassetid://131473149747361",type="galilar"},{id="rbxassetid://101594475858456",type="r8revolver"},{id="rbxassetid://139948369384565",type="deserteagle"},{id="rbxassetid://108831167850928",type="usps"},{id="rbxassetid://103206109634679",type="glock18"},{id="rbxassetid://90575765410470",type="aug"},{id="rbxassetid://81698670085410",type="fiveseven"},{id="rbxassetid://78958784545063",type="mac10"},{id="rbxassetid://100038814759724",type="mag7"},{id="rbxassetid://80128845111227",type="mp9"},{id="rbxassetid://90582975712230",type="negev"},{id="rbxassetid://139999346390524",type="nova"},{id="rbxassetid://119752198454013",type="p250"},{id="rbxassetid://137591842393094",type="p90"},{id="rbxassetid://121020346295718",type="sg553"},{id="rbxassetid://131128504842218",type="sawedoff"},{id="rbxassetid://103535879159128",type="tec9"},{id="rbxassetid://80234588113521",type="xm1014"},{id="rbxassetid://132815946459334",type="zeus"},}do local _bkL=game:GetService("HttpService")
      local _bkM=game:GetService("ReplicatedStorage")
      local _bkN=nil pcall(function()_bkN=require(_bkM.Database.Components.Libraries.Skins)
      end)_XS.fn29=function()
        local _bkO=_bkM:GetAttribute("AvaiableSkins")
        if not _bkO then return nil
        end
        local _bkP,_bkQ=pcall(function()
          return _bkL:JSONDecode(_bkO)
        end)
        if _bkP and _bkQ then return _bkQ
        end
        return nil
      end
    end
  end
  local _bkR={}
  local _bkS={}
  local _bkT={}
  local _bkU={}
  local _bkV={}
  local _bkW={}
  local _bkX={}do do do do do do local _bkY={knifes={"Karambit","Butterfly Knife","M9 Bayonet","Flip Knife","Stiletto Knife","Skeleton Knife","Gut Knife",},knives={"Karambit","Butterfly Knife","M9 Bayonet","Flip Knife","Stiletto Knife","Skeleton Knife","Gut Knife",},gloves={"Sports Gloves","Driver Gloves","Hand Wraps","Operator Gloves","T Glove","CT Glove",},ak47={"AK-47"},m4a1s={"M4A1-S"},awp={"AWP"},famas={"FAMAS"},ssg08={"SSG 08"},m4a4={"M4A4"},dualbarettas={"Dual Berettas"},galilar={"Galil AR"},r8revolver={"R8 Revolver"},deserteagle={"Desert Eagle"},usps={"USP-S"},glock18={"Glock-18"},aug={"AUG"},fiveseven={"Five-SeveN"},mac10={"MAC-10"},mag7={"MAG-7"},mp9={"MP9"},negev={"Negev"},nova={"Nova"},p250={"P250"},p90={"P90"},sg553={"SG 553"},sawedoff={"Sawed-Off"},tec9={"Tec-9"},xm1014={"XM1014"},zeus={"Zeus x27"},}_bkR.fn30=function(_bkZ)
                local _bla=_XS.fn29()
                if not _bla then return nil
                end
                local _blb=_bkY[_bkZ]
                if not _blb then for _blc,_bld in pairs(_bkY)do if _blc:lower()==_bkZ:lower()then _blb=_bld break
                    end
                  end
                end
                if not _blb then return nil
                end
                local _ble={}
                local _blf={}
                for _blg,_blh in ipairs(_blb)do local _bli=_bla[_blh]
                  if _bli then for _blj,_blk in pairs(_bli)do if _blk and _blk.wearImages and _blk.wearImages[1]and _blk.wearImages[1].assetId and _blk.isEnabled~=false then local _bll=_blk.wearImages[1].assetId
                        if not _blf[_bll]then _blf[_bll]=true table.insert(_ble,{id=_bll,name=_blj,type=_blh,wear="Factory New"})
                        end
                      elseif _blk and _blk.imageAssetId and not _blf[_blk.imageAssetId]then local _blm=_blk.imageAssetId _blf[_blm]=true table.insert(_ble,{id=_blm,name=_blj,type=_blh,wear="Factory New"})
                      end
                    end
                  end
                end table.sort(_ble,function(_bln,_blo)
                  return _bln.name<_blo.name
                end)
                return#_ble>0 and _ble or nil
              end
            end _bkR.fn31=function(_blp)
              local _blq=_XS.fn29()
              if not _blq or not _blq[_blp]then return nil
              end
              local _blr={}
              local _bls={}
              for _blt,_blu in pairs(_blq[_blp])do if _blu and _blu.wearImages and _blu.wearImages[1]and _blu.wearImages[1].assetId and _blu.isEnabled~=false then local _blv=_blu.wearImages[1].assetId
                  if not _bls[_blv]then _bls[_blv]=true table.insert(_blr,{id=_blv,name=_blt,type=_blp,wear="Factory New"})
                  end
                elseif _blu and _blu.imageAssetId and not _bls[_blu.imageAssetId]then local _blw=_blu.imageAssetId _bls[_blw]=true table.insert(_blr,{id=_blw,name=_blt,type=_blp,wear="Factory New"})
                end
              end table.sort(_blr,function(_blx,_bly)
                return _blx.name<_bly.name
              end)
              return#_blr>0 and _blr or nil
            end _bkR.tbl20={{id="rbxassetid://124866087889693",name="Snow Leopard",type="Driver Gloves",},{id="rbxassetid://114088813830068",name="Blackout",type="Sports Gloves",},{id="rbxassetid://86209384833013",name="Freshmint",type="Sports Gloves",},{id="rbxassetid://112680995725951",name="Bumblebee",type="Sports Gloves",},{id="rbxassetid://113809907046108",name="Racer",type="Sports Gloves",},{id="rbxassetid://123448009418064",name="Fade",type="Operator Gloves",},{id="rbxassetid://92411404814491",name="Labyrinth",type="Sports Gloves",},{id="rbxassetid://131013387547439",name="Bandage",type="Hand Wraps",},{id="rbxassetid://84460121237207",name="Malibu",type="Sports Gloves",},{id="rbxassetid://113241850928617",name="Emerald Widow",type="Operator Gloves",},{id="rbxassetid://77494194625324",name="The Ambassador",type="Sports Gloves",},{id="rbxassetid://92271195792490",name="Tidal",type="Sports Gloves",},{id="rbxassetid://140102369055407",name="Hellwire",type="Operator Gloves",},{id="rbxassetid://114841890691458",name="Imperial",type="Sports Gloves",},}_bkR.tbl21={{id="rbxassetid://93758402379471",wear="Factory New",name="Midas",},{id="rbxassetid://129248865691768",wear="Factory New",name="Sakura",},{id="rbxassetid://100333275604292",wear="Factory New",name="Red Baron",},{id="rbxassetid://106261473595060",wear="Factory New",name="Luminex",},{id="rbxassetid://79165418130003",wear="Factory New",name="Aniki",},{id="rbxassetid://77784581804635",wear="Factory New",name="PinPoint",},}_bkR.tbl22={{id="rbxassetid://103772900251932",wear="Factory New",name="SuperSoaked",},{id="rbxassetid://81145336779302",wear="Factory New",name="Retro",},{id="rbxassetid://86193535413500",wear="Factory New",name="Phaseprint",},{id="rbxassetid://90728486920409",wear="Factory New",name="Orchis",},{id="rbxassetid://100395479622623",wear="Factory New",name="Blackops",},{id="rbxassetid://131879735241917",wear="Factory New",name="Anodized Red",},}_bkR.tbl23={{id="rbxassetid://122995192815975",wear="Factory New",name="Typhon",},{id="rbxassetid://85574232028372",wear="Factory New",name="Tekko",},{id="rbxassetid://81400648966470",wear="Factory New",name="Railgun",},{id="rbxassetid://83295850359191",wear="Factory New",name="Overdrive",},{id="rbxassetid://115690703667451",wear="Factory New",name="High Octane",},{id="rbxassetid://125588102903302",wear="Factory New",name="Bird Hunt",},{id="rbxassetid://118594988926379",wear="Factory New",name="Beta",},}_bkR.tbl24={{id="rbxassetid://126728063218889",wear="Factory New",name="Wallpaper",},{id="rbxassetid://84937518157338",wear="Factory New",name="Mind",},{id="rbxassetid://73556930212100",wear="Factory New",name="Medic",},{id="rbxassetid://93118742324373",wear="Factory New",name="Heirloom",},{id="rbxassetid://74811856734421",wear="Factory New",name="Arctic Camo",},}_bkR.tbl25={{id="rbxassetid://127712172099348",wear="Factory New",name="Racer8",},{id="rbxassetid://103293410085218",wear="Factory New",name="Prototype",},{id="rbxassetid://89819097332207",wear="Factory New",name="Onyx",},{id="rbxassetid://126450245164016",wear="Factory New",name="Mindspill",},{id="rbxassetid://124277812129093",wear="Factory New",name="Labyrinth",},{id="rbxassetid://113048341513993",wear="Factory New",name="Desert Strike",},}_bkR.tbl26={{id="rbxassetid://79976075643573",wear="Factory New",name="Wrapped",},{id="rbxassetid://82194333419976",wear="Factory New",name="The Ambassador",},{id="rbxassetid://102614504155458",wear="Factory New",name="Tekko",},{id="rbxassetid://93337408915421",wear="Factory New",name="Ignition",},{id="rbxassetid://98519782954693",wear="Factory New",name="BubblePop",},{id="rbxassetid://107052741635853",wear="Factory New",name="B-hop",},}_bkR.tbl27={{id="rbxassetid://94718859658853",wear="Factory New",name="Vernal",},{id="rbxassetid://120194364051679",wear="Factory New",name="Tension",},{id="rbxassetid://103617250154345",wear="Factory New",name="Overclock",},{id="rbxassetid://131507197474545",wear="Factory New",name="Inked",},{id="rbxassetid://71813593655301",wear="Factory New",name="Glided",},{id="rbxassetid://116004668899318",wear="Factory New",name="Choking Hazard",},}_bkS.tbl28={{id="rbxassetid://107215991689244",wear="Factory New",name="Monochrome",},{id="rbxassetid://135905701387256",wear="Factory New",name="Limewire",},{id="rbxassetid://118380098463904",wear="Factory New",name="Irradiated",},{id="rbxassetid://79356697498606",wear="Factory New",name="Irid",},{id="rbxassetid://73716554537684",wear="Factory New",name="Feral",},}_bkS.tbl29={{id="rbxassetid://72251293243669",wear="Factory New",name="Warui",},{id="rbxassetid://91172241700841",wear="Factory New",name="Bloody8",},}_bkS.tbl30={{id="rbxassetid://75834688737733",wear="Factory New",name="Velocity",},{id="rbxassetid://75214384714270",wear="Factory New",name="Turbo",},{id="rbxassetid://82218805914551",wear="Factory New",name="shizukuscripts",},{id="rbxassetid://75758790429953",wear="Factory New",name="Racer8",},{id="rbxassetid://137719337097057",wear="Factory New",name="Permafrost",},{id="rbxassetid://127720679390903",wear="Factory New",name="Paranoia",},{id="rbxassetid://107871193518922",wear="Factory New",name="Mercy",},{id="rbxassetid://118839210332863",wear="Factory New",name="High Octane",},{id="rbxassetid://83763717166776",wear="Factory New",name="Circuit",},}_bkS.tbl31={{id="rbxassetid://79262521332403",wear="Factory New",name="Tekko",},{id="rbxassetid://98779764931541",wear="Factory New",name="SuperSoaked",},{id="rbxassetid://73891797489514",wear="Factory New",name="SpecOps",},{id="rbxassetid://89109055678729",wear="Factory New",name="Heated",},{id="rbxassetid://124476320820787",wear="Factory New",name="Ajax",},}_bkS.tbl32={{id="rbxassetid://135793626617144",wear="Factory New",name="PinPoint",},{id="rbxassetid://109022773367798",wear="Factory New",name="Midas",},{id="rbxassetid://96483145772571",wear="Factory New",name="Fuji",},{id="rbxassetid://133289113149929",wear="Factory New",name="Fade",},{id="rbxassetid://125080807345616",wear="Factory New",name="Broken Tv",},{id="rbxassetid://110209670886154",wear="Factory New",name="Aurora",},}_bkS.flag18=false _bkS.flag19=false _bkS.flag20=false _bkS.flag21=false _bkS.flag22=false _bkT.flag23=false _bkT.flag24=false _bkT.flag25=false _bkT.flag26=false _bkT.flag27=false _bkT.flag28=false _bkT.flag29=false _bkT.flag30=false _bkT.flag31=false _bkT.flag32=false _bkU.flag33=false _bkU.flag34=false _bkU.name=nil getgenv().SavedSkins=getgenv().SavedSkins or{}getgenv().SkinConfig=getgenv().SkinConfig or{DK="Butterfly Knife",DS="",DW="Factory New",GG="Sports Gloves",GS="",GW="Factory New",GunSkins={},GunWear="Factory New",}_bkU.Frame=_y.new("Frame")_bkU.Frame.Name="MainGrid"_bkU.Frame.Parent=_XS.skins.Container _bkU.Frame.BackgroundTransparency=1 _bkU.Frame.BorderSizePixel=0 _bkU.Frame.Size=_y.udim2(0,510,0,0)_bkU.Frame.Visible=true _bkU.Frame.LayoutOrder=-1 do local _blz=_y.new("UIGridLayout")_blz.CellSize=UDim2.new(0,90,0,90)_blz.CellPadding=UDim2.new(0,10,0,10)_blz.FillDirection=Enum.FillDirection.Horizontal _blz.FillDirectionMaxCells=5 _blz.HorizontalAlignment=Enum.HorizontalAlignment.Left _blz.VerticalAlignment=Enum.VerticalAlignment.Top _blz.SortOrder=Enum.SortOrder.LayoutOrder _blz.Parent=_bkU.Frame _bkU.fn32=function()_bkU.Frame.Size=_y.udim2(0,510,0,_blz.AbsoluteContentSize.Y)
              end _blz.Changed:Connect(function(_blA)
                if _blA=="AbsoluteContentSize"then _bkU.fn32()
                end
              end)
            end
          end RefreshSkinGrid=function()
            for _blB,_blC in ipairs(_bkU.Frame:GetChildren())do if _blC:IsA("TextButton")and _blC.Name~="AddSkinButton"then _blC:Destroy()
              end
            end
            for _blD,_blE in ipairs(getgenv().SavedSkins)do local _blF=_bkV.fn37(_blE,_blD)_bkU.fn33(_blF)_bkU.fn34(_blF,0)
            end _bkU.fn32()
          end _z.v84.RefreshSkinGrid=RefreshSkinGrid _bkU.TextButton=_y.new("TextButton")do local _blG=_y.new("UICorner")
            local _blH=_y.new("UIStroke")_bkU.TextButton.Name="AddSkinButton"_bkU.TextButton.Parent=_bkU.Frame _bkU.TextButton.BackgroundColor3=_y.color(21,21,21)_bkU.TextButton.BorderSizePixel=0 _bkU.TextButton.Size=_y.udim2(0,90,0,90)_bkU.TextButton.AutoButtonColor=false _bkU.TextButton.Text=""_bkU.TextButton.LayoutOrder=-1 _bkU.TextButton.ClipsDescendants=true _blG.CornerRadius=UDim.new(0,8)_blG.Parent=_bkU.TextButton _blH.ApplyStrokeMode=Enum.ApplyStrokeMode.Border _blH.Color=_y.color(48,54,68)_blH.Parent=_bkU.TextButton
          end
        end do local _blI=_y.new("TextLabel")_blI.Name="PlusLabel"_blI.Parent=_bkU.TextButton _blI.BackgroundTransparency=1 _blI.BorderSizePixel=0 _blI.Size=UDim2.new(1,0,1,0)_blI.FontFace=_y.font _blI.Text="{ + }"_blI.TextColor3=_y.color(255,255,255)_blI.TextSize=12 _blI.TextXAlignment=Enum.TextXAlignment.Center _blI.TextYAlignment=Enum.TextYAlignment.Center _blI.TextStrokeTransparency=0 _blI.TextStrokeColor3=_y.color(0,0,0)_blI.ZIndex=2
        end do local _blJ do local _blK={BackgroundColor3=theme.accent}_blJ=tweenService:Create(_bkU.TextButton,TweenInfo.new(0.2),_blK)
          end
          local _blL=tweenService:Create(_bkU.TextButton,TweenInfo.new(0.2),{BackgroundColor3=_y.color(21,21,21)})theme_event.Event:Connect(function()
            local _blM={BackgroundColor3=theme.accent}_blJ=tweenService:Create(_bkU.TextButton,TweenInfo.new(0.2),_blM)
          end)_bkU.TextButton.MouseEnter:Connect(function()_blJ:Play()
          end)_bkU.TextButton.MouseLeave:Connect(function()_blL:Play()
          end)
        end
      end do do _bkU.TextButton2=_y.new("TextButton")do local _blN=_y.new("UICorner")
            local _blO=_y.new("UIStroke")_bkU.TextButton2.Name="BackButton"_bkU.TextButton2.BackgroundColor3=_y.color(21,21,21)_bkU.TextButton2.BorderSizePixel=0 _bkU.TextButton2.Size=_y.udim2(0,90,0,90)_bkU.TextButton2.AutoButtonColor=false _bkU.TextButton2.Text=""_bkU.TextButton2.Visible=false _bkU.TextButton2.LayoutOrder=-999 _bkU.TextButton2.ClipsDescendants=true _blN.CornerRadius=UDim.new(0,8)_blN.Parent=_bkU.TextButton2 _blO.ApplyStrokeMode=Enum.ApplyStrokeMode.Border _blO.Color=_y.color(48,54,68)_blO.Parent=_bkU.TextButton2
          end
        end do local _blP=_y.new("TextLabel")_blP.Name="BackLabel"_blP.Parent=_bkU.TextButton2 _blP.BackgroundTransparency=1 _blP.BorderSizePixel=0 _blP.Size=UDim2.new(1,0,1,0)_blP.FontFace=_y.font _blP.Text="<back"_blP.TextColor3=_y.color(255,255,255)_blP.TextSize=12 _blP.TextXAlignment=Enum.TextXAlignment.Center _blP.TextYAlignment=Enum.TextYAlignment.Center _blP.TextStrokeTransparency=0 _blP.TextStrokeColor3=_y.color(0,0,0)_blP.ZIndex=2 _blP.TextTransparency=0
        end
      end do local _blQ do local _blR={BackgroundColor3=theme.accent}_blQ=tweenService:Create(_bkU.TextButton2,TweenInfo.new(0.2),_blR)
        end
        local _blS=tweenService:Create(_bkU.TextButton2,TweenInfo.new(0.2),{BackgroundColor3=_y.color(21,21,21)})theme_event.Event:Connect(function()
          local _blT={BackgroundColor3=theme.accent}_blQ=tweenService:Create(_bkU.TextButton2,TweenInfo.new(0.2),_blT)
        end)_bkU.TextButton2.MouseEnter:Connect(function()_blQ:Play()
        end)_bkU.TextButton2.MouseLeave:Connect(function()_blS:Play()
        end)
      end
    end do do do local _blU do local _blV=TweenInfo.new(0.55,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)_blU=TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.In)_bkU.fn33=function(_blW)
              for _blX,_blY in ipairs(_blW:GetDescendants())do if _blY:IsA("ImageLabel")then _blY.Position=UDim2.new(0.5,-20,0.5,0)_blY.ImageTransparency=1
                elseif _blY:IsA("TextLabel")then _blY.TextTransparency=1
                elseif _blY:IsA("Frame")and _blY~=_blW then _blY.BackgroundTransparency=1
                end
              end _blW.BackgroundTransparency=1
              local _blZ=_blW:FindFirstChildOfClass("UIStroke")
              if _blZ then _blZ.Transparency=1
              end
            end _bkU.fn34=function(_bma,_bmb)_y.delay(_bmb*0.05,function()_bma.Visible=true
                for _bmc,_bmd in ipairs(_bma:GetDescendants())do if _bmd:IsA("ImageLabel")then tweenService:Create(_bmd,_blV,{Position=UDim2.new(0.5,0,0.5,0),ImageTransparency=0}):Play()
                  elseif _bmd:IsA("Frame")and _bmd~=_bma then tweenService:Create(_bmd,_blV,{BackgroundTransparency=0}):Play()
                  end
                end tweenService:Create(_bma,_blV,{BackgroundTransparency=0}):Play()
                local _bme=_bma:FindFirstChildOfClass("UIStroke")
                if _bme then tweenService:Create(_bme,_blV,{Transparency=0}):Play()
                end
              end)
            end
          end do local function _bmf(_bmg,_bmh,_bmi)
              for _bmj,_bmk in ipairs(_bmg:GetDescendants())do if _bmk:IsA("ImageLabel")then tweenService:Create(_bmk,_blU,{ImageTransparency=1}):Play()
                elseif _bmk:IsA("TextLabel")then tweenService:Create(_bmk,_blU,{TextTransparency=1}):Play()
                elseif _bmk:IsA("Frame")and _bmk~=_bmg then tweenService:Create(_bmk,_blU,{BackgroundTransparency=1}):Play()
                end
              end tweenService:Create(_bmg,_blU,{BackgroundTransparency=1}):Play()
              local _bml=_bmg:FindFirstChildOfClass("UIStroke")
              if _bml then tweenService:Create(_bml,_blU,{Transparency=1}):Play()
              end _y.delay(0.2,function()_bmg.Visible=false
                if _bmi then _bmi()
                end
              end)
            end _bkU.fn35=function(_bmm)
              local _bmn=_bmm:GetChildren()
              local _bmo=0
              for _bmp,_bmq in ipairs(_bmn)do if _bmq:IsA("TextButton")then if _bmq.Name~="BackButton"then _bkU.fn33(_bmq)_bkU.fn34(_bmq,_bmo)_bmo+=1
                  end
                end
              end
            end _bkV.fn36=function(_bmr,_bms)
              local _bmt={}
              for _bmu,_bmv in ipairs(_bmr:GetChildren())do if _bmv:IsA("TextButton")and _bmv.Name~="BackButton"then table.insert(_bmt,_bmv)
                end
              end
              local _bmw=#_bmt
              if _bmw==0 then if _bms then _bms()
                end
                return
              end
              local _bmx=0
              for _bmy,_bmz in ipairs(_bmt)do _bmf(_bmz,_bmy,function()_bmx+=1
                  if _bmx>=_bmw and _bms then _bms()
                  end
                end)
              end
            end _bkV.fn37=function(_bmA,_bmB)
              local _bmC=_bmA.skinId
              local _bmD=_y.new("TextButton")
              local _bmE=_y.new("UICorner")
              local _bmF=_y.new("UIStroke")
              local _bmG=_y.new("ImageLabel")
              local _bmH=_y.new("TextLabel")_bmD.Name="SavedSkinBtn_"..tostring(_bmB)_bmD.Parent=_bkU.Frame _bmD.BackgroundColor3=_y.color(21,21,21)_bmD.BorderSizePixel=0 _bmD.Size=_y.udim2(0,80,0,80)_bmD.AutoButtonColor=false _bmD.Text=""_bmD.ZIndex=3 _bmD.BackgroundTransparency=1 _bmD.Visible=false _bmD.LayoutOrder=_bmB _bmE.CornerRadius=UDim.new(0,8)_bmE.Parent=_bmD _bmF.ApplyStrokeMode=Enum.ApplyStrokeMode.Border _bmF.Color=_y.color(48,54,68)_bmF.Parent=_bmD _bmF.Transparency=1 _bmG.Name="SkinImg"_bmG.Parent=_bmD _bmG.BackgroundTransparency=1 _bmG.Image=_bmC _bmG.AnchorPoint=Vector2.new(0.5,0.5)_bmG.Position=UDim2.new(0.5,-20,0.5,0)_bmG.Size=UDim2.new(1,0,1,0)_bmG.ImageColor3=_y.color(255,255,255)_bmG.ScaleType=Enum.ScaleType.Fit _bmG.ZIndex=4 _bmG.ImageTransparency=1 _bmH.Name="DeleteLabel"_bmH.Parent=_bmD _bmH.BackgroundTransparency=1 _bmH.BorderSizePixel=0 _bmH.Size=UDim2.new(1,0,1,0)_bmH.FontFace=_y.font _bmH.Text="delete"_bmH.TextColor3=_y.color(255,120,120)_bmH.TextSize=12 _bmH.TextXAlignment=Enum.TextXAlignment.Center _bmH.TextYAlignment=Enum.TextYAlignment.Center _bmH.TextStrokeTransparency=0 _bmH.TextStrokeColor3=_y.color(0,0,0)_bmH.ZIndex=6 _bmH.TextTransparency=1
              local _bmI=tweenService:Create(_bmD,TweenInfo.new(0.2),{BackgroundColor3=_y.color(10,2,10)})
              local _bmJ=tweenService:Create(_bmG,TweenInfo.new(0.2),{ImageColor3=_y.color(120,120,120)})
              local _bmK={TextTransparency=0}
              local _bmL=tweenService:Create(_bmH,TweenInfo.new(0.2),_bmK)
              local _bmM=tweenService:Create(_bmD,TweenInfo.new(0.2),{BackgroundColor3=_y.color(21,21,21)})
              local _bmN=tweenService:Create(_bmG,TweenInfo.new(0.2),{ImageColor3=_y.color(255,255,255)})
              local _bmO={TextTransparency=1}
              local _bmP=tweenService:Create(_bmH,TweenInfo.new(0.2),_bmO)_bmD.MouseEnter:Connect(function()_bmI:Play()_bmJ:Play()_bmL:Play()
              end)_bmD.MouseLeave:Connect(function()_bmM:Play()_bmN:Play()_bmP:Play()
              end)_bmD:SetAttribute("SkinType",_bmA.skinType or "knife")_bmD:SetAttribute("SkinId",_bmA.skinId)_bmD.MouseButton1Click:Connect(function()_bmf(_bmD,0,function()_bmD:Destroy()
                  for _bmQ=#SavedSkins,1,-1 do if SavedSkins[_bmQ].skinId==_bmA.skinId then table.remove(SavedSkins,_bmQ)break
                    end
                  end _y.delay(0.1,_bkU.fn32)
                end)
              end)
              return _bmD
            end RefreshSkinGrid=function()
              for _bmR,_bmS in ipairs(_bkU.Frame:GetChildren())do if _bmS:IsA("TextButton")and _bmS.Name~="AddSkinButton"then _bmS:Destroy()
                end
              end
              for _bmT,_bmU in ipairs(getgenv().SavedSkins)do local _bmV=_bkV.fn37(_bmU,_bmT)_bkU.fn33(_bmV)_bkU.fn34(_bmV,0)
              end _bkU.fn32()_bkU.Frame.Visible=true _bkU.TextButton.Visible=true
            end _z.v84.RefreshSkinGrid=RefreshSkinGrid _bkV.fn38=function(_bmW,_bmX)
              local _bmY={}
              for _bmZ,_bna in ipairs(_bkU.Frame:GetChildren())do if _bna:IsA("TextButton")and _bna.Name~="AddSkinButton"then if(_bna:GetAttribute("SkinType")or "knife")==_bmW then table.insert(_bmY,_bna)
                  end
                end
              end
              for _bnb=#SavedSkins,1,-1 do if SavedSkins[_bnb].skinType==_bmW then table.remove(SavedSkins,_bnb)
                end
              end
              if#_bmY==0 then if _bmX then _bmX()
                end
                return
              end
              local _bnc=0
              for _bnd,_bne in ipairs(_bmY)do if not _bne.Visible then _bne:Destroy()_bnc+=1
                  if#_bmY<=_bnc then if _bmX then _bmX()
                    end
                  end
                else _bmf(_bne,0,function()_bne:Destroy()_bnc+=1
                    if#_bmY<=_bnc then if _bmX then _bmX()
                      end
                    end
                  end)
                end
              end
            end
          end
        end _bkV.Frame2=_y.new("Frame")_bkV.Frame2.Name="SkinGrid"_bkV.Frame2.Parent=_XS.skins.Container _bkV.Frame2.BackgroundTransparency=1 _bkV.Frame2.BorderSizePixel=0 _bkV.Frame2.Size=_y.udim2(0,510,0,0)_bkV.Frame2.Visible=false _bkV.Frame2.LayoutOrder=-1 do local _bnf=_y.new("UIGridLayout")_bnf.CellSize=UDim2.new(0,90,0,90)_bnf.CellPadding=UDim2.new(0,10,0,2)_bnf.FillDirection=Enum.FillDirection.Horizontal _bnf.FillDirectionMaxCells=5 _bnf.HorizontalAlignment=Enum.HorizontalAlignment.Left _bnf.VerticalAlignment=Enum.VerticalAlignment.Top _bnf.SortOrder=Enum.SortOrder.LayoutOrder _bnf.Parent=_bkV.Frame2 _bkV.fn39=function()_bkV.Frame2.Size=_y.udim2(0,510,0,_bnf.AbsoluteContentSize.Y)
          end _bnf.Changed:Connect(function(_bng)
            if _bng=="AbsoluteContentSize"then _bkV.fn39()
            end
          end)
        end
      end do do _bkV.v86=_y.new("Frame")_bkV.v86.Name="KnifeGrid"_bkV.v86.Parent=_XS.skins.Container _bkV.v86.BackgroundTransparency=1 _bkV.v86.BorderSizePixel=0 _bkV.v86.Size=_y.udim2(0,510,0,0)_bkV.v86.Visible=false _bkV.v86.LayoutOrder=-1 do local _bnh=_y.new("UIGridLayout")_bnh.CellSize=UDim2.new(0,90,0,90)_bnh.CellPadding=UDim2.new(0,10,0,10)_bnh.FillDirection=Enum.FillDirection.Horizontal _bnh.FillDirectionMaxCells=5 _bnh.HorizontalAlignment=Enum.HorizontalAlignment.Left _bnh.VerticalAlignment=Enum.VerticalAlignment.Top _bnh.SortOrder=Enum.SortOrder.LayoutOrder _bnh.Parent=_bkV.v86 _bkV.fn40=function()_bkV.v86.Size=_y.udim2(0,510,0,_bnh.AbsoluteContentSize.Y)
            end _bnh.Changed:Connect(function(_bni)
              if _bni=="AbsoluteContentSize"then _bkV.fn40()
              end
            end)
          end
        end _bkV.Frame3=_y.new("Frame")_bkV.Frame3.Name="SubSkinGrid"_bkV.Frame3.Parent=_XS.skins.Container _bkV.Frame3.BackgroundTransparency=1 _bkV.Frame3.BorderSizePixel=0 _bkV.Frame3.Size=_y.udim2(0,510,0,0)_bkV.Frame3.Visible=false _bkV.Frame3.LayoutOrder=-1 do local _bnj=_y.new("UIGridLayout")_bnj.CellSize=UDim2.new(0,90,0,90)_bnj.CellPadding=UDim2.new(0,10,0,10)_bnj.FillDirection=Enum.FillDirection.Horizontal _bnj.FillDirectionMaxCells=5 _bnj.HorizontalAlignment=Enum.HorizontalAlignment.Left _bnj.VerticalAlignment=Enum.VerticalAlignment.Top _bnj.SortOrder=Enum.SortOrder.LayoutOrder _bnj.Parent=_bkV.Frame3 _bkV.fn41=function()_bkV.Frame3.Size=_y.udim2(0,510,0,_bnj.AbsoluteContentSize.Y)
          end _bnj.Changed:Connect(function(_bnk)
            if _bnk=="AbsoluteContentSize"then _bkV.fn41()
            end
          end)
        end
      end do _bkV.Frame4=_y.new("Frame")_bkV.Frame4.Name="GloveGrid"_bkV.Frame4.Parent=_XS.skins.Container _bkV.Frame4.BackgroundTransparency=1 _bkV.Frame4.BorderSizePixel=0 _bkV.Frame4.Size=_y.udim2(0,510,0,0)_bkV.Frame4.Visible=false _bkV.Frame4.LayoutOrder=-1 do local _bnl=_y.new("UIGridLayout")_bnl.CellSize=UDim2.new(0,90,0,90)_bnl.CellPadding=UDim2.new(0,10,0,10)_bnl.FillDirection=Enum.FillDirection.Horizontal _bnl.FillDirectionMaxCells=5 _bnl.HorizontalAlignment=Enum.HorizontalAlignment.Left _bnl.VerticalAlignment=Enum.VerticalAlignment.Top _bnl.SortOrder=Enum.SortOrder.LayoutOrder _bnl.Parent=_bkV.Frame4 _bkW.fn42=function()_bkV.Frame4.Size=_y.udim2(0,510,0,_bnl.AbsoluteContentSize.Y)
          end _bnl.Changed:Connect(function(_bnm)
            if _bnm=="AbsoluteContentSize"then _bkW.fn42()
            end
          end)
        end
      end _bkW.v87=_y.new("Frame")_bkW.v87.Name="Ak47Grid"_bkW.v87.Parent=_XS.skins.Container _bkW.v87.BackgroundTransparency=1 _bkW.v87.BorderSizePixel=0 _bkW.v87.Size=_y.udim2(0,510,0,0)_bkW.v87.Visible=false _bkW.v87.LayoutOrder=-1 do local _bnn=_y.new("UIGridLayout")_bnn.CellSize=UDim2.new(0,90,0,90)_bnn.CellPadding=UDim2.new(0,2,0,10)_bnn.FillDirection=Enum.FillDirection.Horizontal _bnn.FillDirectionMaxCells=5 _bnn.HorizontalAlignment=Enum.HorizontalAlignment.Left _bnn.VerticalAlignment=Enum.VerticalAlignment.Top _bnn.SortOrder=Enum.SortOrder.LayoutOrder _bnn.Parent=_bkW.v87 _bkW.fn43=function()_bkW.v87.Size=_y.udim2(0,510,0,_bnn.AbsoluteContentSize.Y)
        end _bnn.Changed:Connect(function(_bno)
          if _bno=="AbsoluteContentSize"then _bkW.fn43()
          end
        end)
      end
    end do do do _bkW.Frame5=_y.new("Frame")_bkW.Frame5.Name="M4A1SGrid"_bkW.Frame5.Parent=_XS.skins.Container _bkW.Frame5.BackgroundTransparency=1 _bkW.Frame5.BorderSizePixel=0 _bkW.Frame5.Size=_y.udim2(0,510,0,0)_bkW.Frame5.Visible=false _bkW.Frame5.LayoutOrder=-1 do local _bnp=_y.new("UIGridLayout")_bnp.CellSize=UDim2.new(0,90,0,90)_bnp.CellPadding=UDim2.new(0,10,0,10)_bnp.FillDirection=Enum.FillDirection.Horizontal _bnp.FillDirectionMaxCells=5 _bnp.HorizontalAlignment=Enum.HorizontalAlignment.Left _bnp.VerticalAlignment=Enum.VerticalAlignment.Top _bnp.SortOrder=Enum.SortOrder.LayoutOrder _bnp.Parent=_bkW.Frame5 _bkW.fn44=function()_bkW.Frame5.Size=_y.udim2(0,510,0,_bnp.AbsoluteContentSize.Y)
            end _bnp.Changed:Connect(function(_bnq)
              if _bnq=="AbsoluteContentSize"then _bkW.fn44()
              end
            end)
          end
        end _bkW.Frame6=_y.new("Frame")_bkW.Frame6.Name="AWPGrid"_bkW.Frame6.Parent=_XS.skins.Container _bkW.Frame6.BackgroundTransparency=1 _bkW.Frame6.BorderSizePixel=0 _bkW.Frame6.Size=_y.udim2(0,510,0,0)_bkW.Frame6.Visible=false _bkW.Frame6.LayoutOrder=-1 do local _bnr=_y.new("UIGridLayout")_bnr.CellSize=UDim2.new(0,90,0,90)_bnr.CellPadding=UDim2.new(0,10,0,10)_bnr.FillDirection=Enum.FillDirection.Horizontal _bnr.FillDirectionMaxCells=5 _bnr.HorizontalAlignment=Enum.HorizontalAlignment.Left _bnr.VerticalAlignment=Enum.VerticalAlignment.Top _bnr.SortOrder=Enum.SortOrder.LayoutOrder _bnr.Parent=_bkW.Frame6 _bkW.fn45=function()_bkW.Frame6.Size=_y.udim2(0,510,0,_bnr.AbsoluteContentSize.Y)
          end _bnr.Changed:Connect(function(_bns)
            if _bns=="AbsoluteContentSize"then _bkW.fn45()
            end
          end)
        end
      end do _bkW.v88=_y.new("Frame")_bkW.v88.Name="FamasGrid"_bkW.v88.Parent=_XS.skins.Container _bkW.v88.BackgroundTransparency=1 _bkW.v88.BorderSizePixel=0 _bkW.v88.Size=_y.udim2(0,510,0,0)_bkW.v88.Visible=false _bkW.v88.LayoutOrder=-1 do local _bnt=_y.new("UIGridLayout")_bnt.CellSize=UDim2.new(0,90,0,90)_bnt.CellPadding=UDim2.new(0,2,0,2)_bnt.FillDirection=Enum.FillDirection.Horizontal _bnt.FillDirectionMaxCells=5 _bnt.HorizontalAlignment=Enum.HorizontalAlignment.Left _bnt.VerticalAlignment=Enum.VerticalAlignment.Top _bnt.SortOrder=Enum.SortOrder.LayoutOrder _bnt.Parent=_bkW.v88 _bkW.fn46=function()_bkW.v88.Size=_y.udim2(0,510,0,_bnt.AbsoluteContentSize.Y)
          end _bnt.Changed:Connect(function(_bnu)
            if _bnu=="AbsoluteContentSize"then _bkW.fn46()
            end
          end)
        end
      end _bkW.Frame7=_y.new("Frame")_bkW.Frame7.Name="SSG08Grid"_bkW.Frame7.Parent=_XS.skins.Container _bkW.Frame7.BackgroundTransparency=1 _bkW.Frame7.BorderSizePixel=0 _bkW.Frame7.Size=_y.udim2(0,510,0,0)_bkW.Frame7.Visible=false _bkW.Frame7.LayoutOrder=-1 do local _bnv=_y.new("UIGridLayout")_bnv.CellSize=UDim2.new(0,90,0,90)_bnv.CellPadding=UDim2.new(0,10,0,2)_bnv.FillDirection=Enum.FillDirection.Horizontal _bnv.FillDirectionMaxCells=5 _bnv.HorizontalAlignment=Enum.HorizontalAlignment.Left _bnv.VerticalAlignment=Enum.VerticalAlignment.Top _bnv.SortOrder=Enum.SortOrder.LayoutOrder _bnv.Parent=_bkW.Frame7 _bkX.fn47=function()_bkW.Frame7.Size=_y.udim2(0,510,0,_bnv.AbsoluteContentSize.Y)
        end _bnv.Changed:Connect(function(_bnw)
          if _bnw=="AbsoluteContentSize"then _bkX.fn47()
          end
        end)
      end
    end do do _bkX.v89=_y.new("Frame")_bkX.v89.Name="M4A4Grid"_bkX.v89.Parent=_XS.skins.Container _bkX.v89.BackgroundTransparency=1 _bkX.v89.BorderSizePixel=0 _bkX.v89.Size=_y.udim2(0,510,0,0)_bkX.v89.Visible=false _bkX.v89.LayoutOrder=-1 do local _bnx=_y.new("UIGridLayout")_bnx.CellSize=UDim2.new(0,90,0,90)_bnx.CellPadding=UDim2.new(0,10,0,10)_bnx.FillDirection=Enum.FillDirection.Horizontal _bnx.FillDirectionMaxCells=5 _bnx.HorizontalAlignment=Enum.HorizontalAlignment.Left _bnx.VerticalAlignment=Enum.VerticalAlignment.Top _bnx.SortOrder=Enum.SortOrder.LayoutOrder _bnx.Parent=_bkX.v89 _bkX.fn48=function()_bkX.v89.Size=_y.udim2(0,510,0,_bnx.AbsoluteContentSize.Y)
          end _bnx.Changed:Connect(function(_bny)
            if _bny=="AbsoluteContentSize"then _bkX.fn48()
            end
          end)
        end
      end _bkX.v90=_y.new("Frame")_bkX.v90.Name="DualBarettasGrid"_bkX.v90.Parent=_XS.skins.Container _bkX.v90.BackgroundTransparency=1 _bkX.v90.BorderSizePixel=0 _bkX.v90.Size=_y.udim2(0,510,0,0)_bkX.v90.Visible=false _bkX.v90.LayoutOrder=-1 do local _bnz=_y.new("UIGridLayout")_bnz.CellSize=UDim2.new(0,90,0,90)_bnz.CellPadding=UDim2.new(0,10,0,2)_bnz.FillDirection=Enum.FillDirection.Horizontal _bnz.FillDirectionMaxCells=5 _bnz.HorizontalAlignment=Enum.HorizontalAlignment.Left _bnz.VerticalAlignment=Enum.VerticalAlignment.Top _bnz.SortOrder=Enum.SortOrder.LayoutOrder _bnz.Parent=_bkX.v90 _bkX.fn49=function()_bkX.v90.Size=_y.udim2(0,510,0,_bnz.AbsoluteContentSize.Y)
        end _bnz.Changed:Connect(function(_bnA)
          if _bnA=="AbsoluteContentSize"then _bkX.fn49()
          end
        end)
      end
    end do _bkX.Frame8=_y.new("Frame")_bkX.Frame8.Name="GalilARGrid"_bkX.Frame8.Parent=_XS.skins.Container _bkX.Frame8.BackgroundTransparency=1 _bkX.Frame8.BorderSizePixel=0 _bkX.Frame8.Size=_y.udim2(0,510,0,0)_bkX.Frame8.Visible=false _bkX.Frame8.LayoutOrder=-1 do local _bnB=_y.new("UIGridLayout")_bnB.CellSize=UDim2.new(0,90,0,90)_bnB.CellPadding=UDim2.new(0,2,0,10)_bnB.FillDirection=Enum.FillDirection.Horizontal _bnB.FillDirectionMaxCells=5 _bnB.HorizontalAlignment=Enum.HorizontalAlignment.Left _bnB.VerticalAlignment=Enum.VerticalAlignment.Top _bnB.SortOrder=Enum.SortOrder.LayoutOrder _bnB.Parent=_bkX.Frame8 _bkX.fn50=function()_bkX.Frame8.Size=_y.udim2(0,510,0,_bnB.AbsoluteContentSize.Y)
        end _bnB.Changed:Connect(function(_bnC)
          if _bnC=="AbsoluteContentSize"then _bkX.fn50()
          end
        end)
      end
    end _bkX.Frame9=_y.new("Frame")_bkX.Frame9.Name="R8RevolverGrid"_bkX.Frame9.Parent=_XS.skins.Container _bkX.Frame9.BackgroundTransparency=1 _bkX.Frame9.BorderSizePixel=0 _bkX.Frame9.Size=_y.udim2(0,510,0,0)_bkX.Frame9.Visible=false _bkX.Frame9.LayoutOrder=-1 do local _bnD=_y.new("UIGridLayout")_bnD.CellSize=UDim2.new(0,90,0,90)_bnD.CellPadding=UDim2.new(0,10,0,2)_bnD.FillDirection=Enum.FillDirection.Horizontal _bnD.FillDirectionMaxCells=5 _bnD.HorizontalAlignment=Enum.HorizontalAlignment.Left _bnD.VerticalAlignment=Enum.VerticalAlignment.Top _bnD.SortOrder=Enum.SortOrder.LayoutOrder _bnD.Parent=_bkX.Frame9 _bkX.fn51=function()_bkX.Frame9.Size=_y.udim2(0,510,0,_bnD.AbsoluteContentSize.Y)
      end _bnD.Changed:Connect(function(_bnE)
        if _bnE=="AbsoluteContentSize"then _bkX.fn51()
        end
      end)
    end
  end do local _bnF={}do do _bnF.v91=_y.new("Frame")_bnF.v91.Name="DesertEagleGrid"_bnF.v91.Parent=_XS.skins.Container _bnF.v91.BackgroundTransparency=1 _bnF.v91.BorderSizePixel=0 _bnF.v91.Size=_y.udim2(0,510,0,0)_bnF.v91.Visible=false _bnF.v91.LayoutOrder=-1 do local _bnG=_y.new("UIGridLayout")_bnG.CellSize=UDim2.new(0,90,0,90)_bnG.CellPadding=UDim2.new(0,10,0,10)_bnG.FillDirection=Enum.FillDirection.Horizontal _bnG.FillDirectionMaxCells=5 _bnG.HorizontalAlignment=Enum.HorizontalAlignment.Left _bnG.VerticalAlignment=Enum.VerticalAlignment.Top _bnG.SortOrder=Enum.SortOrder.LayoutOrder _bnG.Parent=_bnF.v91 _bnF.fn52=function()_bnF.v91.Size=_y.udim2(0,510,0,_bnG.AbsoluteContentSize.Y)
          end _bnG.Changed:Connect(function(_bnH)
            if _bnH=="AbsoluteContentSize"then _bnF.fn52()
            end
          end)
        end
      end do _bnF.Frame10=_y.new("Frame")_bnF.Frame10.Name="USPSGrid"_bnF.Frame10.Parent=_XS.skins.Container _bnF.Frame10.BackgroundTransparency=1 _bnF.Frame10.BorderSizePixel=0 _bnF.Frame10.Size=_y.udim2(0,510,0,0)_bnF.Frame10.Visible=false _bnF.Frame10.LayoutOrder=-1 do local _bnI=_y.new("UIGridLayout")_bnI.CellSize=UDim2.new(0,90,0,90)_bnI.CellPadding=UDim2.new(0,10,0,10)_bnI.FillDirection=Enum.FillDirection.Horizontal _bnI.FillDirectionMaxCells=5 _bnI.HorizontalAlignment=Enum.HorizontalAlignment.Left _bnI.VerticalAlignment=Enum.VerticalAlignment.Top _bnI.SortOrder=Enum.SortOrder.LayoutOrder _bnI.Parent=_bnF.Frame10 _bnF.fn53=function()_bnF.Frame10.Size=_y.udim2(0,510,0,_bnI.AbsoluteContentSize.Y)
          end _bnI.Changed:Connect(function(_bnJ)
            if _bnJ=="AbsoluteContentSize"then _bnF.fn53()
            end
          end)
        end
      end _bnF.Frame11=_y.new("Frame")_bnF.Frame11.Name="Glock18Grid"_bnF.Frame11.Parent=_XS.skins.Container _bnF.Frame11.BackgroundTransparency=1 _bnF.Frame11.BorderSizePixel=0 _bnF.Frame11.Size=_y.udim2(0,510,0,0)_bnF.Frame11.Visible=false _bnF.Frame11.LayoutOrder=-1 do local _bnK=_y.new("UIGridLayout")_bnK.CellSize=UDim2.new(0,90,0,90)_bnK.CellPadding=UDim2.new(0,10,0,10)_bnK.FillDirection=Enum.FillDirection.Horizontal _bnK.FillDirectionMaxCells=5 _bnK.HorizontalAlignment=Enum.HorizontalAlignment.Left _bnK.VerticalAlignment=Enum.VerticalAlignment.Top _bnK.SortOrder=Enum.SortOrder.LayoutOrder _bnK.Parent=_bnF.Frame11 _bnF.fn54=function()_bnF.Frame11.Size=_y.udim2(0,510,0,_bnK.AbsoluteContentSize.Y)
        end _bnK.Changed:Connect(function(_bnL)
          if _bnL=="AbsoluteContentSize"then _bnF.fn54()
          end
        end)
      end
    end
    local _bnM,_bnN do _bnM=_y.new("Frame")_bnM.Name="GenericGrid"_bnM.Parent=_XS.skins.Container _bnM.BackgroundTransparency=1 _bnM.BorderSizePixel=0 _bnM.Size=_y.udim2(0,510,0,0)_bnM.Visible=false _bnM.LayoutOrder=-1 do local _bnO=_y.new("UIGridLayout")_bnO.CellSize=UDim2.new(0,90,0,90)_bnO.CellPadding=UDim2.new(0,10,0,10)_bnO.FillDirection=Enum.FillDirection.Horizontal _bnO.FillDirectionMaxCells=5 _bnO.HorizontalAlignment=Enum.HorizontalAlignment.Left _bnO.VerticalAlignment=Enum.VerticalAlignment.Top _bnO.SortOrder=Enum.SortOrder.LayoutOrder _bnO.Parent=_bnM _bnN=function()_bnM.Size=_y.udim2(0,510,0,_bnO.AbsoluteContentSize.Y)
        end _bnO.Changed:Connect(function(_bnP)
          if _bnP=="AbsoluteContentSize"then _bnN()
          end
        end)
      end
    end do local function _bnQ()
        local _bnR=_XS.skins.Container.Parent
        if not _bnR then return
        end
        local _bnS=0
        for _bnT,_bnU in ipairs({_bkU.Frame,_bkV.Frame2,_bkV.v86,_bkV.Frame3,_bkV.Frame4,_bkW.v87,_bkW.Frame5,_bkW.Frame6,_bkW.v88,_bkW.Frame7,_bkX.v89,_bkX.v90,_bkX.Frame8,_bkX.Frame9,_bnF.v91,_bnF.Frame10,_bnF.Frame11,_bnM,})do if _bnU.Visible then local _bnV=0 pcall(function()
              local _bnW=_bnU:FindFirstChildWhichIsA("UIGridLayout")
              if _bnW then _bnV=_bnW.AbsoluteContentSize.Y
              end
            end)
            if _bnS<_bnV then _bnS=_bnV
            end
          end
        end
        local _bnX=math.max(310,_bnS+60)_bnR.Size=_y.udim2(0,510,0,_bnX)pcall(function()_XS.skins.Container.Size=_y.udim2(0,494,0,_bnS)
        end)
        local _bnY=_bnR.Parent
        if _bnY and _bnY:IsA("ScrollingFrame")then local _bnZ=_bnY:FindFirstChild("SingleSectionList")
          if _bnZ then pcall(function()_bnY.CanvasSize=_y.udim2(0,0,0,100+_bnZ.AbsoluteContentSize.Y)
            end)
          else pcall(function()_bnY.CanvasSize=_y.udim2(0,0,0,_bnX+100)
            end)
          end
        else local _boa=_XS.skins.Container.Parent and _XS.skins.Container.Parent.Parent
          if _boa and _boa:IsA("ScrollingFrame")then local _bob=_boa:FindFirstChild("SingleSectionList")
            if _bob then pcall(function()_boa.CanvasSize=_y.udim2(0,0,0,100+_bob.AbsoluteContentSize.Y)
              end)
            end
          end
        end
      end
      for _boc,_bod in ipairs({_bkU.Frame,_bkV.Frame2,_bkV.v86,_bkV.Frame3,_bkV.Frame4,_bkW.v87,_bkW.Frame5,_bkW.Frame6,_bkW.v88,_bkW.Frame7,_bkX.v89,_bkX.v90,_bkX.Frame8,_bkX.Frame9,_bnF.v91,_bnF.Frame10,_bnF.Frame11,_bnM,})do do local _boe=_bod:FindFirstChildWhichIsA("UIGridLayout")
          if _boe then _boe:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(_bnQ)
          end
        end _bod:GetPropertyChangedSignal("Visible"):Connect(_bnQ)
      end task.defer(_bnQ)
    end do local function _bof(_bog,_boh,_boi,_boj)
        local _bok=_boh.size or 80
        local _bol=_boh.id
        local _bom=_y.new("TextButton")
        local _bon=_y.new("UICorner")
        local _boo=_y.new("UIStroke")
        local _bop=_y.new("ImageLabel")_bom.Name=_boj and "SubSkinBtn".._bog or "SkinBtn".._bog _bom.Parent=_boi _bom.BackgroundColor3=_y.color(21,21,21)_bom.BorderSizePixel=0 _bom.Size=_y.udim2(0,_bok,0,_bok)_bom.AutoButtonColor=false _bom.Text=""_bom.ZIndex=3 _bom.BackgroundTransparency=1 _bom.Visible=false _bon.CornerRadius=UDim.new(0,8)_bon.Parent=_bom _boo.ApplyStrokeMode=Enum.ApplyStrokeMode.Border _boo.Color=_y.color(48,54,68)_boo.Parent=_bom _boo.Transparency=1 _bop.Name="SkinImg"_bop.Parent=_bom _bop.BackgroundTransparency=1 _bop.Image=_bol _bop.AnchorPoint=Vector2.new(0.5,0.5)_bop.Position=UDim2.new(0.5,-20,0.5,0)_bop.Size=UDim2.new(1,0,1,0)_bop.ImageColor3=_y.color(255,255,255)_bop.ScaleType=Enum.ScaleType.Fit _bop.ZIndex=4 _bop.ImageTransparency=1
        local _boq={BackgroundColor3=theme.accent}
        local _bor=tweenService:Create(_bom,TweenInfo.new(0.2),_boq)
        local _bos=tweenService:Create(_bom,TweenInfo.new(0.2),{BackgroundColor3=_y.color(21,21,21)})theme_event.Event:Connect(function()
          local _bot={BackgroundColor3=theme.accent}_bor=tweenService:Create(_bom,TweenInfo.new(0.2),_bot)
        end)_bom.MouseEnter:Connect(function()_bor:Play()
        end)_bom.MouseLeave:Connect(function()_bos:Play()
        end)
        return _bom
      end
      for _bou,_bov in ipairs(_XS.tbl19)do _bof(_bou,_bov,_bkV.Frame2,false).MouseButton1Click:Connect(function()
          local _bow=nil
          if _bov.type~="knives"then _bow=_bkR.fn30(_bov.type)
          end
          if _bow and#_bow>0 then local _box,_boy
            if _bov.type=="gloves"then _box=_bkV.Frame4 _boy=_bkW.fn42
            elseif _bov.type=="ak47"then _box=_bkW.v87 _boy=_bkW.fn43
            elseif _bov.type=="m4a1s"then _box=_bkW.Frame5 _boy=_bkW.fn44
            elseif _bov.type=="awp"then _box=_bkW.Frame6 _boy=_bkW.fn45
            elseif _bov.type=="famas"then _box=_bkW.v88 _boy=_bkW.fn46
            elseif _bov.type=="ssg08"then _box=_bkW.Frame7 _boy=_bkX.fn47
            elseif _bov.type=="m4a4"then _box=_bkX.v89 _boy=_bkX.fn48
            elseif _bov.type=="dualbarettas"then _box=_bkX.v90 _boy=_bkX.fn49
            elseif _bov.type=="galilar"then _box=_bkX.Frame8 _boy=_bkX.fn50
            elseif _bov.type=="r8revolver"then _box=_bkX.Frame9 _boy=_bkX.fn51
            elseif _bov.type=="deserteagle"then _box=_bnF.v91 _boy=_bnF.fn52
            elseif _bov.type=="usps"then _box=_bnF.Frame10 _boy=_bnF.fn53
            elseif _bov.type=="glock18"then _box=_bnF.Frame11 _boy=_bnF.fn54
            else _box=_bnM _boy=_bnN
            end
            if _box then _bkS.flag18=false
              if _bov.type=="gloves"then _bkS.flag21=true
              elseif _bov.type=="ak47"then _bkS.flag22=true
              elseif _bov.type=="m4a1s"then _bkT.flag23=true
              elseif _bov.type=="awp"then _bkT.flag24=true
              elseif _bov.type=="famas"then _bkT.flag25=true
              elseif _bov.type=="ssg08"then _bkT.flag26=true
              elseif _bov.type=="m4a4"then _bkT.flag27=true
              elseif _bov.type=="dualbarettas"then _bkT.flag28=true
              elseif _bov.type=="galilar"then _bkT.flag29=true
              elseif _bov.type=="r8revolver"then _bkT.flag30=true
              elseif _bov.type=="deserteagle"then _bkT.flag31=true
              elseif _bov.type=="usps"then _bkT.flag32=true
              elseif _bov.type=="glock18"then _bkU.flag33=true
              else _bkU.flag34=true
              end _bkV.Frame2.Visible=false _box.Visible=true _bkU.TextButton2.Parent=_box _bkU.TextButton2.Visible=true
              for _boz,_boA in ipairs(_box:GetChildren())do if _boA:IsA("TextButton")and _boA.Name~="BackButton"then _boA:Destroy()
                end
              end
              for _boB,_boC in ipairs(_bow)do _bof(_boB,{id=_boC.id,size=80},_box,true).MouseButton1Click:Connect(function()
                  local _boD=_bov.type _bkV.fn36(_box,function()
                    if _boD=="gloves"then _bkS.flag21=false
                    elseif _boD=="ak47"then _bkS.flag22=false
                    elseif _boD=="m4a1s"then _bkT.flag23=false
                    elseif _boD=="awp"then _bkT.flag24=false
                    elseif _boD=="famas"then _bkT.flag25=false
                    elseif _boD=="ssg08"then _bkT.flag26=false
                    elseif _boD=="m4a4"then _bkT.flag27=false
                    elseif _boD=="dualbarettas"then _bkT.flag28=false
                    elseif _boD=="galilar"then _bkT.flag29=false
                    elseif _boD=="r8revolver"then _bkT.flag30=false
                    elseif _boD=="deserteagle"then _bkT.flag31=false
                    elseif _boD=="usps"then _bkT.flag32=false
                    elseif _boD=="glock18"then _bkU.flag33=false
                    else _bkU.flag34=false
                    end _bkS.flag18=false _box.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkV.fn38(_boD,function()
                      local _boE={ak47="AK-47",m4a1s="M4A1-S",awp="AWP",famas="FAMAS",ssg08="SSG 08",m4a4="M4A4",dualbarettas="Dual Berettas",galilar="Galil AR",r8revolver="R8 Revolver",deserteagle="Desert Eagle",usps="USP-S",glock18="Glock-18",aug="AUG",fiveseven="Five-SeveN",mac10="MAC-10",mag7="MAG-7",mp9="MP9",negev="Negev",nova="Nova",p250="P250",p90="P90",sg553="SG 553",sawedoff="Sawed-Off",tec9="Tec-9",xm1014="XM1014",zeus="Zeus x27",}
                      if _boD=="gloves"then SkinConfig.GG=_boC.type SkinConfig.GS=_boC.name
                      elseif _boE[_boD]then SkinConfig.GunSkins[_boE[_boD]]=_boC.name
                      end SkinConfig.GunWear="Factory New"
                      local _boF={knifeName=_boC.name,skinId=_boC.id,skinIndex=_boB,skinType=_boD}table.insert(SavedSkins,_boF)
                      for _boG,_boH in ipairs(_bkU.Frame:GetChildren())do if _boH:IsA("TextButton")and _boH.Name~="AddSkinButton"then _boH.Visible=true
                        end
                      end
                      local _boI=_bkV.fn37(_boF,#SavedSkins)_bkU.fn33(_boI)_bkU.fn34(_boI,0)_bkU.Frame.Visible=true _bkU.TextButton.Visible=true task.defer(_bkU.fn32)
                    end)
                  end)
                end)
              end task.defer(_boy)_y.delay(0.05,function()_bkU.fn35(_box)
              end)
              return
            end
          end
          if _bov.type=="gloves"then _bkS.flag18=false _bkS.flag21=true _bkV.Frame2.Visible=false _bkV.Frame4.Visible=true _bkU.TextButton2.Parent=_bkV.Frame4 _bkU.TextButton2.Visible=true
            for _boJ,_boK in ipairs(_bkV.Frame4:GetChildren())do if _boK:IsA("TextButton")and _boK.Name~="BackButton"then _boK:Destroy()
              end
            end
            for _boL,_boM in ipairs(_bkR.tbl20)do _bof(_boL,{id=_boM.id,size=80},_bkV.Frame4,true).MouseButton1Click:Connect(function()_bkV.fn36(_bkV.Frame4,function()_bkS.flag21=false _bkS.flag18=false _bkV.Frame4.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkV.fn38("glove",function()SkinConfig.GG=_boM.type SkinConfig.GS=_boM.name SkinConfig.GW="Factory New"
                    local _boN={knifeName=_boM.type.." | ".._boM.name,skinId=_boM.id,skinIndex=_boL,skinType="glove"}table.insert(SavedSkins,_boN)
                    for _boO,_boP in ipairs(_bkU.Frame:GetChildren())do if _boP:IsA("TextButton")and _boP.Name~="AddSkinButton"then _boP.Visible=true
                      end
                    end
                    local _boQ=_bkV.fn37(_boN,#SavedSkins)_bkU.fn33(_boQ)_bkU.fn34(_boQ,0)_bkU.Frame.Visible=true _bkU.TextButton.Visible=true task.defer(_bkU.fn32)
                  end)
                end)
              end)
            end task.defer(_bkW.fn42)_y.delay(0.05,function()_bkU.fn35(_bkV.Frame4)
            end)
          elseif _bov.type=="ak47"then _bkS.flag18=false _bkS.flag22=true _bkV.Frame2.Visible=false _bkW.v87.Visible=true _bkU.TextButton2.Parent=_bkW.v87 _bkU.TextButton2.Visible=true
            for _boR,_boS in ipairs(_bkW.v87:GetChildren())do if _boS:IsA("TextButton")and _boS.Name~="BackButton"then _boS:Destroy()
              end
            end
            for _boT,_boU in ipairs(_bkR.tbl21)do _bof(_boT,{id=_boU.id,size=80},_bkW.v87,true).MouseButton1Click:Connect(function()_bkV.fn36(_bkW.v87,function()_bkS.flag22=false _bkS.flag18=false _bkW.v87.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkV.fn38("ak47",function()SkinConfig.GunSkins["AK-47"]=_boU.name SkinConfig.GunWear="Factory New"
                    local _boV={knifeName=_boU.name,skinId=_boU.id,skinIndex=_boT,skinType="ak47"}table.insert(SavedSkins,_boV)
                    for _boW,_boX in ipairs(_bkU.Frame:GetChildren())do if _boX:IsA("TextButton")and _boX.Name~="AddSkinButton"then _boX.Visible=true
                      end
                    end
                    local _boY=_bkV.fn37(_boV,#SavedSkins)_bkU.fn33(_boY)_bkU.fn34(_boY,0)_bkU.Frame.Visible=true _bkU.TextButton.Visible=true task.defer(_bkU.fn32)
                  end)
                end)
              end)
            end task.defer(_bkW.fn43)_y.delay(0.05,function()_bkU.fn35(_bkW.v87)
            end)
          elseif _bov.type=="m4a1s"then _bkS.flag18=false _bkT.flag23=true _bkV.Frame2.Visible=false _bkW.Frame5.Visible=true _bkU.TextButton2.Parent=_bkW.Frame5 _bkU.TextButton2.Visible=true
            for _boZ,_bpa in ipairs(_bkW.Frame5:GetChildren())do if _bpa:IsA("TextButton")and _bpa.Name~="BackButton"then _bpa:Destroy()
              end
            end
            for _bpb,_bpc in ipairs(_bkR.tbl22)do _bof(_bpb,{id=_bpc.id,size=80},_bkW.Frame5,true).MouseButton1Click:Connect(function()_bkV.fn36(_bkW.Frame5,function()_bkT.flag23=false _bkS.flag18=false _bkW.Frame5.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkV.fn38("m4a1s",function()SkinConfig.GunSkins["M4A1-S"]=_bpc.name SkinConfig.GunWear="Factory New"
                    local _bpd={knifeName=_bpc.name,skinId=_bpc.id,skinIndex=_bpb,skinType="m4a1s"}table.insert(SavedSkins,_bpd)
                    for _bpe,_bpf in ipairs(_bkU.Frame:GetChildren())do if _bpf:IsA("TextButton")and _bpf.Name~="AddSkinButton"then _bpf.Visible=true
                      end
                    end
                    local _bpg=_bkV.fn37(_bpd,#SavedSkins)_bkU.fn33(_bpg)_bkU.fn34(_bpg,0)_bkU.Frame.Visible=true _bkU.TextButton.Visible=true task.defer(_bkU.fn32)
                  end)
                end)
              end)
            end task.defer(_bkW.fn44)_y.delay(0.05,function()_bkU.fn35(_bkW.Frame5)
            end)
          elseif _bov.type=="awp"then _bkS.flag18=false _bkT.flag24=true _bkV.Frame2.Visible=false _bkW.Frame6.Visible=true _bkU.TextButton2.Parent=_bkW.Frame6 _bkU.TextButton2.Visible=true
            for _bph,_bpi in ipairs(_bkW.Frame6:GetChildren())do if _bpi:IsA("TextButton")and _bpi.Name~="BackButton"then _bpi:Destroy()
              end
            end
            for _bpj,_bpk in ipairs(_bkR.tbl23)do _bof(_bpj,{id=_bpk.id,size=80},_bkW.Frame6,true).MouseButton1Click:Connect(function()_bkV.fn36(_bkW.Frame6,function()_bkT.flag24=false _bkS.flag18=false _bkW.Frame6.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkV.fn38("awp",function()SkinConfig.GunSkins.AWP=_bpk.name SkinConfig.GunWear="Factory New"
                    local _bpl={knifeName=_bpk.name,skinId=_bpk.id,skinIndex=_bpj,skinType="awp"}table.insert(SavedSkins,_bpl)
                    for _bpm,_bpn in ipairs(_bkU.Frame:GetChildren())do if _bpn:IsA("TextButton")and _bpn.Name~="AddSkinButton"then _bpn.Visible=true
                      end
                    end
                    local _bpo=_bkV.fn37(_bpl,#SavedSkins)_bkU.fn33(_bpo)_bkU.fn34(_bpo,0)_bkU.Frame.Visible=true _bkU.TextButton.Visible=true task.defer(_bkU.fn32)
                  end)
                end)
              end)
            end task.defer(_bkW.fn45)_y.delay(0.05,function()_bkU.fn35(_bkW.Frame6)
            end)
          elseif _bov.type=="famas"then _bkS.flag18=false _bkT.flag25=true _bkV.Frame2.Visible=false _bkW.v88.Visible=true _bkU.TextButton2.Parent=_bkW.v88 _bkU.TextButton2.Visible=true
            for _bpp,_bpq in ipairs(_bkW.v88:GetChildren())do if _bpq:IsA("TextButton")and _bpq.Name~="BackButton"then _bpq:Destroy()
              end
            end
            for _bpr,_bps in ipairs(_bkR.tbl24)do _bof(_bpr,{id=_bps.id,size=80},_bkW.v88,true).MouseButton1Click:Connect(function()_bkV.fn36(_bkW.v88,function()_bkT.flag25=false _bkS.flag18=false _bkW.v88.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkV.fn38("famas",function()SkinConfig.GunSkins.FAMAS=_bps.name SkinConfig.GunWear="Factory New"
                    local _bpt={knifeName=_bps.name,skinId=_bps.id,skinIndex=_bpr,skinType="famas"}table.insert(SavedSkins,_bpt)
                    for _bpu,_bpv in ipairs(_bkU.Frame:GetChildren())do if _bpv:IsA("TextButton")and _bpv.Name~="AddSkinButton"then _bpv.Visible=true
                      end
                    end
                    local _bpw=_bkV.fn37(_bpt,#SavedSkins)_bkU.fn33(_bpw)_bkU.fn34(_bpw,0)_bkU.Frame.Visible=true _bkU.TextButton.Visible=true task.defer(_bkU.fn32)
                  end)
                end)
              end)
            end task.defer(_bkW.fn46)_y.delay(0.05,function()_bkU.fn35(_bkW.v88)
            end)
          elseif _bov.type=="ssg08"then _bkS.flag18=false _bkT.flag26=true _bkV.Frame2.Visible=false _bkW.Frame7.Visible=true _bkU.TextButton2.Parent=_bkW.Frame7 _bkU.TextButton2.Visible=true
            for _bpx,_bpy in ipairs(_bkW.Frame7:GetChildren())do if _bpy:IsA("TextButton")and _bpy.Name~="BackButton"then _bpy:Destroy()
              end
            end
            for _bpz,_bpA in ipairs(_bkR.tbl25)do _bof(_bpz,{id=_bpA.id,size=80},_bkW.Frame7,true).MouseButton1Click:Connect(function()_bkV.fn36(_bkW.Frame7,function()_bkT.flag26=false _bkS.flag18=false _bkW.Frame7.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkV.fn38("ssg08",function()SkinConfig.GunSkins["SSG 08"]=_bpA.name SkinConfig.GunWear="Factory New"
                    local _bpB={knifeName=_bpA.name,skinId=_bpA.id,skinIndex=_bpz,skinType="ssg08"}table.insert(SavedSkins,_bpB)
                    for _bpC,_bpD in ipairs(_bkU.Frame:GetChildren())do if _bpD:IsA("TextButton")and _bpD.Name~="AddSkinButton"then _bpD.Visible=true
                      end
                    end
                    local _bpE=_bkV.fn37(_bpB,#SavedSkins)_bkU.fn33(_bpE)_bkU.fn34(_bpE,0)_bkU.Frame.Visible=true _bkU.TextButton.Visible=true task.defer(_bkU.fn32)
                  end)
                end)
              end)
            end task.defer(_bkX.fn47)_y.delay(0.05,function()_bkU.fn35(_bkW.Frame7)
            end)
          elseif _bov.type=="m4a4"then _bkS.flag18=false _bkT.flag27=true _bkV.Frame2.Visible=false _bkX.v89.Visible=true _bkU.TextButton2.Parent=_bkX.v89 _bkU.TextButton2.Visible=true
            for _bpF,_bpG in ipairs(_bkX.v89:GetChildren())do if _bpG:IsA("TextButton")and _bpG.Name~="BackButton"then _bpG:Destroy()
              end
            end
            for _bpH,_bpI in ipairs(_bkR.tbl26)do _bof(_bpH,{id=_bpI.id,size=80},_bkX.v89,true).MouseButton1Click:Connect(function()_bkV.fn36(_bkX.v89,function()_bkT.flag27=false _bkS.flag18=false _bkX.v89.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkV.fn38("m4a4",function()SkinConfig.GunSkins.M4A4=_bpI.name SkinConfig.GunWear="Factory New"
                    local _bpJ={knifeName=_bpI.name,skinId=_bpI.id,skinIndex=_bpH,skinType="m4a4"}table.insert(SavedSkins,_bpJ)
                    for _bpK,_bpL in ipairs(_bkU.Frame:GetChildren())do if _bpL:IsA("TextButton")and _bpL.Name~="AddSkinButton"then _bpL.Visible=true
                      end
                    end
                    local _bpM=_bkV.fn37(_bpJ,#SavedSkins)_bkU.fn33(_bpM)_bkU.fn34(_bpM,0)_bkU.Frame.Visible=true _bkU.TextButton.Visible=true task.defer(_bkU.fn32)
                  end)
                end)
              end)
            end task.defer(_bkX.fn48)_y.delay(0.05,function()_bkU.fn35(_bkX.v89)
            end)
          elseif _bov.type=="dualbarettas"then _bkS.flag18=false _bkT.flag28=true _bkV.Frame2.Visible=false _bkX.v90.Visible=true _bkU.TextButton2.Parent=_bkX.v90 _bkU.TextButton2.Visible=true
            for _bpN,_bpO in ipairs(_bkX.v90:GetChildren())do if _bpO:IsA("TextButton")and _bpO.Name~="BackButton"then _bpO:Destroy()
              end
            end
            for _bpP,_bpQ in ipairs(_bkR.tbl27)do _bof(_bpP,{id=_bpQ.id,size=80},_bkX.v90,true).MouseButton1Click:Connect(function()_bkV.fn36(_bkX.v90,function()_bkT.flag28=false _bkS.flag18=false _bkX.v90.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkV.fn38("dualbarettas",function()SkinConfig.GunSkins["Dual Berettas"]=_bpQ.name SkinConfig.GunWear="Factory New"
                    local _bpR={knifeName=_bpQ.name,skinId=_bpQ.id,skinIndex=_bpP,skinType="dualbarettas"}table.insert(SavedSkins,_bpR)
                    for _bpS,_bpT in ipairs(_bkU.Frame:GetChildren())do if _bpT:IsA("TextButton")and _bpT.Name~="AddSkinButton"then _bpT.Visible=true
                      end
                    end
                    local _bpU=_bkV.fn37(_bpR,#SavedSkins)_bkU.fn33(_bpU)_bkU.fn34(_bpU,0)_bkU.Frame.Visible=true _bkU.TextButton.Visible=true task.defer(_bkU.fn32)
                  end)
                end)
              end)
            end task.defer(_bkX.fn49)_y.delay(0.05,function()_bkU.fn35(_bkX.v90)
            end)
          elseif _bov.type=="galilar"then _bkS.flag18=false _bkT.flag29=true _bkV.Frame2.Visible=false _bkX.Frame8.Visible=true _bkU.TextButton2.Parent=_bkX.Frame8 _bkU.TextButton2.Visible=true
            for _bpV,_bpW in ipairs(_bkX.Frame8:GetChildren())do if _bpW:IsA("TextButton")and _bpW.Name~="BackButton"then _bpW:Destroy()
              end
            end
            for _bpX,_bpY in ipairs(_bkS.tbl28)do _bof(_bpX,{id=_bpY.id,size=80},_bkX.Frame8,true).MouseButton1Click:Connect(function()_bkV.fn36(_bkX.Frame8,function()_bkT.flag29=false _bkS.flag18=false _bkX.Frame8.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkV.fn38("galilar",function()SkinConfig.GunSkins["Galil AR"]=_bpY.name SkinConfig.GunWear="Factory New"
                    local _bpZ={knifeName=_bpY.name,skinId=_bpY.id,skinIndex=_bpX,skinType="galilar"}table.insert(SavedSkins,_bpZ)
                    for _bqa,_bqb in ipairs(_bkU.Frame:GetChildren())do if _bqb:IsA("TextButton")and _bqb.Name~="AddSkinButton"then _bqb.Visible=true
                      end
                    end
                    local _bqc=_bkV.fn37(_bpZ,#SavedSkins)_bkU.fn33(_bqc)_bkU.fn34(_bqc,0)_bkU.Frame.Visible=true _bkU.TextButton.Visible=true task.defer(_bkU.fn32)
                  end)
                end)
              end)
            end task.defer(_bkX.fn50)_y.delay(0.05,function()_bkU.fn35(_bkX.Frame8)
            end)
          elseif _bov.type=="r8revolver"then _bkS.flag18=false _bkT.flag30=true _bkV.Frame2.Visible=false _bkX.Frame9.Visible=true _bkU.TextButton2.Parent=_bkX.Frame9 _bkU.TextButton2.Visible=true
            for _bqd,_bqe in ipairs(_bkX.Frame9:GetChildren())do if _bqe:IsA("TextButton")and _bqe.Name~="BackButton"then _bqe:Destroy()
              end
            end
            for _bqf,_bqg in ipairs(_bkS.tbl29)do _bof(_bqf,{id=_bqg.id,size=80},_bkX.Frame9,true).MouseButton1Click:Connect(function()_bkV.fn36(_bkX.Frame9,function()_bkT.flag30=false _bkS.flag18=false _bkX.Frame9.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkV.fn38("r8revolver",function()SkinConfig.GunSkins["R8 Revolver"]=_bqg.name SkinConfig.GunWear="Factory New"
                    local _bqh={knifeName=_bqg.name,skinId=_bqg.id,skinIndex=_bqf,skinType="r8revolver"}table.insert(SavedSkins,_bqh)
                    for _bqi,_bqj in ipairs(_bkU.Frame:GetChildren())do if _bqj:IsA("TextButton")and _bqj.Name~="AddSkinButton"then _bqj.Visible=true
                      end
                    end
                    local _bqk=_bkV.fn37(_bqh,#SavedSkins)_bkU.fn33(_bqk)_bkU.fn34(_bqk,0)_bkU.Frame.Visible=true _bkU.TextButton.Visible=true task.defer(_bkU.fn32)
                  end)
                end)
              end)
            end task.defer(_bkX.fn51)_y.delay(0.05,function()_bkU.fn35(_bkX.Frame9)
            end)
          elseif _bov.type=="deserteagle"then _bkS.flag18=false _bkT.flag31=true _bkV.Frame2.Visible=false _bnF.v91.Visible=true _bkU.TextButton2.Parent=_bnF.v91 _bkU.TextButton2.Visible=true
            for _bql,_bqm in ipairs(_bnF.v91:GetChildren())do if _bqm:IsA("TextButton")and _bqm.Name~="BackButton"then _bqm:Destroy()
              end
            end
            for _bqn,_bqo in ipairs(_bkS.tbl30)do _bof(_bqn,{id=_bqo.id,size=80},_bnF.v91,true).MouseButton1Click:Connect(function()_bkV.fn36(_bnF.v91,function()_bkT.flag31=false _bkS.flag18=false _bnF.v91.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkV.fn38("deserteagle",function()SkinConfig.GunSkins["Desert Eagle"]=_bqo.name SkinConfig.GunWear="Factory New"
                    local _bqp={knifeName=_bqo.name,skinId=_bqo.id,skinIndex=_bqn,skinType="deserteagle"}table.insert(SavedSkins,_bqp)
                    for _bqq,_bqr in ipairs(_bkU.Frame:GetChildren())do if _bqr:IsA("TextButton")and _bqr.Name~="AddSkinButton"then _bqr.Visible=true
                      end
                    end
                    local _bqs=_bkV.fn37(_bqp,#SavedSkins)_bkU.fn33(_bqs)_bkU.fn34(_bqs,0)_bkU.Frame.Visible=true _bkU.TextButton.Visible=true task.defer(_bkU.fn32)
                  end)
                end)
              end)
            end task.defer(_bnF.fn52)_y.delay(0.05,function()_bkU.fn35(_bnF.v91)
            end)
          elseif _bov.type=="usps"then _bkS.flag18=false _bkT.flag32=true _bkV.Frame2.Visible=false _bnF.Frame10.Visible=true _bkU.TextButton2.Parent=_bnF.Frame10 _bkU.TextButton2.Visible=true
            for _bqt,_bqu in ipairs(_bnF.Frame10:GetChildren())do if _bqu:IsA("TextButton")and _bqu.Name~="BackButton"then _bqu:Destroy()
              end
            end
            for _bqv,_bqw in ipairs(_bkS.tbl31)do _bof(_bqv,{id=_bqw.id,size=80},_bnF.Frame10,true).MouseButton1Click:Connect(function()_bkV.fn36(_bnF.Frame10,function()_bkT.flag32=false _bkS.flag18=false _bnF.Frame10.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkV.fn38("usps",function()SkinConfig.GunSkins["USP-S"]=_bqw.name SkinConfig.GunWear="Factory New"
                    local _bqx={knifeName=_bqw.name,skinId=_bqw.id,skinIndex=_bqv,skinType="usps"}table.insert(SavedSkins,_bqx)
                    for _bqy,_bqz in ipairs(_bkU.Frame:GetChildren())do if _bqz:IsA("TextButton")and _bqz.Name~="AddSkinButton"then _bqz.Visible=true
                      end
                    end
                    local _bqA=_bkV.fn37(_bqx,#SavedSkins)_bkU.fn33(_bqA)_bkU.fn34(_bqA,0)_bkU.Frame.Visible=true _bkU.TextButton.Visible=true task.defer(_bkU.fn32)
                  end)
                end)
              end)
            end task.defer(_bnF.fn53)_y.delay(0.05,function()_bkU.fn35(_bnF.Frame10)
            end)
          elseif _bov.type=="glock18"then _bkS.flag18=false _bkU.flag33=true _bkV.Frame2.Visible=false _bnF.Frame11.Visible=true _bkU.TextButton2.Parent=_bnF.Frame11 _bkU.TextButton2.Visible=true
            for _bqB,_bqC in ipairs(_bnF.Frame11:GetChildren())do if _bqC:IsA("TextButton")and _bqC.Name~="BackButton"then _bqC:Destroy()
              end
            end
            for _bqD,_bqE in ipairs(_bkS.tbl32)do _bof(_bqD,{id=_bqE.id,size=80},_bnF.Frame11,true).MouseButton1Click:Connect(function()_bkV.fn36(_bnF.Frame11,function()_bkU.flag33=false _bkS.flag18=false _bnF.Frame11.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkV.fn38("glock18",function()SkinConfig.GunSkins["Glock-18"]=_bqE.name SkinConfig.GunWear="Factory New"
                    local _bqF={knifeName=_bqE.name,skinId=_bqE.id,skinIndex=_bqD,skinType="glock18"}table.insert(SavedSkins,_bqF)
                    for _bqG,_bqH in ipairs(_bkU.Frame:GetChildren())do if _bqH:IsA("TextButton")and _bqH.Name~="AddSkinButton"then _bqH.Visible=true
                      end
                    end
                    local _bqI=_bkV.fn37(_bqF,#SavedSkins)_bkU.fn33(_bqI)_bkU.fn34(_bqI,0)_bkU.Frame.Visible=true _bkU.TextButton.Visible=true task.defer(_bkU.fn32)
                  end)
                end)
              end)
            end task.defer(_bnF.fn54)_y.delay(0.05,function()_bkU.fn35(_bnF.Frame11)
            end)
          else _bkS.flag18=false _bkS.flag19=true _bkV.Frame2.Visible=false _bkV.v86.Visible=true _bkU.TextButton2.Parent=_bkV.v86 _bkU.TextButton2.Visible=true task.defer(_bkV.fn40)_bkU.fn35(_bkV.v86)
          end
        end)
      end task.defer(_bkV.fn39)
      for _bqJ,_bqK in ipairs(_XS.tbl18)do _bof(_bqJ,_bqK,_bkV.v86,false).MouseButton1Click:Connect(function()_bkS.flag19=false _bkS.flag20=true _bkU.name=_bqK.name _bkV.v86.Visible=false _bkV.Frame3.Visible=true _bkU.TextButton2.Parent=_bkV.Frame3 _bkU.TextButton2.Visible=true
          for _bqL,_bqM in ipairs(_bkV.Frame3:GetChildren())do if _bqM:IsA("TextButton")and _bqM.Name~="BackButton"then _bqM:Destroy()
            end
          end
          local _bqN=_bkR.fn31(_bqK.name)
          if _bqN and#_bqN>0 then for _bqO,_bqP in ipairs(_bqN)do _bof(_bqO,{id=_bqP.id,size=80},_bkV.Frame3,true).MouseButton1Click:Connect(function()_bkV.fn36(_bkV.Frame3,function()_bkS.flag20=false _bkS.flag19=false _bkS.flag18=false _bkV.Frame3.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkV.fn38("knife",function()SkinConfig.DK=_bqK.name SkinConfig.DS=_bqP.name SkinConfig.DW="Factory New"
                    local _bqQ={knifeName=_bqK.name,skinId=_bqP.id,skinIndex=_bqO,skinType="knife"}table.insert(SavedSkins,_bqQ)
                    for _bqR,_bqS in ipairs(_bkU.Frame:GetChildren())do if _bqS:IsA("TextButton")and _bqS.Name~="AddSkinButton"then _bqS.Visible=true
                      end
                    end
                    local _bqT=_bkV.fn37(_bqQ,#SavedSkins)_bkU.fn33(_bqT)_bkU.fn34(_bqT,0)_bkU.Frame.Visible=true _bkU.TextButton.Visible=true task.defer(_bkU.fn32)
                  end)
                end)
              end)
            end task.defer(_bkV.fn41)_y.delay(0.05,function()_bkU.fn35(_bkV.Frame3)
            end)
            return
          end
          local _bqU=({Karambit={{name="Aurora",id="rbxassetid://113750004793967"},{name="Noir",id="rbxassetid://108497388500011"},{name="Whiteout",id="rbxassetid://82334355963706"},{name="Tiger Stripes",id="rbxassetid://71370484752060"},{name="Scarlet",id="rbxassetid://117216240536029"},{name="Damascus",id="rbxassetid://120144231261906"},{name="Midnight",id="rbxassetid://80763136393591"},{name="Frostbite",id="rbxassetid://123447040169667"},{name="Fade",id="rbxassetid://132543437940378"},},["M9 Bayonet"]={{name="Midnight",id="rbxassetid://91092197123629"},{name="Violet",id="rbxassetid://106967914785340"},{name="Whiteout",id="rbxassetid://72592920992661"},{name="Fade",id="rbxassetid://78742419491563"},{name="Scarlet",id="rbxassetid://132078898068163"},{name="Tiger Stripes",id="rbxassetid://125312157263724"},},["Flip Knife"]={{name="Frostbite",id="rbxassetid://78907946895719"},{name="Scarlet",id="rbxassetid://127959156445369"},{name="Aurora",id="rbxassetid://107603334400510"},{name="Whiteout",id="rbxassetid://130164507735326"},{name="Fade",id="rbxassetid://131986775283604"},{name="Tiger Stripes",id="rbxassetid://92519663294336"},{name="Violet",id="rbxassetid://79527892237078"},{name="Safari",id="rbxassetid://103612553827666"},{name="Midnight",id="rbxassetid://136473561078704"},{name="Noir",id="rbxassetid://106311577861315"},},["Stiletto Knife"]={{name="Scarlet",id="rbxassetid://110060359373367"},{name="Whiteout",id="rbxassetid://127072648843065"},{name="Fade",id="rbxassetid://91048445367762"},{name="Tiger Stripes",id="rbxassetid://116552571639671"},{name="Midnight",id="rbxassetid://77394651362724"},},["Butterfly Knife"]={{name="Whiteout",id="rbxassetid://110113000224373"},{name="Safari",id="rbxassetid://123190091670437"},{name="Scarlet",id="rbxassetid://87017491344468"},{name="Violet",id="rbxassetid://79300005192646"},{name="Fade",id="rbxassetid://111287462193987"},{name="Midnight",id="rbxassetid://88865925934283"},{name="Tiger Stripes",id="rbxassetid://96659966051216"},},["Skeleton Knife"]={{name="Violet",id="rbxassetid://127909377446043"},{name="Midnight",id="rbxassetid://133923596334039"},{name="Fade",id="rbxassetid://118359721200326"},{name="Scarlet",id="rbxassetid://103251681352012"},{name="Whiteout",id="rbxassetid://124594244224619"},},["Gut Knife"]={{name="Midnight",id="rbxassetid://128047568390717"},{name="Aurora",id="rbxassetid://118691372743231"},{name="Scarlet",id="rbxassetid://95174624177505"},{name="Frostbite",id="rbxassetid://94735794140831"},{name="Noir",id="rbxassetid://116282773180540"},{name="Fade",id="rbxassetid://100099630858434"},{name="Tiger Stripes",id="rbxassetid://90574007773663"},{name="Whiteout",id="rbxassetid://103026988088014"},},})[_bqK.name]
          if _bqU then for _bqV,_bqW in ipairs(_bqU)do _bof(_bqV,{id=_bqW.id,size=80},_bkV.Frame3,true).MouseButton1Click:Connect(function()_bkV.fn36(_bkV.Frame3,function()_bkS.flag20=false _bkS.flag19=false _bkS.flag18=false _bkV.Frame3.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkV.fn38("knife",function()SkinConfig.DK=_bkU.name SkinConfig.DS=_bqW.name SkinConfig.DW="Factory New"
                    local _bqX={knifeName=_bkU.name,skinId=_bqW.id,skinIndex=_bqV,skinType="knife"}table.insert(SavedSkins,_bqX)
                    for _bqY,_bqZ in ipairs(_bkU.Frame:GetChildren())do if _bqZ:IsA("TextButton")and _bqZ.Name~="AddSkinButton"then _bqZ.Visible=true
                      end
                    end
                    local _bra=_bkV.fn37(_bqX,#SavedSkins)_bkU.fn33(_bra)_bkU.fn34(_bra,0)_bkU.Frame.Visible=true _bkU.TextButton.Visible=true task.defer(_bkU.fn32)
                  end)
                end)
              end)
            end
          else for _brb=1,15 do _bof(_brb,{id=_bqK.id,size=80},_bkV.Frame3,true).MouseButton1Click:Connect(function()_bkV.fn36(_bkV.Frame3,function()_bkS.flag20=false _bkS.flag19=false _bkS.flag18=false _bkV.Frame3.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkV.fn38("knife",function()SkinConfig.DK=_bkU.name SkinConfig.DS=""SkinConfig.DW="Factory New"
                    local _brc={knifeName=_bkU.name,skinId=_bqK.id,skinIndex=_brb,skinType="knife"}table.insert(SavedSkins,_brc)
                    for _brd,_bre in ipairs(_bkU.Frame:GetChildren())do if _bre:IsA("TextButton")and _bre.Name~="AddSkinButton"then _bre.Visible=true
                      end
                    end
                    local _brf=_bkV.fn37(_brc,#SavedSkins)_bkU.fn33(_brf)_bkU.fn34(_brf,0)_bkU.Frame.Visible=true _bkU.TextButton.Visible=true task.defer(_bkU.fn32)
                  end)
                end)
              end)
            end
          end task.defer(_bkV.fn41)_y.delay(0.05,function()_bkU.fn35(_bkV.Frame3)
          end)
        end)
      end
    end _bkU.TextButton.MouseButton1Click:Connect(function()
      if not _bkS.flag18 then _bkS.flag18=true _bkU.TextButton.Visible=false
        for _brg,_brh in ipairs(_bkU.Frame:GetChildren())do if _brh:IsA("TextButton")and _brh.Name~="AddSkinButton"then _brh.Visible=false
          end
        end _bkU.TextButton2.Parent=_bkV.Frame2 _bkU.TextButton2.Visible=true _bkV.Frame2.Visible=true task.defer(_bkV.fn39)_y.delay(0.05,function()_bkU.fn35(_bkV.Frame2)
        end)
      end
    end)_bkU.TextButton2.MouseButton1Click:Connect(function()
      if _bkS.flag20 then _bkV.fn36(_bkV.Frame3,function()_bkS.flag20=false _bkS.flag19=true _bkV.Frame3.Visible=false _bkV.v86.Visible=true _bkU.TextButton2.Parent=_bkV.v86 _bkU.TextButton2.Visible=true task.defer(_bkV.fn40)_y.delay(0.05,function()_bkU.fn35(_bkV.v86)
          end)
        end)
      elseif _bkS.flag19 then _bkV.fn36(_bkV.v86,function()_bkS.flag19=false _bkS.flag18=true _bkV.v86.Visible=false _bkV.Frame2.Visible=true _bkU.TextButton2.Parent=_bkV.Frame2 _bkU.TextButton2.Visible=true task.defer(_bkV.fn39)_y.delay(0.05,function()_bkU.fn35(_bkV.Frame2)
          end)
        end)
      elseif _bkS.flag21 then _bkV.fn36(_bkV.Frame4,function()_bkS.flag21=false _bkS.flag18=true _bkV.Frame4.Visible=false _bkV.Frame2.Visible=true _bkU.TextButton2.Parent=_bkV.Frame2 _bkU.TextButton2.Visible=true task.defer(_bkV.fn39)_y.delay(0.05,function()_bkU.fn35(_bkV.Frame2)
          end)
        end)
      elseif _bkS.flag22 then _bkV.fn36(_bkW.v87,function()_bkS.flag22=false _bkS.flag18=true _bkW.v87.Visible=false _bkV.Frame2.Visible=true _bkU.TextButton2.Parent=_bkV.Frame2 _bkU.TextButton2.Visible=true task.defer(_bkV.fn39)_y.delay(0.05,function()_bkU.fn35(_bkV.Frame2)
          end)
        end)
      elseif _bkT.flag23 then _bkV.fn36(_bkW.Frame5,function()_bkT.flag23=false _bkS.flag18=true _bkW.Frame5.Visible=false _bkV.Frame2.Visible=true _bkU.TextButton2.Parent=_bkV.Frame2 _bkU.TextButton2.Visible=true task.defer(_bkV.fn39)_y.delay(0.05,function()_bkU.fn35(_bkV.Frame2)
          end)
        end)
      elseif _bkT.flag24 then _bkV.fn36(_bkW.Frame6,function()_bkT.flag24=false _bkS.flag18=true _bkW.Frame6.Visible=false _bkV.Frame2.Visible=true _bkU.TextButton2.Parent=_bkV.Frame2 _bkU.TextButton2.Visible=true task.defer(_bkV.fn39)_y.delay(0.05,function()_bkU.fn35(_bkV.Frame2)
          end)
        end)
      elseif _bkT.flag25 then _bkV.fn36(_bkW.v88,function()_bkT.flag25=false _bkS.flag18=true _bkW.v88.Visible=false _bkV.Frame2.Visible=true _bkU.TextButton2.Parent=_bkV.Frame2 _bkU.TextButton2.Visible=true task.defer(_bkV.fn39)_y.delay(0.05,function()_bkU.fn35(_bkV.Frame2)
          end)
        end)
      elseif _bkT.flag26 then _bkV.fn36(_bkW.Frame7,function()_bkT.flag26=false _bkS.flag18=true _bkW.Frame7.Visible=false _bkV.Frame2.Visible=true _bkU.TextButton2.Parent=_bkV.Frame2 _bkU.TextButton2.Visible=true task.defer(_bkV.fn39)_y.delay(0.05,function()
            if not(_y.n24<9064)then _bkU.fn35(_bkV.Frame2)
              return
            end
            while true do end
          end)
        end)
      elseif _bkT.flag27 then _bkV.fn36(_bkX.v89,function()_bkT.flag27=false _bkS.flag18=true _bkX.v89.Visible=false _bkV.Frame2.Visible=true _bkU.TextButton2.Parent=_bkV.Frame2 _bkU.TextButton2.Visible=true task.defer(_bkV.fn39)_y.delay(0.05,function()_bkU.fn35(_bkV.Frame2)
          end)
        end)
      elseif _bkT.flag28 then _bkV.fn36(_bkX.v90,function()_bkT.flag28=false _bkS.flag18=true _bkX.v90.Visible=false _bkV.Frame2.Visible=true _bkU.TextButton2.Parent=_bkV.Frame2 _bkU.TextButton2.Visible=true task.defer(_bkV.fn39)_y.delay(0.05,function()_bkU.fn35(_bkV.Frame2)
          end)
        end)
      elseif _bkT.flag29 then _bkV.fn36(_bkX.Frame8,function()_bkT.flag29=false _bkS.flag18=true _bkX.Frame8.Visible=false _bkV.Frame2.Visible=true _bkU.TextButton2.Parent=_bkV.Frame2 _bkU.TextButton2.Visible=true task.defer(_bkV.fn39)_y.delay(0.05,function()_bkU.fn35(_bkV.Frame2)
          end)
        end)
      elseif _bkT.flag30 then _bkV.fn36(_bkX.Frame9,function()_bkT.flag30=false _bkS.flag18=true _bkX.Frame9.Visible=false _bkV.Frame2.Visible=true _bkU.TextButton2.Parent=_bkV.Frame2 _bkU.TextButton2.Visible=true task.defer(_bkV.fn39)_y.delay(0.05,function()_bkU.fn35(_bkV.Frame2)
          end)
        end)
      elseif _bkT.flag31 then _bkV.fn36(_bnF.v91,function()_bkT.flag31=false _bkS.flag18=true _bnF.v91.Visible=false _bkV.Frame2.Visible=true _bkU.TextButton2.Parent=_bkV.Frame2 _bkU.TextButton2.Visible=true task.defer(_bkV.fn39)_y.delay(0.05,function()_bkU.fn35(_bkV.Frame2)
          end)
        end)
      elseif _bkT.flag32 then _bkV.fn36(_bnF.Frame10,function()_bkT.flag32=false _bkS.flag18=true _bnF.Frame10.Visible=false _bkV.Frame2.Visible=true _bkU.TextButton2.Parent=_bkV.Frame2 _bkU.TextButton2.Visible=true task.defer(_bkV.fn39)_y.delay(0.05,function()_bkU.fn35(_bkV.Frame2)
          end)
        end)
      elseif _bkU.flag33 then _bkV.fn36(_bnF.Frame11,function()_bkU.flag33=false _bkS.flag18=true _bnF.Frame11.Visible=false _bkV.Frame2.Visible=true _bkU.TextButton2.Parent=_bkV.Frame2 _bkU.TextButton2.Visible=true task.defer(_bkV.fn39)_y.delay(0.05,function()_bkU.fn35(_bkV.Frame2)
          end)
        end)
      elseif _bkU.flag34 then _bkV.fn36(_bnM,function()_bkU.flag34=false _bkS.flag18=true _bnM.Visible=false _bkV.Frame2.Visible=true _bkU.TextButton2.Parent=_bkV.Frame2 _bkU.TextButton2.Visible=true task.defer(_bkV.fn39)_y.delay(0.05,function()_bkU.fn35(_bkV.Frame2)
          end)
        end)
      elseif _bkS.flag18 then _bkV.fn36(_bkV.Frame2,function()_bkS.flag18=false _bkV.Frame2.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkU.TextButton.Visible=true
          for _bri,_brj in ipairs(_bkU.Frame:GetChildren())do if _brj:IsA("TextButton")and _brj.Name~="AddSkinButton"then _brj.Visible=true
            end
          end task.defer(_bkU.fn32)
        end)
      end
    end)inputService.InputBegan:Connect(function(_brk,_brl)
      if _brl then return
      end
      if _brk.UserInputType~=Enum.UserInputType.MouseButton1 then return
      end
      if not _bkS.flag18 and not _bkS.flag19 and not _bkS.flag20 and not _bkS.flag21 and not _bkS.flag22 and not _bkT.flag23 and not _bkT.flag24 and not _bkT.flag25 and not _bkT.flag26 and not _bkT.flag27 and not _bkT.flag28 and not _bkT.flag29 and not _bkT.flag30 and not _bkT.flag31 and not _bkT.flag32 and not _bkU.flag33 and not _bkU.flag34 then return
      end
      local _brm=inputService:GetMouseLocation()-_y.vector2(0,36)
      local _brn=_bkS.flag20 and _bkV.Frame3 or _bkS.flag19 and _bkV.v86 or _bkS.flag21 and _bkV.Frame4 or _bkS.flag22 and _bkW.v87 or _bkT.flag23 and _bkW.Frame5 or _bkT.flag24 and _bkW.Frame6 or _bkT.flag25 and _bkW.v88 or _bkT.flag26 and _bkW.Frame7 or _bkT.flag27 and _bkX.v89 or _bkT.flag28 and _bkX.v90 or _bkT.flag29 and _bkX.Frame8 or _bkT.flag30 and _bkX.Frame9 or _bkT.flag31 and _bnF.v91 or _bkT.flag32 and _bnF.Frame10 or _bkU.flag33 and _bnF.Frame11 or _bkU.flag34 and _bnM or _bkV.Frame2
      local _bro=_brn.AbsolutePosition
      local _brp=_brn.AbsoluteSize
      local _brq=_brm.X>=_bro.X and _brm.X<=_bro.X+_brp.X and _brm.Y>=_bro.Y and _brm.Y<=_bro.Y+_brp.Y
      local _brr=_bkU.TextButton2.AbsolutePosition
      local _brs=_bkU.TextButton2.AbsoluteSize
      if not _brq and not(_brm.X>=_brr.X and _brm.X<=_brr.X+_brs.X and _brm.Y>=_brr.Y and _brm.Y<=_brr.Y+_brs.Y)then if _bkS.flag20 then _bkV.fn36(_bkV.Frame3,function()_bkS.flag20=false _bkS.flag19=false _bkS.flag18=false _bkV.Frame3.Visible=false _bkV.v86.Visible=false _bkV.Frame2.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkU.TextButton.Visible=true
            for _brt,_bru in ipairs(_bkU.Frame:GetChildren())do if _bru:IsA("TextButton")and _bru.Name~="AddSkinButton"then _bru.Visible=true
              end
            end task.defer(_bkU.fn32)
          end)
        elseif _bkS.flag19 then _bkV.fn36(_bkV.v86,function()_bkS.flag19=false _bkS.flag18=false _bkV.v86.Visible=false _bkV.Frame2.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkU.TextButton.Visible=true
            for _brv,_brw in ipairs(_bkU.Frame:GetChildren())do if _brw:IsA("TextButton")and _brw.Name~="AddSkinButton"then _brw.Visible=true
              end
            end task.defer(_bkU.fn32)
          end)
        elseif _bkS.flag21 then _bkV.fn36(_bkV.Frame4,function()_bkS.flag21=false _bkS.flag18=false _bkV.Frame4.Visible=false _bkV.Frame2.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkU.TextButton.Visible=true
            for _brx,_bry in ipairs(_bkU.Frame:GetChildren())do if _bry:IsA("TextButton")and _bry.Name~="AddSkinButton"then _bry.Visible=true
              end
            end task.defer(_bkU.fn32)
            if not _w then return
            end
          end)
        elseif _bkS.flag22 then _bkV.fn36(_bkW.v87,function()_bkS.flag22=false _bkS.flag18=false _bkW.v87.Visible=false _bkV.Frame2.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkU.TextButton.Visible=true
            for _brz,_brA in ipairs(_bkU.Frame:GetChildren())do if _brA:IsA("TextButton")and _brA.Name~="AddSkinButton"then _brA.Visible=true
              end
            end task.defer(_bkU.fn32)
          end)
        elseif _bkT.flag23 then _bkV.fn36(_bkW.Frame5,function()_bkT.flag23=false _bkS.flag18=false _bkW.Frame5.Visible=false _bkV.Frame2.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkU.TextButton.Visible=true
            for _brB,_brC in ipairs(_bkU.Frame:GetChildren())do if _brC:IsA("TextButton")and _brC.Name~="AddSkinButton"then _brC.Visible=true
              end
            end task.defer(_bkU.fn32)
          end)
        elseif _bkT.flag24 then _bkV.fn36(_bkW.Frame6,function()_bkT.flag24=false _bkS.flag18=false _bkW.Frame6.Visible=false _bkV.Frame2.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkU.TextButton.Visible=true
            for _brD,_brE in ipairs(_bkU.Frame:GetChildren())do if _brE:IsA("TextButton")and _brE.Name~="AddSkinButton"then _brE.Visible=true
              end
            end task.defer(_bkU.fn32)
          end)
        elseif _bkT.flag25 then _bkV.fn36(_bkW.v88,function()_bkT.flag25=false _bkS.flag18=false _bkW.v88.Visible=false _bkV.Frame2.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkU.TextButton.Visible=true
            for _brF,_brG in ipairs(_bkU.Frame:GetChildren())do if _brG:IsA("TextButton")and _brG.Name~="AddSkinButton"then _brG.Visible=true
              end
            end task.defer(_bkU.fn32)
          end)
        elseif _bkT.flag26 then _bkV.fn36(_bkW.Frame7,function()_bkT.flag26=false _bkS.flag18=false _bkW.Frame7.Visible=false _bkV.Frame2.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkU.TextButton.Visible=true
            for _brH,_brI in ipairs(_bkU.Frame:GetChildren())do if _brI:IsA("TextButton")and _brI.Name~="AddSkinButton"then _brI.Visible=true
              end
            end task.defer(_bkU.fn32)
          end)
        elseif _bkT.flag27 then _bkV.fn36(_bkX.v89,function()_bkT.flag27=false _bkS.flag18=false _bkX.v89.Visible=false _bkV.Frame2.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkU.TextButton.Visible=true
            for _brJ,_brK in ipairs(_bkU.Frame:GetChildren())do if _brK:IsA("TextButton")and _brK.Name~="AddSkinButton"then _brK.Visible=true
              end
            end task.defer(_bkU.fn32)
          end)
        elseif _bkT.flag28 then _bkV.fn36(_bkX.v90,function()_bkT.flag28=false _bkS.flag18=false _bkX.v90.Visible=false _bkV.Frame2.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkU.TextButton.Visible=true
            for _brL,_brM in ipairs(_bkU.Frame:GetChildren())do if _brM:IsA("TextButton")and _brM.Name~="AddSkinButton"then _brM.Visible=true
              end
            end task.defer(_bkU.fn32)
          end)
        elseif _bkT.flag29 then _bkV.fn36(_bkX.Frame8,function()_bkT.flag29=false _bkS.flag18=false _bkX.Frame8.Visible=false _bkV.Frame2.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkU.TextButton.Visible=true
            for _brN,_brO in ipairs(_bkU.Frame:GetChildren())do if _brO:IsA("TextButton")and _brO.Name~="AddSkinButton"then _brO.Visible=true
              end
            end task.defer(_bkU.fn32)
          end)
        elseif _bkT.flag30 then _bkV.fn36(_bkX.Frame9,function()_bkT.flag30=false _bkS.flag18=false _bkX.Frame9.Visible=false _bkV.Frame2.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkU.TextButton.Visible=true
            for _brP,_brQ in ipairs(_bkU.Frame:GetChildren())do if _brQ:IsA("TextButton")and _brQ.Name~="AddSkinButton"then _brQ.Visible=true
              end
            end task.defer(_bkU.fn32)
          end)
        elseif _bkT.flag31 then _bkV.fn36(_bnF.v91,function()_bkT.flag31=false _bkS.flag18=false _bnF.v91.Visible=false _bkV.Frame2.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkU.TextButton.Visible=true
            for _brR,_brS in ipairs(_bkU.Frame:GetChildren())do if _brS:IsA("TextButton")and _brS.Name~="AddSkinButton"then _brS.Visible=true
              end
            end task.defer(_bkU.fn32)
          end)
        elseif _bkT.flag32 then _bkV.fn36(_bnF.Frame10,function()_bkT.flag32=false _bkS.flag18=false _bnF.Frame10.Visible=false _bkV.Frame2.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkU.TextButton.Visible=true
            for _brT,_brU in ipairs(_bkU.Frame:GetChildren())do if _brU:IsA("TextButton")and _brU.Name~="AddSkinButton"then _brU.Visible=true
              end
            end task.defer(_bkU.fn32)
          end)
        elseif _bkU.flag33 then _bkV.fn36(_bnF.Frame11,function()_bkU.flag33=false _bkS.flag18=false _bnF.Frame11.Visible=false _bkV.Frame2.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkU.TextButton.Visible=true
            for _brV,_brW in ipairs(_bkU.Frame:GetChildren())do if _brW:IsA("TextButton")and _brW.Name~="AddSkinButton"then _brW.Visible=true
              end
            end task.defer(_bkU.fn32)
          end)
        elseif _bkS.flag18 then _bkV.fn36(_bkV.Frame2,function()_bkS.flag18=false _bkV.Frame2.Visible=false _bkU.TextButton2.Visible=false _bkU.TextButton2.Parent=nil _bkU.TextButton.Visible=true
            for _brX,_brY in ipairs(_bkU.Frame:GetChildren())do if _brY:IsA("TextButton")and _brY.Name~="AddSkinButton"then _brY.Visible=true
              end
            end task.defer(_bkU.fn32)
          end)
        end
      end
    end)
  end
  local _brZ do do task.defer(_bkU.fn32)task.spawn(function()
        local _bsa=game:GetService("ReplicatedStorage")
        local _bsb=require(_bsa.Database.Components.Libraries.Skins)
        local _bsc=_bsa:WaitForChild("Assets"):WaitForChild("Skins")
        local _bsd=game:GetService("RunService")
        local function _bse(_bsf)
          return _bsf=="CT Knife"or _bsf=="T Knife"
        end
        local function _bsg()
          return SkinConfig.DS and SkinConfig.DS~=""and SkinConfig.DS or "Vanilla"
        end
        local function _bsh(_bsi,_bsj)
          for _bsk,_bsl in _bsi:GetDescendants()do if _bsl:IsA("BasePart")or _bsl:IsA("MeshPart")then local _bsm=_bsj:FindFirstChild(_bsl.Name)
              if _bsm then local _bsn=_bsl:FindFirstChildOfClass("SurfaceAppearance")
                if _bsn then _bsn:Destroy()
                end
                local _bso=_bsm:Clone()_bso.Name="SurfaceAppearance"_bso.Parent=_bsl
              end
            end
          end
        end
        local function _bsp(_bsq,_bsr,_bss)
          if not _bsq or not _bsr then return
          end pcall(function()
            local _bst=_bsc:FindFirstChild(SkinConfig.DK)
            if not _bst then return
            end
            local _bsu=_bst:FindFirstChild(_bsr)
            local _bsv=_bsu and _bsu:FindFirstChild("Camera")
            if _bsv then _bsv=_bsu.Camera:FindFirstChild(_bss or "Factory New")
            end
            if not _bsv then return
            end
            local _bsw=_bsq:FindFirstChild("Weapon")
            if not _bsw then return
            end _bsh(_bsw,_bsv)_bsq:SetAttribute("SkinApplied",_bsr)
          end)
        end
        local function _bsx(_bsy,_bsz,_bsA)
          if not _bsy or not _bsz then return
          end pcall(function()
            local _bsB=_bsc:FindFirstChild(SkinConfig.GG)
            if not _bsB then return
            end
            local _bsC=_bsB:FindFirstChild(_bsz)
            local _bsD=_bsC and _bsC:FindFirstChild("Camera")
            if _bsD then _bsD=_bsC.Camera:FindFirstChild(_bsA or "Factory New")
            end
            if not _bsD then return
            end
            for _bsE,_bsF in{"Left Arm","Right Arm"},nil,nil do local _bsG=_bsy:FindFirstChild(_bsF)
              if _bsG then local _bsH=_bsG:FindFirstChild("Glove")
                if _bsH then local _bsI=_bsD:FindFirstChild(_bsF)
                  if _bsI then local _bsJ=_bsH:FindFirstChildOfClass("SurfaceAppearance")
                    if _bsJ then _bsJ:Destroy()
                    end
                    local _bsK=_bsI:Clone()_bsK.Name="SurfaceAppearance"_bsK.Parent=_bsH
                  end
                end
              end
            end _bsy:SetAttribute("GloveSkinApplied",_bsz)
          end)
        end
        local function _bsL(_bsM)
          return SkinConfig.GunSkins[_bsM]~=nil
        end
        local function _bsN(_bsO,_bsP,_bsQ)
          if not _bsO or not _bsP then return
          end pcall(function()
            local _bsR=_bsc:FindFirstChild(_bsO.Name)
            if not _bsR then return
            end
            local _bsS=_bsR:FindFirstChild(_bsP)
            local _bsT=_bsS and _bsS:FindFirstChild("Camera")
            if _bsT then _bsT=_bsS.Camera:FindFirstChild(_bsQ or "Factory New")
            end
            if not _bsT then return
            end
            local _bsU=_bsO:FindFirstChild("Weapon")
            if not _bsU then return
            end _bsh(_bsU,_bsT)_bsO:SetAttribute("SkinApplied",_bsP)
          end)
        end
        local function _bsV(_bsW)
          if not _bsW or typeof(_bsW)~="Instance"then return
          end
          local _bsX=SkinConfig.GS and SkinConfig.GS~=""
          if _bsX then local _bsY=SkinConfig.GS _bsX=_bsW:GetAttribute("GloveSkinApplied")~=_bsY
          end
          if _bsX then task.defer(function()_bsx(_bsW,SkinConfig.GS,SkinConfig.GW)
            end)
          end
        end
        local _bsZ=_bsb.GetCameraModel _bsb.GetCameraModel=function(_bta,_btb,...)
          local _btc=table.pack(...)
          if _bse(_bta)then local _btd=_bsZ(SkinConfig.DK,_bsg(),...)
            if _btd then if SkinConfig.DS and SkinConfig.DS~=""then task.defer(function()_bsp(_btd,SkinConfig.DS,SkinConfig.DW)
                end)
              end _bsV(_btd)
            end
            return _btd
          end
          local _bte=SkinConfig.GunSkins[_bta]
          local _btf
          if _bte then local _btg=_bsZ(_bta,_bte,...)
            if _btg then _btf=_btg
            else local _bth=_bsZ(_bta,_btb,table.unpack(_btc,1,_btc.n))_btf=_bth
            end
          else _btf=_bsZ(_bta,_btb,...)
          end
          if _btf then if _bsL(_bta)then task.defer(function()_bsN(_btf,SkinConfig.GunSkins[_bta],SkinConfig.GunWear)
              end)
            end _bsV(_btf)
          end
          return _btf
        end
        local _bti=_bsb.GetBaseWeaponModel _bsb.GetBaseWeaponModel=function(_btj,_btk,...)
          if _bse(_btj)then local _btl=_bti(SkinConfig.DK,_btk,...)
            if _btl then if SkinConfig.DS and SkinConfig.DS~=""then task.defer(function()_bsp(_btl,SkinConfig.DS,SkinConfig.DW)
                end)
              end _bsV(_btl)
            end
            return _btl
          end
          return _bti(_btj,_btk,...)
        end
        if _bsb.GetCharacterModel then local _btm=_bsb.GetCharacterModel _bsb.GetCharacterModel=function(_btn,_bto,...)
            if _bse(_btn)then return _btm(SkinConfig.DK,_bsg(),...)
            end
            local _btp=SkinConfig.GunSkins[_btn]
            if _btp then return _btm(_btn,_btp,...)
            end
            return _btm(_btn,_bto,...)
          end
        end
        local _btq=nil pcall(function()_btq=require(_bsa.Classes.WeaponComponent.Classes.Viewmodel)
        end)
        if _btq and _btq.new then local _btr=_btq.new _btq.new=function(_bts,_btt,_btu,...)
            if _bse(_btt)then local _btv=_btr(_bts,SkinConfig.DK,_bsg(),...)_bsV(_btv)
              return _btv
            end
            local _btw=SkinConfig.GunSkins[_btt]
            if _btw then return _btr(_bts,_btt,_btw,...)
            end
            return _btr(_bts,_btt,_btu,...)
          end
        end
        local _btx=nil pcall(function()_btx=require(_bsa.Database.Components.Common.AttachGlovesToViewmodel)
        end)
        if _btx then local _bty=_btx _btx=function(_btz,_btA)_bty(_btz,_btA)_bsV(_btA)
          end
        end
        if getgenv().SKCL then getgenv().SKCL:Disconnect()
        end
        local _btB=_bsd.Heartbeat getgenv().SKCL=_btB:Connect(function(...)
        end)
      end)_brZ=_z.tween:Tab("settings")do local _btC="e4l3gant/configs/bloxstrike"
        local _btD=_btC.."/autoload.txt"
        local _btE=_btC.."/autoload_meta.json"
        local _btM={path=_btC.."/",file="",config_name="",get_list=function()
          local _btF={}
          local _btG,_btH=pcall(function()
            return listfiles(_btC)
          end)
          if not _btG or type(_btH)~="table"then return _btF
          end
          for _btI,_btJ in ipairs(_btH)do local _btK=tostring(_btJ):gsub("\\","/")
            local _btL=_btK:match("([^/]+)$")or _btK
            if _btL:lower():match("%.txt$")and _btL:lower()~="autoload.txt"then table.insert(_btF,(_btL:gsub("%.[Tt][Xx][Tt]$","")))
            end
          end
          return _btF
        end,}pcall(function()
          if not isfolder("e4l3gant")then makefolder("e4l3gant")
          end
        end)pcall(function()
          if not isfolder("e4l3gant/configs")then makefolder("e4l3gant/configs")
          end
        end)pcall(function()
          if not isfolder(_btC)then makefolder(_btC)
          end
        end)pcall(function()
          if not isfolder(_btC.."/skin_configs")then makefolder(_btC.."/skin_configs")
          end
        end)
        local function _btN()
          local _btO=""pcall(function()_btO=_z.v84:GetConfig()
          end)
          local _btP={spin=getgenv().SHIZUKUSCRIPTS_SPIN_SETTINGS,timestamp=os.time(),modules={silent_aim=getgenv().SHIZUKUSCRIPTS_SILENT_AIM and getgenv().SHIZUKUSCRIPTS_SILENT_AIM.enabled or false,autoshoot=getgenv().SHIZUKUSCRIPTS_AUTOSHOOT and getgenv().SHIZUKUSCRIPTS_AUTOSHOOT.enabled or false,esp=getgenv().SHIZUKUSCRIPTS_ESP and getgenv().SHIZUKUSCRIPTS_ESP.enabled or false,aimbot=getgenv().SHIZUKUSCRIPTS_AIMBOT and getgenv().SHIZUKUSCRIPTS_AIMBOT.enabled or false,ghost_hand=getgenv().SHIZUKUSCRIPTS_GHOST_HAND and getgenv().SHIZUKUSCRIPTS_GHOST_HAND.enabled or false,},}
          local _btQ=""pcall(function()_btQ=game:GetService("HttpService"):JSONEncode(_btP)
          end)
          return tostring(_btO or"").."\n---SHIZUKUSCRIPTS---\n"..tostring(_btQ or "{}")
        end
        local function _btR(_btS)_btS=_btS or{}pcall(function()
            local _btT=getgenv().SHIZUKUSCRIPTS_SILENT_AIM
            if _btT and type(_btT.toggle)=="function"and _btS.silent_aim~=nil then _btT:toggle(_btS.silent_aim==true)
            end
          end)pcall(function()
            local _btU=getgenv().SHIZUKUSCRIPTS_AUTOSHOOT
            if _btU and type(_btU.toggle)=="function"and _btS.autoshoot~=nil then _btU:toggle(_btS.autoshoot==true)
            end
          end)pcall(function()
            local _btV=getgenv().SHIZUKUSCRIPTS_ESP
            if _btV and _btS.esp~=nil then _btV.enabled=_btS.esp==true
            end
          end)pcall(function()
            local _btW=getgenv().SHIZUKUSCRIPTS_AIMBOT
            if _btW and type(_btW.toggle)=="function"and _btS.aimbot~=nil then _btW:toggle(_btS.aimbot==true)
            elseif _btW and _btS.aimbot~=nil then _btW.enabled=_btS.aimbot==true
            end
          end)pcall(function()
            local _btX=getgenv().SHIZUKUSCRIPTS_GHOST_HAND
            if _btX and type(_btX.set)=="function"and _btS.ghost_hand~=nil then _btX:set(_btS.ghost_hand==true)
            end
          end)task.defer(function()task.wait(0.15)pcall(function()
              if _z.v84 and _z.v84.Flags then end
            end)
          end)
        end
        local function _btY(_btZ)
          if type(_btZ)~="string"or _btZ==""then return false
          end
          local _bua,_bub=_btZ,nil
          local _buc=_btZ:find("\n---SHIZUKUSCRIPTS---\n",1,true)
          if _buc then _bua=_btZ:sub(1,_buc-1)_bub=_btZ:sub(_buc+#"\n---SHIZUKUSCRIPTS---\n")
          end
          local _bud=nil
          if _bub and _bub~=""then local _bue,_buf=pcall(function()
              return game:GetService("HttpService"):JSONDecode(_bub)
            end)
            if _bue and type(_buf)=="table"then if type(_buf.spin)=="table"then local _bug=getgenv().SHIZUKUSCRIPTS_SPIN_SETTINGS or{}
                for _buh,_bui in pairs(_buf.spin)do _bug[_buh]=_bui
                end getgenv().SHIZUKUSCRIPTS_SPIN_SETTINGS=_bug
              end
              if type(_buf.modules)=="table"then _bud=_buf.modules
              end
            end
          end
          if _bua and _bua~=""then pcall(function()_z.v84:LoadConfig(_bua)
            end)task.defer(function()task.wait(0.2)pcall(function()_z.v84:LoadConfig(_bua)
              end)
              if _bud then _btR(_bud)
              end
            end)
          elseif _bud then _btR(_bud)
          end
          return true
        end
        local function _buj()
          local _buk=_btN()
          local _bul=pcall(writefile,_btD,_buk)
          return _bul
        end
        local function _bum()
          local _bun,_buo=pcall(isfile,_btD)
          if not _bun or not _buo then return false
          end
          local _bup,_buq=pcall(readfile,_btD)
          if not _bup or type(_buq)~="string"then return false
          end
          return _btY(_buq)
        end pcall(function()writefile(_btE,game:GetService("HttpService"):JSONEncode({enabled=false}))
        end)
        local _bur=_brZ:Section("configuration","left")
        local function _bus(_but)
          local _buu="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
          return((_but:gsub(".",function(_buv)
            local _buw,_bux="",_buv:byte()
            for _buy=8,1,-1 do _buw=_buw..(_bux%2^_buy-_bux%2^(_buy-1)>0 and "1"or "0")
            end
            return _buw
          end).."0000"):gsub("%d%d%d?%d?%d?%d?",function(_buz)
            if#_buz<6 then return""
            end
            local _buA=0
            for _buB=1,6 do _buA=_buA+(_buz:sub(_buB,_buB)=="1"and 2^(6-_buB)or 0)
            end
            return _buu:sub(_buA+1,_buA+1)
          end)..({"","==","="})[#_but%3+1])
        end
        local function _buC(_buD)
          local _buE="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"_buD=tostring(_buD or""):gsub("[^".._buE.."=]","")
          return(_buD:gsub(".",function(_buF)
            if _buF=="="then return""
            end
            local _buG,_buH="",(_buE:find(_buF)-1)
            for _buI=6,1,-1 do _buG=_buG..(_buH%2^_buI-_buH%2^(_buI-1)>0 and "1"or "0")
            end
            return _buG
          end):gsub("%d%d%d?%d?%d?%d?%d?%d?",function(_buJ)
            if#_buJ~=8 then return""
            end
            local _buK=0
            for _buL=1,8 do _buK=_buK+(_buJ:sub(_buL,_buL)=="1"and 2^(8-_buL)or 0)
            end
            return string.char(_buK)
          end))
        end
        local _buM=""_bur:Button({title="SAVE config",callback=function()
          local _buN=_buj()
          if _buN then local _buO=_btN()
            local _buP="SHIZUKUSCRIPTS1:".._bus(_buO)_buM=_buP pcall(function()
              if setclipboard then setclipboard(_buP)
              elseif toclipboard then toclipboard(_buP)
              end
            end)print("[shizukuscripts] SAVED \226\128\148 share code copied to clipboard")print(_buP:sub(1,72)..(#_buP>72 and "..."or""))
          else print("[shizukuscripts] Save FAILED")
          end
        end,})_bur:Button({title="LOAD config",callback=function()
          local _buQ=_bum()print(_buQ and "[shizukuscripts] Config LOADED"or "[shizukuscripts] No saved config")
        end,})_bur:Button({title="COPY share code",callback=function()
          local _buR=_btN()
          local _buS="SHIZUKUSCRIPTS1:".._bus(_buR)_buM=_buS pcall(function()
            if setclipboard then setclipboard(_buS)
            elseif toclipboard then toclipboard(_buS)
            end
          end)print("[shizukuscripts] Share code copied \226\128\148 send to friends")
        end,})_bur:TextBox({title="share / name",default="",placeholder="paste share code OR type config name",ClearTextOnFocus=true,callback=function(_buT)_buM=tostring(_buT or"")_btM.config_name=tostring(_buT or"")
        end,})_bur:Button({title="IMPORT share code",callback=function()
          local _buU=tostring(_buM or""):gsub("^%s+",""):gsub("%s+$","")
          if _buU==""then print("[shizukuscripts] Paste share code in the box first")
            return
          end
          if _buU:sub(1,10)=="SHIZUKUSCRIPTS1:"then _buU=_buU:sub(11)
          end
          local _buV,_buW=pcall(_buC,_buU)
          if not _buV or type(_buW)~="string"or#_buW<5 then print("[shizukuscripts] Bad share code")
            return
          end _btY(_buW)print("[shizukuscripts] Share code imported OK")
        end,})_bur:Button({title="save as name",callback=function()
          local _buX=tostring(_btM.config_name or _buM or""):gsub("^%s+",""):gsub("%s+$","")_buX=_buX:gsub("[\\\\/:*?\"<>|]","_")
          if _buX==""or _buX:find("SHIZUKUSCRIPTS1:")then print("[shizukuscripts] Type a short name in the box (not a share code)")
            return
          end
          local _buY=_btN()
          local _buZ=pcall(writefile,_btM.path.._buX..".txt",_buY)
          if _buZ then local _bva="SHIZUKUSCRIPTS1:".._bus(_buY)pcall(function()
              if setclipboard then setclipboard(_bva)
              elseif toclipboard then toclipboard(_bva)
              end
            end)print("[shizukuscripts] Saved as: ".._buX.." + share code copied")
          else print("[shizukuscripts] Named save failed")
          end
        end,})pcall(function()
          local _bvb=_btM:get_list()
          if type(_bvb)~="table"or#_bvb==0 then _bvb={"--"}
          end
          local _bvd,_bve=_bur:Dropdown({title="named configs",values=_bvb,default=_bvb[1]or "--",multi=false,callback=function(_bvc)_btM.file=_bvc
          end,})_bur:Button({title="load named",callback=function()
            local _bvf=_btM.file
            if type(_bvf)~="string"or _bvf==""or _bvf=="--"then print("[shizukuscripts] Select a named config")
              return
            end
            local _bvg,_bvh=pcall(readfile,_btM.path.._bvf..".txt")
            if _bvg and type(_bvh)=="string"then _btY(_bvh)print("[shizukuscripts] Loaded: ".._bvf)
            else print("[shizukuscripts] Failed to load: "..tostring(_bvf))
            end
          end,})_bur:Button({title="delete named",callback=function()
            local _bvi=_btM.file
            if type(_bvi)=="string"and _bvi~=""and _bvi~="--"then pcall(delfile,_btM.path.._bvi..".txt")print("[shizukuscripts] Deleted: ".._bvi)
            end
          end,})
        end)print("[shizukuscripts] Config: SAVE copies share code | IMPORT loads friend code")
      end
    end do local _bvq={path="e4l3g4nt/configs/bloxstrike/skin_configs/",file="",config_name="",get_list=function()
        local _bvj={}
        local _bvk,_bvl=pcall(function()
          return listfiles("e4l3g4nt/configs/bloxstrike/skin_configs")
        end)
        if not _bvk or type(_bvl)~="table"then return _bvj
        end
        for _bvm,_bvn in ipairs(_bvl)do local _bvo=tostring(_bvn):gsub("\\","/")
          local _bvp=_bvo:match("([^/]+)$")or _bvo
          if _bvp:lower():match("%.txt$")then table.insert(_bvj,(_bvp:gsub("%.[Tt][Xx][Tt]$","")))
          end
        end
        return _bvj
      end,}
      local _bvr=_brZ:Section("skin configs","left")_bvr:TextBox({title="NO TITLE",default="",placeholder="skin config name",ClearTextOnFocus=true,callback=function(_bvs)_bvq.config_name=_bvs
      end,})
      local _bvu,_bvv=_bvr:Dropdown({title="skin configs",values=_bvq:get_list(),default="--",multi=false,callback=function(_bvt)_bvq.file=_bvt
      end,})_bvr:Button({title="load skin config",callback=function()
        local _bvw=_bvq.file
        if type(_bvw)~="string"or _bvw==""or _bvw=="--"then return
        end
        local _bvx=_bvq.path.._bvw..".txt"
        local _bvy,_bvz=pcall(isfile,_bvx)
        if not _bvy or not _bvz then return
        end
        local _bvA,_bvB=pcall(readfile,_bvx)
        if _bvA and type(_bvB)=="string"then pcall(function()_z.v84:LoadSkinConfig(_bvB)
          end)pcall(function()_bvv:Refresh(_bvq:get_list())
          end)
        end
      end,})_bvr:Button({title="save skin config",callback=function()
        local _bvC=tostring(_bvq.config_name or""):gsub("^%s+",""):gsub("%s+$","")_bvC=_bvC:gsub("[\\\\/:*?\"<>|]","_")
        if _bvC~=""then local _bvD,_bvE=pcall(function()
            return _z.v84:GetSkinConfig()
          end)
          if _bvD and type(_bvE)=="string"then pcall(writefile,_bvq.path.._bvC..".txt",_bvE)pcall(function()_bvv:Refresh(_bvq:get_list())
            end)
          end
        end
      end,})_bvr:Button({title="delete skin config",callback=function()
        if _y.n28(365)>=1094 then local _bvF=_bvq.file
          if type(_bvF)=="string"and _bvF~=""and _bvF~="--"then pcall(delfile,_bvq.path.._bvF..".txt")pcall(function()_bvv:Refresh(_bvq:get_list())
            end)
          end
          return
        end
        while true do end
      end,})_bvr:Button({title="refresh list",callback=function()_bvv:Refresh(_bvq:get_list())
      end,})
    end
  end do local _bvG=_brZ:Section("theme","left")
    local _bvH=_brZ:Section("theme colors","right")getgenv().theme=getgenv().theme or{}
    local _bvI=getgenv().theme _bvI.accent=_bvI.accent or Color3.fromRGB(120,200,255)_bvI.scroll=_bvI.scroll or Color3.fromRGB(100,180,255)_bvI.risky=_bvI.risky or Color3.fromRGB(237,77,77)_bvI.playerlist=_bvI.playerlist or Color3.fromRGB(120,200,255)_bvI.bg=_bvI.bg or Color3.fromRGB(14,16,22)_bvI.card=_bvI.card or Color3.fromRGB(20,23,30)_bvI.text=_bvI.text or Color3.fromRGB(235,240,250)_bvI.muted=_bvI.muted or Color3.fromRGB(130,140,160)_bvI.name=_bvI.name or "Dark"
    local _bvJ={Dark={accent=Color3.fromRGB(120,200,255),scroll=Color3.fromRGB(100,180,255),risky=Color3.fromRGB(237,77,77),playerlist=Color3.fromRGB(120,200,255),bg=Color3.fromRGB(14,16,22),card=Color3.fromRGB(20,23,30),text=Color3.fromRGB(235,240,250),muted=Color3.fromRGB(130,140,160),},Black={accent=Color3.fromRGB(220,220,225),scroll=Color3.fromRGB(180,180,185),risky=Color3.fromRGB(255,90,90),playerlist=Color3.fromRGB(200,200,210),bg=Color3.fromRGB(8,8,10),card=Color3.fromRGB(14,14,16),text=Color3.fromRGB(245,245,250),muted=Color3.fromRGB(120,120,130),},}
    local function _bvK(_bvL)_bvL=tostring(_bvL or "Dark")
      if type(_bvL)=="table"then _bvL=_bvL[1]or "Dark"
      end
      local _bvM=_bvJ[_bvL]
      if not _bvM then warn("[shizukuscripts] unknown theme",_bvL)
        return
      end
      local _bvN=getgenv().theme
      for _bvO,_bvP in pairs(_bvM)do _bvN[_bvO]=_bvP
      end _bvN.name=_bvL pcall(function()
        if theme_event then theme_event:Fire()
        end
      end)pcall(function()
        local _bvQ={}pcall(function()
          for _bvR,_bvS in ipairs(game:GetService("CoreGui"):GetChildren())do table.insert(_bvQ,_bvS)
          end
        end)pcall(function()
          local _bvT=game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui")
          if _bvT then table.insert(_bvQ,_bvT)
          end
        end)pcall(function()
          if type(gethui)=="function"then table.insert(_bvQ,gethui())
          end
        end)
        for _bvU,_bvV in ipairs(_bvQ)do for _bvW,_bvX in ipairs(_bvV:GetDescendants())do local _bvY=_bvX.Name or""
            if _bvX:IsA("Frame")or _bvX:IsA("ScrollingFrame")or _bvX:IsA("CanvasGroup")then if _bvY=="MainFrame"or _bvY=="Background"or _bvY=="BackgroundFrame"or _bvY=="1"or _bvY=="2"then pcall(function()_bvX.BackgroundColor3=_bvM.bg
                end)
              elseif _bvY:find("Section")or _bvY=="SettingsPopup"or _bvY=="TopBar"then pcall(function()_bvX.BackgroundColor3=_bvM.card
                end)
              end
            elseif _bvX:IsA("UIStroke")then pcall(function()
                local _bvZ=_bvX.Color
                if _bvZ and(_bvZ.R+_bvZ.G+_bvZ.B)>0.3 then _bvX.Color=_bvM.accent
                end
              end)
            end
          end
        end
      end)print("[shizukuscripts] theme applied:",_bvL)
    end getgenv().SHIZUKUSCRIPTS_APPLY_THEME=_bvK getgenv().SHIZUKUSCRIPTS_THEME_PRESETS=_bvJ pcall(function()_bvG:Dropdown({title="gui theme",values={"Dark","Black"},default="Dark",multi=false,callback=function(_bwa)
        local _bwb=_bwa
        if type(_bwa)=="table"then _bwb=_bwa[1]or next(_bwa)
        end _bvK(_bwb)
      end,})
    end)pcall(function()
      for _bwc,_bwd in ipairs({"Dark","Black"})do _bvG:Button({title="theme: ".._bwd,callback=function()_bvK(_bwd)
        end,})
      end
    end)
    local _bwe=table.clone(getgenv().theme)
    local _bwf={}pcall(function()_bwf.accent=_bvH:Colorpicker({title="accent",default=Color3.fromRGB(110,180,255),transparency=1,callback=function(_bwg)getgenv().theme.accent=_bwg pcall(function()theme_event:Fire()
        end)
      end,})_bwf.scroll=_bvH:Colorpicker({title="scrollbar",default=Color3.fromRGB(110,180,255),transparency=1,callback=function(_bwh)getgenv().theme.scroll=_bwh pcall(function()theme_event:Fire()
        end)
      end,})_bwf.risky=_bvH:Colorpicker({title="risky",default=Color3.fromRGB(237,77,77),transparency=1,callback=function(_bwi)getgenv().theme.risky=_bwi pcall(function()theme_event:Fire()
        end)
      end,})_bwf.playerlist=_bvH:Colorpicker({title="player list",default=Color3.fromRGB(110,180,255),transparency=1,callback=function(_bwj)getgenv().theme.playerlist=_bwj pcall(function()theme_event:Fire()
        end)
      end,})_bvH:Button({title="reset to default",callback=function()_bvK("Dark")
      end,})
    end)
  end
  local _bwk do _bwk=_brZ:Section("menu","right")do local _bwl=_bwk:StandaloneKeybind({title="menu key",key="RightShift",mode="Toggle",callback=function()
      end,})
      local _bwm="RightShift"_y.spawn_(function()
        while _y.wait_(0.5)do local _bwn=_z.v84.Flags[_bwl.Flag.."_info"]
          if _bwn and _bwn[1]and _bwn[1]~=_bwm then _bwm=_bwn[1]getgenv().SetMenuKeybind(_bwm)
          end
        end
      end)
    end
  end do local function _bwo()
      local _bwp=game:GetService("CoreGui"):WaitForChild("DevConsoleMaster"):WaitForChild("DevConsoleWindow"):WaitForChild("DevConsoleUI"):WaitForChild("MainView"):WaitForChild("ClientLog")
      for _bwq,_bwr in pairs(_bwp:GetChildren())do if _bwr:IsA("GuiObject")and _bwr.Name==_bwr.Name:match("%d+")then _bwr:Destroy()
        end
      end
    end
    local function _bws()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,_y.localPlayer)
    end
    local function _bwt()game:GetService("TeleportService"):Teleport(game.PlaceId,_y.localPlayer)
    end _bwk:Button({title="rejoin",callback=function()pcall(_bws)
    end,})_bwk:Button({title="join another server",callback=function()pcall(_bwt)
    end,})_bwk:Button({title="clear console",callback=function()pcall(_bwo)
    end,})
  end
  return
end
local _bwu={enabled=true,fps=0,ping=0,game_name="Loading...",player_name="",update_interval=0.25,_elapsed=0,_frames=0,_gui=nil,_label=nil,_sub=nil}
local _bwv={enabled=false,_gui=nil,_list=nil,_title=nil,_signature=""}
local function _bww()
  local _bwx,_bwy=pcall(function()
    if type(gethui)=="function"then return gethui()
    end
    return game:GetService("CoreGui")
  end)
  return _bwx and _bwy or game:GetService("CoreGui")
end
local function _bwz(_bwA)
  if _bwA then pcall(function()_bwA:Destroy()
    end)
  end
end function _bwu:init()
  local _bwB=game:GetService("Players")
  local _bwC=game:GetService("MarketplaceService")
  local _bwD=game:GetService("TweenService")
  local _bwE=game:GetService("RunService")
  local _bwF=_bwB.LocalPlayer self.player_name=_bwF and(_bwF.DisplayName~=""and _bwF.DisplayName or _bwF.Name)or "player"self.user_id=_bwF and _bwF.UserId or 0 pcall(function()self.game_name=_bwC:GetProductInfo(game.PlaceId).Name or tostring(game.PlaceId)
  end)
  local _bwG=_bww()_bwz(_bwG:FindFirstChild("shizukuscripts_Watermark"))_bwz(_bwG:FindFirstChild("shizukuscripts_Startup"))
  local _bwH=Instance.new("ScreenGui")_bwH.Name="shizukuscripts_Watermark"_bwH.ResetOnSpawn=false _bwH.IgnoreGuiInset=true _bwH.ZIndexBehavior=Enum.ZIndexBehavior.Global _bwH.Parent=_bwG
  local _bwI=Instance.new("Frame")_bwI.Name="Container"_bwI.AnchorPoint=Vector2.new(0.5,0)_bwI.Position=UDim2.new(0.5,0,0,-80)_bwI.Size=UDim2.fromOffset(280,70)_bwI.BackgroundColor3=Color3.fromRGB(10,12,20)_bwI.BackgroundTransparency=0.1 _bwI.BorderSizePixel=0 _bwI.Parent=_bwH Instance.new("UICorner",_bwI).CornerRadius=UDim.new(0,14)
  local _bwJ=Instance.new("UIStroke")_bwJ.Color=Color3.fromRGB(130,180,255)_bwJ.Transparency=0.35 _bwJ.Thickness=1.4 _bwJ.Parent=_bwI
  local _bwK=Instance.new("UIGradient")_bwK.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(30,40,70)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(16,20,36)),ColorSequenceKeypoint.new(1,Color3.fromRGB(22,28,50)),})_bwK.Rotation=25 _bwK.Parent=_bwI
  local _bwL=Instance.new("ImageLabel")_bwL.Name="Anime"_bwL.BackgroundColor3=Color3.fromRGB(20,24,38)_bwL.Position=UDim2.fromOffset(8,7)_bwL.Size=UDim2.fromOffset(56,56)_bwL.BorderSizePixel=0 _bwL.Image="rbxthumb://type=Asset&id=1293887215&w=150&h=150"_bwL.ScaleType=Enum.ScaleType.Crop _bwL.Parent=_bwI Instance.new("UICorner",_bwL).CornerRadius=UDim.new(1,0)
  local _bwM=Instance.new("UIStroke")_bwM.Color=Color3.fromRGB(160,200,255)_bwM.Transparency=0.25 _bwM.Thickness=1.5 _bwM.Parent=_bwL
  local _bwN=Instance.new("TextLabel")_bwN.Name="Stats"_bwN.BackgroundTransparency=1 _bwN.Position=UDim2.fromOffset(74,12)_bwN.Size=UDim2.new(1,-84,0,20)_bwN.Font=Enum.Font.GothamBold _bwN.TextSize=14 _bwN.TextXAlignment=Enum.TextXAlignment.Left _bwN.TextColor3=Color3.fromRGB(240,248,255)_bwN.Text="shizukuscripts  \194\183  0 FPS  \194\183  0ms"_bwN.Parent=_bwI
  local _bwO=Instance.new("TextLabel")_bwO.Name="Game"_bwO.BackgroundTransparency=1 _bwO.Position=UDim2.fromOffset(74,36)_bwO.Size=UDim2.new(1,-84,0,18)_bwO.Font=Enum.Font.Gotham _bwO.TextSize=11 _bwO.TextXAlignment=Enum.TextXAlignment.Left _bwO.TextColor3=Color3.fromRGB(150,190,255)_bwO.TextTruncate=Enum.TextTruncate.AtEnd _bwO.Text=self.player_name.."  \194\183  "..tostring(self.game_name or"")_bwO.Parent=_bwI
  local _bwP=Instance.new("Frame")_bwP.Size=UDim2.new(0.6,0,0,2)_bwP.Position=UDim2.new(0.2,0,1,-2)_bwP.BackgroundColor3=Color3.fromRGB(130,200,255)_bwP.BorderSizePixel=0 _bwP.BackgroundTransparency=0.3 _bwP.Parent=_bwI Instance.new("UICorner",_bwP).CornerRadius=UDim.new(1,0)self._gui,self._label,self._sub,self._avatar,self._frame=_bwH,_bwN,_bwO,_bwL,_bwI
  if not self.enabled then _bwH.Enabled=false
  end
  local _bwQ=game:GetService("UserInputService")
  local _bwR,_bwS,_bwT=false,nil,nil _bwI.InputBegan:Connect(function(_bwU)
    if _bwU.UserInputType==Enum.UserInputType.MouseButton1 or _bwU.UserInputType==Enum.UserInputType.Touch then _bwR=true _bwS=_bwU.Position _bwT=_bwI.Position _bwU.Changed:Connect(function()
        if _bwU.UserInputState==Enum.UserInputState.End then _bwR=false
        end
      end)
    end
  end)_bwQ.InputChanged:Connect(function(_bwV)
    if not _bwR then return
    end
    if _bwV.UserInputType==Enum.UserInputType.MouseMovement or _bwV.UserInputType==Enum.UserInputType.Touch then local _bwW=_bwV.Position-_bwS _bwI.Position=UDim2.new(_bwT.X.Scale,_bwT.X.Offset+_bwW.X,_bwT.Y.Scale,_bwT.Y.Offset+_bwW.Y)
    end
  end)_bwI.BackgroundTransparency=1 _bwN.TextTransparency=1 _bwO.TextTransparency=1 _bwL.ImageTransparency=1
  local _bwX=TweenInfo.new(0.55,Enum.EasingStyle.Back,Enum.EasingDirection.Out)_bwD:Create(_bwI,_bwX,{Position=UDim2.new(0.5,0,0,14),BackgroundTransparency=0.08}):Play()_bwD:Create(_bwN,TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency=0}):Play()_bwD:Create(_bwO,TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{TextTransparency=0}):Play()_bwD:Create(_bwL,TweenInfo.new(0.45,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{ImageTransparency=0}):Play()task.spawn(function()
    local _bwY=tick()
    while _bwI and _bwI.Parent do if not _bwR then local _bwZ=math.sin((tick()-_bwY)*1.4)*3
        local _bxa=_bwI.Position.Y.Offset _bwJ.Transparency=0.25+0.15*(0.5+0.5*math.sin((tick()-_bwY)*2.2))_bwP.BackgroundTransparency=0.25+0.2*(0.5+0.5*math.sin((tick()-_bwY)*2.5))
      end _bwE.RenderStepped:Wait()
    end
  end)
end function _bwu:update(_bxb)
  if not self._gui or not self._gui.Parent then self:init()
  end self._frames+=1 self._elapsed+=_bxb or 0
  if self._elapsed>=self.update_interval then self.fps=math.floor(self._frames/self._elapsed+0.5)self._frames=0 self._elapsed=0
    local _bxc=game:GetService("Players").LocalPlayer
    local _bxd,_bxe=pcall(function()
      return _bxc:GetNetworkPing()*1000
    end)self.ping=_bxd and math.max(0,math.floor(_bxe+0.5))or 0
    if self._label then self._label.Text=string.format("shizukuscripts | FPS: %d | PING: %dms",self.fps,self.ping)
    end
    if self._sub then self._sub.Text=string.format("%s  |  %s",self.game_name,self.player_name)
    end
  end
  if self._gui then self._gui.Enabled=self.enabled
  end
end function _bwu:render()
  return self.enabled and string.format("shizukuscripts | FPS: %d | PING: %dms | %s",self.fps,self.ping,self.game_name)or""
end function _bwu:toggle()self.enabled=not self.enabled
  if self._gui then self._gui.Enabled=self.enabled
  end
end function _bwv:init()
  local _bxf=_bww()_bwz(_bxf:FindFirstChild("shizukuscripts_BindList"))
  local _bxg=Instance.new("ScreenGui")_bxg.Name="shizukuscripts_BindList"_bxg.ResetOnSpawn=false _bxg.IgnoreGuiInset=true _bxg.ZIndexBehavior=Enum.ZIndexBehavior.Global _bxg.Parent=_bxf
  local _bxh=Instance.new("Frame")_bxh.Name="Container"_bxh.AnchorPoint=Vector2.new(1,0)_bxh.Position=UDim2.new(1,-14,0.5,-40)_bxh.Size=UDim2.fromOffset(205,30)_bxh.AutomaticSize=Enum.AutomaticSize.Y _bxh.BackgroundColor3=Color3.fromRGB(10,10,12)_bxh.BackgroundTransparency=0.12 _bxh.BorderSizePixel=0 _bxh.Parent=_bxg
  local _bxi=Instance.new("UICorner")_bxi.CornerRadius=UDim.new(0,6)_bxi.Parent=_bxh
  local _bxj=Instance.new("UIStroke")_bxj.Color=Color3.fromRGB(45,45,48)_bxj.Transparency=0.15 _bxj.Thickness=1 _bxj.Parent=_bxh
  local _bxk=Instance.new("TextLabel")_bxk.BackgroundTransparency=1 _bxk.Size=UDim2.new(1,-16,0,20)_bxk.Position=UDim2.fromOffset(8,5)_bxk.Font=Enum.Font.Code _bxk.TextSize=12 _bxk.TextXAlignment=Enum.TextXAlignment.Right _bxk.TextColor3=Color3.new(1,1,1)_bxk.Text="shizukuscripts  |  binds"_bxk.Parent=_bxh
  local _bxl=Instance.new("Frame")_bxl.Name="List"_bxl.BackgroundTransparency=1 _bxl.Position=UDim2.fromOffset(8,27)_bxl.Size=UDim2.new(1,-16,0,0)_bxl.AutomaticSize=Enum.AutomaticSize.Y _bxl.Parent=_bxh
  local _bxm=Instance.new("UIListLayout")_bxm.HorizontalAlignment=Enum.HorizontalAlignment.Right _bxm.SortOrder=Enum.SortOrder.LayoutOrder _bxm.Padding=UDim.new(0,2)_bxm.Parent=_bxl self._gui,self._list,self._title=_bxg,_bxl,_bxk
end function _bwv:toggle()self.enabled=not self.enabled
  if self._gui then self._gui.Enabled=self.enabled
  end
end function _bwv:update(_bxn)
  if not self._gui or not self._gui.Parent then self:init()
  end
  local _bxo={}
  for _bxp,_bxq in pairs(_bxn)do if _bxq.active then table.insert(_bxo,tostring(_bxp)..":"..tostring(_bxq.label or _bxp)..":"..tostring(_bxq.mode or "Press"))
    end
  end table.sort(_bxo)
  local _bxr=table.concat(_bxo,"|")
  if _bxr==self._signature then self._gui.Enabled=self.enabled and#_bxo>0
    return
  end self._signature=_bxr
  for _bxs,_bxt in ipairs(self._list:GetChildren())do if _bxt:IsA("TextLabel")then _bxt:Destroy()
    end
  end
  local _bxu={}
  for _bxv,_bxw in pairs(_bxn)do if _bxw.active then table.insert(_bxu,{key=_bxv,bind=_bxw})
    end
  end table.sort(_bxu,function(_bxx,_bxy)
    return _bxx.key<_bxy.key
  end)
  for _bxz,_bxA in ipairs(_bxu)do local _bxB=Instance.new("TextLabel")_bxB.BackgroundTransparency=1 _bxB.Size=UDim2.new(1,0,0,16)_bxB.Font=Enum.Font.Gotham _bxB.TextSize=11 _bxB.TextXAlignment=Enum.TextXAlignment.Right _bxB.TextColor3=Color3.fromRGB(200,210,230)_bxB.Text=string.format("[%s]  %s",tostring(_bxA.key),tostring(_bxA.bind.label or _bxA.key))_bxB.LayoutOrder=_bxz _bxB.Parent=self._list
  end self._gui.Enabled=self.enabled and#_bxu>0
end _bwu:init()_bwv.enabled=false getgenv().SHIZUKUSCRIPTS_WATERMARK=_bwu getgenv().SHIZUKUSCRIPTS_BINDLIST=_bwv
local _bxC={enabled=true,crosshair=true,fov_circle=false,fov=90,hitmarker=true,_gui=nil,_crosshair=nil,_fov=nil}function _bxC:init()
  local _bxD=_bww()_bwz(_bxD:FindFirstChild("shizukuscripts_HVH"))
  local _bxE=Instance.new("ScreenGui")_bxE.Name="shizukuscripts_HVH"_bxE.ResetOnSpawn=false _bxE.IgnoreGuiInset=true _bxE.ZIndexBehavior=Enum.ZIndexBehavior.Global _bxE.Parent=_bxD
  local _bxF=Instance.new("Frame")_bxF.Name="Crosshair"_bxF.AnchorPoint=Vector2.new(0.5,0.5)_bxF.Position=UDim2.fromScale(0.5,0.5)_bxF.Size=UDim2.fromOffset(22,22)_bxF.BackgroundTransparency=1 _bxF.Parent=_bxE
  local _bxG=3
  local _bxH=7
  local _bxI=2
  local _bxJ=Color3.fromRGB(120,210,255)
  local _bxK=Color3.fromRGB(10,14,22)
  for _bxL,_bxM in ipairs({{UDim2.new(0.5,-1,0,_bxG),UDim2.fromOffset(_bxI,_bxH)},{UDim2.new(0.5,-1,1,-(_bxG+_bxH)),UDim2.fromOffset(_bxI,_bxH)},{UDim2.new(0,_bxG,0.5,-1),UDim2.fromOffset(_bxH,_bxI)},{UDim2.new(1,-(_bxG+_bxH),0.5,-1),UDim2.fromOffset(_bxH,_bxI)},})do local _bxN=Instance.new("Frame")_bxN.Position=_bxM[1]+UDim2.fromOffset(1,1)_bxN.Size=_bxM[2]_bxN.BorderSizePixel=0 _bxN.BackgroundColor3=_bxK _bxN.BackgroundTransparency=0.35 _bxN.Parent=_bxF
    local _bxO=Instance.new("Frame")_bxO.Position,_bxO.Size=_bxM[1],_bxM[2]_bxO.BorderSizePixel=0 _bxO.BackgroundColor3=_bxJ _bxO.Parent=_bxF
  end
  local _bxP=Instance.new("Frame")_bxP.AnchorPoint=Vector2.new(0.5,0.5)_bxP.Position=UDim2.fromScale(0.5,0.5)_bxP.Size=UDim2.fromOffset(3,3)_bxP.BackgroundColor3=Color3.fromRGB(255,255,255)_bxP.BorderSizePixel=0 _bxP.Parent=_bxF Instance.new("UICorner",_bxP).CornerRadius=UDim.new(1,0)
  local _bxQ=Instance.new("Frame")_bxQ.Name="FOV"_bxQ.AnchorPoint=Vector2.new(0.5,0.5)_bxQ.Position=UDim2.fromScale(0.5,0.5)_bxQ.Size=UDim2.fromOffset(self.fov*4,self.fov*4)_bxQ.BackgroundColor3=Color3.fromRGB(80,160,255)_bxQ.BackgroundTransparency=0.92 _bxQ.Visible=false _bxQ.Parent=_bxE
  local _bxR=Instance.new("UICorner")_bxR.CornerRadius=UDim.new(1,0)_bxR.Parent=_bxQ
  local _bxS=Instance.new("UIStroke")_bxS.Thickness=1.5 _bxS.Transparency=0.25 _bxS.Color=Color3.fromRGB(120,200,255)_bxS.Parent=_bxQ
  local _bxT=Instance.new("UIGradient")_bxT.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(140,220,255)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(90,150,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(160,100,255)),})_bxT.Rotation=45 _bxT.Parent=_bxS self._gui,self._crosshair,self._fov=_bxE,_bxF,_bxQ
end function _bxC:set_fov(_bxU)self.fov=math.clamp(tonumber(_bxU)or 90,20,180)
  if self._fov then self._fov.Size=UDim2.fromOffset(self.fov*4,self.fov*4)
  end
end function _bxC:toggle_crosshair()self.crosshair=not self.crosshair
end function _bxC:toggle_fov()self.fov_circle=not self.fov_circle
end function _bxC:update()
  if not self._gui or not self._gui.Parent then self:init()
  end self._crosshair.Visible=self.enabled and self.crosshair self._fov.Visible=self.enabled and self.fov_circle self._gui.Enabled=self.enabled
end function _bxC:toggle()self.enabled=not self.enabled
end _bxC:init()getgenv().SHIZUKUSCRIPTS_HVH=_bxC
local _bxV={bindings={},macros={},active=true}function _bxV:register(_bxW,_bxX,_bxY,_bxZ)_bxW=tostring(_bxW):upper()_bxY=_bxY or "Press"self.bindings[_bxW]={callback=_bxX,mode=_bxY,label=_bxZ or tostring(_bxW),active=true}
end function _bxV:unregister(_bya)self.bindings[tostring(_bya):upper()]=nil
end function _bxV:set_active(_byb,_byc)
  if self.bindings[tostring(_byb):upper()]then self.bindings[tostring(_byb):upper()].active=_byc and true or false
  end
end function _bxV:create_macro(_byd,_bye)self.macros[_byd]={sequence=_bye,active=true}
end function _bxV:execute_macro(_byf,_byg)_byg=_byg or 50
  local _byh=self.macros[_byf]
  if not _byh or not _byh.active then return false
  end
  for _byi,_byj in ipairs(_byh.sequence)do local _byk=self.bindings[tostring(_byj):upper()]
    if _byk and _byk.active then pcall(_byk.callback)task.wait(_byg/1000)
    end
  end
  return true
end getgenv().SHIZUKUSCRIPTS_KEYBINDS=_bxV
local _byl={enabled=false,teamcheck=true,box_color=Color3.fromRGB(110,200,255),enemy_color=Color3.fromRGB(255,95,130),text_color=Color3.fromRGB(235,245,255),tracer_color=Color3.fromRGB(130,190,255),skeleton_color=Color3.fromRGB(160,220,255),thickness=1.5,max_distance=350,show_box=true,show_corner_box=true,show_health=true,show_healthbar=true,show_distance=true,show_name=true,show_tracer=false,show_skeleton=true,show_head_dot=true,show_chams=false,sound_esp=true,update_interval=0.08,_last_update=0,esp_objects={},chams={},_sound_markers={},}function _byl:clear_drawings()
  for _bym,_byn in ipairs(self.esp_objects)do if _byn then pcall(function()_byn:Remove()
      end)
    end
  end self.esp_objects={}
end function _byl:clear_chams()
  for _byo,_byp in pairs(self.chams)do if _byp then pcall(function()_byp:Destroy()
      end)
    end self.chams[_byo]=nil
  end
end function _byl:add_line(_byq,_byr,_bys,_byt)
  if not Drawing or type(Drawing.new)~="function"then return nil
  end
  local _byu=Drawing.new("Line")_byu.From=_byq _byu.To=_byr _byu.Color=_bys or self.skeleton_color _byu.Thickness=_byt or self.thickness _byu.Transparency=0.9 table.insert(self.esp_objects,_byu)
  return _byu
end function _byl:add_text(_byv,_byw,_byx,_byy)
  if not Drawing or type(Drawing.new)~="function"then return nil
  end
  local _byz=Drawing.new("Text")_byz.Text=_byv _byz.Color=_byy or self.text_color _byz.Size=_byx or 13 _byz.Center=true _byz.Outline=true _byz.Position=_byw table.insert(self.esp_objects,_byz)
  return _byz
end function _byl:draw_corner_box(_byA,_byB,_byC)
  local _byD,_byE=_byA.X-_byB/2,_byA.Y-_byC/2
  local _byF,_byG=_byB,_byC
  local _byH=self.enemy_color
  local _byI=self.thickness
  local _byJ=math.max(5,_byF*0.28)
  local _byK=math.max(5,_byG*0.22)self:add_line(Vector2.new(_byD,_byE),Vector2.new(_byD+_byJ,_byE),_byH,_byI)self:add_line(Vector2.new(_byD,_byE),Vector2.new(_byD,_byE+_byK),_byH,_byI)self:add_line(Vector2.new(_byD+_byF,_byE),Vector2.new(_byD+_byF-_byJ,_byE),_byH,_byI)self:add_line(Vector2.new(_byD+_byF,_byE),Vector2.new(_byD+_byF,_byE+_byK),_byH,_byI)self:add_line(Vector2.new(_byD,_byE+_byG),Vector2.new(_byD+_byJ,_byE+_byG),_byH,_byI)self:add_line(Vector2.new(_byD,_byE+_byG),Vector2.new(_byD,_byE+_byG-_byK),_byH,_byI)self:add_line(Vector2.new(_byD+_byF,_byE+_byG),Vector2.new(_byD+_byF-_byJ,_byE+_byG),_byH,_byI)self:add_line(Vector2.new(_byD+_byF,_byE+_byG),Vector2.new(_byD+_byF,_byE+_byG-_byK),_byH,_byI)
end function _byl:draw_skeleton(_byL,_byM)
  local _byN={{"Head","UpperTorso"},{"UpperTorso","LowerTorso"},{"UpperTorso","LeftUpperArm"},{"LeftUpperArm","LeftLowerArm"},{"LeftLowerArm","LeftHand"},{"UpperTorso","RightUpperArm"},{"RightUpperArm","RightLowerArm"},{"RightLowerArm","RightHand"},{"LowerTorso","LeftUpperLeg"},{"LeftUpperLeg","LeftLowerLeg"},{"LeftLowerLeg","LeftFoot"},{"LowerTorso","RightUpperLeg"},{"RightUpperLeg","RightLowerLeg"},{"RightLowerLeg","RightFoot"},}
  for _byO,_byP in ipairs(_byN)do local _byQ,_byR=_byL:FindFirstChild(_byP[1]),_byL:FindFirstChild(_byP[2])
    if _byQ and _byR then local _byS,_byT=_byM:WorldToViewportPoint(_byQ.Position)
      local _byU,_byV=_byM:WorldToViewportPoint(_byR.Position)
      if _byT and _byV then self:add_line(Vector2.new(_byS.X,_byS.Y),Vector2.new(_byU.X,_byU.Y),self.skeleton_color,1)
      end
    end
  end
end function _byl:update_chams(_byW,_byX,_byY)
  if not self.show_chams then local _byZ=self.chams[_byW]
    if _byZ then pcall(function()_byZ:Destroy()
      end)
    end self.chams[_byW]=nil
    return
  end
  local _bza=self.chams[_byW]
  if not _bza or not _bza.Parent then _bza=Instance.new("Highlight")_bza.Name="SHIZUKUSCRIPTS_ESP_CHAM"_bza.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop _bza.FillTransparency=0.55 _bza.OutlineTransparency=0.15 _bza.Parent=_byX self.chams[_byW]=_bza
  end _bza.Adornee=_byX _bza.FillColor=_byY _bza.OutlineColor=_byY
end function _byl:draw_player(_bzb)
  if not _bzb or not _bzb.Character then return
  end
  local _bzc=_bzb.Character
  local _bzd=_bzc:FindFirstChildOfClass("Humanoid")
  local _bze=_bzc:FindFirstChild("HumanoidRootPart")
  local _bzf=_bzc:FindFirstChild("Head")
  if not _bzd or not _bze or _bzd.Health<=0 then return
  end
  local _bzg=game:GetService("Players").LocalPlayer
  if self.teamcheck and _bzb.Team==_bzg.Team then return
  end
  local _bzh=workspace.CurrentCamera
  local _bzi=_bzg.Character and _bzg.Character:FindFirstChild("HumanoidRootPart")
  local _bzj=_bzi and(_bzi.Position-_bze.Position).Magnitude or 0
  if self.max_distance and _bzj>self.max_distance then return
  end
  local _bzk=self._sound_markers and self._sound_markers[_bzb]
  if _bzk and _bzk.until_t and tick()<_bzk.until_t and _bzk.pos then end
  local _bzl,_bzm=_bzh:WorldToViewportPoint(_bze.Position)
  if not _bzm then self:update_chams(_bzb,_bzc,self.enemy_color)
    if self.sound_esp and Drawing and type(Drawing.new)=="function"then local _bzn=(_bze.Position-_bzh.CFrame.Position).Unit
      local _bzo=_bzh.ViewportSize/2
      local _bzp=math.atan2(_bzn.X,-_bzn.Z)
      local _bzq=_bzo.X+math.sin(_bzp)*(_bzo.X*0.85)
      local _bzr=_bzo.Y+math.cos(_bzp)*(_bzo.Y*0.85)
      local _bzs=Drawing.new("Text")_bzs.Text=string.format("%s\n%.0fm",_bzb.Name,_bzj)_bzs.Color=self.enemy_color _bzs.Size=12 _bzs.Center=true _bzs.Outline=true _bzs.Position=Vector2.new(_bzq,_bzr)table.insert(self.esp_objects,_bzs)
    end
    return
  end
  local _bzt=self.enemy_color self:update_chams(_bzb,_bzc,_bzt)
  local _bzu=_bzh:WorldToViewportPoint((_bzf and _bzf.Position or _bze.Position)+Vector3.new(0,0.5,0))
  local _bzv=_bzh:WorldToViewportPoint(_bze.Position-Vector3.new(0,3,0))
  local _bzw=math.clamp(math.abs(_bzv.Y-_bzu.Y),25,250)
  local _bzx=math.max(18,_bzw*0.52)
  local _bzy=Vector2.new(_bzl.X,(_bzu.Y+_bzv.Y)/2)
  if self.show_box then local _bzz=Drawing.new("Square")_bzz.Color=_bzt _bzz.Thickness=self.thickness _bzz.Transparency=0.85 _bzz.Filled=false _bzz.Position=_bzy-Vector2.new(_bzx/2,_bzw/2)_bzz.Size=Vector2.new(_bzx,_bzw)table.insert(self.esp_objects,_bzz)
  end
  if self.show_corner_box then self:draw_corner_box(_bzy,_bzx,_bzw)
  end
  if self.show_health then self:add_text("HP: "..math.floor(_bzd.Health),Vector2.new(_bzy.X,_bzy.Y-_bzw/2-14),12,self.text_color)
  end
  if self.show_healthbar then local _bzA=math.clamp(_bzd.Health/math.max(_bzd.MaxHealth,1),0,1)
    local _bzB=_bzy.X-_bzx/2-6 self:add_line(Vector2.new(_bzB,_bzy.Y+_bzw/2),Vector2.new(_bzB,_bzy.Y-_bzw/2),Color3.fromRGB(40,40,40),4)self:add_line(Vector2.new(_bzB,_bzy.Y+_bzw/2),Vector2.new(_bzB,_bzy.Y+_bzw/2-_bzw*_bzA),Color3.fromRGB(80,255,80),3)
  end
  if self.show_distance and _bzg.Character and _bzg.Character:FindFirstChild("HumanoidRootPart")then local _bzC=(_bzg.Character.HumanoidRootPart.Position-_bze.Position).Magnitude self:add_text(string.format("%.0fm",_bzC),Vector2.new(_bzy.X,_bzy.Y+_bzw/2+12),11,self.text_color)
  end
  if self.show_name then self:add_text(_bzb.Name,Vector2.new(_bzy.X,_bzy.Y-_bzw/2-28),13,self.text_color)
  end
  if self.show_tracer then self:add_line(Vector2.new(_bzh.ViewportSize.X/2,_bzh.ViewportSize.Y),Vector2.new(_bzl.X,_bzl.Y),self.tracer_color,1)
  end
  if self.show_skeleton then self:draw_skeleton(_bzc,_bzh)
  end
  if self.show_head_dot and _bzf then local _bzD,_bzE=_bzh:WorldToViewportPoint(_bzf.Position)
    if _bzE then if Drawing and type(Drawing.new)=="function"then local _bzF=Drawing.new("Circle")_bzF.Color=_bzt;_bzF.Radius=3;_bzF.Filled=true;_bzF.Position=Vector2.new(_bzD.X,_bzD.Y)table.insert(self.esp_objects,_bzF)
      end
    end
  end
end function _byl:toggle()self.enabled=not self.enabled
  if not self.enabled then self:clear_drawings();self:clear_chams()
  end
end function _byl:update()
  if not self.enabled then return
  end
  if not Drawing or type(Drawing.new)~="function"then return
  end
  local _bzG=os.clock()
  if self._last_update and _bzG-self._last_update<(self.update_interval or 0.10)then return
  end self._last_update=_bzG self:clear_drawings()
  local _bzH={}
  local _bzI=game:GetService("Players")
  local _bzJ=_bzI.LocalPlayer
  for _bzK,_bzL in ipairs(_bzI:GetPlayers())do if _bzL~=_bzJ then _bzH[_bzL]=true pcall(function()self:draw_player(_bzL)
      end)
    end
  end
  for _bzM,_bzN in pairs(self.chams)do if not _bzH[_bzM]or not _bzM.Character then if _bzN then pcall(function()_bzN:Destroy()
        end)
      end self.chams[_bzM]=nil
    end
  end
end getgenv().SHIZUKUSCRIPTS_ESP=_byl
local _bzO={enabled=false,target=nil,smoothing=0.15,fov=150,teamcheck=true}function _bzO:get_nearest_target()
  local _bzP=self.fov
  local _bzQ=nil
  local _bzR=game:GetService("Players").LocalPlayer
  local _bzS=_bzR and _bzR.Character
  local _bzT=_bzS and _bzS:FindFirstChild("HumanoidRootPart")
  if not _bzT then return nil
  end
  for _bzU,_bzV in ipairs(game:GetService("Players"):GetPlayers())do if _bzV~=_bzR and _bzV.Character then local _bzW=_bzV.Character:FindFirstChild("Humanoid")
      local _bzX=_bzV.Character:FindFirstChild("HumanoidRootPart")
      if _bzW and _bzW.Health>0 and _bzX then if self.teamcheck and _bzV.Team==_bzR.Team then continue
        end
        local _bzY=(_bzT.Position-_bzX.Position).Magnitude
        if _bzY<_bzP then _bzP=_bzY _bzQ=_bzV
        end
      end
    end
  end
  return _bzQ
end function _bzO:aim()
  if not self.enabled then return
  end self.target=self:get_nearest_target()
  local _bzZ=game:GetService("Players").LocalPlayer
  local _bAa=workspace.CurrentCamera
  if self.target and self.target.Character then local _bAb=self.target.Character:FindFirstChild("HumanoidRootPart")
    if _bAb then local _bAc=CFrame.new(_bAa.CFrame.Position,_bAb.Position)_bAa.CFrame=_bAa.CFrame:Lerp(_bAc,self.smoothing)
    end
  end
end function _bzO:toggle()self.enabled=not self.enabled
end getgenv().SHIZUKUSCRIPTS_AIMBOT=_bzO
local _bAd={speed_multiplier=1,flight_enabled=false,noclip_enabled=false,flight_speed=50}function _bAd:set_speed(_bAe)self.speed_multiplier=_bAe
  local _bAf=game:GetService("Players").LocalPlayer
  if _bAf.Character then local _bAg=_bAf.Character:FindFirstChild("Humanoid")
    if _bAg then _bAg.WalkSpeed=16*self.speed_multiplier
    end
  end
end function _bAd:enable_flight()
  if self.flight_enabled then return
  end self.flight_enabled=true
  local _bAh=game:GetService("Players").LocalPlayer
  local _bAi=_bAh.Character.HumanoidRootPart
  local _bAj=game:GetService("UserInputService")
  local _bAk=Instance.new("BodyVelocity")_bAk.MaxForce=Vector3.new(999999,999999,999999)_bAk.Velocity=Vector3.new(0,0,0)_bAk.Parent=_bAi spawn(function()
    local _bAl=Vector3.new(0,0,0)
    while self.flight_enabled and _bAi.Parent do _bAl=Vector3.new(0,0,0)
      if _bAj:IsKeyDown(Enum.KeyCode.W)then _bAl=_bAl+workspace.CurrentCamera.CFrame.LookVector
      end
      if _bAj:IsKeyDown(Enum.KeyCode.S)then _bAl=_bAl-workspace.CurrentCamera.CFrame.LookVector
      end
      if _bAj:IsKeyDown(Enum.KeyCode.A)then _bAl=_bAl-workspace.CurrentCamera.CFrame.RightVector
      end
      if _bAj:IsKeyDown(Enum.KeyCode.D)then _bAl=_bAl+workspace.CurrentCamera.CFrame.RightVector
      end
      if _bAj:IsKeyDown(Enum.KeyCode.Space)then _bAl=_bAl+Vector3.new(0,1,0)
      end
      if _bAj:IsKeyDown(Enum.KeyCode.LeftControl)then _bAl=_bAl-Vector3.new(0,1,0)
      end
      if _bAl.Magnitude>0 then _bAk.Velocity=_bAl.Unit*self.flight_speed
      else _bAk.Velocity=Vector3.new(0,0,0)
      end game:GetService("RunService").RenderStepped:Wait()
    end
    if _bAk then _bAk:Destroy()
    end
  end)
end function _bAd:disable_flight()self.flight_enabled=false
end function _bAd:enable_noclip()
  if self.noclip_enabled then return
  end self.noclip_enabled=true
  local _bAm=game:GetService("Players").LocalPlayer spawn(function()
    while self.noclip_enabled and _bAm.Character do for _bAn,_bAo in pairs(_bAm.Character:GetDescendants())do if _bAo:IsA("BasePart")then _bAo.CanCollide=false
        end
      end game:GetService("RunService").RenderStepped:Wait()
    end
  end)
end function _bAd:disable_noclip()self.noclip_enabled=false
  local _bAp=game:GetService("Players").LocalPlayer
  if _bAp.Character then for _bAq,_bAr in pairs(_bAp.Character:GetDescendants())do if _bAr:IsA("BasePart")then _bAr.CanCollide=true
      end
    end
  end
end getgenv().SHIZUKUSCRIPTS_PLAYERMOD=_bAd
local _bAs={saved_locations={}}function _bAs:save_location(_bAt)
  local _bAu=game:GetService("Players").LocalPlayer
  if not _bAu.Character then return false
  end
  local _bAv=_bAu.Character:FindFirstChild("HumanoidRootPart")
  if _bAv then self.saved_locations[_bAt]=_bAv.CFrame
    return true
  end
  return false
end function _bAs:teleport_to(_bAw)
  if not self.saved_locations[_bAw]then return false
  end
  local _bAx=game:GetService("Players").LocalPlayer
  if not _bAx.Character then return false
  end
  local _bAy=_bAx.Character:FindFirstChild("HumanoidRootPart")
  if _bAy then _bAy.CFrame=self.saved_locations[_bAw]
    return true
  end
  return false
end function _bAs:teleport_to_player(_bAz)
  for _bAA,_bAB in ipairs(game:GetService("Players"):GetPlayers())do if _bAB.Name:lower():match(_bAz:lower())and _bAB.Character then local _bAC=_bAB.Character:FindFirstChild("HumanoidRootPart")
      local _bAD=game:GetService("Players").LocalPlayer
      local _bAE=_bAD.Character:FindFirstChild("HumanoidRootPart")
      if _bAC and _bAE then _bAE.CFrame=_bAC.CFrame+_bAC.CFrame.LookVector*5
        return true
      end
    end
  end
  return false
end getgenv().SHIZUKUSCRIPTS_TELEPORT=_bAs
local _bAF={path="shizukuscripts/configs/",current_config=nil}function _bAF:save(_bAG)
  if type(_bAG)~="string"or type(writefile)~="function"then return false
  end _bAG=_bAG:gsub("^%s+",""):gsub("%s+$",""):gsub("[\\\\/:*?\"<>|]","_")
  if _bAG==""or#_bAG>64 then return false
  end
  if type(makefolder)=="function"and type(isfolder)=="function"then pcall(function()
      if not isfolder("shizukuscripts")then makefolder("shizukuscripts")
      end
      if not isfolder(self.path)then makefolder(self.path)
      end
    end)
  end
  local _bAH={version=2,timestamp=os.time(),watermark_enabled=_bwu.enabled,esp_enabled=_byl.enabled,aimbot_enabled=_bzO.enabled,saved_locations=_bAs.saved_locations or{},keybinds={}}
  for _bAI,_bAJ in pairs(_bxV.bindings)do _bAH.keybinds[_bAI]={active=_bAJ.active,mode=_bAJ.mode}
  end
  local _bAK=pcall(function()writefile(self.path.._bAG..".json",game:GetService("HttpService"):JSONEncode(_bAH))
  end)
  if not _bAK then return false
  end self.current_config=_bAG
  return true
end function _bAF:load(_bAL)
  if type(_bAL)~="string"or type(readfile)~="function"then return false
  end _bAL=_bAL:gsub("^%s+",""):gsub("%s+$",""):gsub("[\\\\/:*?\"<>|]","_")
  if _bAL==""or#_bAL>64 then return false
  end
  local _bAM,_bAN=pcall(function()
    return game:GetService("HttpService"):JSONDecode(readfile(self.path.._bAL..".json"))
  end)
  if not _bAM or type(_bAN)~="table"then return false
  end
  if _bAN.watermark_enabled~=nil then _bwu.enabled=_bAN.watermark_enabled==true
  end
  if _bAN.esp_enabled~=nil then _byl.enabled=_bAN.esp_enabled==true
  end
  if _bAN.aimbot_enabled~=nil then _bzO.enabled=_bAN.aimbot_enabled==true
  end _bAs.saved_locations=type(_bAN.saved_locations)=="table"and _bAN.saved_locations or{}
  if type(_bAN.keybinds)=="table"then for _bAO,_bAP in pairs(_bAN.keybinds)do if _bxV.bindings[_bAO]and type(_bAP)=="table"then _bxV.bindings[_bAO].active=_bAP.active~=false _bxV.bindings[_bAO].mode=_bAP.mode or _bxV.bindings[_bAO].mode
      end
    end
  end self.current_config=_bAL
  return true
end getgenv().SHIZUKUSCRIPTS_CONFIG=_bAF
local _bAQ={enabled=false,config="default",path="shizukuscripts/autoload.json"}function _bAQ:save()
  if type(writefile)~="function"then return false
  end pcall(function()
    if type(makefolder)=="function"and type(isfolder)=="function"then if not isfolder("shizukuscripts")then makefolder("shizukuscripts")
      end
    end
  end)
  return pcall(function()writefile(self.path,game:GetService("HttpService"):JSONEncode({enabled=self.enabled,config=self.config}))
  end)
end function _bAQ:read()
  if type(readfile)~="function"or type(isfile)=="function"and not isfile(self.path)then return
  end
  local _bAR,_bAS=pcall(function()
    return game:GetService("HttpService"):JSONDecode(readfile(self.path))
  end)
  if _bAR and type(_bAS)=="table"then self.enabled=_bAS.enabled==true
    if type(_bAS.config)=="string"and _bAS.config~=""then self.config=_bAS.config
    end
  end
end _bAQ.enabled=false getgenv().SHIZUKUSCRIPTS_AUTOLOAD=_bAQ _bxV:register("E",function()_byl:toggle()print("[shizukuscripts] ESP: "..(_byl.enabled and "ON"or "OFF"))
end,"Press","ESP")_bxV:register("F",function()_bzO:toggle()print("[shizukuscripts] Aimbot: "..(_bzO.enabled and "ON"or "OFF"))
end,"Press","Aimbot")_bxV:register("W",function()_bwu.enabled=not _bwu.enabled print("[shizukuscripts] Watermark: "..(_bwu.enabled and "ON"or "OFF"))
end,"Press","Watermark")_bxV:register("X",function()
  if not _bAd.flight_enabled then _bAd:enable_flight()print("[shizukuscripts] Flight: ON")
  else _bAd:disable_flight()print("[shizukuscripts] Flight: OFF")
  end
end,"Press","Flight")_bxV:register("C",function()
  if not _bAd.noclip_enabled then _bAd:enable_noclip()print("[shizukuscripts] Noclip: ON")
  else _bAd:disable_noclip()print("[shizukuscripts] Noclip: OFF")
  end
end,"Press","Noclip")_bxV:register("S",function()_bAd:set_speed(2)print("[shizukuscripts] Speed Boost: 2x")
end,"Press","Speed 2x")_bxV:register("K",function()_bxC:toggle_crosshair()print("[shizukuscripts] Crosshair: "..(_bxC.crosshair and "ON"or "OFF"))
end,"Press","Crosshair")_bxV:register("L",function()_bxC:toggle_fov()print("[shizukuscripts] FOV circle: "..(_bxC.fov_circle and "ON"or "OFF"))
end,"Press","FOV Circle")
local _bAT
if _bAT then pcall(function()_bAT:Disconnect()
  end)
end _bAT=game:GetService("RunService").RenderStepped:Connect(function(_bAU)pcall(function()_bwu:update(_bAU)_bxC:update()
  end)
end)
local _bAV={waiting=nil}game:GetService("UserInputService").InputBegan:Connect(function(_bAW,_bAX)
  if not _bxV.active then return
  end
  local _bAY
  if _bAW.UserInputType==Enum.UserInputType.MouseButton1 then _bAY="MB1"
  elseif _bAW.UserInputType==Enum.UserInputType.MouseButton2 then _bAY="MB2"
  elseif _bAW.UserInputType==Enum.UserInputType.MouseButton3 then _bAY="MB3"
  elseif _bAW.KeyCode and _bAW.KeyCode~=Enum.KeyCode.Unknown then _bAY=_bAW.KeyCode.Name
  end
  if not _bAY then return
  end
  if _bAV and _bAV.waiting then _bAV:assign(_bAY)
    return
  end
  if _bAX then return
  end
  local _bAZ=_bxV.bindings[_bAY]
  if _bAZ and _bAZ.active then pcall(_bAZ.callback)
  end
end)do local _bBa=_bww()pcall(function()
    local _bBb=_bBa:FindFirstChild("shizukuscripts_BindSettings");
    if _bBb then _bBb:Destroy()
    end
  end)
  local _bBc=Instance.new("ScreenGui");_bBc.Name="shizukuscripts_BindSettings";_bBc.ResetOnSpawn=false;_bBc.Parent=_bBa
  local _bBd=Instance.new("Frame");_bBd.Size=UDim2.fromOffset(330,410);_bBd.Position=UDim2.new(.5,-165,.5,-205);_bBd.BackgroundColor3=Color3.fromRGB(14,16,22);_bBd.Visible=false;_bBd.Parent=_bBc Instance.new("UICorner",_bBd).CornerRadius=UDim.new(0,8)
  local _bBe=Instance.new("TextLabel");_bBe.Size=UDim2.new(1,-16,0,28);_bBe.Position=UDim2.fromOffset(8,4);_bBe.BackgroundTransparency=1;_bBe.Text="SHIZUKUSCRIPTS  \226\128\162  SETTINGS / BIND LIST";_bBe.TextColor3=Color3.new(1,1,1);_bBe.Font=Enum.Font.GothamBold;_bBe.TextSize=11;_bBe.Parent=_bBd
  local _bBf=Instance.new("TextBox");_bBf.Position=UDim2.fromOffset(8,35);_bBf.Size=UDim2.new(1,-16,0,25);_bBf.BackgroundColor3=Color3.fromRGB(30,34,43);_bBf.TextColor3=Color3.new(1,1,1);_bBf.PlaceholderText="config name";_bBf.Text="default";_bBf.ClearTextOnFocus=false;_bBf.Font=Enum.Font.Gotham;_bBf.TextSize=10;_bBf.Parent=_bBd
  local _bBg=Instance.new("TextLabel");_bBg.Position=UDim2.fromOffset(8,63);_bBg.Size=UDim2.new(1,-16,0,22);_bBg.BackgroundTransparency=1;_bBg.Text="F7 toggles this panel";_bBg.TextColor3=Color3.fromRGB(145,190,255);_bBg.Font=Enum.Font.Gotham;_bBg.TextSize=9;_bBg.Parent=_bBd
  local function _bBh(_bBi,_bBj,_bBk)
    local _bBl=Instance.new("TextButton");_bBl.Position=UDim2.fromOffset(_bBj,86);_bBl.Size=UDim2.fromOffset(90,24);_bBl.BackgroundColor3=Color3.fromRGB(42,57,76);_bBl.TextColor3=Color3.new(1,1,1);_bBl.Text=_bBi;_bBl.Font=Enum.Font.GothamBold;_bBl.TextSize=9;_bBl.Parent=_bBd;_bBl.MouseButton1Click:Connect(_bBk);Instance.new("UICorner",_bBl).CornerRadius=UDim.new(0,4)
  end _bBh("SAVE CFG",8,function()
    local _bBm=_bAF:save(_bBf.Text);
    if _bBm then _bAQ.config=_bBf.Text;_bAQ:save()
    end;_bBg.Text=_bBm and "Config saved"or "Save failed (check file APIs/name)"
  end)_bBh("LOAD CFG",105,function()
    local _bBn=_bAF:load(_bBf.Text);
    if _bBn then _bAQ.config=_bBf.Text
    end;_bBg.Text=_bBn and "Config loaded"or "Load failed (missing/invalid)"
  end)_bBh("CLOSE",202,function()_bBd.Visible=false
  end)
  local _bBo=Instance.new("TextLabel");_bBo.Position=UDim2.fromOffset(8,113);_bBo.Size=UDim2.fromOffset(70,22);_bBo.BackgroundTransparency=1;_bBo.Text="SPIN MODE";_bBo.TextColor3=Color3.fromRGB(210,218,230);_bBo.Font=Enum.Font.GothamBold;_bBo.TextSize=9;_bBo.Parent=_bBd
  local _bBp=Instance.new("TextButton");_bBp.Position=UDim2.fromOffset(80,112);_bBp.Size=UDim2.fromOffset(110,24);_bBp.BackgroundColor3=Color3.fromRGB(42,57,76);_bBp.TextColor3=Color3.new(1,1,1);_bBp.Font=Enum.Font.GothamBold;_bBp.TextSize=9;_bBp.Parent=_bBd
  local _bBq={"Jitter","Up","Down","Horizontal","Random","Backwards","Sine"};
  local _bBr=1 do local _bBs=(getgenv().SHIZUKUSCRIPTS_SPIN_SETTINGS and getgenv().SHIZUKUSCRIPTS_SPIN_SETTINGS.mode)or "Jitter"
    for _bBt,_bBu in ipairs(_bBq)do if _bBu==_bBs then _bBr=_bBt break
      end
    end
  end _bBp.Text=_bBq[_bBr]_bBp.MouseButton1Click:Connect(function()_bBr=_bBr%#_bBq+1;getgenv().SHIZUKUSCRIPTS_SPIN_SETTINGS.mode=_bBq[_bBr];_bBp.Text=getgenv().SHIZUKUSCRIPTS_SPIN_SETTINGS.mode
  end)_bBf.FocusLost:Connect(function()
    if _bBf.Text and _bBf.Text:gsub("%s+","")~=""then _bAQ.config=_bBf.Text
    end
  end)
  local _bBv=Instance.new("ScrollingFrame");_bBv.Position=UDim2.fromOffset(8,142);_bBv.Size=UDim2.new(1,-16,1,-150);_bBv.BackgroundColor3=Color3.fromRGB(20,23,30);_bBv.BorderSizePixel=0;_bBv.ScrollBarThickness=3;_bBv.Parent=_bBd
  local _bBw=Instance.new("UIListLayout",_bBv);_bBw.Padding=UDim.new(0,3);_bBw.SortOrder=Enum.SortOrder.LayoutOrder Instance.new("UIPadding",_bBv).PaddingTop=UDim.new(0,4)function _bAV:assign(_bBx)
    local _bBy=self.waiting;self.waiting=nil
    if not _bBy then return
    end
    local _bBz=_bxV.bindings[_bBy]
    if _bBz then _bxV.bindings[_bBy]=nil;_bxV.bindings[_bBx]=_bBz;_bBg.Text="Bound to ".._bBx
    end
  end
  local function _bBA()
    for _bBB,_bBC in ipairs(_bBv:GetChildren())do if _bBC:IsA("Frame")then _bBC:Destroy()
      end
    end
    local _bBD={}
    for _bBE,_bBF in pairs(_bxV.bindings)do table.insert(_bBD,{key=_bBE,b=_bBF})
    end table.sort(_bBD,function(_bBG,_bBH)
      return _bBG.key<_bBH.key
    end)
    for _bBI,_bBJ in ipairs(_bBD)do local _bBK=Instance.new("Frame");_bBK.Size=UDim2.new(1,-4,0,26);_bBK.BackgroundColor3=Color3.fromRGB(29,33,42);_bBK.LayoutOrder=_bBI;_bBK.Parent=_bBv Instance.new("UICorner",_bBK).CornerRadius=UDim.new(0,4)
      local _bBL=tostring(_bBJ.b.label or _bBJ.key)
      local _bBM=Instance.new("TextLabel");_bBM.Position=UDim2.fromOffset(6,0);_bBM.Size=UDim2.new(1,-76,1,0);_bBM.BackgroundTransparency=1 _bBM.Text="[".._bBJ.key.."]  ".._bBL;_bBM.TextColor3=_bBJ.b.active and Color3.new(1,1,1)or Color3.fromRGB(130,130,140);_bBM.Font=Enum.Font.Gotham;_bBM.TextSize=11;_bBM.TextXAlignment=Enum.TextXAlignment.Left;_bBM.Parent=_bBK
      local _bBN=Instance.new("TextButton");_bBN.Position=UDim2.new(1,-66,0,3);_bBN.Size=UDim2.fromOffset(62,20);_bBN.BackgroundColor3=Color3.fromRGB(48,65,88);_bBN.TextColor3=Color3.new(1,1,1);_bBN.Text="REBIND";_bBN.Font=Enum.Font.GothamBold;_bBN.TextSize=8;_bBN.Parent=_bBK Instance.new("UICorner",_bBN).CornerRadius=UDim.new(0,4)_bBN.MouseButton1Click:Connect(function()_bAV.waiting=_bBJ.key;_bBg.Text="Rebind ".._bBL.." \226\128\148 press key / MB1-3";_bBN.Text="WAIT..."
      end)
    end _bBv.CanvasSize=UDim2.fromOffset(0,#_bBD*29+8)
  end _bBA()
  local _bBO=0 game:GetService("RunService").Heartbeat:Connect(function()
    if _bBd.Visible and os.clock()-_bBO>0.5 then _bBO=os.clock();_bBA()
    end
  end)game:GetService("UserInputService").InputBegan:Connect(function(_bBP)
    if _bBP.KeyCode==Enum.KeyCode.F7 then _bBd.Visible=not _bBd.Visible
    end
  end)
end
local _bBQ={kill_effect=true,kill_style="Nova",walk_trail=true,walk_style="Neon",damage_numbers=true,screen_flash=true,ambient_aura=false,footstep_rings=false,kill_sound=true,color=Color3.fromRGB(120,200,255),accent=Color3.fromRGB(255,120,200),_last_pos=nil,_trail_parts={},_tracked_health={},_connections={},}
local function _bBR()
  local _bBS,_bBT=pcall(function()
    return game:GetService("CoreGui")
  end)
  if _bBS and _bBT then return _bBT
  end
  local _bBU=game:GetService("Players").LocalPlayer
  return _bBU and _bBU:FindFirstChildOfClass("PlayerGui")
end
local function _bBV(_bBW,_bBX,_bBY)
  return Color3.new(_bBW.R+(_bBX.R-_bBW.R)*_bBY,_bBW.G+(_bBX.G-_bBW.G)*_bBY,_bBW.B+(_bBX.B-_bBW.B)*_bBY)
end
local function _bBZ(_bCa)
  local _bCb=Instance.new("Part")_bCb.Anchored=true _bCb.CanCollide=false _bCb.CanQuery=false _bCb.CanTouch=false _bCb.CastShadow=false _bCb.Material=Enum.Material.Neon _bCb.Transparency=_bCa.transparency or 0.2 _bCb.Color=_bCa.color or _bBQ.color _bCb.Size=_bCa.size or Vector3.new(0.3,0.3,0.3)_bCb.CFrame=_bCa.cframe or CFrame.new()_bCb.Name="SHIZUKUSCRIPTS_FX"_bCb.Parent=workspace.CurrentCamera or workspace
  return _bCb
end function _bBQ:burst(_bCc,_bCd,_bCe)_bCd=_bCd or self.kill_style _bCe=_bCe or self.color
  local _bCf=game:GetService("TweenService")
  local _bCg=game:GetService("Debris")
  if _bCd=="Shatter"then for _bCh=1,18 do local _bCi=Vector3.new(math.random()-0.5,math.random()*0.8+0.2,math.random()-0.5).Unit
      local _bCj=_bBZ({color=(_bCh%2==0)and _bCe or self.accent,size=Vector3.new(0.15,0.15,math.random(8,18)/10),cframe=CFrame.new(_bCc,_bCc+_bCi),transparency=0.1,})
      local _bCk=_bCc+_bCi*math.random(6,14)_bCf:Create(_bCj,TweenInfo.new(0.55,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{CFrame=CFrame.new(_bCk,_bCk+_bCi),Transparency=1,Size=Vector3.new(0.05,0.05,0.2),}):Play()_bCg:AddItem(_bCj,0.6)
    end
  elseif _bCd=="Bloom"then for _bCl=1,3 do local _bCm=_bBZ({color=_bCe,size=Vector3.new(0.4,0.08,0.4),cframe=CFrame.new(_bCc)*CFrame.Angles(math.rad(90),0,0),transparency=0.25,})
      local _bCn=Instance.new("SpecialMesh")_bCn.MeshType=Enum.MeshType.Cylinder _bCn.Parent=_bCm _bCf:Create(_bCm,TweenInfo.new(0.5+_bCl*0.08,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=Vector3.new(10+_bCl*3,0.05,10+_bCl*3),Transparency=1,}):Play()_bCg:AddItem(_bCm,0.7)
    end
    for _bCo=1,12 do local _bCp=_bBZ({color=self.accent,size=Vector3.new(0.2,0.2,0.2),cframe=CFrame.new(_bCc),transparency=0.15,})
      local _bCq=_bCc+Vector3.new((math.random()-0.5)*6,math.random(2,8),(math.random()-0.5)*6)_bCf:Create(_bCp,TweenInfo.new(0.45,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{CFrame=CFrame.new(_bCq),Transparency=1,Size=Vector3.new(0.05,0.05,0.05),}):Play()_bCg:AddItem(_bCp,0.5)
    end
  elseif _bCd=="Lightning"then for _bCr=1,8 do local _bCs=_bCc+Vector3.new((math.random()-0.5)*10,math.random(2,9),(math.random()-0.5)*10)
      local _bCt=(_bCc+_bCs)/2+Vector3.new((math.random()-0.5)*2,(math.random()-0.5)*2,(math.random()-0.5)*2)
      local _bCu=_bBZ({color=Color3.fromRGB(180,230,255),size=Vector3.new(0.12,0.12,(_bCc-_bCs).Magnitude),cframe=CFrame.new(_bCt,_bCs),transparency=0.05,})_bCf:Create(_bCu,TweenInfo.new(0.25,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Transparency=1,Size=Vector3.new(0.02,0.02,_bCu.Size.Z),}):Play()_bCg:AddItem(_bCu,0.3)
    end
  elseif _bCd=="Orbit"then for _bCv=1,16 do local _bCw=(_bCv/16)*math.pi*2
      local _bCx=_bBZ({color=(_bCv%2==0)and _bCe or self.accent,size=Vector3.new(0.25,0.25,0.25),cframe=CFrame.new(_bCc+Vector3.new(math.cos(_bCw)*1.2,0.5,math.sin(_bCw)*1.2)),transparency=0.1,})
      local _bCy=_bCc+Vector3.new(math.cos(_bCw)*8,math.random(1,4),math.sin(_bCw)*8)_bCf:Create(_bCx,TweenInfo.new(0.55,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{CFrame=CFrame.new(_bCy),Transparency=1,}):Play()_bCg:AddItem(_bCx,0.6)
    end
  else for _bCz=1,24 do local _bCA=(_bCz/24)*math.pi*2
      local _bCB=Vector3.new(math.cos(_bCA),0.35,math.sin(_bCA))
      local _bCC=_bBZ({color=_bBV(_bCe,self.accent,_bCz/24),size=Vector3.new(0.2,0.2,1.4),cframe=CFrame.new(_bCc,_bCc+_bCB),transparency=0.1,})
      local _bCD=_bCc+_bCB*9 _bCf:Create(_bCC,TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{CFrame=CFrame.new(_bCD,_bCD+_bCB),Transparency=1,Size=Vector3.new(0.05,0.05,0.3),}):Play()_bCg:AddItem(_bCC,0.55)
    end
    local _bCE=_bBZ({color=Color3.fromRGB(255,255,255),size=Vector3.new(1,1,1),cframe=CFrame.new(_bCc),transparency=0.2,})_bCf:Create(_bCE,TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=Vector3.new(6,6,6),Transparency=1,}):Play()_bCg:AddItem(_bCE,0.45)
  end
end function _bBQ:damage_number(_bCF,_bCG,_bCH)
  if not self.damage_numbers then return
  end
  local _bCI=_bBR()
  if not _bCI then return
  end
  local _bCJ=_bCI:FindFirstChild("SHIZUKUSCRIPTS_FX_GUI")
  if not _bCJ then _bCJ=Instance.new("ScreenGui")_bCJ.Name="SHIZUKUSCRIPTS_FX_GUI"_bCJ.ResetOnSpawn=false _bCJ.IgnoreGuiInset=true _bCJ.DisplayOrder=50 _bCJ.Parent=_bCI
  end
  local _bCK=workspace.CurrentCamera
  if not _bCK then return
  end
  local _bCL,_bCM=_bCK:WorldToViewportPoint(_bCF+Vector3.new(0,2,0))
  if not _bCM then return
  end
  local _bCN=Instance.new("TextLabel")_bCN.BackgroundTransparency=1 _bCN.Size=UDim2.fromOffset(80,28)_bCN.Position=UDim2.fromOffset(_bCL.X-40,_bCL.Y-14)_bCN.Font=Enum.Font.GothamBold _bCN.TextSize=_bCH and 22 or 16 _bCN.TextStrokeTransparency=0.4 _bCN.TextColor3=_bCH and Color3.fromRGB(255,90,130)or Color3.fromRGB(255,240,180)_bCN.Text=_bCH and("KILL  "..tostring(_bCG))or("-"..tostring(_bCG))_bCN.ZIndex=20 _bCN.Parent=_bCJ
  local _bCO=game:GetService("TweenService")_bCO:Create(_bCN,TweenInfo.new(0.7,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Position=UDim2.fromOffset(_bCL.X-40+math.random(-20,20),_bCL.Y-60),TextTransparency=1,TextStrokeTransparency=1,TextSize=_bCH and 28 or 12,}):Play()game:GetService("Debris"):AddItem(_bCN,0.75)
end function _bBQ:screen_kill_flash()
  if not self.screen_flash then return
  end
  local _bCP=_bBR()
  if not _bCP then return
  end
  local _bCQ=_bCP:FindFirstChild("SHIZUKUSCRIPTS_FX_GUI")
  if not _bCQ then _bCQ=Instance.new("ScreenGui")_bCQ.Name="SHIZUKUSCRIPTS_FX_GUI"_bCQ.ResetOnSpawn=false _bCQ.IgnoreGuiInset=true _bCQ.DisplayOrder=40 _bCQ.Parent=_bCP
  end
  local _bCR=Instance.new("Frame")_bCR.Size=UDim2.fromScale(1,1)_bCR.BackgroundColor3=self.accent _bCR.BackgroundTransparency=0.75 _bCR.BorderSizePixel=0 _bCR.Parent=_bCQ
  local _bCS=Instance.new("UIGradient")_bCS.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0.2),NumberSequenceKeypoint.new(0.5,0.6),NumberSequenceKeypoint.new(1,1),})_bCS.Rotation=90 _bCS.Parent=_bCR game:GetService("TweenService"):Create(_bCR,TweenInfo.new(0.35,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundTransparency=1,}):Play()game:GetService("Debris"):AddItem(_bCR,0.4)
end function _bBQ:play_kill_sound()
  if not self.kill_sound then return
  end
  local _bCT=getgenv().HitVisualsConfig
  if _bCT and _bCT.SoundEnabled and _bCT.SoundId then pcall(function()
      local _bCU=Instance.new("Sound")_bCU.SoundId=_bCT.SoundId
      local _bCV=tonumber(_bCT.Volume)or 1
      if _bCV>10 then _bCV=_bCV/100
      end _bCU.Volume=math.clamp(_bCV,0,10)_bCU.Parent=game:GetService("SoundService")game:GetService("SoundService"):PlayLocalSound(_bCU)task.delay(3,function()
        if _bCU then _bCU:Destroy()
        end
      end)
    end)
    return
  end pcall(function()
    local _bCW=Instance.new("Sound")_bCW.SoundId="rbxassetid://9114221281"_bCW.Volume=0.55 _bCW.PlaybackSpeed=1.05 _bCW.Parent=game:GetService("SoundService")game:GetService("SoundService"):PlayLocalSound(_bCW)task.delay(2,function()
      if _bCW then _bCW:Destroy()
      end
    end)
  end)
end function _bBQ:on_kill(_bCX,_bCY)
  if not self.kill_effect then return
  end
  local _bCZ=_bCX and(_bCX:FindFirstChild("HumanoidRootPart")or _bCX:FindFirstChild("Head"))
  local _bDa=_bCZ and _bCZ.Position or Vector3.zero self:burst(_bDa,self.kill_style,self.color)self:damage_number(_bDa,_bCY or 100,true)self:screen_kill_flash()self:play_kill_sound()
end function _bBQ:on_damage(_bDb,_bDc)
  local _bDd=_bDb and(_bDb:FindFirstChild("HumanoidRootPart")or _bDb:FindFirstChild("Head"))
  if not _bDd then return
  end self:damage_number(_bDd.Position,math.floor(_bDc+0.5),false)
  local _bDe=_bBZ({color=self.accent,size=Vector3.new(0.35,0.35,0.35),cframe=CFrame.new(_bDd.Position+Vector3.new(0,1.5,0)),transparency=0.2,})game:GetService("TweenService"):Create(_bDe,TweenInfo.new(0.25),{Size=Vector3.new(1.2,1.2,1.2),Transparency=1,}):Play()game:GetService("Debris"):AddItem(_bDe,0.3)
end function _bBQ:foot_ring(_bDf)
  if not self.footstep_rings then return
  end
  local _bDg=_bBZ({color=self.color,size=Vector3.new(0.6,0.06,0.6),cframe=CFrame.new(_bDf)*CFrame.Angles(0,0,math.rad(90)),transparency=0.35,})
  local _bDh=Instance.new("SpecialMesh")_bDh.MeshType=Enum.MeshType.Cylinder _bDh.Parent=_bDg game:GetService("TweenService"):Create(_bDg,TweenInfo.new(0.45,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=Vector3.new(3.2,0.04,3.2),Transparency=1,}):Play()game:GetService("Debris"):AddItem(_bDg,0.5)
end function _bBQ:spawn_trail_dot(_bDi,_bDj)
  local _bDk=game:GetService("TweenService")
  local _bDl=game:GetService("Debris")
  local _bDm=(tick()*0.7)%1
  local _bDn=_bDj=="Rainbow"and Color3.fromHSV(_bDm,0.85,1)or(_bDj=="Stars"and Color3.fromRGB(255,240,180)or self.color)
  if _bDj=="Smoke"then local _bDo=_bBZ({color=Color3.fromRGB(160,170,190),size=Vector3.new(0.5,0.5,0.5),cframe=CFrame.new(_bDi+Vector3.new(0,0.2,0)),transparency=0.5,})_bDo.Material=Enum.Material.SmoothPlastic _bDk:Create(_bDo,TweenInfo.new(0.7),{CFrame=CFrame.new(_bDi+Vector3.new((math.random()-0.5),1.5,(math.random()-0.5))),Size=Vector3.new(1.4,1.4,1.4),Transparency=1,}):Play()_bDl:AddItem(_bDo,0.75)
  elseif _bDj=="Sparks"then for _bDp=1,3 do local _bDq=_bBZ({color=Color3.fromRGB(255,220,120),size=Vector3.new(0.12,0.12,0.35),cframe=CFrame.new(_bDi),transparency=0.15,})
      local _bDr=_bDi+Vector3.new((math.random()-0.5)*2,math.random()*1.5,(math.random()-0.5)*2)_bDk:Create(_bDq,TweenInfo.new(0.35),{CFrame=CFrame.new(_bDr),Transparency=1}):Play()_bDl:AddItem(_bDq,0.4)
    end
  elseif _bDj=="Stars"then local _bDs=_bBZ({color=_bDn,size=Vector3.new(0.25,0.25,0.25),cframe=CFrame.new(_bDi+Vector3.new(0,0.15,0)),transparency=0.2,})_bDk:Create(_bDs,TweenInfo.new(0.5),{CFrame=CFrame.new(_bDi+Vector3.new(0,1.2,0)),Size=Vector3.new(0.05,0.05,0.05),Transparency=1,}):Play()_bDl:AddItem(_bDs,0.55)
  else local _bDt=_bBZ({color=_bDn,size=Vector3.new(0.35,0.12,0.35),cframe=CFrame.new(_bDi),transparency=0.25,})_bDk:Create(_bDt,TweenInfo.new(0.55),{Size=Vector3.new(0.1,0.05,0.1),Transparency=1,}):Play()_bDl:AddItem(_bDt,0.6)
  end
end function _bBQ:update_walk(_bDu)
  if not self.walk_trail then return
  end
  local _bDv=game:GetService("Players").LocalPlayer
  local _bDw=_bDv and _bDv.Character
  local _bDx=_bDw and _bDw:FindFirstChild("HumanoidRootPart")
  local _bDy=_bDw and _bDw:FindFirstChildOfClass("Humanoid")
  if not _bDx or not _bDy then return
  end
  if _bDy.MoveDirection.Magnitude<0.15 then self._last_pos=_bDx.Position
    return
  end
  local _bDz=_bDx.Position-Vector3.new(0,_bDy.HipHeight+1.5,0)
  if self._last_pos then local _bDA=(_bDz-self._last_pos).Magnitude
    if _bDA>=1.4 then self:spawn_trail_dot(_bDz,self.walk_style)self:foot_ring(_bDz)self._last_pos=_bDz
    end
  else self._last_pos=_bDz
  end
end function _bBQ:update_aura()
  if not self.ambient_aura then return
  end
  local _bDB=game:GetService("Players").LocalPlayer
  local _bDC=_bDB and _bDB.Character
  local _bDD=_bDC and _bDC:FindFirstChild("HumanoidRootPart")
  if not _bDD then return
  end
  if math.random()>0.03 then return
  end
  local _bDE=Vector3.new((math.random()-0.5)*3,math.random()*3,(math.random()-0.5)*3)
  local _bDF=_bBZ({color=_bBV(self.color,self.accent,math.random()),size=Vector3.new(0.15,0.15,0.15),cframe=CFrame.new(_bDD.Position+_bDE),transparency=0.35,})game:GetService("TweenService"):Create(_bDF,TweenInfo.new(0.8),{CFrame=CFrame.new(_bDD.Position+_bDE+Vector3.new(0,1.5,0)),Transparency=1,}):Play()game:GetService("Debris"):AddItem(_bDF,0.85)
end function _bBQ:hook_players()
  local _bDG=game:GetService("Players")
  local _bDH=_bDG.LocalPlayer
  local function _bDI(_bDJ)
    if _bDJ==_bDH then return
    end
    local function _bDK(_bDL)
      local _bDM=_bDL:WaitForChild("Humanoid",8)
      if not _bDM then return
      end self._tracked_health[_bDJ]=_bDM.Health _bDM.HealthChanged:Connect(function(_bDN)
        local _bDO=self._tracked_health[_bDJ]or _bDN
        local _bDP=_bDO-_bDN self._tracked_health[_bDJ]=_bDN
        if _bDP>1 and _bDP<500 then pcall(function()
            if _bDN<=0 then self:on_kill(_bDL,_bDP)
            else self:on_damage(_bDL,_bDP)
            end
          end)
        end
      end)_bDM.Died:Connect(function()pcall(function()self:on_kill(_bDL,100)
        end)
      end)
    end
    if _bDJ.Character then task.spawn(_bDK,_bDJ.Character)
    end _bDJ.CharacterAdded:Connect(function(_bDQ)task.spawn(_bDK,_bDQ)
    end)
  end
  for _bDR,_bDS in ipairs(_bDG:GetPlayers())do _bDI(_bDS)
  end _bDG.PlayerAdded:Connect(_bDI)
end function _bBQ:set_kill_style(_bDT)
  local _bDU={Nova=true,Shatter=true,Bloom=true,Lightning=true,Orbit=true}
  if _bDU[_bDT]then self.kill_style=_bDT
  end
end function _bBQ:set_walk_style(_bDV)
  local _bDW={Neon=true,Sparks=true,Smoke=true,Rainbow=true,Stars=true}
  if _bDW[_bDV]then self.walk_style=_bDV
  end
end function _bBQ:toggle_kill(_bDX)
  if type(_bDX)=="boolean"then self.kill_effect=_bDX
  else self.kill_effect=not self.kill_effect
  end print("[shizukuscripts] Kill FX: "..(self.kill_effect and "ON"or "OFF").." ("..self.kill_style..")")
end function _bBQ:toggle_walk(_bDY)
  if type(_bDY)=="boolean"then self.walk_trail=_bDY
  else self.walk_trail=not self.walk_trail
  end print("[shizukuscripts] Walk FX: "..(self.walk_trail and "ON"or "OFF").." ("..self.walk_style..")")
end pcall(function()_bBQ:hook_players()
end)getgenv().SHIZUKUSCRIPTS_FX=_bBQ _G.shizukuscripts_fx=_bBQ pcall(function()
  if _bxV then _bxV:register("V",function()_bBQ:toggle_kill()
    end,"Press","Kill FX")_bxV:register("B",function()_bBQ:toggle_walk()
    end,"Press","Walk FX")_bxV:register("N",function()
      local _bDZ={"Nova","Shatter","Bloom","Lightning","Orbit"}
      local _bEa=1
      for _bEb,_bEc in ipairs(_bDZ)do if _bEc==_bBQ.kill_style then _bEa=_bEb break
        end
      end _bEa=_bEa%#_bDZ+1 _bBQ:set_kill_style(_bDZ[_bEa])print("[shizukuscripts] Kill style: ".._bDZ[_bEa])
    end,"Press","Kill Style")_bxV:register("M",function()
      local _bEd={"Neon","Sparks","Smoke","Rainbow","Stars"}
      local _bEe=1
      for _bEf,_bEg in ipairs(_bEd)do if _bEg==_bBQ.walk_style then _bEe=_bEf break
        end
      end _bEe=_bEe%#_bEd+1 _bBQ:set_walk_style(_bEd[_bEe])print("[shizukuscripts] Walk style: ".._bEd[_bEe])
    end,"Press","Walk Style")
  end
end)print("[\226\156\147] shizukuscripts FX loaded \226\128\148 V kill / B walk / N kill style / M walk style")spawn(function()
  local _bEh=0
  while true do local _bEi=false
    if _byl.enabled then _bEi=true pcall(function()_byl:update()
      end)
    end
    if _bzO.enabled then _bEi=true pcall(function()_bzO:aim()
      end)
    end _bEh=_bEh+1
    if _bEh>=3 then _bEh=0
      if _bBQ and(_bBQ.walk_trail or _bBQ.ambient_aura)then pcall(function()
          if _bBQ.walk_trail then _bBQ:update_walk(0.05)
          end
          if _bBQ.ambient_aura then _bBQ:update_aura()
          end
        end)
      end
    end task.wait(_bEi and 0.02 or 0.08)
  end
end)_o()
local _bEj={enabled=false,fov=500,teamcheck=true,hitpart="Head",max_distance=5000,wallbang=false,wallcheck=false,target_bots=true,target=nil,raycast_module=nil,}
local _bEk=game:GetService("Players")
local _bEl=_bEk.LocalPlayer
local _bEm=game:GetService("Workspace")
local _bEn=game:GetService("RunService")
local _bEo=_bEm.CurrentCamera
local function _bEp(_bEq,_bEr)
  local _bEs=_bEq:FindFirstChild("HumanoidRootPart")
  local _bEt=_bEq:FindFirstChild("Head")
  local _bEu=_bEq:FindFirstChild("UpperTorso")or _bEq:FindFirstChild("Torso")
  local _bEv=_bEr.resolver_mode or "Body"
  if _bEr.resolver and _bEv=="Body"and _bEs then return _bEt or _bEs,_bEs.Position+Vector3.new(0,1.45,0)
  end
  if _bEr.resolver and(_bEv=="Multi"or _bEr.multipoint)and _bEo then local _bEw={}
    if _bEs then table.insert(_bEw,{part=_bEs,pos=_bEs.Position+Vector3.new(0,1.45,0)})table.insert(_bEw,{part=_bEs,pos=_bEs.Position+Vector3.new(0,0.9,0)})table.insert(_bEw,{part=_bEs,pos=_bEs.Position})
      if _bEr.backward then local _bEx=-_bEs.CFrame.LookVector table.insert(_bEw,{part=_bEs,pos=_bEs.Position+Vector3.new(0,1.3,0)+_bEx*0.35})
      end
    end
    if _bEt then table.insert(_bEw,{part=_bEt,pos=_bEt.Position})
    end
    if _bEu then table.insert(_bEw,{part=_bEu,pos=_bEu.Position})
    end
    local _bEy=_bEo.ViewportSize/2
    local _bEz,_bEA
    for _bEB,_bEC in ipairs(_bEw)do local _bED,_bEE=_bEo:WorldToViewportPoint(_bEC.pos)
      if _bEE then local _bEF=(Vector2.new(_bED.X,_bED.Y)-_bEy).Magnitude
        if not _bEA or _bEF<_bEA then _bEA=_bEF;_bEz=_bEC
        end
      end
    end
    if _bEz then return _bEz.part,_bEz.pos
    end
  end
  if _bEt then return _bEt,_bEt.Position
  end
  if _bEu then return _bEu,_bEu.Position
  end
  if _bEs then return _bEs,_bEs.Position+Vector3.new(0,1.2,0)
  end
  return nil,nil
end
local function _bEG()
  if not _bEo then return nil
  end
  local _bEH=getgenv().SHIZUKUSCRIPTS_HVH_COMBAT or{}
  local _bEI=_bEj.fov
  if _bEH.rage_fov then _bEI=math.max(_bEI,550)
  end
  if _bEH.force_shot then _bEI=math.max(_bEI,8000)
  end
  local _bEJ,_bEK,_bEL=nil,nil,nil
  local _bEM=_bEl:GetAttribute("Team")
  local _bEN=_bEl.Character
  if not _bEN then return nil
  end
  local _bEO=_bEN:FindFirstChild("Head")or _bEN:FindFirstChild("HumanoidRootPart")
  if not _bEO then return nil
  end
  local _bEP=tick()
  local _bEQ=_bEo.ViewportSize/2
  local function _bER(_bES,_bET)
    if _bEH.prediction and _bET then local _bEU=_bET.AssemblyLinearVelocity
      if _bEU.Magnitude>1 then local _bEV=_bEU*(_bEH.pred_scale or 0.12)getgenv()._SHIZUKUSCRIPTS_PRED_OFFSET=_bEV
        return _bES+_bEV
      end
    end getgenv()._SHIZUKUSCRIPTS_PRED_OFFSET=nil
    return _bES
  end
  if _bEH.sticky and _bEH._sticky_target and _bEP<(_bEH._sticky_until or 0)then local _bEW=_bEH._sticky_target
    if _bEW and _bEW.Parent then local _bEX=_bEW.Parent
      if _bEX:IsA("BasePart")then _bEX=_bEX.Parent
      end
      if _bEX and _bEX:IsA("Model")and not _bEX:GetAttribute("Dead")then local _bEY=_bEX:FindFirstChildOfClass("Humanoid")
        if _bEY and _bEY.Health>0 then local _bEZ,_bFa=_bEp(_bEX,_bEH)
          if _bEZ and _bFa then _bFa=_bER(_bFa,_bEZ)getgenv()._SHIZUKUSCRIPTS_AIM_POS=_bFa
            return _bEZ
          end
        end
      end
    end _bEH._sticky_target=nil
  end
  local function _bFb(_bFc,_bFd)
    if not _bFc or not _bFc:IsA("Model")then return
    end
    if _bFc==_bEN then return
    end
    if _bFc:GetAttribute("Dead")then return
    end
    local _bFe=_bFc:FindFirstChildOfClass("Humanoid")
    if not _bFe or _bFe.Health<=0 then return
    end
    if not(_bFc:FindFirstChild("Head")or _bFc:FindFirstChild("HumanoidRootPart"))then return
    end
    if _bEj.teamcheck and _bFd~=nil and _bEM~=nil and _bFd==_bEM then return
    end
    local _bFf,_bFg=_bEp(_bFc,_bEH)
    if not _bFf or not _bFg then return
    end
    local _bFh=(_bFg-_bEO.Position).Magnitude
    if _bFh>_bEj.max_distance then return
    end
    local _bFi,_bFj=_bEo:WorldToViewportPoint(_bFg)
    if not _bFj and not _bEH.force_shot then return
    end
    local _bFk=_bFj and(Vector2.new(_bFi.X,_bFi.Y)-_bEQ).Magnitude or 9999
    if _bFk>_bEI and not _bEH.force_shot then return
    end
    local _bFl=true
    if _bEj.wallcheck and not _bEj.wallbang and not _bEH.auto_wallbang and not _bEH.force_shot then local _bFm=RaycastParams.new()_bFm.FilterType=Enum.RaycastFilterType.Exclude _bFm.FilterDescendantsInstances={_bEN}
      local _bFn=_bEm:Raycast(_bEo.CFrame.Position,_bFg-_bEo.CFrame.Position,_bFm)_bFl=(not _bFn)or _bFn.Instance:IsDescendantOf(_bFc)
    end
    if not _bFl then return
    end
    local _bFo
    local _bFp=_bEH.priority or "Crosshair"
    if _bFp=="Health"then _bFo=_bFe.Health
    elseif _bFp=="Distance"then _bFo=_bFh
    else _bFo=_bFk
    end
    if _bEJ==nil or _bFo<_bEJ then _bEJ=_bFo _bEK=_bFf _bEL=_bFg
    end
  end
  for _bFq,_bFr in _bEk:GetPlayers()do if _bFr==_bEl then continue
    end
    local _bFs=false pcall(function()
      if _bEH.ignore_friends and _bFr:IsFriendsWith(_bEl.UserId)then _bFs=true
      end
    end)
    if _bFs then continue
    end
    local _bFt=_bFr:GetAttribute("Team")
    if _bFt==nil and _bFr.Team then _bFt=_bFr.Team
    end _bFb(_bFr.Character,_bFt)
  end
  local function _bFu(_bFv)
    if not _bFv then return
    end
    for _bFw,_bFx in ipairs(_bFv:GetChildren())do if _bFx:IsA("Model")then local _bFy=_bFx:FindFirstChildOfClass("Humanoid")
        if _bFy and _bFy.Health>0 and not _bEk:GetPlayerFromCharacter(_bFx)then local _bFz=_bFx:GetAttribute("Team")_bFb(_bFx,_bFz)
        elseif _bFx:IsA("Folder")or _bFx:IsA("Model")then for _bFA,_bFB in ipairs(_bFx:GetChildren())do if _bFB:IsA("Model")then local _bFC=_bFB:FindFirstChildOfClass("Humanoid")
              if _bFC and _bFC.Health>0 and not _bEk:GetPlayerFromCharacter(_bFB)then _bFb(_bFB,_bFB:GetAttribute("Team"))
              end
            end
          end
        end
      elseif _bFx:IsA("Folder")then for _bFD,_bFE in ipairs(_bFx:GetChildren())do if _bFE:IsA("Model")then local _bFF=_bFE:FindFirstChildOfClass("Humanoid")
            if _bFF and _bFF.Health>0 and not _bEk:GetPlayerFromCharacter(_bFE)then _bFb(_bFE,_bFE:GetAttribute("Team"))
            end
          end
        end
      end
    end
  end pcall(_bFu,_bEm)
  if _bEK and _bEL then _bEL=_bER(_bEL,_bEK)getgenv()._SHIZUKUSCRIPTS_AIM_POS=_bEL
    if _bEH.sticky then _bEH._sticky_target=_bEK _bEH._sticky_until=_bEP+(_bEH.sticky_time or 0.35)
    end
  else getgenv()._SHIZUKUSCRIPTS_AIM_POS=nil
  end
  return _bEK
end _G._silentAimData={target=nil,localPlayer=_bEl,camera=_bEo,oldCast=nil,oldCastThrough=nil,}_bEn.RenderStepped:Connect(function()
  if _bEj.enabled then _G._silentAimData.target=_bEG()_bEj.target=_G._silentAimData.target
  else _G._silentAimData.target=nil _bEj.target=nil
  end
end)
local _bFG pcall(function()
  if type(getgc)=="function"then for _bFH,_bFI in getgc(true)do if type(_bFI)=="table"and rawget(_bFI,"cast")and rawget(_bFI,"castThrough")then if type(rawget(_bFI,"cast"))=="function"and type(rawget(_bFI,"castThrough"))=="function"then _bFG=_bFI break
        end
      end
    end
  end
end)
if not _bFG then local _bFJ,_bFK=pcall(function()
    return require(game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Raycast"))
  end)
  if _bFJ and type(_bFK)=="table"and type(_bFK.cast)=="function"and type(_bFK.castThrough)=="function"then _bFG=_bFK
  end
end _bEj.raycast_module=_bFG
if not _bFG then warn("[shizukuscripts] no raycast module found, silent aim disabled")
else local _bFL=getfenv()
  local _bFM={}setmetatable(_bFM,{__index=function(_bFN,_bFO)
    if _bFO=="getgenv"or _bFO=="hookfunction"or _bFO=="hookfunc"or _bFO=="replaceclosure"or _bFO=="oth"or _bFO=="debug"then return nil
    end
    return _bFL[_bFO]
  end})_bFM._silentAimData=_G._silentAimData _bFM.typeof=typeof _bFM.Vector3=Vector3 _bFM.warn=warn _bFM.select=select _bFM.shizukuscripts_silentaim=_bEj
  local _bFP=loadstring("        return function(origin, direction, ...)\n            local data = _silentAimData\n            local t = data.target\n            local config = shizukuscripts_silentaim\n            \n            if t and typeof(direction) == \"Vector3\" and config.enabled then\n                local lchar = data.localPlayer.Character\n                if lchar and lchar:FindFirstChild(\"Head\") then\n                    local dist = (origin - lchar.Head.Position).Magnitude\n                    if dist < 50 then\n                        local g = getgenv and getgenv() or _G\n                        local aim = rawget(g, \"_SHIZUKUSCRIPTS_AIM_POS\")\n                        if typeof(aim) ~= \"Vector3\" then\n                            aim = t.Position\n                            local pred = rawget(g, \"_SHIZUKUSCRIPTS_PRED_OFFSET\")\n                            if typeof(pred) == \"Vector3\" then aim = aim + pred end\n                        end\n                        direction = (aim - origin)\n                    end\n                end\n            end\n            \n            if data.oldCast then\n                return data.oldCast(origin, direction, ...)\n            end\n            return nil\n        end\n    ")
  local _bFQ=loadstring("        return function(origin, direction, ...)\n            local data = _silentAimData\n            local t = data.target\n            local config = shizukuscripts_silentaim\n            \n            if t and typeof(direction) == \"Vector3\" and config.enabled then\n                local lchar = data.localPlayer.Character\n                if lchar and lchar:FindFirstChild(\"Head\") then\n                    local dist = (origin - lchar.Head.Position).Magnitude\n                    if dist < 50 then\n                        local g = getgenv and getgenv() or _G\n                        local aim = rawget(g, \"_SHIZUKUSCRIPTS_AIM_POS\")\n                        if typeof(aim) ~= \"Vector3\" then\n                            aim = t.Position\n                            local pred = rawget(g, \"_SHIZUKUSCRIPTS_PRED_OFFSET\")\n                            if typeof(pred) == \"Vector3\" then aim = aim + pred end\n                        end\n                        direction = (aim - origin)\n                    end\n                end\n            end\n            \n            if data.oldCastThrough then\n                return data.oldCastThrough(origin, direction, ...)\n            end\n            return nil\n        end\n    ")pcall(function()setfenv(_bFP,_bFM)
  end)pcall(function()setfenv(_bFQ,_bFM)
  end)_G._silentAimData.oldCast=_bFG.cast _G._silentAimData.oldCastThrough=_bFG.castThrough
  local _bFR=_bFP()
  local _bFS=_bFQ()
  if type(hookfunction)=="function"then pcall(function()_G._silentAimData.oldCast=hookfunction(_bFG.cast,function(_bFT,_bFU,...)
        if not _bEj.enabled or not _G._silentAimData.oldCast then return _G._silentAimData.oldCast(_bFT,_bFU,...)
        end
        return _bFR(_bFT,_bFU,...)
      end)
    end)pcall(function()_G._silentAimData.oldCastThrough=hookfunction(_bFG.castThrough,function(_bFV,_bFW,...)
        if not _bEj.enabled or not _G._silentAimData.oldCastThrough then return _G._silentAimData.oldCastThrough(_bFV,_bFW,...)
        end
        return _bFS(_bFV,_bFW,...)
      end)
    end)print("[shizukuscripts] Silent Aim: Raycast module hooked successfully")
  else warn("[shizukuscripts] hookfunction is unavailable, silent aim may not work")
  end
end function _bEj:toggle(_bFX)
  if type(_bFX)=="boolean"then self.enabled=_bFX
  else self.enabled=not self.enabled
  end getgenv().SHIZUKUSCRIPTS_SILENT_AIM_ENABLED=self.enabled getgenv().SHIZUKUSCRIPTS_SILENT_AIM=self print("[shizukuscripts] Silent Aim: "..(self.enabled and "ON"or "OFF"))
end function _bEj:set_fov(_bFY)self.fov=_bFY print("[shizukuscripts] Silent Aim FOV set to: ".._bFY)
end function _bEj:set_distance(_bFZ)self.max_distance=_bFZ print("[shizukuscripts] Silent Aim max distance set to: ".._bFZ)
end function _bEj:set_teamcheck(_bGa)self.teamcheck=_bGa print("[shizukuscripts] Silent Aim teamcheck: "..(_bGa and "ON"or "OFF"))
end getgenv().SHIZUKUSCRIPTS_SILENT_AIM=_bEj getgenv().SHIZUKUSCRIPTS_SILENT_AIM_ENABLED=false pcall(function()
  if _bxV then _bxV:register("G",function()_bEj:toggle()
    end,"Press","Silent Aim")
  end
end)_G.shizukuscripts_silentaim=_bEj print("[\226\156\147] shizukuscripts Silent Aim loaded - Press G to toggle")
local _bGb={enabled=false,fov=250,max_distance=5000,teamcheck=true,target=nil,last_fire_time=0,shot_cooldown=0.05,death_wait=0.1,target_bots=true,wallcheck=true,pending=nil,skip_until={},enemy_detected=false,firing=false,}
local _bGc=game:GetService("Players")
local _bGd=_bGc.LocalPlayer
local _bGe=game:GetService("RunService")
local _bGf=game:GetService("Workspace")function _bGb:is_alive(_bGg)
  if not _bGg then return false
  end
  local _bGh=_bGg.Character
  if not _bGh then return false
  end
  if type(_bGg)~="table"or not _bGg.IsBot then if _bGh:GetAttribute("Dead")then return false
    end
  end
  local _bGi=_bGh:FindFirstChildOfClass("Humanoid")
  return _bGi and _bGi.Health>0
end function _bGb:player_from_part(_bGj)
  if not _bGj then return nil
  end
  local _bGk=_bGj:FindFirstAncestorOfClass("Model")
  if not _bGk then return nil
  end
  return _bGc:GetPlayerFromCharacter(_bGk)
end function _bGb:visible_to(_bGl,_bGm)
  if self.wallcheck==false then return true
  end
  local _bGn=nil pcall(function()
    local _bGo=_bGf.CurrentCamera
    if _bGo then _bGn=_bGo.CFrame.Position
    end
  end)
  if not _bGn then local _bGp=_bGd.Character and _bGd.Character:FindFirstChild("Head")_bGn=_bGp and _bGp.Position
  end
  if not _bGn or not _bGl then return false
  end
  local _bGq=RaycastParams.new()_bGq.FilterType=Enum.RaycastFilterType.Exclude
  local _bGr={_bGd.Character}_bGq.FilterDescendantsInstances=_bGr
  local _bGs=_bGf:Raycast(_bGn,_bGl-_bGn,_bGq)
  if not _bGs then return true
  end
  if _bGm and _bGs.Instance and _bGs.Instance:IsDescendantOf(_bGm)then return true
  end
  return false
end function _bGb:detect_enemy()
  local _bGt=nil pcall(function()
    if _G._silentAimData and _G._silentAimData.target then _bGt=_G._silentAimData.target
    elseif getgenv().SHIZUKUSCRIPTS_SILENT_AIM and getgenv().SHIZUKUSCRIPTS_SILENT_AIM.target then _bGt=getgenv().SHIZUKUSCRIPTS_SILENT_AIM.target
    end
  end)
  if _bGt then local _bGu=self:player_from_part(_bGt)
    local _bGv=_bGu and _bGu.Character
    if(not _bGu)and type(_bGt)=="userdata"then _bGv=_bGt:FindFirstAncestorOfClass("Model")
    end
    if _bGu and self:is_alive(_bGu)then local _bGw=tick()
      if not(self.skip_until[_bGu]and _bGw<self.skip_until[_bGu])then local _bGx=_bGt.Position
        if self:visible_to(_bGx,_bGv or _bGu.Character)then return _bGu
        end
      end
    elseif type(_bGt)=="table"and _bGt.IsBot and _bGt.Character then local _bGy=_bGt.Character:FindFirstChild("Head")or _bGt.Character:FindFirstChild("HumanoidRootPart")
      if _bGy and self:visible_to(_bGy.Position,_bGt.Character)then return _bGt
      end
    end
  end
  if not _bGd.Character then return nil
  end
  local _bGz=_bGf.CurrentCamera
  if not _bGz then return nil
  end
  local _bGA=self.fov
  local _bGB=nil
  local _bGC=_bGd.Character:FindFirstChild("Head")
  if not _bGC then return nil
  end
  local _bGD=tick()
  local _bGE=_bGd.Team
  for _bGF,_bGG in ipairs(_bGc:GetPlayers())do if _bGG==_bGd then continue
    end
    if self.skip_until[_bGG]and _bGD<self.skip_until[_bGG]then continue
    end
    local _bGH=_bGG.Character
    if not _bGH or _bGH:GetAttribute("Dead")then continue
    end
    local _bGI=_bGH:FindFirstChildOfClass("Humanoid")
    if not _bGI or _bGI.Health<=0 then continue
    end
    if self.teamcheck and _bGG.Team and _bGE and _bGG.Team==_bGE then continue
    end
    local _bGJ
    local _bGK=_bGH:FindFirstChild("Head")
    local _bGL=_bGH:FindFirstChild("HumanoidRootPart")
    if _bGL then _bGJ=_bGL.Position+Vector3.new(0,1.45,0)
    elseif _bGK then _bGJ=_bGK.Position
    else continue
    end
    local _bGM=(_bGJ-_bGC.Position).Magnitude
    if _bGM>self.max_distance then continue
    end
    if not self:visible_to(_bGJ,_bGH)then continue
    end
    local _bGN,_bGO=_bGz:WorldToViewportPoint(_bGJ)
    if not _bGO then continue
    end
    local _bGP=_bGz.ViewportSize/2
    local _bGQ=(Vector2.new(_bGN.X,_bGN.Y)-_bGP).Magnitude
    if _bGQ<_bGA then _bGA=_bGQ _bGB=_bGG
    end
  end
  if self.target_bots==false then return _bGB
  end pcall(function()
    local _bGR=_bGf.CurrentCamera
    if not _bGR then return
    end
    local _bGS=_bGd.Character and _bGd.Character:FindFirstChild("Head")
    if not _bGS then return
    end
    local _bGT=_bGR.ViewportSize/2
    for _bGU,_bGV in ipairs(_bGf:GetChildren())do if _bGV:IsA("Model")and _bGV~=_bGd.Character then local _bGW=_bGV:FindFirstChildOfClass("Humanoid")
        local _bGX=_bGV:FindFirstChild("Head")
        local _bGY=_bGV:FindFirstChild("HumanoidRootPart")
        if _bGW and _bGW.Health>0 and(_bGX or _bGY)and not _bGc:GetPlayerFromCharacter(_bGV)then local _bGZ=(_bGX or _bGY).Position
          local _bHa=(_bGZ-_bGS.Position).Magnitude
          if _bHa<=self.max_distance and self:visible_to(_bGZ,_bGV)then local _bHb,_bHc=_bGR:WorldToViewportPoint(_bGZ)
            if _bHc then local _bHd=(Vector2.new(_bHb.X,_bHb.Y)-_bGT).Magnitude
              if _bHd<_bGA then _bGA=_bHd _bGB={Name=_bGV.Name,DisplayName=_bGV.Name,Character=_bGV,IsBot=true}
              end
            end
          end
        end
      end
    end
  end)
  return _bGB
end function _bGb:click()
  if self.firing then return
  end self.firing=true pcall(function()
    if mouse1click then mouse1click()
    elseif mouse1press and mouse1release then mouse1press()mouse1release()
    else local _bHe=_bGd:GetMouse()_bHe:TriggerButton1Down()_bHe:TriggerButton1Up()
    end
  end)self.firing=false self.last_fire_time=tick()
end function _bGb:fire_once_head(_bHf)
  if not self.enabled or not _bHf then return false
  end
  if not self:is_alive(_bHf)then return false
  end pcall(function()
    if getgenv().shizukuscripts and getgenv().shizukuscripts.SilentAim then getgenv().shizukuscripts.SilentAim.Enabled=true
    end
    if getgenv().SHIZUKUSCRIPTS_SILENT_AIM and getgenv().SHIZUKUSCRIPTS_SILENT_AIM.toggle then getgenv().SHIZUKUSCRIPTS_SILENT_AIM:toggle(true)
    end
  end)self:click()
  return true
end function _bGb:toggle(_bHg)
  if type(_bHg)=="boolean"then self.enabled=_bHg
  else self.enabled=not self.enabled
  end self.pending=nil print("[shizukuscripts] Autoshoot: "..(self.enabled and "ON"or "OFF"))
end function _bGb:set_fov(_bHh)self.fov=tonumber(_bHh)or self.fov
end function _bGb:set_teamcheck(_bHi)self.teamcheck=_bHi==true
end spawn(function()
  while true do if _bGb.enabled then local _bHj=_bGb pcall(function()
        if getgenv().shizukuscripts and getgenv().shizukuscripts.Autoshoot then if getgenv().shizukuscripts.Autoshoot.Enabled==false then _bHj.enabled=false
          end
        end
      end)
      if not _bHj.enabled then task.wait(0.1)continue
      end
      if _bHj.pending then if _bHj.death_wait and _bHj.death_wait>0 then task.wait(_bHj.death_wait)
        end
        local _bHk=_bHj.pending _bHj.pending=nil
        if _bHj:is_alive(_bHk)then _bHj.skip_until[_bHk]=tick()+0.15
          if getgenv().SHIZUKUSCRIPTS_HITLOG then getgenv().SHIZUKUSCRIPTS_HITLOG:add("HIT  "..(_bHk.DisplayName or _bHk.Name).."  (alive)",false)
          end
        else _bHj.skip_until[_bHk]=tick()+1.0
          if getgenv().SHIZUKUSCRIPTS_HITLOG then getgenv().SHIZUKUSCRIPTS_HITLOG:add("KILL  "..(_bHk.DisplayName or _bHk.Name),true)
          end
        end
      else local _bHl=_bHj:detect_enemy()_bHj.enemy_detected=_bHl~=nil _bHj.target=_bHl
        if _bHl and(tick()-_bHj.last_fire_time)>=_bHj.shot_cooldown then if _bHj:fire_once_head(_bHl)then _bHj.pending=_bHl
          end
        end
      end task.wait(0)
    else task.wait(0.05)
    end
  end
end)function _bGb:set_fire_mode(_bHm)print("[shizukuscripts] Autoshoot is fixed to 1-shot head mode")
end function _bGb:set_fire_rate(_bHn)self.shot_cooldown=_bHn
end getgenv().SHIZUKUSCRIPTS_AUTOSHOOT=_bGb _G.shizukuscripts_autoshoot=_bGb pcall(function()
  if _bxV then _bxV:register("J",function()_bGb:toggle()
    end,"Press","Autoshoot")
  end
end)print("[\226\156\147] shizukuscripts Autoshoot loaded \226\128\148 J toggle (1-shot head + death check)")do local _bHo={enabled=true,max_lines=8,_gui=nil,_list=nil,_lines={},_tracked={},}
  local function _bHp()
    local _bHq,_bHr=pcall(function()
      if type(gethui)=="function"then return gethui()
      end
      return game:GetService("CoreGui")
    end)
    return _bHq and _bHr or game:GetService("CoreGui")
  end function _bHo:init()
    local _bHs=_bHp()pcall(function()
      local _bHt=_bHs:FindFirstChild("shizukuscripts_HitLog")
      if _bHt then _bHt:Destroy()
      end
    end)
    local _bHu=Instance.new("ScreenGui")_bHu.Name="shizukuscripts_HitLog"_bHu.ResetOnSpawn=false _bHu.IgnoreGuiInset=true _bHu.DisplayOrder=80 _bHu.Parent=_bHs
    local _bHv=Instance.new("Frame")_bHv.Name="Container"_bHv.AnchorPoint=Vector2.new(0,1)_bHv.Position=UDim2.new(0,14,1,-14)_bHv.Size=UDim2.fromOffset(260,28)_bHv.AutomaticSize=Enum.AutomaticSize.Y _bHv.BackgroundColor3=Color3.fromRGB(10,12,18)_bHv.BackgroundTransparency=0.15 _bHv.BorderSizePixel=0 _bHv.Parent=_bHu Instance.new("UICorner",_bHv).CornerRadius=UDim.new(0,8)
    local _bHw=Instance.new("UIStroke")_bHw.Color=Color3.fromRGB(90,150,255)_bHw.Transparency=0.5 _bHw.Thickness=1 _bHw.Parent=_bHv
    local _bHx=Instance.new("TextLabel")_bHx.BackgroundTransparency=1 _bHx.Size=UDim2.new(1,-12,0,20)_bHx.Position=UDim2.fromOffset(8,4)_bHx.Font=Enum.Font.GothamBold _bHx.TextSize=11 _bHx.TextXAlignment=Enum.TextXAlignment.Left _bHx.TextColor3=Color3.fromRGB(160,200,255)_bHx.Text="HITLOG"_bHx.Parent=_bHv
    local _bHy=Instance.new("Frame")_bHy.BackgroundTransparency=1 _bHy.Position=UDim2.fromOffset(8,24)_bHy.Size=UDim2.new(1,-16,0,0)_bHy.AutomaticSize=Enum.AutomaticSize.Y _bHy.Parent=_bHv
    local _bHz=Instance.new("UIListLayout")_bHz.SortOrder=Enum.SortOrder.LayoutOrder _bHz.Padding=UDim.new(0,2)_bHz.Parent=_bHy self._gui=_bHu self._list=_bHy
  end function _bHo:add(_bHA,_bHB)
    if not self.enabled then return
    end
    if not self._gui or not self._gui.Parent then self:init()
    end table.insert(self._lines,1,{text=_bHA,kill=_bHB==true,t=tick()})
    while#self._lines>self.max_lines do table.remove(self._lines)
    end
    for _bHC,_bHD in ipairs(self._list:GetChildren())do if _bHD:IsA("TextLabel")then _bHD:Destroy()
      end
    end
    for _bHE,_bHF in ipairs(self._lines)do local _bHG=Instance.new("TextLabel")_bHG.BackgroundTransparency=1 _bHG.Size=UDim2.new(1,0,0,16)_bHG.Font=Enum.Font.Gotham _bHG.TextSize=11 _bHG.TextXAlignment=Enum.TextXAlignment.Left _bHG.TextColor3=_bHF.kill and Color3.fromRGB(255,110,140)or Color3.fromRGB(210,220,235)_bHG.Text=_bHF.text _bHG.LayoutOrder=_bHE _bHG.Parent=self._list
    end self._gui.Enabled=true
  end function _bHo:toggle(_bHH)
    if type(_bHH)=="boolean"then self.enabled=_bHH
    else self.enabled=not self.enabled
    end
    if self._gui then self._gui.Enabled=self.enabled
    end print("[shizukuscripts] Hitlog: "..(self.enabled and "ON"or "OFF"))
  end function _bHo:hook()
    local _bHI=game:GetService("Players")
    local _bHJ=_bHI.LocalPlayer
    local function _bHK(_bHL)
      if _bHL==_bHJ then return
      end
      local function _bHM(_bHN)
        local _bHO=_bHN:WaitForChild("Humanoid",8)
        if not _bHO then return
        end self._tracked[_bHL]=_bHO.Health _bHO.HealthChanged:Connect(function(_bHP)
          local _bHQ=self._tracked[_bHL]or _bHP
          local _bHR=_bHQ-_bHP self._tracked[_bHL]=_bHP
          if _bHR>1 and _bHR<500 then local _bHS=_bHL.DisplayName~=""and _bHL.DisplayName or _bHL.Name
            if _bHP<=0 then self:add(string.format("KILL  %s  -%d",_bHS,math.floor(_bHR)),true)
            else self:add(string.format("HIT   %s  -%d  (%.0f hp)",_bHS,math.floor(_bHR),_bHP),false)
            end
          end
        end)_bHO.Died:Connect(function()
          local _bHT=_bHL.DisplayName~=""and _bHL.DisplayName or _bHL.Name self:add("KILL  ".._bHT,true)
        end)
      end
      if _bHL.Character then task.spawn(_bHM,_bHL.Character)
      end _bHL.CharacterAdded:Connect(function(_bHU)task.spawn(_bHM,_bHU)
      end)
    end
    for _bHV,_bHW in ipairs(_bHI:GetPlayers())do _bHK(_bHW)
    end _bHI.PlayerAdded:Connect(_bHK)
  end _bHo:init()pcall(function()_bHo:hook()
  end)getgenv().SHIZUKUSCRIPTS_HITLOG=_bHo _G.shizukuscripts_hitlog=_bHo pcall(function()
    if _bxV then _bxV:register("O",function()_bHo:toggle()
      end,"Press","Hitlog")
    end
  end)print("[\226\156\147] shizukuscripts Hitlog loaded \226\128\148 O toggle")
end do local _bHX=game:GetService("Players")
  local _bHY=game:GetService("RunService")
  local _bHZ=game:GetService("Workspace")
  local _bIa=_bHX.LocalPlayer pcall(function()
    local function _bIb(_bIc)
      if not _bIc or not _bIc:IsA("Sound")then return
      end
      local _bId=getgenv().SHIZUKUSCRIPTS_ESP
      if not _bId or not _bId.sound_esp then return
      end
      local _bIe=_bIc.Parent
      if not _bIe then return
      end
      local _bIf=_bIe:FindFirstAncestorOfClass("Model")or _bIe
      local _bIg=_bHX:GetPlayerFromCharacter(_bIf)
      if not _bIg or _bIg==_bIa then return
      end
      local _bIh
      if _bIe:IsA("BasePart")then _bIh=_bIe.Position
      elseif _bIf:IsA("Model")and _bIf:FindFirstChild("HumanoidRootPart")then _bIh=_bIf.HumanoidRootPart.Position
      end
      if not _bIh then return
      end _bId._sound_markers=_bId._sound_markers or{}_bId._sound_markers[_bIg]={pos=_bIh,until_t=tick()+2.5}
    end
    local function _bIi(_bIj)pcall(function()_bIj.Played:Connect(function()_bIb(_bIj)
        end)
      end)
    end _bHZ.DescendantAdded:Connect(function(_bIk)
      if _bIk:IsA("Sound")then _bIi(_bIk)
      end
    end)
    for _bIl,_bIm in ipairs(_bHZ:GetDescendants())do if _bIm:IsA("Sound")then _bIi(_bIm)
      end
    end
  end)pcall(function()_bHY.Heartbeat:Connect(function()
      if not getgenv().SHIZUKUSCRIPTS_REVOLVER_ALT then return
      end
      local _bIn=getgenv().shizukuscripts and getgenv().shizukuscripts.Exploits
      if not _bIn or not _bIn.InstantRevolver then return
      end
      local _bIo=_bIa.Character
      if not _bIo then return
      end
      local _bIp=_bIo:FindFirstChildOfClass("Tool")
      if not _bIp then return
      end
      local _bIq=string.lower(_bIp.Name or"")
      if not(_bIq:find("revolver")or _bIq:find("r8")or _bIq:find("deagle")==nil and _bIq:find("rev"))then if not(_bIq:find("revolver")or _bIq:find("r8"))then return
        end
      end pcall(function()_bIp:SetAttribute("AltFire",true)_bIp:SetAttribute("FastShot",true)_bIp:SetAttribute("SecondaryFire",true)
      end)pcall(function()
        if _bIp:FindFirstChild("AltShot")then end
      end)
    end)
  end)pcall(function()_bHY.RenderStepped:Connect(function()
      local _bIr,_bIs=pcall(function()
        return getgenv().removescope or nil
      end)pcall(function()
        for _bIt,_bIu in ipairs({"shizukuscripts","Settings"})do end
      end)
    end)
  end)getgenv().SHIZUKUSCRIPTS_TOOL_CHAMS_FILTER=getgenv().SHIZUKUSCRIPTS_TOOL_CHAMS_FILTER or{enabled=true,allow={"ak","m4","awp","usp","glock","deagle","revolver","r8","scout","mp","p250","tec","famas","galil","negev","nova","xm","mag","cz","five","dual","knife","bayonet","karambit"},}getgenv().SHIZUKUSCRIPTS_TOOL_IS_WEAPON=function(_bIv)
    local _bIw=getgenv().SHIZUKUSCRIPTS_TOOL_CHAMS_FILTER
    if not _bIw or not _bIw.enabled then return true
    end
    if not _bIv then return false
    end
    local _bIx=string.lower(tostring(_bIv.Name or""))
    for _bIy,_bIz in ipairs(_bIw.allow or{})do if _bIx:find(_bIz,1,true)then return true
      end
    end
    if _bIv:FindFirstChild("Handle")and(_bIv:FindFirstChild("Ammo")or _bIv:FindFirstChild("GunScript")or _bIv:FindFirstChild("Client"))then return true
    end
    return false
  end print("[shizukuscripts] BloxStrike helpers: sound ESP, revolver alt, tool-chams filter, share codes")
end pcall(function()
  local _bIA=game:GetService("RunService")
  local _bIB=game:GetService("Players")
  local _bIC=game:GetService("Workspace")
  local _bID=_bIB.LocalPlayer _bIA.RenderStepped:Connect(function()
    local _bIE=getgenv().SHIZUKUSCRIPTS_SILENT_AIM
    if not _bIE or not _bIE.enabled or _bIE.target_bots==false then return
    end
    if _bIE.target and typeof(_bIE.target)=="Instance"then local _bIF=_bIB:GetPlayerFromCharacter(_bIE.target:FindFirstAncestorOfClass("Model")or _bIE.target.Parent)
      if _bIF and _bIF~=_bID then return
      end
    end
    local _bIG=_bIC.CurrentCamera
    if not _bIG or not _bID.Character then return
    end
    local _bIH=_bID.Character:FindFirstChild("Head")
    if not _bIH then return
    end
    local _bII=_bIG.ViewportSize/2
    local _bIJ,_bIK=nil,_bIE.fov or 500
    local function _bIL(_bIM)
      if not _bIM or not _bIM:IsA("Model")then return
      end
      if _bIM==_bID.Character then return
      end
      if _bIB:GetPlayerFromCharacter(_bIM)then return
      end
      local _bIN=_bIM:FindFirstChildOfClass("Humanoid")
      local _bIO=_bIM:FindFirstChild("Head")or _bIM:FindFirstChild("HumanoidRootPart")
      if not _bIN or _bIN.Health<=0 or not _bIO then return
      end
      if _bIM:GetAttribute("Dead")then return
      end
      local _bIP,_bIQ=_bIG:WorldToViewportPoint(_bIO.Position)
      if not _bIQ then return
      end
      local _bIR=(Vector2.new(_bIP.X,_bIP.Y)-_bII).Magnitude
      if _bIR<_bIK then _bIK=_bIR _bIJ=_bIO
      end
    end
    local _bIS=_bIC:FindFirstChild("Characters")
    if _bIS then for _bIT,_bIU in ipairs(_bIS:GetChildren())do _bIL(_bIU)
      end
    end
    for _bIV,_bIW in ipairs(_bIC:GetChildren())do if _bIW:IsA("Model")then _bIL(_bIW)
      end
      if _bIW:IsA("Folder")then for _bIX,_bIY in ipairs(_bIW:GetChildren())do if _bIY:IsA("Model")then _bIL(_bIY)
          end
        end
      end
    end
    if _bIJ then _bIE.target=_bIJ getgenv()._SHIZUKUSCRIPTS_AIM_POS=_bIJ.Position
    end
  end)
end)pcall(function()
  local _bIZ=game:GetService("TweenService")
  local function _bJa(_bJb)
    for _bJc,_bJd in ipairs(_bJb:GetDescendants())do if _bJd:IsA("Frame")and(_bJd.Name=="MainFrame"or _bJd.Name=="1"or _bJd.Name=="Background")then local _bJe=_bJd:FindFirstChildOfClass("UIScale")
        if not _bJe then _bJe=Instance.new("UIScale")_bJe.Scale=0.92 _bJe.Parent=_bJd _bIZ:Create(_bJe,TweenInfo.new(0.35,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Scale=1}):Play()
        end
      end
    end
  end task.defer(function()task.wait(0.5)
    local _bJf=game:GetService("CoreGui")
    for _bJg,_bJh in ipairs(_bJf:GetChildren())do pcall(_bJa,_bJh)
    end
    if type(gethui)=="function"then pcall(function()
        for _bJi,_bJj in ipairs(gethui():GetChildren())do pcall(_bJa,_bJj)
        end
      end)
    end
  end)
end)print("[shizukuscripts] HVHBot removed \194\183 silent bots + GUI polish")
local _bJk={enabled=false,show_on_others=false,hat_color=Color3.fromRGB(120,200,255),trail_color=Color3.fromRGB(255,120,200),trail_enabled=true,hat_height=1.15,hat_size=1.4,_hats={},_conn=nil,_char_conn={},}
local _bJl=game:GetService("Players")
local _bJm=game:GetService("RunService")
local _bJn=_bJl.LocalPlayer
local function _bJo(_bJp)
  local _bJq=_bJk._hats[_bJp]
  if not _bJq then return
  end pcall(function()
    if _bJq.hat then _bJq.hat:Destroy()
    end
    if _bJq.trail then _bJq.trail:Destroy()
    end
    if _bJq.a0 then _bJq.a0:Destroy()
    end
    if _bJq.a1 then _bJq.a1:Destroy()
    end
  end)_bJk._hats[_bJp]=nil
end
local function _bJr()
  for _bJs in pairs(_bJk._hats)do _bJo(_bJs)
  end
end
local function _bJt(_bJu,_bJv,_bJw,_bJx)
  local _bJy=Instance.new("Part")_bJy.Name="SHIZUKUSCRIPTS_ChinaHat"_bJy.Anchored=false _bJy.CanCollide=false _bJy.CanQuery=false _bJy.CanTouch=false _bJy.CastShadow=false _bJy.Material=Enum.Material.Neon _bJy.Color=_bJv _bJy.Transparency=0.15 _bJy.Size=Vector3.new(0.05,0.05,0.05)_bJy.Massless=true _bJy.Parent=_bJu
  local _bJz=Instance.new("SpecialMesh")_bJz.MeshType=Enum.MeshType.FileMesh _bJz.MeshId="rbxassetid://1033714"_bJz.Scale=Vector3.new(_bJw,_bJw*0.55,_bJw)_bJz.Offset=Vector3.new(0,_bJx*0.35,0)_bJz.Parent=_bJy
  local _bJA=Instance.new("Weld")_bJA.Part0=_bJu _bJA.Part1=_bJy _bJA.C0=CFrame.new(0,_bJx*0.5,0)_bJA.Parent=_bJy
  return _bJy
end
local function _bJB(_bJC,_bJD)
  local _bJE=Instance.new("Attachment")_bJE.Name="SHIZUKUSCRIPTS_TrailA0"_bJE.Position=Vector3.new(0,0.1,0)_bJE.Parent=_bJC
  local _bJF=Instance.new("Attachment")_bJF.Name="SHIZUKUSCRIPTS_TrailA1"_bJF.Position=Vector3.new(0,-0.35,0)_bJF.Parent=_bJC
  local _bJG=Instance.new("Trail")_bJG.Name="SHIZUKUSCRIPTS_ChinaTrail"_bJG.Attachment0=_bJE _bJG.Attachment1=_bJF _bJG.Color=ColorSequence.new(_bJD)_bJG.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0.2),NumberSequenceKeypoint.new(1,1),})_bJG.Lifetime=0.55 _bJG.MinLength=0.08 _bJG.FaceCamera=true _bJG.LightEmission=0.7 _bJG.WidthScale=NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,0),})_bJG.Parent=_bJC
  return _bJG,_bJE,_bJF
end
local function _bJH(_bJI)
  if not _bJk.enabled then return
  end
  if _bJI~=_bJn and not _bJk.show_on_others then return
  end
  local _bJJ=_bJI.Character
  if not _bJJ then return
  end
  local _bJK=_bJJ:FindFirstChild("Head")
  if not _bJK or not _bJK:IsA("BasePart")then return
  end _bJo(_bJI)
  local _bJL=_bJt(_bJK,_bJk.hat_color,_bJk.hat_size,_bJk.hat_height)
  local _bJM,_bJN,_bJO=nil,nil,nil
  if _bJk.trail_enabled then _bJM,_bJN,_bJO=_bJB(_bJK,_bJk.trail_color)
  end _bJk._hats[_bJI]={hat=_bJL,trail=_bJM,a0=_bJN,a1=_bJO}
  if _bJk._char_conn[_bJI]then pcall(function()_bJk._char_conn[_bJI]:Disconnect()
    end)
  end _bJk._char_conn[_bJI]=_bJJ.AncestryChanged:Connect(function(_bJP,_bJQ)
    if not _bJQ then _bJo(_bJI)
    end
  end)
end
local function _bJR()_bJr()
  if not _bJk.enabled then return
  end
  for _bJS,_bJT in ipairs(_bJl:GetPlayers())do pcall(_bJH,_bJT)
  end
end function _bJk:set_enabled(_bJU)self.enabled=_bJU and true or false
  if self.enabled then _bJR()
  else _bJr()
  end print("[shizukuscripts] ChinaHat: "..(self.enabled and "ON"or "OFF"))
end function _bJk:set_others(_bJV)self.show_on_others=_bJV and true or false _bJR()
end function _bJk:set_trail(_bJW)self.trail_enabled=_bJW and true or false _bJR()
end function _bJk:set_hat_color(_bJX)
  if typeof(_bJX)=="Color3"then self.hat_color=_bJX
    for _bJY,_bJZ in pairs(self._hats)do if _bJZ.hat then _bJZ.hat.Color=_bJX
      end
    end
  end
end function _bJk:set_trail_color(_bKa)
  if typeof(_bKa)=="Color3"then self.trail_color=_bKa
    for _bKb,_bKc in pairs(self._hats)do if _bKc.trail then _bKc.trail.Color=ColorSequence.new(_bKa)
      end
    end
  end
end
local function _bKd(_bKe)_bKe.CharacterAdded:Connect(function()task.wait(0.4)
    if _bJk.enabled then pcall(_bJH,_bKe)
    end
  end)
end
for _bKf,_bKg in ipairs(_bJl:GetPlayers())do _bKd(_bKg)
end _bJl.PlayerAdded:Connect(_bKd)_bJl.PlayerRemoving:Connect(function(_bKh)_bJo(_bKh)
  if _bJk._char_conn[_bKh]then pcall(function()_bJk._char_conn[_bKh]:Disconnect()
    end)_bJk._char_conn[_bKh]=nil
  end
end)getgenv().SHIZUKUSCRIPTS_CHINAHAT=_bJk _G.shizukuscripts_chinahat=_bJk function ndlc_ch_build_menu(_bKi)
  local _bKj=_bKi:Section("china hat","right")_bKj:Toggle({title="china hat",default=false,risky=false,callback=function(_bKk)_bJk:set_enabled(_bKk)
  end,}):Colorpicker({title="hat color",default=Color3.fromRGB(120,200,255),transparency=1,callback=function(_bKl)_bJk:set_hat_color(_bKl)
  end,})_bKj:Toggle({title="hat trails (\209\129\208\187\208\181\208\180\209\139)",default=true,risky=false,callback=function(_bKm)_bJk:set_trail(_bKm)
  end,}):Colorpicker({title="trail color",default=Color3.fromRGB(255,120,200),transparency=1,callback=function(_bKn)_bJk:set_trail_color(_bKn)
  end,})_bKj:Toggle({title="show on others",default=false,risky=false,callback=function(_bKo)_bJk:set_others(_bKo)
  end,})_bKj:Slider({title="hat size",suffix="x",min=0.6,max=3.0,float=0.05,default=1.4,callback=function(_bKp)_bJk.hat_size=_bKp _bJR()
  end,})_bKj:Slider({title="hat height",suffix="",min=0.4,max=2.5,float=0.05,default=1.15,callback=function(_bKq)_bJk.hat_height=_bKq _bJR()
  end,})print("[\226\156\147] shizukuscripts ChinaHat menu added \226\134\146 Visuals / china hat")
end pcall(function()
  local _bKr=rawget(_G,"players_tab")or(type(players_tab)~="nil"and players_tab)
  if not _bKr or type(_bKr.Section)~="function"then task.delay(1.5,function()_bKr=rawget(_G,"players_tab")or(type(players_tab)~="nil"and players_tab)
      if not _bKr or type(_bKr.Section)~="function"then warn("[shizukuscripts] ChinaHat menu: visuals tab not found")
        return
      end ndlc_ch_build_menu(_bKr)
    end)
    return
  end ndlc_ch_build_menu(_bKr)
end)print("[\226\156\147] shizukuscripts ChinaHat + trails loaded")
local _bKs=game:GetService("Lighting")
local _bKt=game:GetService("TweenService")
local _bKu=game:GetService("RunService")
local _bKv={fullbright=false,no_shadows=false,fog_enabled=false,fog_start=0,fog_end=500,fog_color=Color3.fromRGB(180,200,255),bloom_enabled=false,bloom_intensity=0.8,bloom_size=24,bloom_threshold=0.9,cc_enabled=false,cc_saturation=0.2,cc_contrast=0.1,cc_brightness=0.05,cc_tint=Color3.fromRGB(255,255,255),dof_enabled=false,dof_far=100,dof_near=0.1,dof_focus=20,dof_in_focus=15,sunrays_enabled=false,sunrays_intensity=0.15,sunrays_spread=0.8,atmosphere_enabled=false,atmosphere_density=0.3,atmosphere_offset=0.25,atmosphere_color=Color3.fromRGB(150,180,255),atmosphere_decay=Color3.fromRGB(100,120,200),atmosphere_glare=0.3,atmosphere_haze=1.2,stars_enabled=false,moon_size=1,sun_size=1,ambient_particles=false,_orig={},_effects={},_particle_parts={},_conn=nil,}
local function _bKw()
  local _bKx=_bKv._orig
  if _bKx.saved then return
  end _bKx.saved=true _bKx.FogStart=_bKs.FogStart _bKx.FogEnd=_bKs.FogEnd _bKx.FogColor=_bKs.FogColor _bKx.GlobalShadows=_bKs.GlobalShadows _bKx.Brightness=_bKs.Brightness _bKx.Ambient=_bKs.Ambient _bKx.OutdoorAmbient=_bKs.OutdoorAmbient _bKx.ClockTime=_bKs.ClockTime _bKx.GeographicLatitude=_bKs.GeographicLatitude
  for _bKy,_bKz in ipairs({"BloomEffect","ColorCorrectionEffect","DepthOfFieldEffect","SunRaysEffect","BlurEffect"})do local _bKA=_bKs:FindFirstChildOfClass(_bKz)or _bKs:FindFirstChild(_bKz)
    if _bKA then _bKx[_bKz]=_bKA:Clone()
    end
  end
  local _bKB=_bKs:FindFirstChildOfClass("Atmosphere")
  if _bKB then _bKx.Atmosphere=_bKB:Clone()
  end
  local _bKC=_bKs:FindFirstChildOfClass("Sky")
  if _bKC then _bKx.StarCount=_bKC.StarCount _bKx.MoonSize=_bKC.MoonAngularSize _bKx.SunSize=_bKC.SunAngularSize
  end
end
local function _bKD(_bKE,_bKF)
  local _bKG=_bKs:FindFirstChild(_bKF)
  if _bKG and _bKG:IsA(_bKE)then return _bKG
  end _bKG=_bKs:FindFirstChildOfClass(_bKE)
  if _bKG then if _bKG.Name:find("SHIZUKUSCRIPTS")then return _bKG
    end
  end _bKG=Instance.new(_bKE)_bKG.Name=_bKF _bKG.Parent=_bKs
  return _bKG
end
local function _bKH(_bKI)
  local _bKJ=_bKs:FindFirstChild(_bKI)
  if _bKJ then _bKJ:Destroy()
  end
end function _bKv:set_fullbright(_bKK)_bKw()self.fullbright=_bKK and true or false
  if self.fullbright then _bKs.Brightness=2 _bKs.Ambient=Color3.fromRGB(200,200,200)_bKs.OutdoorAmbient=Color3.fromRGB(200,200,200)_bKs.FogEnd=100000
  else if self._orig.saved then _bKs.Brightness=self._orig.Brightness _bKs.Ambient=self._orig.Ambient _bKs.OutdoorAmbient=self._orig.OutdoorAmbient
      if not self.fog_enabled then _bKs.FogEnd=self._orig.FogEnd
      end
    end
  end
end function _bKv:set_no_shadows(_bKL)_bKw()self.no_shadows=_bKL and true or false _bKs.GlobalShadows=not self.no_shadows
  if not self.no_shadows and self._orig.saved then _bKs.GlobalShadows=self._orig.GlobalShadows
  end
end function _bKv:set_fog(_bKM)_bKw()self.fog_enabled=_bKM and true or false
  if self.fog_enabled then _bKs.FogStart=self.fog_start _bKs.FogEnd=self.fog_end _bKs.FogColor=self.fog_color
  else if self._orig.saved then _bKs.FogStart=self._orig.FogStart _bKs.FogEnd=self._orig.FogEnd _bKs.FogColor=self._orig.FogColor
    end
  end
end function _bKv:apply_fog_values()
  if not self.fog_enabled then return
  end _bKs.FogStart=self.fog_start _bKs.FogEnd=self.fog_end _bKs.FogColor=self.fog_color
end function _bKv:set_bloom(_bKN)self.bloom_enabled=_bKN and true or false
  if self.bloom_enabled then local _bKO=_bKD("BloomEffect","SHIZUKUSCRIPTS_Bloom")_bKO.Enabled=true _bKO.Intensity=self.bloom_intensity _bKO.Size=self.bloom_size _bKO.Threshold=self.bloom_threshold
  else _bKH("SHIZUKUSCRIPTS_Bloom")
  end
end function _bKv:apply_bloom()
  if not self.bloom_enabled then return
  end
  local _bKP=_bKs:FindFirstChild("SHIZUKUSCRIPTS_Bloom")
  if _bKP then _bKP.Intensity=self.bloom_intensity _bKP.Size=self.bloom_size _bKP.Threshold=self.bloom_threshold
  end
end function _bKv:set_cc(_bKQ)self.cc_enabled=_bKQ and true or false
  if self.cc_enabled then local _bKR=_bKD("ColorCorrectionEffect","SHIZUKUSCRIPTS_CC")_bKR.Enabled=true _bKR.Saturation=self.cc_saturation _bKR.Contrast=self.cc_contrast _bKR.Brightness=self.cc_brightness _bKR.TintColor=self.cc_tint
  else _bKH("SHIZUKUSCRIPTS_CC")
  end
end function _bKv:apply_cc()
  if not self.cc_enabled then return
  end
  local _bKS=_bKs:FindFirstChild("SHIZUKUSCRIPTS_CC")
  if _bKS then _bKS.Saturation=self.cc_saturation _bKS.Contrast=self.cc_contrast _bKS.Brightness=self.cc_brightness _bKS.TintColor=self.cc_tint
  end
end function _bKv:set_dof(_bKT)self.dof_enabled=_bKT and true or false
  if self.dof_enabled then local _bKU=_bKD("DepthOfFieldEffect","SHIZUKUSCRIPTS_DOF")_bKU.Enabled=true _bKU.FarIntensity=self.dof_far/100 _bKU.NearIntensity=self.dof_near _bKU.FocusDistance=self.dof_focus _bKU.InFocusRadius=self.dof_in_focus
  else _bKH("SHIZUKUSCRIPTS_DOF")
  end
end function _bKv:apply_dof()
  if not self.dof_enabled then return
  end
  local _bKV=_bKs:FindFirstChild("SHIZUKUSCRIPTS_DOF")
  if _bKV then _bKV.FarIntensity=math.clamp(self.dof_far/100,0,1)_bKV.NearIntensity=self.dof_near _bKV.FocusDistance=self.dof_focus _bKV.InFocusRadius=self.dof_in_focus
  end
end function _bKv:set_sunrays(_bKW)self.sunrays_enabled=_bKW and true or false
  if self.sunrays_enabled then local _bKX=_bKD("SunRaysEffect","SHIZUKUSCRIPTS_SunRays")_bKX.Enabled=true _bKX.Intensity=self.sunrays_intensity _bKX.Spread=self.sunrays_spread
  else _bKH("SHIZUKUSCRIPTS_SunRays")
  end
end function _bKv:apply_sunrays()
  if not self.sunrays_enabled then return
  end
  local _bKY=_bKs:FindFirstChild("SHIZUKUSCRIPTS_SunRays")
  if _bKY then _bKY.Intensity=self.sunrays_intensity _bKY.Spread=self.sunrays_spread
  end
end function _bKv:set_atmosphere(_bKZ)_bKw()self.atmosphere_enabled=_bKZ and true or false
  if self.atmosphere_enabled then local _bLa=_bKs:FindFirstChildOfClass("Atmosphere")
    if not _bLa then _bLa=Instance.new("Atmosphere")_bLa.Name="SHIZUKUSCRIPTS_Atmosphere"_bLa.Parent=_bKs
    end _bLa.Density=self.atmosphere_density _bLa.Offset=self.atmosphere_offset _bLa.Color=self.atmosphere_color _bLa.Decay=self.atmosphere_decay _bLa.Glare=self.atmosphere_glare _bLa.Haze=self.atmosphere_haze
  else local _bLb=_bKs:FindFirstChild("SHIZUKUSCRIPTS_Atmosphere")
    if _bLb then _bLb:Destroy()
    end
    if self._orig.Atmosphere and not _bKs:FindFirstChildOfClass("Atmosphere")then self._orig.Atmosphere:Clone().Parent=_bKs
    end
  end
end function _bKv:apply_atmosphere()
  if not self.atmosphere_enabled then return
  end
  local _bLc=_bKs:FindFirstChildOfClass("Atmosphere")
  if _bLc then _bLc.Density=self.atmosphere_density _bLc.Offset=self.atmosphere_offset _bLc.Color=self.atmosphere_color _bLc.Decay=self.atmosphere_decay _bLc.Glare=self.atmosphere_glare _bLc.Haze=self.atmosphere_haze
  end
end function _bKv:set_stars(_bLd)_bKw()self.stars_enabled=_bLd and true or false
  local _bLe=_bKs:FindFirstChildOfClass("Sky")
  if not _bLe then return
  end
  if self.stars_enabled then _bLe.StarCount=3000
  else _bLe.StarCount=self._orig.StarCount or 3000
  end
end function _bKv:set_moon_size(_bLf)self.moon_size=_bLf
  local _bLg=_bKs:FindFirstChildOfClass("Sky")
  if _bLg then _bLg.MoonAngularSize=_bLf*11
  end
end function _bKv:set_sun_size(_bLh)self.sun_size=_bLh
  local _bLi=_bKs:FindFirstChildOfClass("Sky")
  if _bLi then _bLi.SunAngularSize=_bLh*21
  end
end function _bKv:set_ambient_particles(_bLj)self.ambient_particles=_bLj and true or false
  for _bLk,_bLl in ipairs(self._particle_parts)do pcall(function()_bLl:Destroy()
    end)
  end self._particle_parts={}
  if not self.ambient_particles then if self._conn then self._conn:Disconnect();self._conn=nil
    end
    return
  end
  local _bLm=workspace.CurrentCamera
  if not _bLm then return
  end
  local _bLn=Instance.new("Part")_bLn.Name="SHIZUKUSCRIPTS_WorldDust"_bLn.Anchored=true _bLn.CanCollide=false _bLn.CanQuery=false _bLn.CanTouch=false _bLn.Transparency=1 _bLn.Size=Vector3.new(1,1,1)_bLn.Parent=_bLm
  local _bLo=Instance.new("Attachment")_bLo.Parent=_bLn
  local _bLp=Instance.new("ParticleEmitter")_bLp.Name="Dust"_bLp.Texture="rbxassetid://241625105"_bLp.Rate=12 _bLp.Lifetime=NumberRange.new(2,4)_bLp.Speed=NumberRange.new(0.2,0.8)_bLp.SpreadAngle=Vector2.new(180,180)_bLp.Rotation=NumberRange.new(0,360)_bLp.RotSpeed=NumberRange.new(-30,30)_bLp.Size=NumberSequence.new({NumberSequenceKeypoint.new(0,0.15),NumberSequenceKeypoint.new(0.5,0.35),NumberSequenceKeypoint.new(1,0.1),})_bLp.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0.7),NumberSequenceKeypoint.new(0.5,0.4),NumberSequenceKeypoint.new(1,1),})_bLp.Color=ColorSequence.new(Color3.fromRGB(200,220,255))_bLp.LightEmission=0.3 _bLp.LockedToPart=false _bLp.Parent=_bLo table.insert(self._particle_parts,_bLn)self._conn=_bKu.RenderStepped:Connect(function()
    if not self.ambient_particles then return
    end
    local _bLq=workspace.CurrentCamera
    if _bLq and _bLn and _bLn.Parent then _bLn.CFrame=_bLq.CFrame*CFrame.new(0,0,-8)
    end
  end)
end getgenv().SHIZUKUSCRIPTS_WORLDFX=_bKv _G.shizukuscripts_worldfx=_bKv function ndlc_wfx_build_menu(_bLr)
  local _bLs=_bLr:Section("world fx","right")_bLs:Toggle({title="fullbright",default=false,risky=false,callback=function(_bLt)_bKv:set_fullbright(_bLt)
  end,})_bLs:Toggle({title="no shadows",default=false,risky=false,callback=function(_bLu)_bKv:set_no_shadows(_bLu)
  end,})_bLs:Toggle({title="fog",default=false,risky=false,callback=function(_bLv)_bKv:set_fog(_bLv)
  end,}):Colorpicker({title="fog color",default=Color3.fromRGB(180,200,255),transparency=1,callback=function(_bLw)_bKv.fog_color=_bLw _bKv:apply_fog_values()
  end,})_bLs:Slider({title="fog start",suffix="",min=0,max=200,float=1,default=0,callback=function(_bLx)_bKv.fog_start=_bLx _bKv:apply_fog_values()
  end,})_bLs:Slider({title="fog end",suffix="",min=50,max=2000,float=10,default=500,callback=function(_bLy)_bKv.fog_end=_bLy _bKv:apply_fog_values()
  end,})_bLs:Toggle({title="bloom",default=false,risky=false,callback=function(_bLz)_bKv:set_bloom(_bLz)
  end,})_bLs:Slider({title="bloom intensity",suffix="",min=0,max=3,float=0.05,default=0.8,callback=function(_bLA)_bKv.bloom_intensity=_bLA _bKv:apply_bloom()
  end,})_bLs:Slider({title="bloom size",suffix="",min=1,max=56,float=1,default=24,callback=function(_bLB)_bKv.bloom_size=_bLB _bKv:apply_bloom()
  end,})_bLs:Toggle({title="color correction",default=false,risky=false,callback=function(_bLC)_bKv:set_cc(_bLC)
  end,}):Colorpicker({title="tint",default=Color3.fromRGB(255,255,255),transparency=1,callback=function(_bLD)_bKv.cc_tint=_bLD _bKv:apply_cc()
  end,})_bLs:Slider({title="saturation",suffix="",min=-1,max=1,float=0.05,default=0.2,callback=function(_bLE)_bKv.cc_saturation=_bLE _bKv:apply_cc()
  end,})_bLs:Slider({title="contrast",suffix="",min=-1,max=1,float=0.05,default=0.1,callback=function(_bLF)_bKv.cc_contrast=_bLF _bKv:apply_cc()
  end,})_bLs:Slider({title="cc brightness",suffix="",min=-1,max=1,float=0.05,default=0.05,callback=function(_bLG)_bKv.cc_brightness=_bLG _bKv:apply_cc()
  end,})_bLs:Toggle({title="depth of field",default=false,risky=false,callback=function(_bLH)_bKv:set_dof(_bLH)
  end,})_bLs:Slider({title="dof far",suffix="",min=0,max=100,float=1,default=100,callback=function(_bLI)_bKv.dof_far=_bLI _bKv:apply_dof()
  end,})_bLs:Slider({title="dof focus",suffix="",min=1,max=200,float=1,default=20,callback=function(_bLJ)_bKv.dof_focus=_bLJ _bKv:apply_dof()
  end,})_bLs:Toggle({title="sun rays",default=false,risky=false,callback=function(_bLK)_bKv:set_sunrays(_bLK)
  end,})_bLs:Slider({title="rays intensity",suffix="",min=0,max=1,float=0.02,default=0.15,callback=function(_bLL)_bKv.sunrays_intensity=_bLL _bKv:apply_sunrays()
  end,})_bLs:Slider({title="rays spread",suffix="",min=0,max=1,float=0.02,default=0.8,callback=function(_bLM)_bKv.sunrays_spread=_bLM _bKv:apply_sunrays()
  end,})_bLs:Toggle({title="atmosphere",default=false,risky=false,callback=function(_bLN)_bKv:set_atmosphere(_bLN)
  end,}):Colorpicker({title="atmo color",default=Color3.fromRGB(150,180,255),transparency=1,callback=function(_bLO)_bKv.atmosphere_color=_bLO _bKv:apply_atmosphere()
  end,})_bLs:Slider({title="atmo density",suffix="",min=0,max=1,float=0.02,default=0.3,callback=function(_bLP)_bKv.atmosphere_density=_bLP _bKv:apply_atmosphere()
  end,})_bLs:Slider({title="atmo haze",suffix="",min=0,max=10,float=0.1,default=1.2,callback=function(_bLQ)_bKv.atmosphere_haze=_bLQ _bKv:apply_atmosphere()
  end,})_bLs:Slider({title="atmo glare",suffix="",min=0,max=1,float=0.02,default=0.3,callback=function(_bLR)_bKv.atmosphere_glare=_bLR _bKv:apply_atmosphere()
  end,})_bLs:Toggle({title="extra stars",default=false,risky=false,callback=function(_bLS)_bKv:set_stars(_bLS)
  end,})_bLs:Slider({title="moon size",suffix="x",min=0.2,max=5,float=0.1,default=1,callback=function(_bLT)_bKv:set_moon_size(_bLT)
  end,})_bLs:Slider({title="sun size",suffix="x",min=0.2,max=5,float=0.1,default=1,callback=function(_bLU)_bKv:set_sun_size(_bLU)
  end,})_bLs:Toggle({title="world dust particles",default=false,risky=false,callback=function(_bLV)_bKv:set_ambient_particles(_bLV)
  end,})print("[\226\156\147] shizukuscripts World FX menu \226\134\146 Visuals / world fx")
end pcall(function()
  local _bLW=rawget(_G,"players_tab")or(type(players_tab)~="nil"and players_tab)
  if not _bLW or type(_bLW.Section)~="function"then task.delay(1.5,function()_bLW=rawget(_G,"players_tab")or(type(players_tab)~="nil"and players_tab)
      if not _bLW or type(_bLW.Section)~="function"then warn("[shizukuscripts] World FX menu: visuals tab not found")
        return
      end ndlc_wfx_build_menu(_bLW)
    end)
    return
  end ndlc_wfx_build_menu(_bLW)
end)print("[\226\156\147] shizukuscripts Extended World Visuals loaded")
local function _bLX()
  local _bLY=game:GetService("RunService")
  local _bLZ=game:GetService("TweenService")
  local function _bMa()
    local _bMb={}pcall(function()
      for _bMc,_bMd in ipairs(game:GetService("CoreGui"):GetChildren())do table.insert(_bMb,_bMd)
      end
    end)pcall(function()
      if type(gethui)=="function"then for _bMe,_bMf in ipairs(gethui():GetChildren())do table.insert(_bMb,_bMf)
        end
      end
    end)
    for _bMg,_bMh in ipairs(_bMb)do for _bMi,_bMj in ipairs(_bMh:GetDescendants())do if _bMj:IsA("Frame")and(_bMj.Name=="BackgroundFrame"or _bMj.Name=="MainFrame"or _bMj.Name=="2")then if _bMj.AbsoluteSize.X>=200 and _bMj.AbsoluteSize.Y>=200 then return _bMj
          end
        end
      end
    end
    for _bMk,_bMl in ipairs(_bMb)do local _bMm=_bMl:FindFirstChild("BackgroundFrame",true)or _bMl:FindFirstChild("MainFrame",true)
      if _bMm then return _bMm
      end
    end
    return nil
  end task.spawn(function()
    local _bMn=nil
    for _bMo=1,40 do _bMn=_bMa()
      if _bMn then break
      end task.wait(0.25)
    end
    if not _bMn then warn("[shizukuscripts] menu stars: host frame not found")
      return
    end
    if _bMn:FindFirstChild("SHIZUKUSCRIPTS_StarLayer")then return
    end
    local _bMp=Instance.new("Frame")_bMp.Name="SHIZUKUSCRIPTS_StarLayer"_bMp.BackgroundTransparency=1 _bMp.BorderSizePixel=0 _bMp.ClipsDescendants=true _bMp.Size=UDim2.fromScale(1,1)_bMp.Position=UDim2.fromScale(0,0)_bMp.ZIndex=1 _bMp.Parent=_bMn
    local _bMq=Instance.new("Frame")_bMq.Name="StarDim"_bMq.BackgroundColor3=Color3.fromRGB(0,0,0)_bMq.BackgroundTransparency=0.92 _bMq.BorderSizePixel=0 _bMq.Size=UDim2.fromScale(1,1)_bMq.ZIndex=1 _bMq.Parent=_bMp
    local _bMr={}
    local _bMs=28
    local function _bMt()
      local _bMu=Instance.new("Frame")_bMu.Name="Star"_bMu.BorderSizePixel=0 _bMu.AnchorPoint=Vector2.new(0.5,0.5)
      local _bMv=math.random(2,5)_bMu.Size=UDim2.fromOffset(_bMv,_bMv)_bMu.BackgroundColor3=Color3.fromRGB(math.random(200,255),math.random(210,255),math.random(230,255))_bMu.BackgroundTransparency=math.random(10,40)/100 _bMu.ZIndex=2
      local _bMw=Instance.new("UICorner")_bMw.CornerRadius=UDim.new(1,0)_bMw.Parent=_bMu
      local _bMx=Instance.new("UIStroke")_bMx.Color=Color3.fromRGB(180,210,255)_bMx.Thickness=1 _bMx.Transparency=0.55 _bMx.Parent=_bMu _bMu.Parent=_bMp
      local _bMy=math.max(_bMn.AbsoluteSize.X,300)
      local _bMz=math.max(_bMn.AbsoluteSize.Y,300)
      local _bMA=math.random(0,math.floor(_bMy))_bMu.Position=UDim2.fromOffset(_bMA,-math.random(4,40))
      local _bMB=math.random(18,40)/10
      local _bMC=math.random(-30,30)
      local _bMD=_bMz+20
      local _bME=_bMA+_bMC
      local _bMF=_bLZ:Create(_bMu,TweenInfo.new(_bMB,Enum.EasingStyle.Linear),{Position=UDim2.fromOffset(_bME,_bMD),BackgroundTransparency=1,})_bMF:Play()_bMF.Completed:Connect(function()
        if _bMu then _bMu:Destroy()
        end
      end)
      if math.random()<0.12 then local _bMG=Instance.new("Frame")_bMG.Name="Streak"_bMG.BorderSizePixel=0 _bMG.AnchorPoint=Vector2.new(0.5,0)_bMG.BackgroundColor3=Color3.fromRGB(200,230,255)_bMG.BackgroundTransparency=0.35 _bMG.Size=UDim2.fromOffset(2,math.random(14,28))_bMG.Rotation=15+math.random()*25 _bMG.ZIndex=2 _bMG.Position=_bMu.Position _bMG.Parent=_bMp
        local _bMH=Instance.new("UICorner")_bMH.CornerRadius=UDim.new(1,0)_bMH.Parent=_bMG
        local _bMI=_bLZ:Create(_bMG,TweenInfo.new(_bMB*0.55,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Position=UDim2.fromOffset(_bME,_bMD*0.6),BackgroundTransparency=1,Size=UDim2.fromOffset(1,6),})_bMI:Play()_bMI.Completed:Connect(function()
          if _bMG then _bMG:Destroy()
          end
        end)
      end
    end
    for _bMJ=1,_bMs do task.delay(_bMJ*0.05,_bMt)
    end task.spawn(function()
      while _bMp and _bMp.Parent do _bMt()task.wait(math.random(12,35)/100)
      end
    end)print("[\226\156\147] shizukuscripts menu falling stars")
  end)
end pcall(_bLX)task.delay(2,function()pcall(_bLX)
end)task.delay(4,function()pcall(_bLX)
end)
