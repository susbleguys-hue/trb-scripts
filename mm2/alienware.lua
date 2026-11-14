local players, userInputService, teleportService, httpService, tweenService, runService,
  virtualUser, replicatedStorage, starterGui, v40, localPlayer, getMouse, currentCamera, v43,
  v44, v45, v48, v49, playerSpeed, playerJump, flySpeed, playerSpinSpeed, playerFOV,
  maxZoomDist, fpsCap, v50, aimAssistPrediction, orbitSpeed, orbitDistance, v56, alienware,
  customCursorOverlay, f21, connect3, f27, instance3, alienwareColorCorrection, instance4,
  instance5, instance6, instance7, instance8, v83, instance12, instance13, instance16, v89, v90,
  v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107,
  v108, v122, instance42, localPlayer2, v167, v172

do
  players = game:GetService("Players")
  userInputService = game:GetService("UserInputService")
  teleportService = game:GetService("TeleportService")
  httpService = game:GetService("HttpService")
  tweenService = game:GetService("TweenService")
  runService = game:GetService("RunService")
  virtualUser = game:GetService("VirtualUser")
  replicatedStorage = game:GetService("ReplicatedStorage")
  starterGui = game:GetService("StarterGui")

  local v1 = {
    "Zq;2MBl[\"o", "Znns,", "Ze%Lui$0H739Qjm&qGZU%E&i?>K`[L<GSp#-oR!GKEOX)9F+k", "Z[g>>",
    "Z0U\"Rl3#jn;", "Z,>f.DF^CEa?Pcn)5a^Tu", "Zi8Ci\"", "Z?Etk*SCjit", "Z;h3q,!ML3YB(4",
    "Zi6CdenD6r+*DYoAU!", "ZBL?@A*ZMZr`*P\"", "ZWftN7", "Zd%i\"lEC,*LmI", "ZXkcXuc&1L`",
    "Zr7JE", "Zdr-6hUf3u-47'O>fM<`V", "Z%;i1", "Zs?UfU)ZsD`", "Zrin5F", "Z;rb9TDP3R'",
    "Z?+E_\\QH2@\"MMXT%()E:P", "Z>E@Y!", "Zj`9]/", "ZdY,JBTVk9Q3?+", "Z:4KuX",
    "ZnB54Ts,XY:$11e1nIl", "Z_lB_#Epb;c", "ZCu5O", "Z>%&Z)J^XG.51V)4*.i", "Zo.=:c/gb",
    "Zbf9?Y4o<nJdhk", "ZlA(MTP\\WQ@Wt", "Z#k.DZ*ZC-N`1\",r`dZVUQk$'", "Z_*\">",
    "ZnGk2*.4R%CH4&(<OW", "Z5\\F+&B;HQrnYMbT", "Z>4H4j.8`0+*.\\7_*7e5D", "ZOms$Y*`$[N*R",
    "Z@*mh", "Z0sHtqGH8.8gM=N<`<U", "Z=n32u", "Z-ShA*", "ZZu9L", "ZJ3@4Ik\\acK",
    "Z[L*K$r#)4-'.m9CC$tBVd0jUb`T'@`9H=TH`fKE?\",", "ZH!Lh*fg$cVc4A", "ZnDlW[",
    "Z5/o/PoLk2[IuFs", "Z2>iY", "ZgpP5OIc:", "ZOjse]D4DRA?W)*X", "Zk51F*", "Z;k]'", "Z=pVoX",
    "Zff19;;V?H\"((WE#s.i.", "Z3L_iJlG7o8l$;XF<aXXTE6\"(+p,W",
    "ZX2$NqU'l29IrN2*9Yto^:t_(s]he!li?a5nh;", "ZStFQ86I5,(SnW>oUV", "Z]5Pig5Z9Bgcpo[:EO",
    "ZILuLN", "Z:O=a*UmA#`e[_SR3t0kR>X", "ZoIMK/Dg@", "ZYSba_g<L?#", "Z)6*5K!f`", "Z:boK*%Pa@J",
    "Z;?4^6FFBbV", "ZMQ2:lQFE\"", "ZJIpfe", "Z26M[lA,5E", "Z8H%h", "Zbu$N+.hXQ5b=>)lUc[>e",
    "Z=@1YL<*e$>/gFt?5K=%NeBmd%8dck.Op`FA", "Zcu,EC97@+", "ZVZRZdEK$M5$N?n$@p?#q'r6O8fe%U",
    "ZF$fr>h%cMtE'A=ikN8Ap>X", "ZX&d!c*[NCoB)Y67#o^", "ZI/`l7)'K*bC9dQ", "ZCagj", "ZK:MH*",
    "Z*Q^=S_:?\":I-^", "Z'U<<l9\\H5^IfVMBYA", "Z>aT7Gd7Xle`*k8P", "ZdZn1J._Cj'U?0HF01",
    "Z&p2X&YbhhAGmRE9Au?a", "ZW_+sH`2mp^", "ZK;jfMPpJg,ej", "Zrf6PN", "ZNFkbd&$rRYnO",
    "ZEg1VV-*\\/5KDM_cPV<", "Z+'tt", "Z5]GL:", "ZCrR2Y]rGK&97l4XeB#?jpEmf(Sc\"*q5Nmtjk\\rG\"",
    "Z>%nQ^Au[fhnG/_^", "Z=Jq\"i", "Zm_)En$-J50/I%", "ZpTh.scZ8Jg5'J", "Z;qY;,", "Z01",
    "Z,4t!M", "Z\"emiVY(Q]cD9K", "Z#k/uG:'PAqUlm6HU.E", "Z'8iE7pbjk6", "Z&Kft1", "ZF?cF",
    "Z09ltDo,5L", "ZqLS,$t<UfBorsH", "ZK9`_Q", "Z`\\4P;!\"nVdmQl", "ZXqZ8h.;Y)#",
    "Z0kK@-dF-bSOnXN>`<s", "Zk.)6.F!", "Z%.uH`$&t*n", "Z(AD2:dF/", "Z'd4)(%=[BgPA",
    "Z.j85Ut8(;", "Z#ZVM2fc1NY", "Z6C;4pOH$+:,UV-caRE]", "ZM%85b>j", "ZHj:FK", "ZCVp\\V.B?;h",
    "Z9QIW0HIQO>", "ZBp:YX/<HB*!,#hXNdoZB<YW-=!]RN)2r@?eK)h@Vn^Vl:", "ZF=BS", "Z:l+K6o1J\\g",
    "Z>\\\"`bne>h", "Z_;k8SYMLk!", "ZJU(WaQkG\"aBJ`8(2D", "ZN$P?T00KL[\"UffQ!8c",
    "Zt^J,7nY;QEn+JKIne(ROn(1Z_", "Z1lS,", "ZQ6Pi8", "Z5,i[ogf;,iGJFT(", "ZcQsjl",
    "Z-JiZMX^P;7^Ak", "ZH_\"L", "ZP^0/]`G8R?4;", "Z)65/N\".]?+", "ZA1V,0:V=@k",
    "ZHUcS03>p:l):(7", "Z<o+Qb", "Z3%Ns1", "ZA67^Q", "ZB[eE-\"8l@D()", "ZkO?o",
    "ZtN;B^jW/GEB*Wi9#..gmO\\OI)$af", "Z;]$4&UM_K", "Z*LXtC,I-;`", "Zt^;1[QrdLK`[3", "Z*i5d&",
    "ZnDq`/", "Z23,!'", "ZD9/!i`_o^;,!['gQ;I", "ZF<Wfb*H6`", "ZAIH$@Q**=jCm<\"Ale", "Z'EX'm&_",
    "ZcK>MQ6>8C", "ZV>-<WO5>,Qkp$M!;1", "Z5V34_U?g&m*e<^S2e", "Z!J\"2%", "Z#M7-s",
    "Z.B(1h>4OY(#A^#a", "ZD<(*8UdVm\\tIG_?Vpb:6OO", "Z:q[DD", "ZdW2CF", "ZN_t!Gs-]<$lkn\\-Hk",
    "Z?>f/i*MM(", "Z212V+$Sd>]^bB-", "Z^oJqAX]$cRLhd_r", "Z8hiI",
    "ZNUe,gXcAjft0o(f3'N?J##G0AKa1", "ZHZ?'H", "Z<`t\\=#4m]M;(\"", "ZLh/%oMb.oO,CjcF", "Z1j*,",
    "ZkSk(r>cs", "ZlO\\%>Qb>\"Jo'=B;@D_N]", "Z;rfJ-9[XMQ`Ad:", "Z;tP9Cp?[S", "ZN6[C[Lq,=>",
    "ZA3o-j%7ApF3G-mV6%).RbfE", "Zg;,n(BSQP4g#KK", "Z&c2/", "ZfPTeW1hD", "Zkk(L+Nce",
    "ZPA?7>G9(", "ZE9*hT", "Z_&QUT;YaW", "ZQ/q[Nri)\\", "ZEf\"T/pt!m^m\"S1",
    "ZUnEs['1!K=l^t9NKLq", "Z%>gCsN;:lJFu", "Z#I`!`dInGhtl@tO", "Z2A0G", "Z[?ioE/\\.7#",
    "Z2/\"0Ud7IYD#\"IX3gIq", "ZE*Dj/", "Z>NIa*#>h#,dKlDb", "ZUI9<e", "ZiX<e", "Z2U\"Pl",
    "ZsuR(rJip'narM", "Z$IaF", "ZRjOe", "ZH+iqN/]:\\FW&pBW<>l",
    "Z:h/Y$]29Y>m\\pY]lEPl_nKFe?O+5", "ZB2>(8", "Zd,<F_$?9k", "Z_oYb:", "Z>9Lr'SdU",
    "ZZ^r8^mC(9S`;", "ZopJ1", "Z^oT?Be6Q@4\"M5", "Zn`W^3dtbp", "Z!=ARtiWO\"F", "Z*U8[qfaNa9cZ",
    "ZUQs=?I`i[C0K1N*61", "Z`3-O(2$`\\Ai/i;7>SB", "ZW93R_3sO", "Z>%*WFQX2(", "Z_g%6^*?ET`+K",
    "ZUX\"<n4EMB#", "ZmiAB3", "Zn9OO-db", "Zn3IgF:EWV+>H,US", "Z/YBnDR3&`K,GI", "ZjZ(6c",
    "ZFbqP", "ZQ>lX?", "Z3a9dHX`hZJRU", "Z9f9c", "ZrZ3%", "Zna<\\1NKlAuYk",
    "Zq-pTbTG#kFA:sR=/p9\"g+RL6,<.", "ZsuE_`!k", "Z'::UB", "ZQM0ng", "Z:SG+B2;*LCBSH", "ZGljRa",
    "Z@A%)oV`noX", "Z0RCGAOQl]:nO", "ZQ\\?Gb@N:!", "ZEJAJ", "Z=r1\"m", "ZY^OEf;^V",
    "Z[nlHAjf=3$#PP<bkU", "ZL?l=2R2<", "ZB8%.)%6`'K)pjbCFbK+eJ17hM$!e", "ZI_Yd]>H+2]",
    "ZPR:do2!ut;$p(*eHk", "Z<'j0B@Ne2_?V", "Z(3c:a'u", "Z5*=bG#r8:?`%Z!JXm.", "ZQXTa&oJn)",
    "ZjU33", "Z@h/$DE]J2mgV.nQ?V", "Zr973P_fVQM5PKl[*5fU=FmHtaWrM",
    "Z0ST2!31WOF.bb4^[udqk!TM\\$h2Y<5,ZUD", "ZdK\"HmdisP`)H]", "Z3#k;)", "Zf40_QmRUND,ji-q",
    "Z(O%_jU(^'[c)uV", "Z9IMQk", "Zhk4`OX/9$/>X", "ZLEKZ", "Z1A1QHLhep\\e2qcKX_", "Z$^srt",
    "ZGcB7'ZMl)V!9TiI", "Z*U8@:*uV`0)iU)6_(-7Up[CUD'4Ag`Y6)`'B3t:&bc`@%5Kl^Q", "Ze)'!9a0mC,(2W",
    "Z0=W[@YG\\Od3#ZXX:Z", "ZY+Yp^ouKhm", "ZsNLGN=>F28FR", "ZH_&H", "Z;D/,O,;5sGH#j",
    "ZK*19<!HD<&1'brBr`P1t", "ZQi$!L99cdYqTu<M", "Z>R-Gk*Z,GZ*Cj", "Zf\\3mDCYU_", "Z4nHCD",
    "ZE_Ns", "ZsOJ]\"", "Z%gR2", "Z=i&fb'e1+?Kl$O%S#28^XO", "ZlOtj9borIf4;", "ZTYrjnp#]*I50t",
    "Z?0Bh[.8up.", "Zl3hc^", "Z/t9:SW\\A", "Z>TlE8jWI^;cb@0K9)", "Z,%DRsc+7YYZ$6",
    "Z]fcqDJ,>Eu", "ZS3_5<50'", "ZC5M6", "Zn9&7qn_", "ZH+UT&", "Z]6W_", "Z$!M^%=p.O?0thf:UO290",
    "Zt=qpg4g:1An93&", "Z>R>+Rn<+", "ZqW-n]qh]t", "ZTL.b", "Zk?N?^=6+", "ZO3)ABQl_232$A/1JQ",
    "Z1`fF)>qW,q$.", "ZFMX+X08p", "ZQ9ZCO+YjN", "Z2:QKEn(S`H::,$hJ\"L", "Z/\"\\e?9#",
    "Z0nWB4_6t#LJJa;)ib", "ZgUO;X!hUL@/1t/PPGLDg73>_", "Z<P)o%kT_()G*fl(jQ:To", "Z7g:>", "Z\",",
    "ZZObX9", "ZG7&q", "ZVu=g", "Z;*0p", "ZA6s_uPN+2", "ZMc==N'nDh[", "ZpMDD%^GUn", "Z#R0m",
    "ZZc)/rU`$HU", "Z^ipQ^BZ", "Z)RRR7SjgO$\"Q", "ZaF3V%Hb6", "Z#X`X4.HtXS:MBVh:WK",
    "Z1J,P8p^.1D[VJ>K", "ZTA*dd:Qm3ec8,[*_P(`oC\"W2%(0P", "Z9O2*Z-1BrfZ1", "Z=rZf>&2b*oRU",
    "Z]PK'M?cg8FtV", "ZniLl38;DnTUd'g\\", "ZS`sF(rk", "Z?Xc<T", "Zo#tBY", "Zg>pGd",
    "Zt0VM`#ll9^iCGo]", "Z9HpCF5>!`L", "Z?_WBs#'X%c", "Z;*\"#I)9[", "ZDR_kq)pp(`qI",
    "Za8fha&FBjVhr7&V5(=s'", "Z%:(O", "ZOeTIE.RMV6O.aUTgo_", "Zgok)o2rh@sJFnQbilM", "ZbjOB@",
    "Ztc_nA=3&4XeoucssV", "Za!osBV\\kEZ4:m", "Z%Pu=TSnh'b@9_O^(e\\\\o", "Z(O%^",
    "Zn[i3eB$JmjGO!X#Q?", "ZTlnh", "Z(,E)", "ZFL-Nm", "Z5B5eO", "ZisH3,cG`", "Z?(8PD",
    "ZnAHGq<V_-VXV%;_kpSZUie&UcRpP", "ZF!Qq\"C\\<k", "Z%VD'YUn9<bN8t)9fI", "Z6%9.P`?@-",
    "Z#$O#mI?\"K9I*fu\\Et/S1%V5,", "ZIXGJM!-T", "ZOCb[M1)jp+m'7l", "ZSr+Mo9'/s", "ZgZrV`pCXH",
    "Z7[mE;", "Zt+/e/n((p3*Zl;(dILJ", "Z?gf)YX(cD_S$`oT", "Zjf>sVlDpVpd$hV=/lZ4=)*",
    "Z>\\T]P*Z0G3B_S", "Z<Q-D", "Z]B80KIMs/I5e:&HRTmc9_]9N", "ZK&-\\9Meb&L", "Z*ESV$Mc`<kidakc",
    "Z#s6c)dj/f,t^=AUJ\"L", "Z?^Us", "ZD)O1#>-dA`tW/HTc&DLRf'AueCtX[[JFe(J<V/W,", "Zn(1I_*Z!",
    "Z&g@SfK5S?@2[EJ", "ZQ?'n", "Z5,=FZXm#`?`[L;Y", "ZA/bQ", "ZGt2Vsn,6]ZJ6ds>>ut",
    "ZjC^(G.3)M&<mo'8A_LTrp:D^F]=l<ePN\"[+cGSOg!`\\", "ZCo\\@OXeR<", "Z_5$trXK<k-\"e5jZ$X-^&",
    "Zt<<*6aEt", "ZeV*l", "ZG77mG?l6m", "Z+2ih", "ZSDrMsF@>&S2Xo*3e-Z", "Z>neK`", "Z((!Y0",
    "Z<k/J2dS'3NIA+4idt]thooMkcpp,5<%+F0", "Z-B/V/F)gX5,e", "Z!<J!sW,MFQr5U6", "Z\"/5].",
    "Z-aAUJha]\\$", "Z>rj-SD_P", "Zd?4Gp", "Z61\"jLbe(1:%mD`", "Z^pf*N*=HlHks", "ZoY/N'",
    "ZB#f,Wt(a=Td@Z,i01", "Z>rr.o`Q^", "Zog", "ZYN;@1(\"\\V?", "Z5[3.+JU5eKX2aK[B#j",
    "Z+\"4Er8Al,Q`bb>!<aAD", "Z6E\\3)G3?VXbOo>_B8C", "ZW23UaZ4l6'#?", "Z>HJ5KODaR.*7+5EtZkMI",
    "ZTd:Vgt@eg@]ueK(rNkPX9(3[^$Noh-rfF", "ZRs2\"\\c*:;D", "Z-2D[Gab@", "ZUi&@", "ZUnpZ7-VnT@",
    "Z,@B!u#lEN'_iraJ7M(@h", "Z]nKCl%?466/K#/>41@4l", "Za:C4l53'", "ZfmirL!>9W", "Z\"sqNN",
    "ZAPg8i=2LNPbImARMT6!", "ZF\"\"@o/;", "Zr5VOgZT'rlNb^G-[a8L8FFH.", "Zd5?$", "Z$RZPlqbi'",
    "ZG5%k", "ZN9?\"WR8Hn1sp!9", "Z'i;[75AP^", "Zl#_*ZAPA#l45XE6V>&<1+jT;+>bO73", "ZBSsg<",
    "Z:;tm8BcoLMO`6kW>Hu", "Z*T>c+=WBNMle", "ZRu$3.", "Z8]s$.;as'$n_",
    "Zrac\\k/Lp$e<>b`=I2Ga!Q4N[c'OC", "Zc)a6W;Kf", "ZcI20Ne)i", "Z57a0^f3C", "Zr4b5", "Zbq:2",
    "Zd0E$_Gt$VL>\\)(T.5t", "Z>MIheX2YMQ#@WYr5#", "ZSn\"QMW3PS-%=\\q", "ZSH", "Z<:c:;'4S>;9;",
    "ZX_`b72^\\=U:!d", "Zf-MSLjlC", "ZYYqoV", "Zo)", "Z,ZSQF>4R34", "Z*(WN", "Z2;,tH^.F;",
    "ZnGHY-Un!.i58kiQi,", "ZmBKMH`Tf/@", "Zi=tJ^`F7FNp&", "ZU5WT[s&Lm:J,", "ZVAcfcHc^h",
    "ZmH5E*k?:fK!k", "ZnV9mD", "Z9/o8FP?0", "Z`1Q&5JsF^4n[,e7Qn", "ZZ*", "Z[Mben>ii_h*!",
    "Zk9s[uh=i", "ZS\\8I=", "Zh7XnK", "Zkr$'%,G", "ZSuMcF", "Z8eusc", "ZiDlk=P'WkW",
    "ZZ/OCck)u6", "Z4^a7f8S3RJTDk=F3r@F0", "ZBDc]Z^cD)Cpm6bZ*R", "Z68UAs!kFM[J,",
    "Z+I(#;fbNb2/?uUnD7\\0NCBRJmS!", "Z&k1oLWEY`lH%N9c", "Zo?\\5", "ZSY1DNU97", "ZYkkeG",
    "ZdXVn3$l%[", "Z%t`MiOF3l]OL^", "ZtHi908bh>c", "Z4-$t", "Zl4@[\"", "Z9=\"u1;Og8C",
    "Z!>%#SRKXbZ", "ZfeW,", "ZJ^Eu-2oiVlO9^X^", "Z/iI!", "Z/?N9+;V=$o6$FTa>6H9eJ;lY9F$b",
    "Z$KQO%", "ZG]@#XtL&ZN9/h:M\"]?'D", "Z_V3uhtoVD", "ZP89h", "ZO:&A9Zg&O", "ZNl!/@V\",.N",
    "Zai:V%<J)9(c6", "Z]*$7h?:-rtZ4P2-jt", "Z)-=qm.q<j(", "ZF@d?ff.<o",
    "Z!OtT,1)?1lX6r0iP+d6\"FXK", "ZW47A", "ZqQ.(;", "Z_HK**lHT^QRiAu,=A'V>", "Z+]uA\"",
    "Z4/-,haoHZ", "ZG2)uGTPk(A_-Sue", "ZhPr0pP]g'\\;O!&7D:5", "Zs*WGd)0jU,+3lqMed`kn",
    "Z2rD\"hU6sXUQZQ;\\", "Zm^n>=ZIjq)1bjFVK(]h^$e", "ZQh*?", "Z)`efTb7$qm", "Z>@ca", "Z6OT3",
    "ZtqUR4", "Z!*HV8I/!0", "Z<6,UrqbgAoC+%", "Z8oOfA)8Y0o", "Z<Ggk", "ZtT@MT`N'G'>X",
    "Z>4\\i8`?u,J`Bd3=B'Z=+", "Zt<8X@#P=A-WW", "ZIC_Q", "Zoc?\\3", "Z;!ES", "Z<k>Uu6QPo\"0dRT",
    "Z;?", "Z0Rc,[57(&[+gp", "Z:LlbO`?N;[dIEprBt]C&BODTLBLK", "ZBjQkN3)E,", "Z^.-bA",
    "ZASiI-nfFq,iR\\P3e[:/R7u[\"IN^5]&]!Q", "Z*4j>3_a[/", "ZML'j2", "Z2)?d3nW",
    "Z=2hjI(NVCl``(", "ZgqTjc", "ZKKffnM@[l", "ZfVY\\5", "Z#mt#FHBAKq", "Z.?iNOFB6", "Z$JV41'R",
    "Z$%(5@'6Y!=`T45$$^L?/<,5!gN5H16n_", "Zi/tsTgU`L>BM0GoAk", "Z2dp$RBnCBr'-q<)$Ch+g",
    "Z@$/':", "Zg8l%<Fj*S5T8+l", "Z`TMko`hmqh,6/4", "ZA/.NB[<BM", "Z09&K1\"=+",
    "Z0KR`3:gfe[Q0@Za5?8", "ZQ@YfKGJiP.gIg'\"", "Z7YD<", "ZZn*hAlM[ockf%kV@b", "ZlG-0\\,u/=Y",
    "ZHA[SK#,Q", "Z<TkLDrjk)\">I", "Z^D/O0NAP/f]2", "Z<Z^(6R!Bd2pHh", "Z/1$X",
    "ZBA?YXJ7-6*BrS<EUR", "ZY0]rABEU", "Z]d9Y+JF6S=FY4!/2-P$-J?8J", "Z:P;3q:J\"8MX*(met7b",
    "ZfT%0+7>(Qu`:H:Z;\\OH`", "Z5nmtu*+k(rQAs#gX2]", "Z+I7Tq", "ZU*nP[]+iX",
    "Z(1Z_#.ek-]@7\\Ai", "Z?2YtkZ'1a8", "Z+D9\\VtN$WC1Vc5<", "Z1ct:9/>*B]K<1Eoo)",
    "Z=%tK\\^\\k0Wq8lYd", "Z:9nA4", "Z[%TVNle", "ZXW", "ZOms$Y*.a:-Qk$pm*V", "Z]K*go",
    "Z!LF6aVO1T", "ZTQb/J", "Z<3_[2D-jq9M9NF-!sLO`", "ZJ@DFJ0sV4#BL\"LrU6M", "ZUS70",
    "ZCF7#C(5'?R2\\GAr(#A3D", "ZX6]*S&GZ=", "Z[)FL0M7`2A", "Z.\"&($.N@r4Hpb[r$!R", "Z<1nBWqB-+",
    "ZP*ht:$tQuA", "ZV6YL9NPj", "ZAF7dHV@G2ofoBk@0q/", "Z7<8CsG>1", "Z'pIlMJ'LMg",
    "Z+!<fKHhs%3/N4N;_A,`?/P=T%a\\/[_", "ZS49if=;CpC", "ZjMFe3HZS0p5;", "ZS':LP", "Z+_hAD",
    "Zh/_=Ek(0T", "ZJYa`=.%(qO*0MZhib", "ZR80R-oe8ZfCoCB", "ZQSC&^_d1]KFq.t0(c0I;KF@G[Hk",
    "ZqGr/A)dcS", "ZVN7'<*V", "ZoV7]rs3,", "ZEB7hP", "ZIq/q*", "ZdI5jlnW",
    "ZS*:&\\H`t;/cp8oXMr?D2$hF7+U!", "Z!u(T`U[9te", "Z(M!Lb", "Z7_35R`4<c", "Z%Zf>qDe=U",
    "ZD9%Q!Pdn1I", "Z4o_(LmUVR$2GkO4,lMHY", "ZQsE9", "Z@Q00OK,!\"QS<Q", "Z2@5e^2V/CCPA",
    "Z1R=&3", "ZFgt+[", "ZAr53", "ZlW9*OU0;", "Z_Al9", "Zg3-M", "ZO.RDtQKtD6*?Ahq2e",
    "Z(,bpW4J`ajiLL<", "Zf$*nUPpTXY.S(<1S[N8.", "Z>e&s(@uil3nW", "ZinTp", "ZH\\C@FgG",
    "Z8TOG;>0XS#Rb*E", "Z>)7.m58-Bt0PE=KQ?",
    "Z+r)JI'07obdLkFI-2b!!KiN?k.!]VsVT(O[7\\bq8L?1nS5pm*B",
    "ZN@[XpFkK:Pi(V6VsN%*a:6)M3)tOPJ3I$u-SEN\\%7l", "Z]rVmK(pMDD34Lj@J0YR#", "Z&'kR`6b4G",
    "Z%u?=/qNq57)r`jKq$R(pSrOpfD*;7+>nLIL\"1m", "ZUd4]'T3X72Hk", "Zt^l:l.a'-/`[DYj",
    "Z%@?.>Wi5fp1LHSJ);@Qn?\"kj&[JIMb>*^:I>[o", "ZKMX\\01G.,=h;", "ZnQ5d", "Z=q*0%4SU+",
    "Z(<S1V0`Wu\\kU", "Z>R-Gk*Z,GZ*CfCcBJ`8(2D", "Z:4Q5YlV.9o0L]", "ZD-Z>uV7b", "ZM*nLc.&t",
    "ZI0<d\\pcO(-D>", "Zf[(,WTZgh", "ZO,KtIgTD,<*@VUiQn", "Z,V&^L'm3[Z", "Z#f&T.g)BQIn(T$,2G",
    "Z0gs0s>\"/[,N0[", "Zg;cJU`3g+E2:#B\\Jsp", "Z$nUmcqAdNcYM%tlWUc.PaA",
    "Z,!Z0Rj=oX\"n8ukoH(r^F", "ZTeqg8Q@)0O?u", "Z`*k,H*C:pL", "Z#1", "Z#+jf-U&q#-2RJHL",
    "Z84^X", "ZOYAe[*Zc;",
    "ZqcGj+UgOhNtf9o#%l!Raq\"'W8dMV#*_[97MF7<?lfpXM&EVHOB'@&hh(6)%>QYUK=6i7>8NjlsZcU\"-V3bs_=P&OdDN'opq<e#2Y\"jE2/Qtbg!m0<6;`nC",
    "Z>9*\"#o;", "Zqu']X", "ZgkKs<:te=c2:a", "Zi%cB", "Zd6AJGnYpDbd+S00#PN", "Zt^J,7BJLm",
    "ZJ/H7to3j*", "Z-e2JdOTCKt]LZ85rG`G6.f", "Z+(>#.", "ZAQ\\SE", "ZHt$S0__", "Z@Gmi,-Hfq\\Fu",
    "ZqUB9-#`6HF:m(", "ZAMT+", "ZMmS@", "ZEr6\"Z)_$s", "Z`E1cSCfjDZ_O]\\o.-o", "ZdYY",
    "ZBQ+\\hV,,:[PgLSlb?", "ZO+:4L4d.Ljr'?Ft`HDY\"", "ZP3sj", "Z<S>+",
    "Z%\"AK\".TuB''faTW_FY%_=2", "ZM+e_!^ed>p5)", "ZQ/LFMU9p13nnq3]>I", "Z<Q'[)V<44", "Z4`s5&",
    "ZL,T1+!Qj&!e8'60t6_J2GiT:T`sr?a", "Z:'Gd4#Z>6-t.\"%r.!M", "Z2$em$",
    "ZWL0SjkqYKHla\"oh)j#1<", "ZMH0^]", "ZilF%%*YX2fQ0Z>6", "Zj9kjL", "ZgA*&,2hb>bgkK,k`bl",
    "Z&n$SS&pNej", "Z[LcjD", "Z14WJl7mgngnPZb>", "Zbc/q/[BebTf86FY1GmP'o;", "Zae=`",
    "ZhlW$i]Uo", "ZilSd`t^p1N#F8b$:0", "ZU*;?$`[/R`dl+S1", "ZX6hkKOUXbq,m", "Zd.kC4b?",
    "ZTC\\kDd$mrO", "Z0W48(E#LqYOEnL<", "Zg&A3K", "ZoCX*.UhN:B9N36'eU", "ZD$($]", "ZD!&d$l\\2/",
    "Zg;,mM*K5X3H,M5_:teoddF:D", "Z#h;oioogJ", "ZJ`25", "ZM1>8>h)", "Z6TdOCR\\7V_$/80",
    "ZY90Rsq;WCh&dRL4nXeo@", "Z!Fl\\b0^14", "Zkk[H", "ZPN>H3", "Z;\"rtJ.Ckfm=N6",
    "ZR`V1\\>oi6.", "ZG,9J]<.", "ZrD.+3C:KG>Ncurf", "Zij.M", "Z<<H@g,4PJ3OEX", "Zmlfb0",
    "Z[F?#G/UN'L2s\"nLk+H", "ZD)iA]kU", "Z*G#HP:k(`;JYu>0Qhi", "ZA;dIjh-msAZng.7FEidr6P3.i4QY",
    "Z&Grp", "ZOZR9Cq'8!", "Z5$kE1:Ajj6@GRd-N(:d2(1it-H1u_L,-A", "ZP&:%NaFE5=7:L", "Zte]eu",
    "Zm0_C1#WDZH[$GQ", "ZQ>2?/*Z)_Cg;,6I`g", "Z]`-;VO=/#,6,YD&4;", "Z^i#QjnL.s!8\\)G4]dqob",
    "ZTf_)q", "Z=7E@r[#';g", "ZH);:(>ZpT^", "Z6s_\"U#42o^/ZIm-U1p,T",
    "Z3EPH*mNd+Yl^9rm)oba*TY8&", "ZOddPO", "Z^Ef!&", "Z5IsZ", "Z@\\/J", "ZWD00CZpCfN",
    "ZTH7]Y01", "Z:SG+J*ZTDh", "ZFAf/5sIUum", "Z?7SLFJK\\)q", "ZBC8VM=AJ)YmI",
    "Z%baNC:b(Q1R7\"_21+EB6Nkatc%HY", "ZE5Gu4rsVij%l", "Zh;l&k:6", "Zh0br",
    "ZNH$A6GQs)MYPJM51\"\"?Cc942", "ZNqo)", "Zl_P3)5`hAZlO#", "Z2gNB", "Z$]_K.+l", "ZR#F<@bM;[",
    "Zs0QLg4)", "Zl[]O:", "ZS-$]l)KKI:", "ZdgLL+l)&4PGj", "ZQi7A+gf,D<#o=J`U13", "Z`d2WT2G",
    "ZrQt!C*d`7B%3/\"++PMX,", "Z!GB]#76", "ZFbel", "Z`c/.oqfl", "Zm`a,%Z$cQ';uq", "Z[ol%",
    "Zil\"a?U6t'@dZEj:", "ZkIH?u1G3BH", "Zh.GX", "ZH.*)nd,", "Zt^J,O*Z;d", "Z'3\"h-D.r",
    "Znmm*`O[u'UQPJTc2T`", "Z:WjpoBTLhfn9j;r", "ZAaO5;", "ZqoU6A8db\\Z",
    "ZX3k\\G0P`Q@GV/\"4dYa", "Z:o8Z]')Z*", "Z@c^RFWmPj", "Z(HmmhDHE:4m;06", "Z?BZm_=/W",
    "ZcJS6", "Z>OcVU5,(XBi^0s%XO", "ZF>qA", "ZMjPhu:0", "Z;l7'DAW(9#%$e", "ZtGGTZ>apTI#KQL$>4p",
    "ZSp`,7\"P(B&#lG", "Z4uPp>", "Z*@Dg+BcU\\e2-,M>gM<", "ZUjGh!\"(%e`m2J7;%EDFQ", "Z<VE&oq:H",
    "Z;/P-8", "Z0qqTh?u", "Z@h8[$", "ZejW]$", "ZD;u']?(EIV/WY`L", "Z;n\\)r;pVqZ5;",
    "Z2;?882ksfD.]E$.O*n", "ZFeen&97-IA4\\Z", "ZTr-,.<u2q", "Z,j,S2DR/JQ", "Z9X'-sb'sH4",
    "Z:SG+J*ZTDh>\\\"i'Bl", "ZES\"a*1]uG%>>e", "Z2=glS.B(WB.<[K7", "ZFj+quNe>IN",
    "Zf1aFYUD&?Len;V@VNW", "Zn,?12t6rI;t1gFegD", "ZU'/tFN)", "ZPXJVEXWNpNGRl", "ZJDV5pQAb=152Z",
    "Z?AOV4dmh[>bE;)[", "Zlgiak^e", "Z/_6g*<R'p6RI", "Z;kqF]i%a", "ZA%eU", "ZgSQf_l9n",
    "Z@FE*/cm?p$r<=", "ZG+r-", "Z^4,/HPK*I8>:?", "Z>Rf(G`dY", "Z:SG+i2;sV-*7+0$`n:", "ZALe+k",
    "ZtkceDr!V\\ckI", "Z(amatdX*3*qW@s<k;c4PA>", "Zk`KC31F4-", "Ze!s2", "Z)1",
    "Z0-7<it(NDN#^boAJb", "Z^OD<U+V=*h['PKf?C@9!W'lrr#n", "ZP1=LKZWfc-9q\"7/B0'*0",
    "Z_EFb]?3TB", "Zn!\\?", "ZIM8ntW3>", "ZKDMTPH^GlQ", "Ze5Z!t64i", "Z2)gI2k;n48tnb3",
    "ZC0\\'c", "ZaA", "ZH`:cBY-L", "ZnD)Ri`g", "ZQr'J4OdZ,F.tt6_", "ZR.6/O7lHW<i39",
    "Z53DZY:WXO:QP*#$", "Z4Vq[RI_", "Z)pa5N", "ZR,dG>", "ZUFUH)-4pG8>[CRK>u4)*_N<DHOg+",
    "Z2Cc%u`u#", "Z`Q=K2X2/enJC8uOi,", "ZHDJSq,CcYF94&Zu", "Z6IR0b8CnM#", "Z&hWX",
    "ZndL\\b*eZJ-t95<aUR", "ZR+FODH`s.FRd]\"(0d9l", "Z3:\\cU$NX>Pb\"jA", "ZtD*:Pt&)DO5[j?D01",
    "ZsR5mt", "Zn.d?u7agZoB@n", "ZJ<E%O^lrW4FH", "ZDN?F?k>bK;X7%.$9EoadC;lFU,2T0F'QLu]FUs",
    "Za4WD;%p(eNV\"<", "Zo`fdr44^r#?7O", "ZgkD5ph)", "Z+-UcTi'c^c", "ZUn2CK*7_QI",
    "Zn6H\\o`@#q", "Z(B*'3mDji)/)", "Z4ahX", "Z\".G@7Op;+UKZ)m)>j", "Zbn=G=&\"Up", "Z7@AWZ",
    "Z<FcdOqN2!$>0,9bPZ6\"8Uk$l/-aB$uP<X\\4<3`N", "Z@0_2", "Z*&6nHe=FI5GI", "ZdpE3pdBU",
    "Z,7%(U", "Zf\":\"1&_bDrk?UF'E0Oq", "Z-O4*U", "Z_+@(eMNm%B", "Zbq_!R>+Lq1BrZ\\\\p.-g+Z*",
    "ZsJXN", "ZmPL;", "Zq)M$t#6I:,", "Z5!+S/KtI,_", "Zb#^2XUX5tJ)K?%7",
    "ZOeO#W!B9@.o[<BnKDC%\"e'(6YI^\"qgUDlOu8]2KJ62YH", "Z&u0-s%)/L+)!kJ", "ZZYH`X1<m)",
    "Z->:N5^0?66:Zr'E^.", "Z)QV8K/6AV:", "ZU7Oh7&;/LCMVU7e.f", "ZD:;GbeB!5p", "Z5Kes2:bJ^.*V",
    "ZoNXUPK05", "Za^dG7OiH;", "Z+(P8jghFi#", "Z[).H-E!^^7IB(d))L*;8gE4LJ$B9esGb28Kh%.!",
    "ZpGu^QYgJisSNE`@'I;%^6><p2=.?", "Z53DZY", "Zf%YNIoI;&", "Z^C`cPsR",
    "Z#k.DZ*ZC-N`16)@BJ`8(2D", "Zn#9@*DPS", "Zi!ORDcp8F", "ZB_D\\q:$:t^dFBeW", "Zj3YI@-S>(5.A",
    "Z4WbhP", "Z*CRT1is'pj", "ZRI", "Z:LlbV`[3", "ZXcg)T&A:#F9=^", "Z)`I-,@S&Z)'iM",
    "Z>R-n/*ZMmbQA*D", "Z543).4UJ(B*!", "ZTp^l>,o2m#G9@.S=<h", "ZRqlQ29V\\16BrXE\">I",
    "ZJj;0itld2j:E*B#", "Z$\\fNeb970`", "ZbFNOLjsm", "ZQI`V", "ZP\":/kk0aje!U<13ttMqi_jR",
    "Z#iF012Tfi8B;-r.", "ZtY3P2n.)QmGgKE>XO", "Z?!N", "ZNg", "Zb'arl[\"s",
    "Z_Y_<_`k7M1S>=Z^Ag)nNJ)H4%^:oC$nY^8n]Y.", "Z>R-Gk*Z8/(neRlHgoj", "Z^jZ5G", "Z7#%$#cj[",
    "Zo\\?6@#&D", "Z+c10", "Z#fo1n5,Oc\"X`e!.JUp", "ZWH]eQ", "Zf-SeW", "ZWBDJ",
    "Z_?U-)H]_O-2I:sj%l0", "Z%)6n]I5H", "Z5a$8", "Z%b`1W@QmeH^TR\\sdb", "Zg;co#.LkcT*V",
    "Zb702QRAQ^C", "Z.V0>_7Z", "ZhJq_qrT=#m5+5HBsu", "Zh..*T1`B)3.]Q", "ZkE@j2", "ZYhG_k",
    "Z`;3+oZ<oV-H6La<#s::[.`J?", "Z4A)=('+A&F#>4od", "Z)*", "Z>_8=tO&e,K/c[Y6G\\j", "Z5QHALeU",
    "Z\"43Tm\"Bm)", "Zsb_259Ao4L", "ZaJG;4Qq9ZQo[uIS(^gfY", "Z'Jb)Y?h+S+GKl_Sc9jKA7M9JIHUb",
    "ZW\"P#Q", "ZBtDY]s\"c\\T", "ZX2WjI.'=Lji0:idib", "Z[tlVsl@\"",
    "Zm2u/InTPIr*)n3RRLD/Z$&3))F+mA[04X6<?`'pZtR", "ZOM&-I", "ZnlO6", "ZdKgMMi7rMCQA=4p",
    "ZGrinY",
    "Z;XP:njPRksQL5?H)8J,S*pK6\"!so\"4A,R`H)T/_'h;Dlp/tfX,W5\\FV:G$n9))h(el5G-#7J=B)9*6`Diq$C%]G#2K3`@j].n02#0mB'",
    "Z:WjpoBTLhd*77E/2cr", "ZgUO3Rt6R's0PHjXJb", "Z.HJBlenN0h(5%", "Zt7o#WBWmGIQouqk:teoddF:D",
    "Z7,%>NcW$", "ZU*6,6ghfeO*m0K6", "ZQc4;2BL?]i0\"gk4*[[", "Z^S]5", "ZU\"3t",
    "Z5!(;@$qRD/Fhc!jDXa-#%5J*$_P2", "ZKPA'M]3r-HU#GoCKice>TR`=", "ZARY0qSRV", "Z4<LmW*DQ0",
    "ZM8@ngp%),\\", "ZXW+St%df", "ZS@QiBMn-<'IS>-9[H", "Z^,l3QO\\Frj", "Z3tK9+/[l\"JVF9",
    "Z2P7HFQimu2J7)7-0r@", "Z6]dVU", "Z,qW&0bS:T?EE", "Z_e:E0PUk", "Z\"%c%_m[AiX<R3KpZu[3qYR79",
    "Z\"!/Ah6.M.g!f\\>i\"Q", "ZcXFHEk3h'm?OQDJUC;4U", "Z[h!0", "ZsGZ;", "ZdJ*2Mt,BXh#mijGo%b",
    "Z3ZjWh0^E", "Z2S0KO8a^d+kFM(j%*E$`", "ZqiKr/+#b9@^8.", "Zm(-5%&V5`i", "Z:WM+Dm8`M+",
    "ZT`scpUs!T^2Hb", "ZiP>.g", "Z^U&j", "Z(0tmM", "ZQaNLF", "Zpp[^:@1m", "ZojeIh",
    "ZU>)*Agbd*fFq&", "ZUC^o`BJW,,JI#k4UR", "ZQXCklgI=_P.QePW01", "ZQK`mWG4\"pEtm7b$",
    "Z$Fu^[fmq)[M\"36IUW3Y", "Zm^Z$_db", "ZnbWPH0\"dQG#n", "ZNGd=HWTH_Z", "Z0*g)g;Gs!",
    "ZB_!cng=EkZ:>&^f:6", "Zeq=+Y+\"&,3", "Z,8\\:I>q1o#90&As=b/%s`\\Qikb=,",
    "ZWXV$j6Os>PS=0g%&_", "ZD!(7iBenXlP]E", "Zotc0\"fHfOqW([\\/EChMuQ1TQd&O",
    "Z^W3qbpg2:aDoQ/cqMF2L_l=", "Zc^^>j;:<d1MS`GZN'JXp", "Z>=nPcH!mS(g)+@MJb", "ZgG",
    "Z3pUG(q_JuA1D\"p-mQ!A", "Z?HO^$S<)(6+<lrm7b1)t5VIrOMPN<U&%uE8SAk8", "ZDb$\"f'F4?d7?G",
    "Z@t)TfDePA", "ZIL!+-K^fpSc4IEBt3=Io3p", "ZBDRS<cl", "Z:gB[%gsP0]2#FXQ", "Zt^-&>\"6oO",
    "Z0Zj1E5Bki]JF*7<:O^", "Z;*g:V", "ZLEds=Drgk_hougS&HqUG-\"@q", "ZO.`IMghfm6#K)]1nO",
    "ZW985'MIagU", "ZdN@=CYa+5l[u", "ZO[ci6>aMrGnQu#]", "Z/Y\\ul", "Z=QT$*", "Z<7T:i8o<\\B",
    "Z`13uh*@m3", "Z$b<eC*:bLq", "ZCB](j8.>pHgJWt<7l",
    "Z!Db^u*U+$K+9C-Bgr9dSn&jjNDD.,$3e2tTX1'/g$Y)AuGU$h&Z*", "ZJF?-*", "ZARCf:75pPR6?",
    "Z[_Z]\"G=8", "Z?]\"]fi(1-`9?1'", "Z=K'EZ+0B,", "Z[SG5TEG^4))S;F&$.", "ZYrJ?X!bh1N",
    "Z9@gIjj4$$", "Z,#mk5nF=uk,i5`+mf$Difj", "Z.puf!H;p&=#n", "ZH7Aqmg(e", "ZHHC05ZnH%F",
    "ZS,q8", "Z-%K[7E'R", "Zn1HF*iCAPY#fHtWBZ", "Z_)AiAJ+\\", "Z:hRd*C],", "Z<%28", "Zh\"9i9T2",
    "ZG_j5)ERM1", "Zp[0`W=b", "ZR]MjiC(B=RN&u`Q)E#'", "ZBL?@A*ZM>W`3A", "Zh6#-0",
    "Z(R1r)*bYG\\FH", "ZndO2POeduld7sQK", "ZE1p>:;1", "ZS=i5RQ5q!Xl+RgbTRU>&",
    "Z.Bal$ijmS]O[GiN`[i", "ZNTI[`WufS:&-(TE", "Z$5DCH5,7p", "ZVjX;)jrP", "ZGE\\:mO@t#.#1",
    "Z>R-n/*ZMeSQk>BWBJ`8(2D", "ZNjX'T5@9UHZ+g.1__", "Zkii7N4NcVNjJ%",
    "ZS,43mpjKVJA0DV\"PZ5V=)\\fZIdnn", "Zn3<p2_lc[Ad,", "Z-c!60Z:eZ\\,]C6Scc,1.", "ZQ^;Mi%($+m",
    "Ze&BJ>];B8k/-`H$Es:P'VpY", "ZZnE@_$D", "Z:MRnkXm-_g.H][GO[O", "Z*lS7a:ga@MdUCW]O`R",
    "Zn?#7Z#F#PKiF3VV", "Z?sT41", "ZS<Zg6?Q!B", "ZQTg$gri0", "Z.QlE6Q[$ZK2e", "ZZT[TNWt",
    "ZX;eIY", "Z2#$Fi)1mI", "ZE/*ZN[NGAAl\\1", "ZY9R8k", "Z0@MU+`2YDJ5Ql@q#rN",
    "ZtYUis2rmVBdUu@p`)", "ZkjmS", "Z_7=PM_k#]5!;-:\"-L!1", "Zp@#Kc?foVN0q4", "Zej\"06",
    "Z`8QF0`(Vr(2#'X\"", "Zt)@b", "ZEW*:DQe7E", "Z:t+>Y", "ZX=.h[7m>bf?)pK", "Zr?Fa;h5tR^",
    "ZVqubg", "ZafOGD[q&RMKg_tjIcZJrVSq1A-7]", "Z9,[3TtP*;NRLYH\\$;:(s6-lIX2riY(", "Z4Z-]",
    "Zt7oI<BO>j^BOD+$n_", "ZU)c-rKOPG]e9&@=!je", "ZjY&_8W3jIgsKT3kh)", "Z::g\\20rPjjg:`gc",
    "ZA2J-+6acMF", "Z[tTsfnoFt", "Zp&rT^2LE", "ZZ)n`Fs06\\VO`(&O\"(I", "ZO[%N#t?sEd>aQ/@",
    "ZT/J\"r", "Zlac4'-7J", "ZhrM1KJFH\"7", "Z7I=LqCaSN", "Z`36Gi2;'B,BJ`8(", "Z=u3(7-tt#e1_",
    "Z9msb_&o,dO@7?", "Z#i:%\\4RJqI", "Z8QIg", "ZUY8=YUD^`8#-;[$dCM", "ZG?(2gtGTt=:XiC2",
    "Z/YgKV3P'", "ZY=1ls$d%%=", "ZsOV_qQ9!h", "Z_HS,JmMK>s", "ZASB-#hmE>s9j20Kh+\\c<",
    "ZsIJJq!SH", "Zh-5)hU2LC", "ZA)'t%gg54&Ccb4j", "ZWd'e;>I3Z6+Z", "ZQa<XES=A(YD?K%V",
    "Z6Q.im&HY\"gJ%+#(p/S", "Zc]?dmGqjCNo9K,p", "ZB;+DWU7Mc/*(^t&", "Z`c:RKFu", "Zsa/Ee4fO7l",
    "ZJ_T/;", "Z\")/CpN.217cH%52B6", "Z]l\\Rs?o_V2\"@'g", "Z..O0'Y0p", "Z:J63)tC`)0UmU'\"5#",
    "Z9b-BPqFlsV", "ZqcTW", "ZtV", "ZQ?(SM^.l^6eO\"", "Z0ba9", "Z1`<q", "ZX*)#o", "Z(HS$r`I4",
    "Z%3It-", "Z>?*F4", "Z.]#IDY<jlA5S,i:6n", "Z3/fA", "Z&_,M", "Zqh7q#PuC", "ZUj)\\L3Yo&;",
    "Z#Vn^", "Z<D", "ZQs[I,>%t>[`3b'+.k", "Zs)FZD", "ZG6jOItW^mQk28[-4#", "Z.-JS",
    "Zg\"UQ^,Z;!5m;'", "Z5n:FS#h12", "ZD['=!'1WXWI/PrFp7^im", "ZJ^2m58o5JO<TNc1JaJ+D", "Z44j4",
    "Z7Sde`]EG[h[=g", "ZMJgZ-Rn7Z`6?", "Zi0t<i2AhNqN)", "ZcJ*M**S0@", "Z@b(T6iC(q!",
    "Zpg59M3F/sa", "ZR#if\"", "ZHcgMrU#ETiT'_SQm'c\"-:!cI0bu0", "Z#?ChG0-&'DY94TLSu",
    "ZdNZ-.PSj", "Z+qd^e", "ZD]CdN\"q)ga.A", "ZEO;CF", "Z+h1lIsJ?7E5l=8A1e,\"_", "Z0+8dPps>Pl",
    "ZsT0Zk/&q%o-Km;!?FM", "Zh[\\1", "Z\"rF=j9`5kW;qUP?nO", "Zk`WP", "ZbdWW]", "Z7K&\\PIt",
    "Z@MX?YGN__", "ZN;R]/", "Z2g>d4d+@LU`*D6,db", "Z^kVKVdB]BAe1gZ)i*Wb`H<-\"",
    "Z`l9pg`:1Q';>Arf/562l", "Z]E5t'R^A", "ZJjbGi.bCH05,NXP", "Z>R>/%2cZZ", "ZdG%L.2G",
    "Zhpe&\"", "Z0Z$%c2X_d>2S&Z(^e", "ZM*8Qt`^K", "ZG<?i[);Q", "ZJs)M<*gO2@",
    "Z5Q#1tBg3>G2gV5m", "Z@kJ4aUhoKT)=k", "Z>q:#Z:_Iq7:LlbO*77E/2cr", "Z&*(Q)aa\\i`",
    "ZGikW]eO*kTI_", "ZnQm1]gU(dB`2qJ]UR", "ZRVHr9Kto", "Zg/8RBS!",
    "ZdnhU-)ZQgD[nFlQ-LZ(d`-Ag*c3_", "ZTFWS#Vo1OiESk", "Z<=_LY1$oIV%l))I",
    "Z$7@4/BYV:N8*Rlp?R.f[W;?%;THu", "Z\"AW<LfU", "Z,TrL.WkY", "Z@cEYS", "Zj'g/IJEbh\\UI45",
    "ZA>B[%lXB0HELg", "Z[*QBUWJsV(3A*", "ZQG4AK!>", "Z1aS6Rmg3;cAi!ZB(d.", "ZXp>DPlSL",
    "ZM&HMq=WeD@", "ZggI;e2=mT%.k", "Zl.$]]_-b+GSZcZ.;r\\EVcVZFY!CTE9g$r1q8LqT+$DI",
    "ZHB?(]SKj:elNuaC+l", "ZJ;mO+", "Z*H8f", "Z?0'P!!)Bg0", "Z9bDc[.Tq<Dm!E", "Z\"OiP",
    "ZO0;Rfr[fs0,G", "ZTtmsU", "Z89TL", "Z_H'*j", "ZU5?g<nt0@>", "ZF&+atXK4lm[:b", "ZT38j+n_",
    "ZUmT^%", "ZWom)k^^ql?_nD#", "Z_53>4sI;3I", "ZJF\\EK", "Z$LP4Nil'O=3WIse",
    "Z5[]YDRV_Sp&maY`e#1MqV^O.'moj:[tu", "ZciNR1@FRk", "Z*>=EH%^<gc8I+WA]EOTiQIICkTb",
    "ZKs/Nuf't#d", "Z`WQD(q>+i", "ZKn>?8O9W.S@RR#*", "Z2BEc?", "ZN-/6V-<6gb", "Z;V9@]<2kPF",
    "ZbQq/Y", "Z#aeSq9#rmcIt", "ZXomSgl84A\\Fs#U", "ZonIg", "ZrI%5RY/.lO@T==VN_=f'/g(I",
    "ZHmOd#", "Z)s=H", "Z/ub0JOUT/\"_!](U-HA`\"NLRhK", "Z6R$$,W5\\a4UPcNt2,8)^l'dhc",
    "ZR)H>n.lGg;", "ZOb/WoX)FO_\"dUa+%l", "Zt`&0hi7G!qiIH>T>I", "Zb*0>7Sn3P", "Z'`'cP_dm",
    "ZDt#Z", "ZWj]M1#(V>jSZU", "Z+Bnb_1.0+LRDB:=InBgq45kd0#TGS@:fi", "ZNSF5g5[mgNY>D1",
    "Z/$m7B", "ZR_B", "ZfrQ7Y,'aR]", "Z_:=CMbaDrlE_", "ZaGe<f?^C'", "ZiD!3#Y'iJ", "Z5uJ7",
    "Za(hMQ$r<,Y&W/jAO_", "Z.q'>o.Q.F", "Z]7Eu1=p\"", "Z51RM_A\\Y&ug$j>7.bn",
    "Zs\\<+/sN=R!HuIO", "Z>R-n/*ZMeSQk>/@2M!Q", "Z>%t(a5ajXd>W>Ge5bH", "Z>9(7BPZdmbI26.j%,/",
    "Zm)e%X>V3?A\"T@K$V%t", "Z-1o#_>VY#", "ZQhAN@", "ZIc2\\eWZ@p+1TZ1K6%P4F),Y;", "Z#?%5,LE(]G",
    "ZV`&O", "Z]4i?pHD]G", "ZQTrH+@N5duP@p", "Z;MD-1R.)Cl", "Zp/N#", "Zt2YJdom)",
    "ZX8\\%sSjC&b5iM", "Z2#jqt:tqput6R$F.Qn", "Z&U+oq<Y-Pi", "ZI<j(", "Z<DX(F`6sRm&9.bo",
    "ZG[a!Y\"JS@d", "Z@Z)Is", "ZJic81b8]`bSRgg`)/UY)", "Z7H'M", "ZVMNrH", "ZcpPS?ea`i2",
    "Z+VV=8q+2H", "ZakWTZ`-(TR>1CX", "ZI`[>X", "ZG8g;", "Z>4\\i8`?u,J`2G+/.u$]8Q\"+U[",
    "ZI&7Oj%h9;", "Z%WS1", "Z=9Vr'a07f+@,", "Zg;,mM*K5X3gT9uI:teoddF:D", "ZW>*N!1td.",
    "ZU?Mj3>uRJ00k*li", "Zt`Y[D*DEOU*^\"/-#n", "ZQ6enMFoSn<+HtnBp7/", "Zm\\<>U5)",
    "Z00(2ig!)<so2)F)^G`jS", "Z&(,ok/(\"B^", "Z;E=in;DYjf(5)\"C?R",
    "Z>4\\i8`?u,J`2+q$2o]Qs`dZ7", "ZO9)I%2oT_;", "ZB$)dXOd[C=GEhN4", "Zq)&gS", "ZD%mp",
    "Zr^q[p.dBM;BK0", "Z)\"=9:[K/ChkEL", "Z4e5RhZU=V\"", "ZMJAU", "Z&>l&", "Zb.nc7Vl?1K&W",
    "Z%>g;k", "ZoferKip#>:qj", "ZOM2;m(Rc5U", "Z?Sk\"Z!la\"m$D", "Z3oSaG", "ZIC;UY-<4?d",
    "ZP5RB5", "ZUbTH(", "ZW:I5H>;Mu8JdY&X&^o", "ZKbftW", "Z:uA3).@?`i&1oi+", "Z[m!ih", "Z.;o#",
    "Z!71X1", "Z(p-j$3+?8", "Zm>\\^<dN/[V", "ZiD(*N", "Zm[V+Z", "Z`dQ>9", "Z`W.7OEW",
    "Z<)S\"20+EqQaf", "ZF4j#=YEr^A", "ZZ$Hjt(bl", "ZE/e$pRfPHn28bDP`<9Bt", "Z!,.ld,O/S8",
    "ZDg30[(7XU2", "ZSWET-U:,e2pn", "Z8DTtY^0=6e", "Z>*kp'i-0po>I", "Zi6<o>2ARP_#fU\\D",
    "Z>RH+rOmd0gGE\\UOdb", "Z?bHs?3ZAu7j/<", "ZR$7Fr", "Zd09sP.2l1L2kjHq#n",
    "ZE\"s`PV`O)u.FE8V", "Z5[Sskn9/0hA_U.6#n", "ZY9_TbOE<E", "Z:O&G(n?]()db",
    "Z0t&R5-f-\"or\"3m2(OOhIV9oB=6-o6#*FgM<qqA%$)hmD_+g7S`m?@", "ZZ'O$Q#4N%c&m2AB",
    "ZdY@>=>ElDiXG;`NH,9", "Z4aJH=B]oYYP?0fs9+d2SUWDb5ooh", "ZOXF@t-BLc&@b",
    "ZO[!\\ZgIdG10I0e\"", "ZJ3^:Ap4c)", "Zml-&H@2Ac$?%t7<b9Y", "Z$l&XpASM3aU/0d", "ZX9jmi",
    "Z*Xhlj", "Z.U=!2^&J$&", "Z;9Sm$Cs6KulRuD_", "ZX=e',", "ZKr`(/2e", "Zc5(!Q`)6g", "ZeTWW",
    "ZI!!CK7g(P", "Z`nSFJ", "ZF_8fmEkY", "Zk+k$9h\\mR@`)", "ZgkKs<>\\6rG2:a", "Z2l)+>sUSsCRa1?",
    "Z3hm]Y#/;55[!", "Z/)!tao4i", "ZP+DF\\", "ZoILY.c]d=U", "ZdDpiYGM.", "ZY`PqN&K:i6", "Z]Zkm",
    "ZY'1k", "Zf!it$(<T>;", "Z_XoRO", "Z\"95#_h`7DZ", "Z8*/;hn9)Ea!H-cQ/N\"",
    "Z$a's-<5(A9C8*:u@/R-)", "ZENcN=", "ZY&eJo@*u3?#&NPrC[s;0#U]upiDK", "Z@b", "ZKW^/",
    "ZtXu[!iFrZm,5'=ITb", "Zb+40<P_:[BMds]uDg]", "Z9*^;-NCM#*p+W", "Z3$GfO", "Zi6_`e&\\F+(",
    "ZHfJJVinTAqTo%;l6n", "Z+59LV/<=eIVWiH9RfJdC", "Z6j6oC<0HW]4#", "ZA-UZ", "ZB_G>TBOt",
    "Z9f4@", "Z.A0WqBo*YutR", "Z2,WYb", "Z^n!W=sdsEb.!$+#=+pdn`d?bOejg:7", "Z03apoE]Be2[3.r7",
    "ZV>j0E%6", "Z*^i$Cggd+o`n6O9J,", "Z<(20cOW", "Z3@>G4", "Z2I]Y",
    "ZaD\\j(/0#rZeos(Xl4J>YAZ]JM#k*k!'&90m", "ZQ^h>1,mc5", "ZTE72o0\"AL", "Z,g.I\\o.N((,m",
    "ZQaHXEI%b.'`g", "Zba@gH%%jX/FdgAC'YnR", "Z';<#Q%k+%$N`pJ", "Z^/;4G.f", "Z.u+Vp",
    "Z%-et!#@g", "ZdYa", "Z#I![m.O,^_ObE/!5*:", "Z,^jSQ^k:q)3#S*8kRX", "Z.Wl?S53GAQQlOaAQn",
    "ZJXe\"YIH6<Q_NB\\AcKY'W", "ZCYMFi", "Z(D?@\"V,<", "Z4\\\\,", "ZgN:^@f#us-^.", "Z$Ub`Y],",
    "Zk\\5E", "ZeAlH", "ZTaPH@q7J_V", "ZmI9Jb", "Z]m<3", "ZQ>[>r1f0[", "Z/([UTiT%", "Z4,249",
    "ZP7pdg!f", "Z4]tm", "Z1=XrV,8X-sC),o8)(m\"Y", "ZItU=KS:>i#", "Z_5]:XF>k^",
    "Z:-*8ME?*u51AT\".\"ONph", "ZTuP^0c/!hL#n", "Z&0-amo@@O@P_)Qq^Kc:n", "Z0=!@SB+L",
    "Z5Q)?f1J@O4h=Yqe#/3,KF0T5O2NX", "Z2fX\\AQ\"ffqOmWJW>5Q", "Z>Q2a", "Zsjqcf0Y#VKWi`h<EGC",
    "Z*KO0O5!9^jBOGkstu", "Z.!U#LUDc`IX9eH-0k-", "Z(+g;=TZds", "Zc%b@;)^A!4:5CmZ4e$I",
    "Z8sq7ck&u4'<$^[RSUa9", "Zi&N&c", "Z7(U\"`UHC8*]2Mp8g5r*ZqPLk;8-RDAYf", "Z+UhN%$e,CV*u",
    "ZXG)c&QrU:9n1A2l", "Zf!`2md8-$",
    "Zmm*'3_,0S]Mh/NR>s^V*4EnH_rc\\D159$'j(So]G6\"+OIb!pd)nRI%MsR!GBKE8`8?D.8^TJW)$+d!&!7e6[E6n`Jd",
    "Z?3H[G?LDj", "Z)q0Za1F:4_BT$d:/d$", "ZknSX8Kth`C()", "ZH(gJcNM;I#Hf", "Z(6,T/#H>R!eI",
    "Z>O%W91.@q[PWM", "Ze[kdL", "Zoa/'O", "ZtmTegD?Q-,", "Z8\\;=jg&^a4D/!",
    "ZQIMg&`8$VpJjl+2BM+", "ZK&B0DW]oD", "Z#KnIBcR\\W/(M$R[", "Z>aV1", "Z.b?g@",
    "Zahk)sRjL!)3'DL]1mK373`K(ao9:", "Z5@$r&%_2`L.A", "Z[XJ>sgp!.=", "Z`u\"/r", "Z08S=C",
    "ZVN7.=", "Z.9AE\\7K[AV[`Zo", "Z`&iT", "Z$f.3*%O\"]b8;jWh6qL", "Z1\\T)+sjF>",
    "ZRIq][tDs6N3LaD", "Zkl\\jt", "Z('B;657e9,", "ZF2i\"XZco@C,m", "Z36H+k?\\7s",
    "ZQ#l\"BE3JHTd6^(", "Z#kjc:QlW7OQk+Qo", "Z2@k#)'#Xa-", "Z`*kAQnY;n3", "ZSWTT4&p9",
    "ZQZKN\\i7f\"<06&q=", "ZC-h\"?sG<<0", "ZPqHO", "ZXVB5ma+H>]tq$Qk", "Z.p<p[dGD\"OBfBS*B6",
    "Z3SI0Z", "Z$lNGPN`%d[e$@mG7l", "Z.!F(5QP]7AU9bbV#n", "Z,M1c8V?&bB", "ZYGcfn9Fj]H",
    "ZUsT=(", "Z>Wm_dQU?_b0rPfj01", "Z\",)-HXOR#Mg_kP0XH/$R", "ZdXU7p5BD[22Mh.=XD<", "Zlr.+",
    "Z6G6l>du#Fg;N4", "ZUM;f@T9q", "Z/4Y)[9;e)<AAV5D/e;", "ZKTaUum:l5X", "Zo;i%[J[%_6Ke",
    "ZngTc*C4auo^X0=@Boco<0a>O$=uDVE9KK", "Z:EG:N;UmSQ", "Zf?e@it8R`&#J%oRMD", "Z0#\\_t",
    "Z^B\"?", "Z2HF:mP4<d", "ZQjK^6*0:]7UY<#]:Je", "ZJm@tJ", "ZsHdKt", "ZY:ciKFj$8]",
    "ZRn-B1Z(C", "ZnbG/0JDhaJ#s0'H", "Z8l^HY*ef", "ZO$(M';=@%?jZX", "ZFcEhG", "Zot8kJ6:O",
    "Z`H+b!n[lbX`ROK[", "ZW*<e", "Zp0+qN", "Z$CL(`o>!on", "ZOe)8RWak]Rpn", "Z/;b@>",
    "ZeN7tSQ=\\X2PRBD", "Z)*gHsUE`", "ZY*d;;", "Z;Pl]I7tj>I_+N", "ZlE]Chalqs", "ZM9hr-?&I:G",
    "Z!?tRF", "ZUU*'7,N\\BpJ2AdoDg1?o", "Z!WW+8j2@U", "Z[^5:iXW+>t", "Z<A>Qj",
    "Z0qi\"HaT`RJMef?rNYXY!8\\j?G", "Z.Q%MV:)/9kBA31&U[\\", "Z+'D(`7fM6&N+pRQlo_t", "Zf;9",
    "ZBWrcJX,a2?U\"g?>", "ZQgo]]nEOi_Npu", "ZO_KQ", "Z'=Qc'", "Z>_d^8E@X4`", "Z4>K!$Lgc@GClE",
    "Z_$2^", "Z/FBfSU@F+M9Mr1QY[0ZW.&;\"d9++`P*<UJE3%Hp]EYJM]H/:O,CUZjh2$e/\"",
    "Z?/#Y\\Q1aM?Hk", "Z`+u\"M", "Z&H-#", "ZH->%=^H:VOW>/A",
    "Z`HX>1R`(uV<au0=%pi>Z'@5V%bt2fM76", "Zqa%>", "Z>q:#Zt^=?Z`Bd3=B'Z=+", "ZD'_ZFh#", "Z*6HX$",
    "ZH(e&)", "ZgobG", "ZX@iR", "ZDmkC*@B)?W", "Z.n)r?$hKrarNJX\"01", "Z9[2SDHF47,",
    "ZF3-(>Keqp9pn", "ZIJ6?,", "ZYAW:", "Za@,,=", "Z]r3.", "ZkL.d#JU,<", "Z.QC*H2MDN-2G",
    "Z_W4A#", "Z0nlbX/E4m+*Ln$", "Z(LDE>mqTF9l_qal@3L", "Z2lqS]ad1JN0QO", "Z7`G<(a@DV6Q?",
    "ZP]=#]^7phcP:9/;i''gii_r(#HaklBt!", "ZhL*A5'9<$=,m", "ZUEiY..7<eDh3C@H.#j2EJ.8(H/MY*E_9V",
    "Z=0IL_", "Z:Agp", "ZSp^W", "Z:tu8GXQpbAGJJ\\5:E,", "ZUK$>;J@c@a`SXg=JWW", "ZI&`t4p1",
    "Z$*Yeu#[Wr#]T4\"4[,1", "ZA'Ie", "Zh!\\PVFJnjQ>Ga<", "Zq4W#>n8nN@2Nj", "Zrk`'0C?,tK",
    "Z<,63F*;-*c&e04t", "Z.Ygbbr00$", "ZH5PfQtk!DEPJ/9;[sYB\"", "Z7D=C4_A!D[@d,2t",
    "ZB'86gBt)5:gh\\NW", "Zd5?P7'u>", "Z/6Hn^cN=^3SDM:[N@EA@Tqb=hNe5gkPk", "ZO=0rQ%[s",
    "Z]:2pM", "Z1bF$$L>sXC(phWS@+^^P@c8", "Z&Anb[", "Z.,Z)k>SQ(-5uKI+*0A", "ZdBu[(-Kc", "ZQ9qm",
    "ZfS;lAIC0MtB9b!", "ZAY2gQ#)!e-4]r!nX'dH$rYJ_RB[ra2>opp]3kQh)\",", "Z(h/l=", "ZIm@]U",
    "Zac!MY-BU`#", "Z*Z)10g;:V_tDF(eG!O", "Z>ucl", "Z`]=?!2Q`", "Z_^Es*Jp-T",
    "Zdl>@g`bUhWQIgYqdb", "Z9\\&mb[p-&kRVci(S!", "Z#JT=B+&RCWdKmX^,J5d]", "ZD#,6.T&)>$a=bl",
    "ZceK/0OMG3s2G", "Zg$sHY$5Q", "Z-)0)", "Zp[N;", "Z\"*ATAgeS4:?aWqLIA'AWZ?", "Z2/s`HZ*",
    "Zg4bgK", "Z>N(S=`1s8<*Z0Rt*^L>qnW", "ZlhIN?$)@A", "ZlJ;-V'r>L(8;tt*[L'>C",
    "Z>TeXEd.Z3##\"*bA", "Zc2T*2`'*F(aq.\\*\"\\RVfPL_*Et_nql", "Zm`0D[7iWY2(J,", "Ze'8uLni6%U",
    "ZNsl#", "ZF@>s?T,", "Z:VZ.", "ZG*n[\"6GP'GQ1", "ZYDH.9?\"]U<", "Z4#", "Z@Z^p$sg)A",
    "ZPZ;''", "Zd%pgGE#D-", "Z%;mB)", "Z.^7OGg#fH!", "Ze@i_", "ZCCQ26<ab", "ZhBPpVFE.",
    "Zn6c54,:Xf", "Zn,V0eSiM", "ZcE?p2VL*a@m(]bbRU", "Z9C^i(bMnbF=KtL`'pcT/", "Zrr*9K,e",
    "Z*[)&", "Zq-moA", "ZoYr(", "Z]sE:E?5-", "ZQ4-d", "Zo<.^u", "ZIf@J9=MB", "Z&5-tJB&\"Ag",
    "ZA2^h;le", "Z%M_8r", "Z$mS*3XUPT", "Z1F24qOn?Gl9PrmkZrBL08G#E<CV7>($&Up?aY,KQ\"K,f",
    "ZBL?@A*ZMn^nm>:", "Z;6g'", "ZV#eph", "ZTIs>d", "Z?1be'I8T.", "Z(]GX7", "ZcTA", "ZCiZU",
    "ZUu", "ZjkW9#kSr-Caf", "ZD+ViugUOJ7(Am", "Z6tgbGLgP-4.k", "ZCZ", "Z1J.!",
    "Z>TL4Od^m/C:#tn**Z.", "Z>ULE=", "ZH,fnQX,/GUgcRJjJ,", "ZpQc&,", "Z_p;(D3WRm*=b",
    "ZOY.0B.4YM7`(DI>>_N", "Zr4^qc", "ZX.D&QTop13cl", "Z:/8:;b;`ko8qJ", "ZG$oV473:<`mf6pm3b",
    "Z4=8W%[n7X.", "ZeR_J", "Zt6q2[:g-!o*77E/2cr", "ZA7uu_rgkT'", "Z5<6:&&h\"DlYf",
    "ZUlqe.`%gH/t(L,YJQ", "Znn8p/#id/9dm\\(0", "ZI\"A%8CZ", "ZqM9Zsrp!>p", "Z`B)C1#i_?j*DL!:.k",
    "ZRME[MQFg=FTPZ&;?BRN!", "Zn&G;", "Z:O1XlgckchB;e>Adj0", "ZagY2&M<p8OMB(%",
    "Z0l<qH0oq]rg41/Bj_", "ZiQ$O-!3C,B.K+2b@/5WKO5JlkFdTq&", "Z%Ush_p>\"h,", "ZEO-;", "Zd[JJ",
    "Z\"D26", "Z1IWu)ioWTQ7u\"X", "Z`h*9ocRU>P2N#kJ", "Z:LlbOte!)!BJ`8(2D",
    "Z\"j=]o>9)_22c]_)c#\"(", "Z4\"o:-Y1#6Oco5<%h#", "ZtI.s%Bbb!>DDKce8qE9fnDHW=:DhQnEBlf",
    "ZhZm+5", "Z]sq31N39m0W&b", "ZSGm&$", "Z1n+G<Hp?nQs6Wug&W", "ZUug_K;P`I.)q<O",
    "ZlS*/l_$k0>", "ZlMa$u)rk!", "Z5W6V',r4@Q", "Z2MP5eOpLt$`&'\\hJGtM", "Z]-##dL!n<A", "Z(_0-",
    "Z9:-M", "ZVN4*)", "Z^g8<", "Zg-AC1*7%11t@OK!2D", "ZU;\":);c4*W9;", "Z2*2:WHSpHo$=@",
    "ZGZ^@jH9+9jQe?rElkC/Mnbkh)`!(", "ZiI+D5*m,P[.u$N4", "ZPkTNc4(Mrl", "Z:^M!",
    "ZE43]\"-\\5p\"#%O9T()Z\"sh&Q)", "Z8CX6KJGs<", "Z9O9.", "Z>E#dA", "Z>`MR", "Z@9;f",
    "Zg1&:@pZ4\"`3bo", "ZfpW_ppIE0cEtm", "Z:$NjN", "Zj9tJ');\"rb,e", "Z,[hW,:[%69", "ZX.oEI",
    "Z$gKKT", "Zn2d#^QsE9\\UZ@R*B=;", "ZU,jVcNhHg?^.", "Za8uU5,:Q8u_4KPaA2he#",
    "ZYG&.9q\\)4%i0N", "Z.2=s'UYM`J.!UN]Je,", "Z>YaP#)6-YC", "Zn]IXi", "Zp<5q", "Z`RLDG",
    "ZJWagKrlNN)f(SlGGo'KZkQbe", "Z^Oim7C%Y,jFCQmWkI", "ZSXi3ZK6@nj5=1^6sA(5fMeqGW`f!PPGb$",
    "Zij5u", "Z@(kP", "Z8%=7\\!4j_(]$=", "ZG0>t<9EaK", "ZnYgeb5Rdt4BkVU+#KR", "Z?a=^-\"sbO",
    "Z?\"tgD9-pu,", "Z*?>*L:E]oBB-1:)5)", "ZW_", "ZNqQ2X6#a!4$Z\\V?hO@PKorODb3\\l",
    "Z=9LT%iE-&93b", "ZVJt2+WTW)K", "ZR!QbYn3Yq4fF]_b", "ZfG68V1<^RZR3C@$", "Z.2Q;QdU%Z_5!PhR",
    "Z@.LiaVSRP))1", "ZGOIlEIT]YO)s1_9OaA", "Zo?,D\\MlO-", "ZIVq(pg!Ba&W)/", "Za)7EmHDS",
    "ZLAMU;J:A6*", "Z)!TK=rp9e", "ZO1[@7#o1pP.SIe00\"A", "Z-_JP",
    "ZgR;@C>>/OR-7_W?UT:ePa-Ed_Mu[", "ZrXnK9?Bu", "ZQL>00Hg%", "Z#oGe3']*", "Z+*ZbW?<s=km<-#.",
    "Zii`@5.8a<siF3VgQ?", "ZU'<*BP$]_#5#", "Z_2ir", "ZA&F=V9\"gEh(\"q&&jQ>YU", "Z(Vg*",
    "ZEmk=Y+\"i4l(;", "Z^lRf^", "Z9kmV", "Zod?q3", "Z_\\_5q!f/)", "Z)!Ym&R$fQJh<NX",
    "ZKP?jg;+\"_<0S)j,S[u\"a", "Z2X5?Hc6", "Z8E]U", "Z69,afmfHd&N[Kft_(.", "ZZlHY", "Z*X=U>",
    "Z2M&kJ>_ep7`V&u6t?l", "Zf/CI]?`9", "ZBAt<BA_X8L#A-e(", "Z?!", "Z)#)]", "ZtA'H#",
    "ZSu[N#2r)8JbKJ;", "ZB2cJB", "Z5pBt,JUok:#r<m\"5#", "Zl'$[L1ta4L", "Z0KT#OFu",
    "ZhKqu3O'46b", "Z4)&Q", "Zl%S\"^\"7_*D", "ZOCg2tPY^H_18!;(RfZ", "Z8bM-", "Z:@\\:dqPJ^",
    "ZCd_o", "Z>R-Gk*Z8/(neRlHt^]PF", "ZAtg^BH;d.s&P'", "Zt^J,\"`dQ#,:teoddF:D", "Z#Si4;FOY",
    "ZkteD\"", "Z#FBpj0kJ&l:$:D[ie!", "Zn<O>Kj.$", "ZP4F1\\N^]p*5AL,",
    "Z7HY[i@\\CiCQ<<W2K-c4;\"KQ?_XW", "ZtnB\\", "ZS8ll", "Zd\"E?pV;Y\\m", "ZlRcBU?8f;tJ)9",
    "ZS:%IR3l>!<", "Zl+JYB;\\T", "Z^X3F", "Z!C?#9", "Z>VPNrn+Q6jJFOi9`2I", "Z\"e.Yk`skPk",
    "ZKg:/", "Z5?OQL$F/1`>eZG5pVW(O", "Z>SJmT#h\"=)*^U(;", "Z9YaP`", "ZEY]EmPsu<A/RK@0UV",
    "Z./o@l2jbQJ", "ZHMj4jnM<$", "Z'\\Q+YU-PNW", "Z4qGC.qSb5QY9K", "ZnpC/1+t<VkFRnBPJ2/4E",
    "ZOddPOi,", "Z=]X0Nfb%o3Ti(NWdQ", "Z]\"G.1JWQ=+Lm'4>nQ<&0T;'q1GY*UeJd:", "Z\"&<n*.m_O`S:c/",
    "Z>g/K", "ZiiLe1#A-TA`(!b*#?", "Z,YCs65#Yn`mK`.u3H?7A", "Zse#V", "Z`*A>!",
    "ZsH.6YBAgE7>]#pMOk=X>", "Zp-2#G", "Z>W,/D", "ZP=1#e", "Z2GPVk\"-S/r", "ZH:1=", "ZG^#S&7l",
    "Z-omN6Ba4e8*Ac", "Z*ep'3#f4I[>T(%N", "Z1Ym)2-!fF5Ng", "ZU7;EH>J/-LA_sHn5[$", "Zl#[=",
    "ZOGsY12r-'cB'6s4", "ZVg3'\"l_(G", "Z>Fsb", "Z02Kl", "Z_h4\\L", "Z-)OgMpn",
    "ZS'l_LV:'*&SZ_", "ZeD'7qTj2SI", "Z58_%uZ%_a!Mp6L,>0^\"", "ZTQ^0<9@Qc]`6P", "Z::@o!",
    "Z`26??G\"7ZY", "ZO9;kWnD;e5", "ZY5+\"=E)3]t80", "Z!pef1:1TI_", "ZD7b2E+GKNP0$lQ", "Z0@dB=",
    "ZF5LA&", "Zg#2_-:SGe", "Zt(.gpJ^4#D2:<iL", "Z_\\.?J!HAh", "ZsA.'", "ZnYlRI2$ep-", "Zju3,A",
    "Z<%K\\Bn4dHB`0m`e", "Z4*-8<", "Zr.9OZXDB7&;jF", "Z!YeAlG[>r_[R", "ZIF[5HP(lf", "Zc7QT<",
    "Zt(sbu_KYks)*", "ZR@6!!a]<XKXO", "Z;O5-P", "Z:Sa7ZJKY'J>S[H@", "Zgr5,`X2W6-G!fASAk",
    "Z&sBC^:8%\"=Z*", "Z3@bHB:Te`%", "Z`J8@4", "ZpuP]dZC7", "ZB'09<:'N_qX,_e-B#n",
    "Za\\F+d%$%sG?V", "Zd6cK", "Z=<'2", "ZO90W[2;2$b2;'6$`d^u9", "Z4HsRA=pi", "ZVj",
    "Z>lZD&sR=MH+GQ>)E4_)=8^#", "Zs[YTT?\\YUnViHqTHk", "ZQt7?o$5h>jd,", "Zt!",
    "Z5CeY%;kU,Lq<Db!hsrnRbm*S", "Zgha]h0PDjUg)KV,tu", "ZKd=R7?HOn;#?", "ZT]@XSaee\"\"k2!",
    "Z^k8>sgLn/K", "Z", "Z$2ZK:f]8[o", "Zg;,;rBtbc+", "Z+u)#G1sZ=?@lQO.E,*bOk1doF$Fli5o;",
    "Z.>P'Qrdn:@mD3dS@Zd?=", "ZhWG!QY-s?ACl/", "ZXn,]YnD--fdDpLU2e", "Zp_7G",
    "ZPE.p9GWmHU(==b)D488#AG[$>32Rs,", "ZN5Wp", "ZU!T%4M.TYB)hOHpO4@?hQ15FR\"R2",
    "Zg8X+t2q8=1!f", "Z0qm'<oG6", "Z*!V!7h&uV_<Pq<hcLpoE", "ZBAI:EdscuFB#qGp",
    "ZoZOkjZ5FIporTpVm%D", "Z1ikpFQr7", "ZbF%tpPF,a5", "Z?;ZqgG1iB#-Z", "Z_.C]UqrgXs0$Nn",
    "Z)uVa", "Z5>2I", "ZLhmQ", "ZW*#qP9_^j", "Z`\"YPVY'#i,lm", "Z:N#U*J6=giGV?2n",
    "Z>a6$``8p!3:teoddF:D", "Z3^ni7UoWr", "ZGtZ!G2A+2WB-oI\\", "Z-E&_g1Y7^6p&",
    "ZiebAT2:2s<>JkD+0n", "ZiJJAo#W'1.Cb&", "ZA?bY<hCPB\"[3>OeV#gVZFc4/c!*-TQ@2", "ZQ8def;@2",
    "ZQk76Tne'", "ZQg<!1#HBBWD5Tj5tu", "Z3i/>", "Z([*Dm#g,].=)2V]EF\\$",
    "ZHJWTk>4'b.(<Ue\\GZ/gV", "ZTF_H7", "Z2r(\\,58VFQ5dGKdgfe", "ZW8R+WrY^", "Z:&tDk5;",
    "Z&XKM9", "Z1Vqj=qs*_GErf.N3,2>Q", "Z53lPo@2", "Z>'Y<`V%3n", "ZCRa+!_P,", "Z\"g??q/n,mUIW",
    "Zn[Ja,5*6eP#o[+bn,%", "ZcZ<T2SHI=2`)", "Z!.O4c`Gc`9\"gY,uJA=*I", "Z;mE0Q8<XJUl=jlY",
    "ZiD*/*X.sM1ij:hu.,7", "Zg7'@MrrU/;l@UD6tR", "Z>TS\"4nLP)oe9IA@%Z", "ZRoa480u^J,o<.",
    "Z(%J3", "Z`1?lDBSu", "Z)O'ki!L^", "ZdOe*", "Zn2O=3>+Ib`CtU/1'Sp_K%p#1", "ZI9=[9Co3Ro+$p",
    "Z$8pON5:t#^=[K&#(:d+G", "ZT)I#", "Z!m`mSU(?kP", "Z:]D7[V/Eu[j_", "Zf[o+^]A-#Pi@;SC;n",
    "ZUY-3mJeJ@qB;kQ.O2/", "Z0kd12dD@Q6g:Y\\5t!", "Z*h@oQ?2!+B#!!sM>c*", "ZWXhcG>W@(#Bd8DM!>",
    "Z:)*qJgAj?e0k3t@#lV", "Z\"jM$@+a:",
    "ZY(($&!$-NtqqE*0T)o-'oERcnnI_PQXL,-ID\\+0YA,\\QV%,\"qg'u", "Z^6on;$*:,Af#;95npE8",
    "Z,p!+4?R", "Z'?1!iQn", "Z(7)/", "ZNgdOP#\\OL", "ZrEM*", "ZAu'[[2P7t`0-BSaJ.t",
    "Z:VR'Va0BVeZ8<8td/u", "ZeNJu+", "Z:)$qN/lDRZ", "Z6Sem", "Z\"eL2)D%J", "Z;?JY",
    "Zd3/f$H/338BN\\<f;?", "ZNK8uJU\"0J)", "Z_cla_", "ZdC*2\\O<e7*OYG2r", "ZK;'S-Of&?", "Z>Vq6",
    "Zf[VA", "Z#-;IHt6!n4.BjcQ", "Z\"D3i", "Za*c>r'R", "Z^14-n", "ZjBu,^",
    "Z:'f(j:'f-(`B0[=dFm=<Qr3@K`q;", "Z)?", "Z3.\\B^#mNBp;5\\", "ZRAE^5+>oj&ib",
    "ZF;[\"WSr(SqHPr+O&W", "ZfLNA", "Z_f@b", "Z4fS1J4-,>X", "Z7-Nk=[,Q71]3@H2J7%3(",
    "Z+sHu];)QD,76", "ZjT,*[p7X", "Z.<D+?Mg]@", "Zg;,bId\"T`=neu!:", "Z'U+KeJ%Z@/YbFtX><\"H*",
    "Z;n", "Z\"nWQN@+2hX", "ZeR)!G<V?4b!G6i,4)f:kY8*uOItmdOmlio5", "ZV:J7O0.!G.Z<Yb", "Z!!S%I",
    "Z:T[<", "Z3g=T+.TD-oj4Ys=Seg.(", "ZT\"j(", "ZP[bq[", "Z<*P7", "Z)kCl9)HB1M",
    "Z?pF\"l<N`B;d<t6[EJ:)KH<-.,\"h6fHi,", "Z]MI8:c-opY9fD#\\J<>PtAal/&fSa*o8P+X1",
    "Z4FN^Q@9H-%aj*'X+;]dh", "Z>kW67(K2", "Z+eAifE]*PD", "Z$:]o5JA=^60;FZQ", "ZY7r-", "Zg;cl",
    "Z0h.JBe.CdZl\\lE!EuS", "ZQ?pF=kum%d", "ZspSM'", "ZUCUQeGd#/#iPq5lTn8W",
    "Z#k.DZ*ZC-N`1\".TnY0O&*^_S", "ZY?8/Q", "ZJBem<f:Gm#0k<9+9T'j\"", "ZH3uBgjLVo6",
    "Z4^-JX_h8U6", "Z)>*N(Qr:", "Zag<,", "ZpU<", "Z:P$o\\>a=5tGqXa0", "Z9kX^EI\"P[O",
    "Zp^kABc@J[o#?", "ZdsJI?mJ2cCekTSt'WFYM*YLf@_-TQ-^62e@adbqIs;mJW>40)p:YJ$g6'2",
    "Z_ljTp^:Wlg", "Zp`\"mI>C'b\\", "Zh*]jlYk*u]?I!0,fU", "Z[bJrbK>45!>j", "ZR-eP/nHRS",
    "ZQ\"ANl.<@^'`<>-6.bO", "Z2jhXLijD>HJ^AF4go1", "ZNRrEO", "ZaUVTgBXX(!C5F", "ZIl@\"'",
    "Z=LD/,Y)f", "ZiKs$8tDSTqg/aT(BtD", "ZIPcH", "ZhTK[.", "Z&SkGb", "ZYp)M\"96ktgS!=$A:4!",
    "Zg5i40.#1tGD:1q9-fNJt61", "Z:ge6b>ucQ5:S!*q", "Z_\"*h!/Tb.UVV!", "ZO5**T:bf0Pj!ZR8MD",
    "Z;%8dM0c39dCd0", "ZaZ$!`H^7)'dMp*", "ZJbM&", "ZBN#/@i+\\KR>ReLb#/$",
    "Zle8uGm(H\\dQ57#@'m6e[_&9Q@,V<l5e(T&4d+!Kn7cI%^?Kea05Y2abk!U2WrMG>aH``<lEaOharVJsa",
    "ZXa$NUQ)U=3", "Z$D", "Z`36G&nm!s\\*u", "Z:SG+0QP*#$nY09", "ZQ_B`2", "Z2I``AJZZM`tCO8U",
    "ZT**)FtY(-r@]K$dSH", "ZVr9>C9WGni+5[", "ZfR9^$,\\u_<]JSW]OVF", "ZZD\"Dphu'GS", "Z!f",
    "Z&FqF;Ak", "Z>M\"V&C]b;-A6S91$oE", "Z3Mo@e%Bro=__", "ZaG\\+HB@a(", "ZdQ$r<UG_h\\)_%\"'",
    "Z9+U", "Zc5%S5", "Z,+AK3,]@", "ZtCST\\:O/Da*`<SeQkO", "Zm..&R]mc-b", "ZY3%Cm",
    "Z)&/1)JT``A", "ZD3,$", "Ze<SA_gO$V8", "Z>_`[H", "Z2;*@0nW", "ZK1m)hRW.?jm`>D\\0sjRQ_t",
    "Z,YrS", "Z'C^;Ya&Zh", "Zpui@=d;Rgs;RMM", "Z5[b[U+LG.;5gUA&2`AD/", "ZHBIp", "ZIS5P",
    "Z:4;UC%@tB5`h_fU5#", "ZGc1_2?R+Rk0W+*", "Zq8p,%[i<IGXNH", "Z$ME'),H.q3",
    "Z068e(P=h>^r=.cKrh[r]QM$_<MiAU;&2)3e+V5\\1A<n4V", "Zb3PmW3;8Jlgus", "ZQ/9o\\O.Y>8i^IqjQn",
    "Z7Y(U", "ZV#84Uj=rQ/\"nQqf`]NjD", "ZdSH_C", "ZW0-Gfp?t", "ZRSdZ", "Zjm><d?qj\"d", "Z6m.+",
    "ZXje\\@UFX`AgK9q+qThH9?jr", "Z9JBd9+ie", "Z,u^4>e?+$!L:#*72e", "Z:EscV:t%mY#UQrM`)",
    "Zlu>*,Y(hhT(52=9C)G", "ZUR<PM^s*qN", "ZsX&$hU9J#h6%A307T:='0?", "ZQ[3f#)dI",
    "ZQkCk'Qffi>QimV=n[>", "ZJbYN5^4*p", "Zos]=?NeEHu$e", "Z!:X/?", "Zb=)cL+ri",
    "ZKZMJB&[al&Bl", "Z.BafJ:L%p%Op\\^j:Eg", "Z6I?-b", "ZW%0esZ*", "Z+.>cEl)-8,kV=d4",
    "Z:SG+5Q-9nJ", "ZRZ\\C&'rUCa", "Z=b", "Z#k`ehB:OieBL3:oio,", "ZRRIZ!Tkm]`9k1",
    "Z:'f(j:'f-(`B0[=dF&", "Zd9Jg", "ZVgL`b>c6<A'j]Z.c%6^ba2N0p!D[", "Z9#nT/",
    "Z2o\"I#O,>QFQA=cOgD", "Z:A2rpX?EJ[#PB#)X,\"", "ZtabD", "Z'<d86o%NW[=tG/X9#",
    "ZGo^jIj(f8NS\"!=", "Z0^-f**&IUZOYHI+", "Zfr,&UPk", "Z<?m4$b?", "ZF1Zaf",
    "ZD9ZWq:$$OSWOS,e+B^-\"", "ZokRFO'VC-cg[?#*", "Z:SG+5d@F=!ne'", "Z)L)ND#cNR@QVB@", "Z&ZPBs",
    "Z#\"cs<!8&a/A&k", "ZUD87Zd.<(LXG+?Y>qX", "ZV/rD=1s(/=8?lk-<lkl/94C", "Z[p-.", "ZkKS#dZ<>",
    "Z/BCV;.7+", "ZisZE0t95PF#l2g?GU", "Z:FmpOOimobKXn", "Z+0&nueet,#Hot",
    "ZJVu\\c>1@@j,[AWe^,=$", "ZGHclUXG^*p:Jb:IdQ", "ZaUs!5", "Z?Dq%#", "ZUGFN",
    "Zn`WZVd@35\":L2RR.a$", "Z]QD,s/bCO]", "Z)u`q:$Sd#<OAWGLqj", "ZKAp;2O_", "ZqTJ@&XO",
    "ZR=c*O`=4O", "ZgUI1((>./,Z%]", "ZS&?%4hQT%g", "ZRJMOp+:b@f)O4Btsu", "ZRe5qP,Oqt[jA\"5F",
    "Z#9%P1hPZn-Pk", "ZO$B-k8bY/M.A", "ZIk.'o3gRRB*T\\pXa`&Q", "Z/@KqP)WQ!g<.", "Zc9L3",
    "Z.]hG/>Mj`>Gg6KEQ?", "ZWT7F!nm9;M@Q'&/iVp)d", "Z3/X<!imX<[ks", "Z!Sp+A61",
    "Z)m[YU+X^u-79a[Y[>!\\Pdke6!XW", "ZRGA#", "Z*`<la`ujs/H!+o'01", "ZZN39\\)pSs", "ZI,&c",
    "Z`%K78$PK0b3+Tk:N;", "Zl1D6'No1</:SKaR1ca", "ZQpg:", "Z\"\"ZhEr@b", "Z5V-_VY:iT+2D",
    "ZnY0&9.8d", "Zg(a9A", "Zs!", "ZcZ", "Z]3(8I];TC&=\"<8pIG\\", "Zq?qg=R<`JH",
    "ZOEC*RGma*Knk``", "ZAjGjh", "Z=#?Z1", "Z2rhTK#\"Wk`.NGh:tKG", "ZcO_Z", "Z/!@n", "Z>1W;)",
    "Z!f$.1", "ZH.m;p", "ZnlUTn&J%>S", "Z/L4JbDoulA9#", "Z5)egc", "ZGU", "Z'H", "Zg=Jc&",
    "Z/a8C0", "Z2k&'t`;", "Z%DMl9d_5(", "ZPH(u1DmB\"<", "ZGkX-cMT;R^Su",
    "Z4\"Tk8UFo#!;Wg6!I%f$.eS.s>>%QZ)aEt", "Z+)fEG<[)MU", "Z`mF+#6<Ef1", "ZNRc>mic#4#YH=m*.k",
    "Z7rn_3gsd$8OO;da+:<G", "ZTW&X.cFGd$nW", "Z!Q;$s", "ZtY#gT.QmUYJI<54.'Q",
    "Zaq?lp+F\\phYd2Tg*$u1/", "Z.aXp'nYlIadXEGrXO", "ZCtZSC4cCMT", "ZY0qd", "ZN/mYK", "Z57^o",
    "Zg^JB(BU\\nN),F(.O9k", "Z+e%Pe)'L[E-%YR9pe+", "Z>nFn'g/l&c$WSmdNbeC@n_", "Zd.R<)fAbNbNn9",
    "Zg)iM/%F.iSY#:!+E=#", "ZkJY\"", "Z<%6Z=N\\(1c)oib3a:MJl", "Zp:])8b';0fd#c",
    "ZUS3_m`obkr:0", "Z<=NHV*%t0eAk", "ZNob!&i_nYS-Bo",
    "Z'@L84@s,75Z<'jg?.X?l>6j-sj.2%9/(6qk4Z$nL", "Z#k()Ddj`Yr>W7p8UR", "ZRH?>.", "Z]Z@<[",
    "Zm$T@E2A5#2Qb,", "Z&M!KG8SgDjpMe", "ZnYr:o6\"201UXm:'", "Z#lJQN2$NMcU(@B_",
    "Zp6CG[$%QF7EW", "Z>Lg5A(;", "Zk$Lk/fT(dM'Ls/:Hf", "ZHt_$mdDf;ih+6%_", "Z(-Is(^T+",
    "Zp\\Dc!U[t_AUu+WB()", "Z!3LP", "ZD';LP?G4nlA0e(53[C5(I*3V", "Z6tghMe@kks", "ZSK.O",
    "Z,CU3UMTFEDkdq[Ypg5?g1]682", "Z9L))K", "Z[X3g", "Z&mE(qomY!j!kO$?ocb$A", "ZC:2WQ",
    "Z'4.$NrQb\\T!k", "Zn.8]%nGV4rO1S`Y", "Z2QAsXWnW_$", "ZaCWt'*JW?mSH",
    "ZBCU`6bsVb?G`HS\"a@(r2", "Z1I[]HHsZX/", "Z6=>_", "Zt7oI<BO>s", "ZRMk;S", "Zhf:TW%l9gN",
    "ZY:Ysce<=;gns$\\*Ju<LA", "ZDcQ,", "Z#TTD", "Z:$q785a__=nd4A%ib", "Z2%GT",
    "ZFt4-k2\\Ci:Ak\\S,FC%U", "ZcXpI*RUL#M+Z", "Zrb$H^Ht&+Uf`QD0Fu", "Z>ICk", "Zjcc_7$A5aC",
    "Zf>PT@", "Z4u$;U)#_=(\",", "Zm>p?", "Z0l9\"lD&R'DZ0ceA$j25-!Ok[i$Otg3]35kKeVZ",
    "Z+s$]&MN@<R", "ZQ-j1Ai/s?]n]('Vib", "ZGtB71X,_%JXG:*diZN", "Z0es\\", "Z+cP?qlpM",
    "Z1b2Dqkj7", "ZcC=EM,S-#I/kuZ?`X`", "Z'I8kobF$-!80", "ZfP_&", "Z>R-n/*ZMmbQA*mK*77E/2cr",
    "Z[<0AE", "Z]9@^rr*2rA'7\\X_A7J", "ZSddN.", "ZT*W4=+c3!", "Z#k\\lUJ/G\\-`\\-nBnO", "Z(lrd",
    "Z'NX^3HM6\",cTG", "Z%NK\\", "Zhe*_G!-IEEb*", "Z;#uNFl<4OlQn", "Z<U9Gi^si@;db",
    "ZB4'P!c[#XHOHnGf5b\\", "ZDdgr)--T8&", "Z;-iLX>X", "ZbY=aa:^$&Z>/YZTDe=", "Z%L4kQoRGAu",
    "ZJlr,!*e6SUU^aW)`g", "ZBuj*?_^C$$fCH]DcAY", "Z,/fq9UQ[$O[['", "Z<[C)g",
    "Ztt(5[ph^Z+5cZ:a,NYFY5JG\\", "Z1:Z#\\", "Z*arZ_", "ZXjOe]R%+mpRU", "Z5CHU0Fj7$gGU",
    "Z#A$VA:cM\\BiC`A%", "ZI=q+Y,>2", "ZUl,n", "Z4p<N]?^TQ+", "Z5-aWM", "ZS1%*1a3&`%og",
    "ZkYOjCZb@PC", "Z5?*Mn`BT5&`bUiU`8k", "Zm,lg1;5b[N:#p", "Z!SujMs8BQiPk", "Zt3+@*", "ZS^LE]",
    "ZGP@\".61D6", "Z0cj/P", "ZE!$C@#HRcZrOflSE=VV(=f,H<CW!", "ZIgVO", "ZaC*?&pADt)",
    "Z@F/hZo;", "Z?dN;V2,30ToHj&_e&7Lu4-=,/]8`i\"HB+1@G4_;", "ZcYbR,R*,MFG>1",
    "Z>5/H251Au(5q$ei`[3", "ZDIRY_MgjO", "Zbapd", "Z#jC<K#&XAuGGOM3(Z33+,=EsGh%b",
    "Z1OPODD8KL>kMg", "ZK=9o", "Zb9Icd", "ZCOkL", "Z3VU&VO*W", "ZNUrtn;EU?", "ZA,aZ2", "Z^.&We",
    "Zd6DBY>gSgWB'6%]UKX", "Z^m/HsXm^3\\", "ZRl]FMbiFP=", "Zne9jHgoRX`>RVT1", "Z1/sV&pXH",
    "Z>]G9", "Z&N5E9afr", "Z4e[ol1W]U\"_:.8iaZdit-?T`", "ZN[IP+O':6M?Z4T/>I", "ZU_B]b", "ZZ;?&",
    "Z0QM_YA`978f238d75sX#a/c*", "Z*^1Q=X?n:\"BMbB4Bl", "Z`2eTPnY:(#2MaCc",
    "Z$Z._]Y3Jepr*Y[ujt_Q2", "ZTUjD$I'Wn", "ZZ&iOn3$@", "Z'@pf", "Z&P:7", "ZB)Ru3>u9'6>OG_J:M&",
    "ZR=!1mZVIo\"/;", "Z(V7I", "ZBecFcBUXgS=_>k'QfR&XoaodD", "Z>4hYC:L7\"\"GE_c0`a/", "Zh022h",
    "Z*^oD<iZ+iV*^I&j", "ZWD8O*!<\\Z:@KfJkFH", "Z(]_i;Ppj5/", "ZqdQ>E", "ZdXr+", "Zs5=J#JV0Nc",
    "Z5mD's&lqSVmLF7K3M=", "ZBLX,Y0jpb6*l_RM", "Z`!e17", "Z;geY]dF;bM", "Z@sM1<adslr",
    "ZEeM(:Rq.l,R5aMu+uVX2", "Zk5rXOg$F-]3=T=QESiZh", "ZHa9g", "Z.am0", "Z$0r]a", "ZkbO6S",
    "Z0/l\">B)9/%5`EB_*u", "Z>MjJ0Ul9(=dZIGg", "Z:'-V5*77E/2cr", "ZRcf40K<Et,Kme@'dT\"Bs",
    "Zn[,')t996EH!bO?#n", "Z]3Mi^b+;u", "ZcahGH", "Z^%K5=", "Z#-3K^2;*B,g#KK",
    "Zfu3k_Q'fIq2_g>_,Lr;eY'rJP?5B", "Z]!^a", "Z#+d36cRhR)gD", "Z@+=5Hj/M", "ZU8S)04&5",
    "Z<gQ2j5j3", "Z.OTi)5,jfL`&toR0n", "Z(8>h`", "Z*;(ohAHs3le\\1", "Z:Llb62=,tete!)!BJ`8(2D",
    "Z^??FT%:(6P", "Z2oim\"Q\"(T-*GQ.nt!", "Z2jOrm2TC>(0PYA=", "ZE`,2K)*__&eU",
    "Za9L2J?s/*D:)qaJCS#nl", "Z.8hfPgPsuGt0mrgQ>E", "Z>/i,,8/Fh^ge", "Z#DZZE!_XAT?s^",
    "Z=9atZk^5;+N^gQH;#(J5's-%@E`k", "ZaM<[oN$kfdY(^qF", "Z.CWq=ZlFA#8>h", "Z]2",
    "Z2jhB*n3`.AX7h'8`g", "Z4O2ZJ1')", "Zls'ktN[oNM_/bbgp6\\d9[H", "Z&L%G", "ZZcQ1hUZg",
    "Z3=N?", "Zfn>+$ANep,=>D-9WTU\\oo+!M4dn@;Po>G\\'f9XN", "Zs3ic", "ZAQ.JR<\"0ht9]\\",
    "ZGVJuXJj6&55[\"P(", "ZYcoCE&MBYV", "ZbJ=[", "Z@BTJ7n6\"F", "ZDsd))TkmWGaUc%WU!",
    "ZqD:T/ed`6e0K/Z#M^qrE", "ZBL7bP", "Z2pM=Pb0rrqe1@H`mDl'KQq%\"$c4\\", "Z\"/;qZ#D6dp",
    "ZipLpP", "ZI4g4a", "ZC`C!`m^g[6IG727", "Za!ApNJ2NVnb<Dge:2`_3",
    "ZO.kg%*7ehW*Z,Q1*7+5EtZkMI", "Z9T(\\.", "ZJOYipm;PuGS&nJEs5O9n", "Z*;Z_UQ1cT-><r",
    "Z#U4Dj", "Zn.$6OJF4#Q`8=irQ1", "Z4:Ro7@oW)kb?", "Z!7s\\J\"'=,s\",", "ZGOtD\"",
    "ZPFGpj7b\\E@E^)_JH9HI:", "ZF4[R", "Z@o\\:5C<@0:J8ku'E&.Q?", "ZA9s\\nO:F", "Z>I;T",
    "ZAXk,k+O8<", "Z%4*XGO+PI\"JjZ@qc6", "ZU2(,)I8$gjp(;a83Q", "Ze!%h", "ZUGk]",
    "Z2fE*9O9$0F`%Z@Ti,", "ZD+Ut#8W8li", "Zks@?;8V9pM]P\"GjPkn:L!nn-tp:]", "ZR=/X",
    "ZWu=ces.?pY", "ZFLi89j(aS'", "Z:SG+5d@F=!n]r3Z*&Su`n(1742;B", "ZM&n2^Bas4uQFn2&",
    "ZJX@*t>Ofu_52d<F", "Z;2GhFOR;o&DNLAIrA", "Z_9OY", "Z3XArj`1&Yt`;", "ZXnZqMJI0OfBAJI!2e",
    "Z1SLYf;3X^R", "Z-_3,J", "Z9)*@k", "Z'^dN2", "Z)t`8+_eK", "ZdK+Iln1V^42rY;Tg#Y",
    "ZrG';**^;1SZVSELd,", "ZZ)RbSpK<5C", "Z&q@Jr", "ZXFOhZDsZ0>:i,VQ2H;",
    "Zd,C`m<;d(o+JV/AHClR?,nt)iXJ?0=Z1-R", "Z5,STR*e^Ihd+[&#", "ZUF7,Z", "Z8f5/",
    "Z)odJ+>8>BG!;Rr", "Z6n0Khk[u\"/q!Z\"L7P(t0", "ZQiVeaUlqjQiU6V)", "ZQAsR^Qo/a\":_'5d",
    "ZbUH=Rj5\"d^", "Zo$;c", "ZgmRCRoG_T'Gn,]F5b*%", "Z>=k&?*Cj", "ZUKY0DBJtm&Ulu'POO",
    "Z+.te`", "ZGHk.\"d.#fuiioC?", "Zte>I*2D", "Z!tLg,iQ", "Z4-P+o/#a", "Z;4kX", "Zm3#SM",
    "ZO@F<", "Zt?JNoOm19iAuUA)5ab", "Z`,YYB2I'PFGJ_c,n_", "Z^5;r", "ZTC\\^2cdfJ@ohK$dj_",
    "ZA<*RsFYR/-\"nCk)", "ZF!", "Z2bWOjm!eOi_\\r", "Z>!\"+aA\\h\"#*77E/2cr", "ZQ-O0&OesYBUD-ch",
    "Z0V\\=", "Z,W(\\IokR", "Z!41:CfXX&fF1$oT_,8`55;", "ZfI", "ZQhR0\\2Mua", "ZUEQ\"VUg74B",
    "Zq1=E", "Z.%U9^)7i4g[-)qqhMWas", "Z0.\"4eL!%&b_t", "Z(95WN/T07<Y?R", "Z:3[o", "Z0-b[",
    "Zq78h)%31>;Wt", "ZT/[Hm", "Z&g!pKRehM^9o/n", "Zb6@23cTlVk<.", "Z53DZYQk:ff*ZML!BOr\"W.k",
    "Z6$;RB", "Z8\"T-<ca7<tsj8", "Z[fMh_=31L", "ZQS+B:)D:", "ZcM^JZ1YM(Qq#]c%", "Z;*2m",
    "Z[4;(qI2<1P", "Z[`m??:1RY", "ZIN15Jc7F+K", "ZoV/QflW6", "Z$+RtqjV;FgM2L'%2NL]:",
    "ZO_NZ3>V/3", "Z51csZ:M-12*`<\\$UR", "ZC3TR", "ZQ,$3'(_nU?", "ZneDepX3>s>ijuMS:Z", "Z!LP>t",
    "ZgPM4HkC>Xr'Z*l&%H*G", "Zd6&!e06Xps2fO$\\**[", "Za1HnmXPA", "Z-.W*JqVc#CYHh]N4@LDU",
    "Zkc5;d$fCi", "ZkR+A*an4RP", "ZGqo:`is0&;.b82U", "ZmW_A(Y5'nt^e", "Z/+==Q",
    "ZJI2B3dZL\"r0\"]DEGU", "ZSDN]", "Z1*8t\\*83KPO=I?m8NBV3#gg49_dq", "ZQCu$cJ6J$j>$I`n",
    "Z$!7b", "Z760.@JJis3*<*kV:(:3kK1c&L4SjsIfu7]kj67(.CUPl[k,M_HsiY[kst6Z)'GrG%", "ZE_Un",
    "Z77O\"WiTJ1b", "Zm*&m#pUbuITJ+F.J-]l", "ZU`SYpQf8nH.NAS[", "Z3/m)", "Z$31$\"\"W/[f",
    "Z:e.M)>nA)DTG?ck1-e$*", "ZC=[K44o&7%", "Z:0)hWG?4c.HLhLOja/mh",
    "Z.Gf9Rr]2@mI_4>,8-Yq>>R5\"JN*C", "Z>_g?cO,8#5UZXs'U@P", "Z;mTq", "Zaku4)X!<\\h'A6JLnO",
    "Z*CKp)G`oW$o#`6[,V\"=!P*0T]>\"h", "ZW\\31J", "Z6Zu-", "Z8m\\:-EVtb\\9%'XKq`a'%",
    "ZUA`ZPmi]e1db", "Zmc*KcKG", "Z/%TrAX_", "Zh=)L_e\\tJmBtli')f3", "ZplV]=r.YZutZs",
    "Z2oJGbU0_dYU^:DM:0", "Z;]8_+", "ZS0_HO#.^bu0%?ni/]SJtdS/9=QF,", "ZQ>2?/*Z)_C>\\\"`\"",
    "ZJ'qMSMM4\\SEBjX", "Z.Mddf^&chh", "Z51lp28M&eN", "ZW<Ik", "ZbYi@s",
    "Zt;e9P/\\B0XCDo/I!J5G", "Z%1ArdP-7", "Zf&-7", "ZX,t\"DlV`P]Hq!^",
    "Z:SG+5neA)Cneec)QoP+r2c$[cQA'm)", "Zb((BIe`ocAIqq=UCk%", "ZQ\"KW8Nj)bC",
    "Zg=&kY2c^.,t(`KH5)", "ZlYAn%^Q@Fb28F", "Z/\\ApYB7QA_(tE@acZ",
    "ZDDnU^U?2Okis)\"C35kR'.s+.l!)';Xa@n", "Zqr!HI", "Zbg8co0$h)^$S+", "Z=f3=HOXk",
    "Z;mkCcqm[*oD!JEE^U)\\N*QK", "Z(r3!9Fg>!a$.", "ZC,C?3A@7<A6?", "Z27_Y", "ZQWkC",
    "ZI&F+>bK1#G?\\-d,lCIb;%l[n')?M", "Zg8lo", "Z420P5", "Z.206!n`WEZgk$H'",
    "ZTXS*nb`.1KUFhpk$uS\"#", "ZVkANlfBT&I;BdN", "Z?HAkN]Us?hFC0o", "ZWuXm=",
    "ZBd/PV2P[SiVX>;Q", "Z27EKIp:#", "Z<TEVdlcEiP", "Z>!\"+a:'k+'Qi>bGB'Z=+",
    "Z1t1%tG)/`(WWsbs1?iOM", "Z7.ZWa306c0\"WbK", "Z[t[p", "Zgqmk2", "ZfW!5",
    "Z[cde[^jEZg.k@t?<QU%Kh>GHEN)<", "ZYoh!IWn7&)L3tC,i)=", "ZQl9Mp", "Z`oP'lNHj-EEWH9d!k",
    "Z<fq/c", "ZJU*]9-G/", "ZFR", "Z`&?.J*K,", "Z\"WM$-fkRT]BQDR<!oQ(L", "ZA&@gS?V",
    "Z.2Fst`?aP\\2G", "Z'VbW^c&Pj9", "Ze6b=m/%S_jP.!U", "Z:SeaHE3g9", "ZU/V,Z", "Z3A]k",
    "Z$#%.", "Zrl2X_1tEAnToYH\"^D", "Zp^4Z:", "ZgtW`P!nn;_^hD)ja#/ub)SEq", "ZQ0h't", "Z_%Mk",
    "Zd6(s&53V,V.bfrR5)", "Z%LdC", "ZSSL0oW.aE", "ZpBb-M@lgo@", "Zp*@bh4^pP_::rH9s1J",
    "Z)4egqN0.U@", "Zde\"Ysr_K", "ZP*rA.Xh$F", "ZRA:%Eb\\):3KDBC", "Z0iXH",
    "Za++3.olZ[oVub+QeN$OH/HZc*Z*", "ZDh5\\'-MI1", "Z9qScb", "ZX2P*CA\\RU+#kj7,i,",
    "ZcUH1N_,[J", "ZnhSC]KGR7o", "ZPCOmR1XQm!", "ZUaEBGKG!", "Z:'f(j:'f-(`B0[=dFm5c>aTiPn_",
    "Z$#p<9&2c", "Z@Q]\\;A6MZ2", "Zs,AC_$GVR", "Z:LljnBTLiY", "Z'CtefcXbO(Xj`-Z]q59-ggi(.WU0",
    "ZQRL=?", "Zg8u1Qs.?J", "Zd3E0<'u", "Z^JM1B/!pJH')J,^qI", "Z]Or6=", "Z.Hl8K", "Z%6D>jS?-0'",
    "Zi^@STgca97B;Y6.", "ZXn6LOi+fC].R:B&2U(", "Z?7K3]&5o-5^D", "ZQjoU.:OTDA?OT@K",
    "Zeu-)LdZ=;h58_1Ab*", "Zl--rGr?Q'oXbWdU^.", "Z1QMR$I+C[*", "Z-t*nm",
    "Z12ME?n\\HE@BL[-#A/S!P", "Z%/A.e16d", "ZsB;$*S&\"W$", "Zr`]Lj=b:[!",
    "Z2\"g<'r\"N>H0`@f'PA", "ZM3$jW", "Z(RH&\"4lI=En><", "Z3W$6W3Hl&", "ZK`@<<,.f",
    "ZdFjsD!srUE?gVWjb?", "ZcjgP>", "Z0f,=hQA#KViZq'R", "Z^@j:QqI[lI", "Z0IEG;PosK8sDo",
    "Z<R@aVb=b", "ZcU$3*b__#JB<aG.*V", "Z=eJC", "Zm#`(n", "Z$q%g#", "ZJ`pT#TqO;B", "Za[Ioorq2",
    "Z;%7:^", "Ze1U\"(%/C`0':e", "ZOCK.nEO", "ZJ?S=H%m'q*7l", "ZCTsR;d6Nd?/kVDh[4/_<jb:ia*cQ",
    "Z6Yn*EIu<", "ZJ2Pre<1#-bAf", "Zrs\"Zh977glQC6'Wsu", "ZrtSVG", "Zk&*<KGLJkF\"D/rfR5O",
    "Z$3][m", "Zh]O4X", "ZHV-L.Yc5n@po]", "Z*nsM", "ZRN%5s", "Zgl'@!Y)VI", "Z+CJf",
    "Z5>GHOd=-3nUGH9T", "ZV5h#L=1&8mr]&", "Z?V,]e!e,XZ0?>e$&_", "ZBc5E-U`\"t#5\\rl0",
    "Z9q^A^`RP;", "ZPV_cTnb%s", "ZK]+C/V;%-q,$'", "ZmdY%3", "Zd'I3", "ZmT<+HgVi+E7Q[fc",
    "ZGgCJ,n.#*a.4Y<M", "Z$o3'mRhJ5", "ZLAJi_Pob\\", "ZXdRcL*0@A?G5^Lg", "ZX%eJYCo+d",
    "Z#Irs>`bj1QUeX7PUV", "ZFaNaktu", "Z&QmS&%fLMn", "Zj;utN:#6kPco%Xb1[u", "Zn.;T0OPeZ",
    "ZUrR;", "Z.,@5Kj)sMC4MI", "Z0&^jN", "ZZff^jZ1", "Z*d<lp8:h$0$J3", "ZE?M9]", "ZoGD\"H",
    "Z,^A2Ha_09D", "Z6[fK8C!IdWW_", "Zbpq]l_^h%0mBBq\\LE@X/4;l1>%[I", "ZVN7sY2:bu",
    "Z+)SsnR]r!4Dn7u4i,", "Z*95/", "ZS/\"ho1bPL", "Z`B69StZf^=>!J%2ib", "ZV1:E!d$2%pG,pV?-T5DE",
    "Z1u+S", "ZL8j@*", "Z'TR#d[V+Pu'u", "ZBSbJr", "ZqjP2+", "ZrXCZ?", "Z-Z'U.G=c",
    "Z<ct$D6g]@7Dk", "Z#;T+N", "Zr-BiP", "Z#\"(Hd0sHrs:_EX:", "Z>i9$J7'VF", "Z6F7[ac/6,IaA",
    "Z'(/MAWos51", "Z18p'XV@PgqsJm0^K\\`tRaD&j", "ZtRLJK1i-", "Z4_^Bl?Y1u'2>b",
    "Z.,3\\e:#OX!.a@<,", "Z:SG+J*ZTDh#f9n\"`*ARU", "Zmuc'>!+;qdnI?.", "Z1=JcZlMns&!3p-7Hi[eE",
    "ZQ>.&", "Z>N/$sn<]#@>V-e+", "Z\"rO^", "Z]A;+b", "Z>uqT1#lFmU#c#X8gU3", "ZXp@PMXD[<Zg>6$`",
    "Z<Rf%Kog", "Z/#XR/QP'd$f8r\\", "Z>+T]hA$]b.%bn4BPT\\<(og", "Z#A?Qd&X7pSqX", "Z9U%,9aoAK=",
    "ZNQepb", "ZOYAe[*ZcW", "Z4b(EH<7D/aq4i(/bt]/WkQ.\\lX91;%/N!?-:[6k", "Z>4H4j.8!63",
    "ZWcAWaG]q$", "ZtKpb`*lSTi#Kdj[Js;", "Z$Lu[@\";]", "ZJ7H", "ZELa\\",
    "ZQqUIY/G3VIUbm;K'X^+a", "ZNV\\rSqR#^CDf$", "ZUKf,Lt6>MsB_5\\:", "Z%RU5`m>EG", "ZBNXpD",
    "ZCET/ObVr1tmtT_j3Cg", "Z>N(rQ2M[", "ZrQD$O`i33]\"b", "ZPYZ)-(ctMB+Sl", "ZsQ3F)qcZ9o",
    "ZMrto`V/oc", "Z]C3=M%-]!", "Z:mg8%]6N^", "ZS85U0", "Z<=/Tjdl#o3o)", "Zf1p=+d[O&Fs7nnT",
    "ZYJSP7", "Zb?VHa=N8]#m]rT*:=2%,*(\"l", "ZiG2n3isbnFtKJ!P", "ZcfQD&Jr#SW+I^", "Z^0h;1",
    "ZP:MU5N\\id", "ZBVTlb40=<6", "Z-3@a(#>IWf%c7`V__", "Z.dZ%`q;>Ot^D", "Z*K'-pB)+A.JXiH>.f",
    "ZJUd0r\"B1i10?", "ZQ>2?/*Z)_CODq./2G", "Z>a6$.Qha41BOV,", "ZQ\\Rr", "Z>X7I+",
    "Z+2gj[pDNVeM_VbN<+IWTB,\\/", "Z'=H?", "Z.ch>", "ZamLM", "Z[H", "Z0j*^[B[Qg5h)", "Z.S[ff",
    "ZM2Qh)Do._T", "Z`?hjFQsi#-t180$:-%", "Zr'_`74:6,l0SM^+3p", "Z55t^E>t6\\j4Q.", "Z$q-N9",
    "ZQ\\gP#m=.i:<;8>)Ke", "ZfUW+l", "Z53DZYQk:ff*ZM6].k", "ZdjA.gXr'7.`JY8lRYG",
    "Z@NW,Kl[%iX]TLQ<*V", "ZRb02", "ZRuB*n^V%hc", "ZUg0rF/iH", "Z0V4@DOj=\\*Q?",
    "Zgs`=Ug:kJq`1dguJIG", "ZaPn;rV\"XK^&GLpP`Y'=", "ZMFJWJ`lD/cX\"@s&W2acnSu", "Z?1IkM1t",
    "Z#5XL^", "ZY=mXak*m@2", "Z[\"DP", "ZW[5b", "Z3i1-", "Z*7-1I`3q^n`[EiB#n",
    "Z:5X^e]lXBG;=-=ri+?<-t`Jo'_hK<#", "ZdO=^fm.;",
    "ZXMi*tY/&a)eA+YgSb^01V2rsF$D@K3Vc:9+19O^3E1qQ", "ZJ!`bt", "ZkP`&t<Zi3;'J;\"3rVo^sGp*o!qhG",
    "ZXnpp$0Z\"@n0sP,R.k", "Z*lU=DO.D_>n.2#Z5,;", "ZB?+VrD[u`#1gumKe,&[uIt",
    "ZQn;Ku*Uf0qZ4i/^?u", "Z!WA%+", "Z`[.Vl#rkLs2)3=5514", "Z*&IUot(r\\:Bgbb+.q9", "ZETTpK",
    "ZP\\if19@1f", "ZK9(b*r.#.n", "Z\"D)CA>qO", "Z\"fNf^k_E", "ZPhN^",
    "ZmM)FGn$\\I;jsKk1;HegnQG`TVeE#hM\"91", "ZQdd9LXN^&lFn.?XMe", "ZP/+=0", "ZrqU=]$e",
    "Z%5G9Ob:$+/V7L,)\"H5Q", "ZIn$#(UL3", "ZJ7V/;>;K/\\OGFi-.k", "ZVN7ab`dQ#4B'Z;",
    "ZG(b?b4<r6", "Z$k;GDKEDO)s!]9HJb", "Z48H'1)TTgG;n", "ZFT9G0)E'fXMX%", "Z[R!=!9CNs",
    "ZHiZu5]Y0-e%'S>h_K`H!r$jjL-BL", "Z8ntm", "Z*62RZ:WtO$n3NrOU*\\", "Z!u.p/:CYE", "Z6iY$+",
    "ZiUZ;2*.1u758:5iQ1", "ZHA4LJDt3F", "Zd$h[H\"pL[QYQ^9KE6aemU!", "Z;6DI-U9)-k", "ZV`?6",
    "Z@`d\\:rH__9Cea(=Ob2tn", "Z_gaSkj(\\Mo@f4/;\"H.tJ", "Zt+_:CdUBEs:JKI?`,I", "Ze`*rP08Eo<",
    "Z>4\\i8`?u,J`2u%FQhRl", "Z`@a0WpIi$`2e", "Znms5ePf", "ZcS'3C0i8-=le", "Zq[&d", "ZBNBO5",
    "Zb^t+l6u#WBi.OoN0F%eo", "Z4)", "Z2IO(YiK#'1>RCm]O_", "Z=f;_&2Vf)\\6lO", "ZbqkQZl808Z",
    "ZQD#]j^Nq;D/Vg[rgX#L/", "Z&CmpVWNYoV>ntcE*hf(8r^%#3MNp", "Zj2f.k%?HYk", "ZgMSci`,qT-:__Og",
    "ZJ]l&bIUk", "ZR#CXf'EX2A6-;7eV,*H", "Z1RQN;p=N+>UR", "Z:!Z4dUc,cJ1(=_s++7", "Z@23/",
    "Z*imC", "ZQ-tVZBg0B92gu+8", "ZBa[MWE1\"n.YFO", "Z<=VGm3@7", "Z]Q][?cjaA`CfTH[ku!RPS5\\L",
    "ZQk+-!dFX", "ZU7Fo", "Z>1n:UQreP[T\\^=0A%`", "Z>KRMn+VsR", "Ze=]M]E5Eem52EBg1J)6[-iXE#",
    "Zn^<#A1g8CdbtI]VsV", "ZdbO!>b>eNgJaDb*(p,", "Z'@`,q?D?8:ej", "Z!hp\\K\"1UDl", "ZB;G*$-l",
    "Z*0*\\Gm?_%>4S\\goBcD)_'e_?#ckVO=MA'E", "ZP^^%", "Zp?OdM", "ZG4\"A#*^_OLQ\"r_@`;",
    "Z2cb\\?BAOCpiD3P!O2L", "Z0R*GU!kl=ajh300", "Zbd[j", "ZUF-&1^1`kT?@*", "Z<Ua@p8J%<`",
    "Zf5JRt/I!o]", "ZtG(F)7^Wgt1l[u;*V", "Z%<LjNi]];OC^I", "ZjV7f'B(iMrM5qr", "Z`5WGn5Le:'",
    "Z>OGZ)iCaHJOnt<8", "ZG]5_q4Ua", "Zqoug", "Z`PQ;O%[3$6hNQ<It<f2h[@F", "ZGO`q0:AMi[:LKZsdQ",
    "ZJlY9Rn3jK+t`Y^*i,", "Z5PGPs", "ZU#rb+iX$0D", "Zm\\NsPfMM",
    "Zhu?t\"bm$F0Jb27tpK_PJtuES/oGp", "Z+#U[tK??!JH*]RV", "Z*e]Lui.s%`.!E0j",
    "Z;B7%h_[OWMq]+>SY2$1)B3>", "Z_5LJGEZbK", "Z8C#?", "Z!VSN4Sa5Gi", "ZB6hSD$AlaG&6I&8i-soO",
    "Z.oa[*C<U\"D!PC", "ZY5GNAq7L[", "ZkKI?aM3\"EFGVFEa7\\DY_.fVJ", "ZQ^nI.WcJ\\",
    "ZOm=Dr:MBX:tmm*g.!l", "Z&>Bpc/7n8", "ZJa?+Et9X`^F#:/0=(g+QWGt\\sqI", "Zn_", "ZD';?",
    "Z1_)k]=+51%..4", "ZQA<+", "Z)i+^30eFcHJ,", "Z`:Jnm([U^,", "ZQAs3EBSa", "ZG4!Wnd,", "Zl6<m",
    "ZcLnQ", "Z>@1ed", "Z4E_ag", "Z@QH_@YOUGc(Y\\Y5I;\\(D", "Zt`o.(BcrRFXGCQhJIk", "Z=Pb3Y",
    "Z=!o24]#B", "ZQ6#0]n3X;`nefg:5;", "Z)5c!F90cB)", "Z0uD&u%<s*`Zqf-L%2TY(", "Z)H\"#E3psC1",
    "ZbkL&(R)@HZag\"&$?fe@", "ZdIO1-`&?.J*K,", "Zepl", "Z`g", "Z0lJq/6gmR]eOG^5tT.", "ZeOp^knO",
    "Z=k\"B.c#G65:?G\\<h3A82.A", "Z5]0!", "ZXGC2Y5*))MO<<g\\", "ZSV?!C3!;", "Zmk,[341`",
    "Zon9bh,hQetfI", "Z!nFJ", "ZrOrJ", "Z.23,Zi.Ib@XG6\"1:0", "Z$&1K,*AgjZW>L`!EO",
    "ZsR3?X%Cb/K&aM", "ZZ5WC", "Z#sPUU1<94", "ZgBhQk", "Z3?bk4=uYjU=#sD>_'@79",
    "ZD6WDO,FMu*kHV", "Z>R>%':=]5M:teoddF:D", "Zeog<", "ZgC3L3*Qs4nQc)@9+im", "ZFI$Oi@<V5",
    "Z4-ZJ;!f", "Z:0[_", "ZqaeXaVU", "ZA5%R.Y\\@JT]2", "Z\"-R`#RfT\"",
    "ZSP>_th))H`g(A:nccR_cUd(PSrP4", "Z;`rW':K64", "ZU%tU!Z(kY?*!", "ZhkJqBi:2", "ZH4[O",
    "Z#Ikn$*0@C=B>qS\\.k", "Z,6ZdE/4fX\"SfdF", "ZA@98!Z=!qYGU", "Z\"EA#N*QBte2?c", "Z#]SdYWW",
    "Z.HdoYdD$c1nnfT`G4c", "Z9HqZR$`2^d&U:d+", "Zi\"\\mJ**ahUn<=WS*Dd", "ZhQO'om$G4Jib",
    "Z/<6mUM4fjsGj", "Z5n:FS:teoddF:D", "ZFYYf", "Zo^Cdb4;2%$Wr,", "Ze$CeOW1S[c\"TQQK",
    "Z]QXO/", "Z[&5t@M=8=spONmQ", "Z:OOntQk8;Yn(1/Dn9&eu*7%S", "ZKKb=", "Z*7p?>;Q8fWak",
    "ZI]BA", "ZfaAP*jp,)'^I_p", "Zg:fa_", "Zn$B+?krNGRCud;#Tb", "Z$7kfV#Q%$\\*K&#P",
    "ZoGqd_f=,PWFR", "Zf3at", "Zt_c;",
    "ZgZpOH`m]&A<@\\G?p1Z,Z6?X4TFED]Vf@er`\"Z2>-b2.PK`6;(4i,", "Z1M^9R8LkfEiiLC=V^:_9", "Zg;lH",
    "Z%/;P&U3rtK]7P#Q6\"O;", "Z%f@=#_'", "ZT?4Tu0nU89JBtQiSYF=hFR", "Z^d&MT6sH!3-!Ul",
    "ZWuimVMsN)[cM+CWl:eu*", "ZPa\\/TY;YZFj,Er`", "ZB&M<MNgY=k3\\@b_9\"'",
    "ZnTFN2J*L;5)5\\n(8sM", "Z!ln@_02LBBJY*2", "Z]H'8;7`0=\"4T6hp(DsJl", "Zs6NlniPFOB",
    "Z2<\"QY,'l_?\"G/a", "Zaoeo=d*iSc", "Z*aW0H;3VU-rM[a;q_PD406k.%Y1O9&'Xr2jrA", "ZCsMr4>iRAa",
    "ZR[s;N9RFsrMak", "Z,_3e<1JRQZ", "Z+).a>,Tjo;W-Vtbb)3.5", "Z7UK&U+l", "ZWid*/pVIR",
    "ZX`_U#", "ZV4d*", "Z]W\"Q`toKdJR=`", "Zmu8XL@dlYjc6)-o&2iQhEd$c", "Zlk7Rc?%LlQ+3Q*",
    "ZmXG7-", "Zr[p=#23nQb^NM$WG)Jms", "Z/[=A5fiRkt5O5L9ml2", "Zsu", "ZFW71", "Z*CCo4",
    "Zt.6Pk0k\";>5,(&VGU", "Zn8ZNt3LQk/", "ZPB%s3", "Z*^13q>$e+", "ZqIEHaf>'Kp14jV;Q'JSD",
    "Z:AjT", "ZMD", "ZmkDKgBM,*HMG", "ZQ&jpR0q7ad", "ZTsccc46RS<;t_P", "Zf1o<TOc@i",
    "Zl&3Y0-A@U&5X!<,gWD7r3dr0084%`dXWk+X;dT*",
    "Z!@Z@4(!)t7Nt^kGfkU.jq\")V.$$0-qXsE[7/P\\RTkI#ghl-em)f$HOU8V<*>X#0lF&2q$f7As&4CL!f]i]&\")8l+mM]^ZAN#H,q?qT-m-5<UJ^E_",
    "ZXQj@Cm?C\\aDBa0", "ZUC2Obm4E;U5_0Xs]2", "Z[g:Ra", "ZpcTsT$.+^5", "ZQh(lD5['PTiKiF@",
    "ZoJqo$W$0&\"Y_.", "ZYOV,q", "ZsI;9@n(-)",
    "Z/P)*]W;Z\\4UNAt)tZXjZO5)r/oieOokqLf'D^Ybsp<T(-nCgLt.n%,\\X%hW(r0,C_;UH", "Z[rkJj+tIn1",
    "ZH!A;U/\\Z\"5", "ZUYW0C", "Z+<BtUIjeRYR(0", "ZgP'XUie8`#5<1TXtu", "Z-3/M?f+Ib+cl",
    "Z^(pjb\"CS", "ZX<IFJpMJ6r,B3TGTY(qqks", "Z/j'dhmq#<.,e", "ZG?(:", "ZBL?@A*ZM1).A",
    "Z\"nF,\"sH_A", "Z(M9_u^O>\"", "Zc\\jo,;7lr", "ZE+*%#7s1", "ZGqX8YXnbi3G#u=Vdb",
    "Z6Q^fUiN;,", "Zf*gAh", "ZiR8Gc", "Z:G\\o`", "Z#rc7uX%Wh9", "Z;e&rc5?=b3Q4UoCo%Kfr",
    "Zgo_L", "Z.=ZH#", "Zn^\\FO,m,%", "Z%lXd19<QW+'!", "Z;M)C<.YR7p", "Z:6k;Wnio91TTPS,[#>Zh",
    "Z^#J#P0Lg=VB6", "ZR:Iu", "ZI$-k:", "ZJ!bSYtZ,AZfj", "Znjj!;", "Zb'j-_+-jca",
    "ZccJDGPAVlbf\\R", "Z2=>JRO&?*9il[8/n]Q", "Z`\"bDP5R$X+CJ!3sKJgJ8TfjJWf\\12r",
  }

  for index, value in ipairs({ { 1, 3287 }, { 1, 2976 }, { 2977, 3287 } }) do
    while value[1] < value[2] do
      v1[value[1]], v1[value[2]], value[1], value[2] = v1[value[2]], v1[value[1]], value[1] + 1, value[2] - 1
    end
  end

  do
    local sub = string.sub

    local v2 = {
      B = 31,
      o = 46,
      K = 41,
      ["+"] = 67,
      k = 75,
      ["("] = 64,
      d = 34,
      ["%"] = 58,
      ["2"] = 32,
      ["\\"] = 83,
      U = 17,
      p = 6,
      g = 23,
      ["-"] = 76,
      O = 27,
      ["`"] = 37,
      [")"] = 78,
      q = 3,
      l = 14,
      ["#"] = 24,
      r = 74,
      ["9"] = 10,
      [":"] = 22,
      h = 19,
      ["&"] = 9,
      ["'"] = 53,
      E = 0,
      N = 55,
      D = 11,
      t = 26,
      V = 30,
      X = 18,
      ["]"] = 61,
      W = 54,
      ["4"] = 1,
      _ = 81,
      ["/"] = 73,
      u = 84,
      C = 13,
      b = 60,
      ["8"] = 4,
      a = 56,
      ["6"] = 42,
      G = 39,
      ["7"] = 40,
      ["^"] = 68,
      ["!"] = 2,
      A = 20,
      Y = 65,
      S = 80,
      J = 25,
      [">"] = 21,
      [","] = 5,
      ["*"] = 35,
      ["\""] = 43,
      ["@"] = 70,
      [";"] = 51,
      ["?"] = 8,
      i = 16,
      c = 49,
      s = 44,
      ["="] = 52,
      Q = 33,
      e = 66,
      ["."] = 38,
      P = 47,
      ["<"] = 59,
      H = 29,
      F = 71,
      R = 57,
      ["3"] = 7,
      ["0"] = 15,
      T = 79,
      f = 48,
      ["$"] = 77,
      n = 36,
      ["5"] = 28,
      ["["] = 62,
      I = 72,
      j = 45,
      m = 12,
      Z = 69,
      M = 50,
      L = 82,
      ["1"] = 63,
    }

    local floor = math.floor

    local v3 = {
      F = 15,
      l = 44,
      Y = 14,
      Q = 4,
      i = 26,
      M = 60,
      ["7"] = 51,
      y = 35,
      r = 5,
      ["+"] = 38,
      ["8"] = 63,
      Z = 59,
      R = 21,
      m = 18,
      u = 24,
      A = 20,
      ["0"] = 45,
      ["1"] = 43,
      C = 3,
      e = 30,
      B = 13,
      W = 54,
      a = 10,
      g = 47,
      I = 1,
      x = 0,
      O = 6,
      o = 34,
      v = 2,
      w = 42,
      X = 12,
      N = 62,
      ["3"] = 58,
      ["5"] = 36,
      t = 9,
      p = 57,
      ["4"] = 16,
      S = 37,
      ["/"] = 23,
      V = 61,
      ["9"] = 33,
      d = 19,
      j = 39,
      U = 52,
      q = 29,
      z = 27,
      K = 31,
      f = 46,
      D = 40,
      P = 7,
      H = 8,
      L = 48,
      k = 50,
      T = 22,
      n = 25,
      J = 41,
      b = 53,
      ["2"] = 28,
      c = 55,
      G = 32,
      ["6"] = 11,
      h = 56,
      E = 17,
      s = 49,
    }

    local char = string.char
    local concat = table.concat
    local insert = table.insert
    local len = string.len
    local v4 = type

    for i = 1, #v1 do
      local v5 = v1[i]

      if v4(v5) == "string" then
        local v6 = sub(v5, 1, 1)

        if v6 == "u" then
          v5 = sub(v5, 2)
          local v7 = len(v5)
          local v8 = {}
          local v9 = 1
          local v10 = 0
          local v11 = 0

          while v9 <= v7 do
            local v12 = sub(v5, v9, v9)
            local v13 = v3[v12]

            if v13 then
              v10 = v10 + v13 * 64 ^ (3 - v11)
              v11 = v11 + 1

              if v11 == 4 then
                v11 = 0
                insert(v8, char(floor(v10 / 65536), floor(v10 % 65536 / 256), v10 % 256))
                v10 = 0
              end
            elseif v12 == "=" then
              insert(v8, char(floor(v10 / 65536)))

              if v9 >= v7 or sub(v5, v9 + 1, v9 + 1) ~= "=" then
                insert(v8, char(floor(v10 % 65536 / 256)))
              end

              break
            end

            v9 = v9 + 1
          end

          v1[i] = concat(v8)
        elseif v6 == "Z" then
          v5 = sub(v5, 2)
          local v14 = len(v5)
          local v15 = {}
          local v16 = 1

          while v16 <= v14 do
            local v17 = v14 - v16 + 1
            local v18 = v17 >= 5 and 5 or v17
            local v19 = 0
            local v20 = v18 > 1

            for j = 0, 4 do
              local v21

              if j < v18 then
                v21 = v2[sub(v5, v16 + j, v16 + j)]

                if not v21 then
                  v20 = false
                  break
                end
              else
                v21 = 84
              end

              v19 = v19 * 85 + v21
            end

            if v20 then
              local v22 = floor(v19 / 16777216) % 256
              local v23 = floor(v19 / 65536) % 256
              local v24 = floor(v19 / 256) % 256
              local v25 = v19 % 256

              if v18 == 5 then
                insert(v15, char(v22, v23, v24, v25))
              elseif v18 == 4 then
                insert(v15, char(v22, v23, v24))
              elseif v18 == 3 then
                insert(v15, char(v22, v23))
              elseif v18 == 2 then
                insert(v15, char(v22))
              end
            end

            v16 = v16 + v18
          end

          v1[i] = concat(v15)
        end
      end
    end
  end
end

local v26 = 2
local floor2 = math.floor
local v27 = 0
local v28 = {}

do
  local char2 = string.char
  local remove = table.remove
  local random = math.random
  local v29 = {}

  for k = 1, 256 do
    v29[k] = k
  end

  while true do
    local v30 = remove(v29, (random(1, #v29)))
    v28[v30] = char2(v30 - 1)

    if #v29 == 0 then
      break
    end
  end
end

local v31 = {}

local function f1()
  if #v31 == 0 then
    v27 = (v27 * 213 + 27552854471197) % 35184372088832

    while true do
      v26 = v26 * 201 % 257

      if v26 ~= 1 then
        break
      end
    end

    local v32 = v26 % 32
    local v33 = floor2(v27 / 2 ^ (13 - (v26 - v32) / 32)) % 4294967296 / 2 ^ v32
    local v34 = floor2(v33 % 1 * 4294967296) + floor2(v33)
    local v35 = v34 % 65536
    local v36 = (v34 - v35) / 65536
    v31 = { v35 % 256, (v35 - v35 % 256) / 256, v36 % 256, (v36 - v36 % 256) / 256 }
  end

  local v37 = #v31
  local v38 = v31[v37]
  v31[v37] = nil
  return v38
end

local v39 = {}
v40 = setmetatable({}, { __index = v39, __metatable = nil })

local function f2(p1, p2)
  if v39[p2] then
    return p2
  else
    v31 = {}
    v27 = p2 % 35184372088832
    local text = ""
    v26 = p2 % 255 + 2
    local v41 = #p1
    v39[p2] = ""
    local v42 = 204
    local count = 0

    while true do
      count = 1 + count

      if not (count <= v41) then
        break
      end

      v42 = (string.byte(p1, count) + f1() + v42) % 256
      text = text .. v28[v42 + 1]
    end

    v39[p2] = text
    return p2
  end
end

localPlayer = players.LocalPlayer
getMouse = localPlayer:GetMouse()
currentCamera = workspace.CurrentCamera
v43 = true
v44 = {}

local function f3(p3)
  table.insert(v44, p3)
  return p3
end

v45 = {}

local function f4()
  if not isfile or not readfile or not isfile("mm2_hub_settings.json") then
    return {}
  else
    local v46, v47 = pcall(function()
      return httpService:JSONDecode(readfile("mm2_hub_settings.json"))
    end)

    if v46 and type(v47) == "table" then
      return v47
    end

    return {}
  end
end

local function f5(p4)
  if not writefile then
    return
  end

  pcall(function() writefile("mm2_hub_settings.json", httpService:JSONEncode(p4)) end)
end

v48 = f4()
ThemeHue = v48.ThemeHue or 140
RainbowThemeEnabled = v48.RainbowThemeEnabled == true
HotkeyKey = Enum.KeyCode[v48.HotkeyKey or "RightShift"]
WaitingForKey = false
XrayKey = Enum.KeyCode[v48.XrayKey or "X"]
WaitingForXrayKey = false
GuiScale = v48.GuiScale or 1
SaturationValue = v48.SaturationValue or 0
CustomCursorID = v48.CustomCursorID or ""
CustomCursorSize = v48.CustomCursorSize or 32
CursorSpinEnabled = v48.CursorSpinEnabled == true
CursorSpinSpeed = v48.CursorSpinSpeed or 15
CursorAngleEnabled = v48.CursorAngleEnabled == true
CursorAngle = v48.CursorAngle or 0
ActiveGunSoundID = v48.ActiveGunSoundID or ""
CustomTime = v48.CustomTime or 14
CustomTimeEnabled = v48.CustomTimeEnabled == true
InnocentHue = v48.InnocentHue or 120
MurdererHue = v48.MurdererHue or 0
SheriffHue = v48.SheriffHue or 240
GunHue = v48.GunHue or 180
EspFillTransparency = v48.EspFillTransparency or 100
GunEspFillTransparency = v48.GunEspFillTransparency or 70
ChamsESPEnabled = v48.ChamsESPEnabled ~= false
RoleESPEnabled = v48.RoleESPEnabled ~= false
GunESPEnabled = v48.GunESPEnabled ~= false
GunTextESPEnabled = v48.GunTextESPEnabled ~= false
XrayEnabled = v48.XrayEnabled == true
FreecamEnabled = v48.FreecamEnabled == true
FreecamSpeed = v48.FreecamSpeed or 50
NoclipEnabled = v48.NoclipEnabled == true
FlyEnabled = v48.FlyEnabled == true
AntiFlingEnabled = v48.AntiFlingEnabled == true
InfiniteZoomEnabled = v48.InfiniteZoomEnabled == true
InfiniteJumpEnabled = v48.InfiniteJumpEnabled == true
AimAssistEnabled = v48.AimAssistEnabled == true
AimAssistTarget = v48.AimAssistTarget or "Head"
AimAssistRoleFilter = v48.AimAssistRoleFilter or "All"
AimAssistOnlyWithGun = v48.AimAssistOnlyWithGun == true
AutoGrabGunEnabled = v48.AutoGrabGunEnabled == true
AutoShootEnabled = v48.AutoShootEnabled == true
AntiAFKEnabled = v48.AntiAFKEnabled == true
MotionBlurEnabled = v48.MotionBlurEnabled == true
MotionBlurIntensity = v48.MotionBlurIntensity or 120
MotionBlurThreshold = v48.MotionBlurThreshold or 5
CoinFarmEnabled = v48.CoinFarmEnabled == true
v49 = v48.CustomFOVEnabled == true
playerSpeed = v48.PlayerSpeed or 16
playerJump = v48.PlayerJump or 50
flySpeed = v48.FlySpeed or 50
playerSpinSpeed = v48.PlayerSpinSpeed or 0
playerFOV = v48.PlayerFOV or 70
maxZoomDist = v48.MaxZoomDist or 400
fpsCap = v48.FpsCap or 60
v50 = v48.AimAssistPredictionEnabled ~= false
aimAssistPrediction = v48.AimAssistPrediction or 150
orbitSpeed = v48.OrbitSpeed or 60

local function f6()
  if RainbowThemeEnabled then
    return Color3.fromHSV(tick() % 5 / 5, 0.8, 0.9)
  end

  return Color3.fromHSV(ThemeHue / 360, 0.8, 0.9)
end

orbitDistance = v48.OrbitDistance or 10

local function f7()
  f5({
    AimAssistPredictionEnabled = v50,
    AimAssistPrediction = aimAssistPrediction,
    OrbitSpeed = orbitSpeed,
    ThemeHue = ThemeHue,
    RainbowThemeEnabled = RainbowThemeEnabled,
    HotkeyKey = HotkeyKey.Name,
    XrayKey = XrayKey.Name,
    OrbitDistance = orbitDistance,
    GuiScale = GuiScale,
    SaturationValue = SaturationValue,
    ChamsESPEnabled = ChamsESPEnabled,
    RoleESPEnabled = RoleESPEnabled,
    GunESPEnabled = GunESPEnabled,
    GunTextESPEnabled = GunTextESPEnabled,
    XrayEnabled = XrayEnabled,
    AntiAFKEnabled = AntiAFKEnabled,
    FreecamEnabled = FreecamEnabled,
    FreecamSpeed = FreecamSpeed,
    NoclipEnabled = NoclipEnabled,
    FlyEnabled = FlyEnabled,
    AntiFlingEnabled = AntiFlingEnabled,
    InfiniteZoomEnabled = InfiniteZoomEnabled,
    InfiniteJumpEnabled = InfiniteJumpEnabled,
    AimAssistEnabled = AimAssistEnabled,
    AimAssistTarget = AimAssistTarget,
    AimAssistRoleFilter = AimAssistRoleFilter,
    AimAssistOnlyWithGun = AimAssistOnlyWithGun,
    AutoGrabGunEnabled = AutoGrabGunEnabled,
    AutoShootEnabled = AutoShootEnabled,
    MotionBlurEnabled = MotionBlurEnabled,
    MotionBlurIntensity = MotionBlurIntensity,
    MotionBlurThreshold = MotionBlurThreshold,
    CoinFarmEnabled = CoinFarmEnabled,
    CustomFOVEnabled = v49,
    PlayerSpeed = playerSpeed,
    PlayerJump = playerJump,
    FlySpeed = flySpeed,
    PlayerSpinSpeed = playerSpinSpeed,
    PlayerFOV = playerFOV,
    MaxZoomDist = maxZoomDist,
    FpsCap = fpsCap,
    CustomCursorID = CustomCursorID,
    CustomCursorSize = CustomCursorSize,
    CursorSpinEnabled = CursorSpinEnabled,
    CursorSpinSpeed = CursorSpinSpeed,
    CursorAngleEnabled = CursorAngleEnabled,
    CursorAngle = CursorAngle,
    ActiveGunSoundID = ActiveGunSoundID,
    CustomTime = CustomTime,
    CustomTimeEnabled = CustomTimeEnabled,
    InnocentHue = InnocentHue,
    MurdererHue = MurdererHue,
    SheriffHue = SheriffHue,
    GunHue = GunHue,
    EspFillTransparency = EspFillTransparency,
    GunEspFillTransparency = GunEspFillTransparency,
  })
end

local total = 0

local function f8()
  local v51 = f6()

  for index2, value2 in ipairs(v45) do
    if value2.inst and value2.inst.Parent then
      value2.inst[value2.prop] = v51
    end
  end
end

f3(runService.Heartbeat:Connect(function()
  if RainbowThemeEnabled and v43 then
    f8()
  end
end))

local function f9()
  for index3, value3 in ipairs(workspace:GetChildren()) do
    if value3:FindFirstChild("CoinContainer") and value3:FindFirstChild("Spawns") then
      return value3
    end
  end

  return nil
end

local function f10(p5)
  local v52 = not p5
  local f11, v53, character, character2, humanoid, humanoidRootPart, f12

  if v52 or not p5.Character then
    return
  else
    character = localPlayer.Character

    local humanoid2 = character
      and (character:FindFirstChildOfClass("Humanoid") or character:FindFirstChild("Humanoid"))

    local humanoidRootPart2 = character
      and (character:FindFirstChild("HumanoidRootPart") or character.PrimaryPart)

    local handle = nil
    local head = nil
    local accessory = nil
    character2 = p5.Character
    humanoid = nil
    humanoidRootPart = nil

    if character2 and character2:FindFirstChildOfClass("Humanoid") then
      humanoid = character2:FindFirstChildOfClass("Humanoid")
    end

    if humanoid then
      humanoidRootPart = character2:FindFirstChild("HumanoidRootPart") or character2.PrimaryPart
        or humanoid.RootPart
    end

    if character2 and character2:FindFirstChild("Head") then
      head = character2.Head
    end

    if character2 and character2:FindFirstChildOfClass("Accessory") then
      accessory = character2:FindFirstChildOfClass("Accessory")
    end

    if accessory and accessory:FindFirstChild("Handle") then
      handle = accessory.Handle
    end

    if character and humanoid2 and humanoidRootPart2 then
      if humanoidRootPart2.Velocity.Magnitude < 50 then
        getgenv().OldPos = humanoidRootPart2.CFrame
      end

      local currentCamera2 = workspace.CurrentCamera

      if head then
        currentCamera2.CameraSubject = head
      elseif not head and handle then
        currentCamera2.CameraSubject = handle
      elseif humanoid and humanoidRootPart then
        currentCamera2.CameraSubject = humanoid
      end

      if not (character2 and character2:FindFirstChildWhichIsA("BasePart")) then
        return
      end

      function f12(p6, p7, p8)
        humanoidRootPart2.CFrame = CFrame.new(p6.Position) * p7 * p8

        pcall(function()
          if character and character.PrimaryPart then
            character:SetPrimaryPartCFrame(CFrame.new(p6.Position) * p7 * p8)
          end
        end)

        humanoidRootPart2.Velocity = Vector3.new(90000000, 900000000, 90000000)
        humanoidRootPart2.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
      end

      function f11(p9)
        local v54 = tick()
        local total2 = 0
        local sit

        repeat
          if humanoidRootPart2 and humanoid then
            if p9.Velocity.Magnitude < 50 then
              total2 = total2 + 100

              f12(
                p9,
                CFrame.new(0, 1.5, 0) + humanoid.MoveDirection * p9.Velocity.Magnitude / 1.25,
                CFrame.Angles(math.rad(total2), 0, 0)
              )

              task.wait()

              f12(
                p9,
                CFrame.new(0, -1.5, 0) + humanoid.MoveDirection * p9.Velocity.Magnitude / 1.25,
                CFrame.Angles(math.rad(total2), 0, 0)
              )

              task.wait()

              f12(p9, CFrame.new(2.25, 1.5, -2.25)
                + humanoid.MoveDirection * p9.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(total2), 0, 0))

              task.wait()

              f12(p9, CFrame.new(-2.25, -1.5, 2.25)
                + humanoid.MoveDirection * p9.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(total2), 0, 0))

              task.wait()

              f12(
                p9, CFrame.new(0, 1.5, 0) + humanoid.MoveDirection,
                CFrame.Angles(math.rad(total2), 0, 0)
              )

              task.wait()

              f12(
                p9, CFrame.new(0, -1.5, 0) + humanoid.MoveDirection,
                CFrame.Angles(math.rad(total2), 0, 0)
              )

              task.wait()
            else
              f12(p9, CFrame.new(0, 1.5, humanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
              task.wait()
              f12(p9, CFrame.new(0, -1.5, -humanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
              task.wait()
              f12(p9, CFrame.new(0, 1.5, humanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
              task.wait()

              f12(p9, CFrame.new(
                0, 1.5, humanoidRootPart and humanoidRootPart.Velocity.Magnitude / 1.25 or 0
              ), CFrame.Angles(math.rad(90), 0, 0))

              task.wait()

              f12(p9, CFrame.new(
                0, -1.5, -(humanoidRootPart and humanoidRootPart.Velocity.Magnitude / 1.25 or 0)
              ), CFrame.Angles(0, 0, 0))

              task.wait()

              f12(p9, CFrame.new(
                0, 1.5, humanoidRootPart and humanoidRootPart.Velocity.Magnitude / 1.25 or 0
              ), CFrame.Angles(math.rad(90), 0, 0))

              task.wait()
              f12(p9, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
              task.wait()
              f12(p9, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
              task.wait()
              f12(p9, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(-90), 0, 0))
              task.wait()
              f12(p9, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
              task.wait()
            end

            local v55 = p9.Velocity.Magnitude > 500

            sit = v55

            sit = v55 or p9.Parent ~= p5.Character or p5.Parent ~= players
              or p5.Character ~= character2 or humanoid and humanoid.Sit
              or humanoid2 and humanoid2.Health <= 0 or tick() > v54 + 2
          else
            break
          end
        until sit
      end

      if not getgenv().FPDH then
        getgenv().FPDH = workspace.FallenPartsDestroyHeight
      end

      workspace.FallenPartsDestroyHeight = (0 / 0)

      local epixVel = Instance.new("BodyVelocity")
      epixVel.Name = "EpixVel"
      epixVel.Parent = humanoidRootPart2
      epixVel.Velocity = Vector3.new(900000000, 900000000, 900000000)
      epixVel.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

      humanoid2:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

      if humanoidRootPart and head then
        if (humanoidRootPart.CFrame.p - head.CFrame.p).Magnitude > 5 then
          f11(head)
        else
          f11(humanoidRootPart)
        end
      elseif humanoidRootPart and not head then
        f11(humanoidRootPart)
      elseif not humanoidRootPart and head then
        f11(head)
      elseif not humanoidRootPart and not head and accessory and handle then
        f11(handle)
      end

      if epixVel and epixVel.Parent then
        epixVel:Destroy()
      end

      humanoid2:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
      workspace.CurrentCamera.CameraSubject = humanoid2

      repeat
        if getgenv().OldPos then
          humanoidRootPart2.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0)

          pcall(function()
            if character and character.PrimaryPart then
              character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, 0.5, 0))
            end
          end)
        end

        humanoid2:ChangeState(Enum.HumanoidStateType.GettingUp)

        for index4, value4 in ipairs(character:GetChildren()) do
          if value4:IsA("BasePart") then
            local vector = Vector3.new()
            local vector2 = Vector3.new()

            value4.Velocity = vector
            value4.RotVelocity = vector2
          end
        end

        task.wait()

        v53 = not getgenv().OldPos
          or (humanoidRootPart2.Position - getgenv().OldPos.p).Magnitude < 25
      until v53

      if getgenv().FPDH then
        workspace.FallenPartsDestroyHeight = getgenv().FPDH
      end

      return
    end

    return
  end
end

f3(runService.Heartbeat:Connect(function(delta)
  if not v43 then
    return
  else
    local character3 = localPlayer.Character
    local humanoidRootPart3 = character3 and character3:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart3 and playerSpinSpeed > 0 then
      humanoidRootPart3.CFrame = humanoidRootPart3.CFrame
        * CFrame.Angles(0, math.rad(playerSpinSpeed * delta * 10), 0)
    end

    if v56 and v56.Character and v56.Character:FindFirstChild("HumanoidRootPart") then
      local character4 = localPlayer.Character

      if character4 and character4:FindFirstChild("HumanoidRootPart") then
        total = total + math.rad(orbitSpeed * delta)

        character4.HumanoidRootPart.CFrame = CFrame.new(v56.Character.HumanoidRootPart.Position)
          * CFrame.Angles(0, total, 0) * CFrame.new(0, 0, orbitDistance)
      end
    end

    return
  end
end))

alienware = Instance.new("ScreenGui")
alienware.Name = "Alienware"
alienware.ResetOnSpawn = false
alienware.IgnoreGuiInset = true
alienware.Parent = game.CoreGui

customCursorOverlay = Instance.new("ImageLabel")
customCursorOverlay.Name = "CustomCursorOverlay"
customCursorOverlay.BackgroundTransparency = 1
customCursorOverlay.BorderSizePixel = 0
customCursorOverlay.BorderColor3 = Color3.fromRGB(0, 0, 0)
customCursorOverlay.AnchorPoint = Vector2.new(0.5, 0.5)
customCursorOverlay.Size = UDim2.new(0, CustomCursorSize, 0, CustomCursorSize)
customCursorOverlay.ZIndex = 9999
customCursorOverlay.Visible = false
customCursorOverlay.Parent = alienware

local f13

local function f14()
  local v57 = f13(CustomCursorID)

  if v57 ~= "" then
    userInputService.MouseIconEnabled = false
    getMouse.Icon = "rbxasset://textures/Blank.png"

    customCursorOverlay.Image = v57
    customCursorOverlay.Size = UDim2.new(0, CustomCursorSize, 0, CustomCursorSize)
    customCursorOverlay.Visible = true
  else
    userInputService.MouseIconEnabled = true
    getMouse.Icon = ""
    customCursorOverlay.Visible = false
  end
end

function f13(p10)
  if p10 == "" then
    return ""
  else
    local gsub = p10:gsub("%D", "")

    if gsub ~= "" then
      return "rbxthumb://type=Asset&id=" .. gsub .. "&w=150&h=150"
    end

    return ""
  end
end

f3(runService.RenderStepped:Connect(function(delta2)
  if customCursorOverlay.Visible and v43 then
    local getMouseLocation = userInputService:GetMouseLocation()
    customCursorOverlay.Position = UDim2.new(0, getMouseLocation.X, 0, getMouseLocation.Y)

    if CursorSpinEnabled then
      customCursorOverlay.Rotation = (customCursorOverlay.Rotation
          + CursorSpinSpeed * delta2 * 20)
        % 360
    elseif CursorAngleEnabled then
      customCursorOverlay.Rotation = CursorAngle
    else
      customCursorOverlay.Rotation = 0
    end

    if userInputService.MouseIconEnabled then
      userInputService.MouseIconEnabled = false
    end
  end
end))

local function f15()
  if setfpscap then
    pcall(function() setfpscap(fpsCap) end)
  end
end

local function f16()
  local character5 = localPlayer.Character

  if not character5 then
    return
  else
    local humanoid3 = character5:FindFirstChildOfClass("Humanoid")

    if humanoid3 then
      humanoid3.WalkSpeed = playerSpeed
      humanoid3.JumpPower = playerJump
    end

    return
  end
end

f3(runService.Stepped:Connect(function()
  if not v43 then
    return
  else
    local character6 = localPlayer.Character

    if character6 then
      local humanoid4 = character6:FindFirstChildOfClass("Humanoid")

      if humanoid4 then
        if humanoid4.WalkSpeed ~= playerSpeed then
          humanoid4.WalkSpeed = playerSpeed
        end

        if humanoid4.JumpPower ~= playerJump then
          humanoid4.JumpPower = playerJump
        end
      end
    end

    return
  end
end))

f3(userInputService.JumpRequest:Connect(function()
  if InfiniteJumpEnabled and v43 then
    local character7 = localPlayer.Character
    local humanoid5 = character7 and character7:FindFirstChildOfClass("Humanoid")

    if humanoid5 then
      humanoid5:ChangeState(Enum.HumanoidStateType.Jumping)
    end
  end
end))

local function f17()
  if v49 then
    currentCamera.FieldOfView = playerFOV
  else
    currentCamera.FieldOfView = 70
  end
end

local function f18(cameraMinZoomDistance, cameraMaxZoomDistance)
  localPlayer.CameraMinZoomDistance = cameraMinZoomDistance
  localPlayer.CameraMaxZoomDistance = cameraMaxZoomDistance
end

local function f19()
  pcall(function() runService:UnbindFromRenderStep("AlienwareZoomOverride") end)

  runService:BindToRenderStep("AlienwareZoomOverride", Enum.RenderPriority.Camera.Value + 1, function()
    if not InfiniteZoomEnabled or not v43 then
      pcall(function() runService:UnbindFromRenderStep("AlienwareZoomOverride") end)
      return
    end

    f18(0.5, maxZoomDist)
  end)
end

local function f20()
  pcall(function() runService:UnbindFromRenderStep("AlienwareZoomOverride") end)
  f18(0.5, 400)
end

f3(localPlayer.CharacterAdded:Connect(function()
  task.wait(0.6)
  f16()
  f17()
  f14()

  if InfiniteZoomEnabled then
    f19()
  end
end))

local v58 = true
local anchored = false
local connect, connect2, instance

local function f22()
  f21()
  local v59, v60

  if not FreecamEnabled or not v43 then
    return
  else
    instance = Instance.new("Part", workspace)
    instance.Anchored = true
    instance.CanCollide = false
    instance.Transparency = 1
    instance.CFrame = currentCamera.CFrame

    currentCamera.CameraType = Enum.CameraType.Scriptable
    local character8 = localPlayer.Character

    local humanoidRootPart4 = character8
    humanoidRootPart4 = character8 and character8:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart4 then
      anchored = humanoidRootPart4.Anchored
      humanoidRootPart4.Anchored = true
    end

    v58 = true
    local lookVector = currentCamera.CFrame.LookVector
    v59 = math.atan2(-lookVector.X, -lookVector.Z)
    v60 = math.asin(math.clamp(lookVector.Y, -1, 1))

    connect2 = userInputService.InputBegan:Connect(function(input, p11)
      if p11 then
        return
      end

      if input.KeyCode == Enum.KeyCode.V then
        v58 = not v58
      end
    end)

    connect = runService.RenderStepped:Connect(function(delta3)
      if not FreecamEnabled or not v43 then
        f21()
        return
      else
        if v58 then
          userInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
          local getMouseDelta = userInputService:GetMouseDelta()
          v59 = v59 - math.rad(getMouseDelta.X * 0.25)

          v60 = math.clamp(
            v60 - math.rad(getMouseDelta.Y * 0.25), -math.pi / 2 + 0.01, math.pi / 2 - 0.01
          )
        else
          userInputService.MouseBehavior = Enum.MouseBehavior.Default
        end

        local v61 = CFrame.new(instance.Position) * CFrame.Angles(0, v59, 0)
          * CFrame.Angles(v60, 0, 0)

        local zero = Vector3.zero

        if userInputService:IsKeyDown(Enum.KeyCode.W) then
          zero = zero + v61.LookVector
        end

        if userInputService:IsKeyDown(Enum.KeyCode.S) then
          zero = zero - v61.LookVector
        end

        if userInputService:IsKeyDown(Enum.KeyCode.A) then
          zero = zero - v61.RightVector
        end

        if userInputService:IsKeyDown(Enum.KeyCode.D) then
          zero = zero + v61.RightVector
        end

        if userInputService:IsKeyDown(Enum.KeyCode.Space) then
          zero = zero + Vector3.yAxis
        end

        if userInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
          zero = zero - Vector3.yAxis
        end

        if zero.Magnitude > 0 then
          instance.CFrame = CFrame.new(instance.Position + zero.Unit * (FreecamSpeed * delta3))
            * CFrame.Angles(0, v59, 0) * CFrame.Angles(v60, 0, 0)
        else
          instance.CFrame = v61
        end

        currentCamera.CFrame = instance.CFrame
        return
      end
    end)

    return
  end
end

function f21()
  if connect then
    connect:Disconnect()
    connect = nil
  end

  if connect2 then
    connect2:Disconnect()
    connect2 = nil
  end

  if instance then
    instance:Destroy()
    instance = nil
  end

  currentCamera.CameraType = Enum.CameraType.Custom
  userInputService.MouseBehavior = Enum.MouseBehavior.Default
  local character9 = localPlayer.Character

  if character9 then
    local humanoidRootPart5 = character9:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart5 then
      humanoidRootPart5.Anchored = anchored
    end

    local humanoid6 = character9:FindFirstChildOfClass("Humanoid")

    if humanoid6 then
      currentCamera.CameraSubject = humanoid6
    end
  end
end

if alienware.Name ~= "Alienware" then
  while true do
    setfpscap(3)
    task.wait(0.1)
  end
end

local function f23()
  if connect3 then
    connect3:Disconnect()
  end

  connect3 = runService.Stepped:Connect(function()
    if not NoclipEnabled or not v43 then
      if connect3 then
        connect3:Disconnect()
        connect3 = nil
      end

      return
    else
      local character10 = localPlayer.Character

      if character10 then
        for index5, value5 in ipairs(character10:GetChildren()) do
          if value5:IsA("BasePart") and value5.CanCollide then
            value5.CanCollide = false
          end
        end
      end

      return
    end
  end)

  f3(connect3)
end

local v62 = {}

do
  local function f24(p12)
    if p12 == localPlayer or not p12.Character then
      return
    else
      local v63 = {}

      for index6, value6 in ipairs(p12.Character:GetDescendants()) do
        if value6:IsA("BasePart") then
          v63[#v63 + 1] = value6
        end
      end

      v62[p12] = v63

      f3(p12.Character.DescendantAdded:Connect(function(descendant)
        if descendant:IsA("BasePart") then
          local v64 = v62[p12]

          if v64 then
            v64[#v64 + 1] = descendant
          end
        end
      end))

      f3(p12.Character.AncestryChanged:Connect(function(p13, p14)
        if not p14 then
          v62[p12] = nil
        end
      end))

      return
    end
  end

  for index7, value7 in ipairs(players:GetPlayers()) do
    local v65 = value7

    if v65 ~= localPlayer then
      f24(v65)

      f3(v65.CharacterAdded:Connect(function()
        task.wait()
        f24(v65)
      end))
    end
  end

  f3(players.PlayerAdded:Connect(function(player)
    f3(player.CharacterAdded:Connect(function()
      task.wait()
      f24(player)
    end))
  end))
end

local stepped = runService.Stepped
local v66

local function f25()
  for key, value8 in pairs(v66) do
    if value8 and value8.Parent then
      if value8:IsA("Highlight") then
        value8.FillColor = Color3.fromHSV(GunHue / 360, 1, 1)
        value8.FillTransparency = GunEspFillTransparency / 100
        value8.OutlineColor = Color3.fromHSV(GunHue / 360, 1, 1)
      elseif value8:IsA("BillboardGui") then
        value8.Enabled = GunTextESPEnabled
      end
    end
  end
end

f3(stepped:Connect(function()
  if not AntiFlingEnabled or not v43 then
    return
  end

  for key2, value9 in pairs(v62) do
    if key2.Character and key2.Character.Parent then
      for index8, value10 in ipairs(value9) do
        if value10.CanCollide then
          value10.CanCollide = false
        end
      end
    end
  end
end))

local connect4 = nil

local function f26(p15)
  if connect4 then
    connect4:Disconnect()
    connect4 = nil
  end

  if p15 then
    connect4 = localPlayer.Idled:Connect(function()
      if AntiAFKEnabled and v43 then
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new())
      end
    end)

    f3(connect4)
  end
end

local connect5, bodyVelocity, bodyGyro

local function f28()
  f27()
  local humanoidRootPart6, humanoid7

  if not FlyEnabled or not v43 then
    return
  else
    local character11 = localPlayer.Character
    humanoidRootPart6 = character11 and character11:FindFirstChild("HumanoidRootPart")
    humanoid7 = character11 and character11:FindFirstChildOfClass("Humanoid")

    if not humanoidRootPart6 or not humanoid7 then
      return
    end

    humanoid7.PlatformStand = true

    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.P = 90000
    bodyGyro.maxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
    bodyGyro.cframe = humanoidRootPart6.CFrame
    bodyGyro.Parent = humanoidRootPart6

    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.velocity = Vector3.zero
    bodyVelocity.maxForce = Vector3.new(9000000000, 9000000000, 9000000000)
    bodyVelocity.Parent = humanoidRootPart6

    connect5 = runService.RenderStepped:Connect(function()
      if not FlyEnabled or not v43 or not humanoidRootPart6.Parent or not humanoid7.Parent then
        f27()
        return
      else
        local cframe = currentCamera.CFrame
        bodyGyro.cframe = cframe
        local zero2 = Vector3.zero

        if userInputService:IsKeyDown(Enum.KeyCode.W) then
          zero2 = zero2 + cframe.LookVector
        end

        if userInputService:IsKeyDown(Enum.KeyCode.S) then
          zero2 = zero2 - cframe.LookVector
        end

        if userInputService:IsKeyDown(Enum.KeyCode.A) then
          zero2 = zero2 - cframe.RightVector
        end

        if userInputService:IsKeyDown(Enum.KeyCode.D) then
          zero2 = zero2 + cframe.RightVector
        end

        if zero2.Magnitude == 0 and humanoid7.MoveDirection.Magnitude > 0 then
          local vector3 = Vector3.new(cframe.LookVector.X, 0, cframe.LookVector.Z)
          local vector4 = Vector3.new(cframe.RightVector.X, 0, cframe.RightVector.Z)

          if vector3.Magnitude > 0 then
            vector3 = vector3.Unit
          end

          if vector4.Magnitude > 0 then
            vector4 = vector4.Unit
          end

          local dot = humanoid7.MoveDirection:Dot(vector3)
          local dot2 = humanoid7.MoveDirection:Dot(vector4)
          zero2 = cframe.LookVector * dot + cframe.RightVector * dot2
        end

        local zero3 = Vector3.zero

        if zero2.Magnitude > 0 then
          zero3 = zero2.Unit * flySpeed
        end

        if userInputService:IsKeyDown(Enum.KeyCode.Space)
          or userInputService.TouchEnabled and humanoid7.Jump then
          zero3 = zero3 + Vector3.new(0, flySpeed, 0)
        end

        if userInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
          zero3 = zero3 - Vector3.new(0, flySpeed, 0)
        end

        bodyVelocity.velocity = zero3
        return
      end
    end)

    if type(f3) == "function" then
      f3(connect5)
    end

    return
  end
end

function f27()
  if connect5 then
    connect5:Disconnect()
    connect5 = nil
  end

  if bodyVelocity then
    bodyVelocity:Destroy()
    bodyVelocity = nil
  end

  if bodyGyro then
    bodyGyro:Destroy()
    bodyGyro = nil
  end

  local character12 = localPlayer.Character

  local humanoid8 = character12
  humanoid8 = character12 and character12:FindFirstChildOfClass("Humanoid")

  if humanoid8 then
    humanoid8.PlatformStand = false
  end
end

local function f29(p16)
  if not GunESPEnabled then
    return
  elseif p16:FindFirstChild("GunESP") then
    return
  else
    local gunESP = Instance.new("Highlight")
    gunESP.Name = "GunESP"
    gunESP.FillColor = Color3.fromHSV(GunHue / 360, 1, 1)
    gunESP.OutlineColor = Color3.fromHSV(GunHue / 360, 1, 1)
    gunESP.FillTransparency = GunEspFillTransparency / 100
    gunESP.OutlineTransparency = 0.2
    gunESP.Parent = p16

    local gunESP2 = Instance.new("BillboardGui", p16)
    gunESP2.Name = "GunESP"
    gunESP2.Size = UDim2.new(0, 120, 0, 20)
    gunESP2.StudsOffset = Vector3.new(0, 2, 0)
    gunESP2.AlwaysOnTop = true
    gunESP2.Enabled = GunTextESPEnabled

    local instance2 = Instance.new("TextLabel", gunESP2)
    instance2.Size = UDim2.new(1, 0, 1, 0)
    instance2.BackgroundTransparency = 1
    instance2.Text = "Gun Drop"
    instance2.TextColor3 = Color3.fromRGB(210, 190, 255)
    instance2.Font = Enum.Font.GothamBold
    instance2.TextScaled = true
    instance2.TextStrokeTransparency = 0

    table.insert(v66, gunESP)
    table.insert(v66, gunESP2)

    return
  end
end

local v67 = {}

task.spawn(function()
  while task.wait(0.5) do
    if not v43 then
      break
    end

    pcall(function()
      local invokeServer = replicatedStorage:FindFirstChild("GetPlayerData", true):InvokeServer()

      if invokeServer then
        local v68 = {}

        for key3, value11 in pairs(invokeServer) do
          if type(value11) == "table" and not value11.Dead then
            v68[key3] = value11.Role
          end
        end

        v67 = v68
      end
    end)
  end
end)

local function f30(p17)
  if not p17 then
    return "Innocent"
  end

  return v67[p17.Name] or "Innocent"
end

local function f31()
  for key4, value12 in pairs(players:GetPlayers()) do
    if v67[value12.Name] == "Sheriff" or v67[value12.Name] == "Hero" then
      return value12, value12.Character
    end
  end

  return nil, nil
end

local function f32()
  for key5, value13 in pairs(players:GetPlayers()) do
    if v67[value13.Name] == "Murderer" then
      return value13, value13.Character
    end
  end

  return nil, nil
end

local function f33(p18)
  local getPlayerFromCharacter = players:GetPlayerFromCharacter(p18)

  if not getPlayerFromCharacter then
    return Color3.fromHSV(InnocentHue / 360, 1, 1)
  else
    local v69 = f30(getPlayerFromCharacter)

    if RoleESPEnabled then
      if v69 == "Murderer" then
        return Color3.fromHSV(MurdererHue / 360, 1, 1)
      end

      if v69 == "Sheriff" or v69 == "Hero" then
        return Color3.fromHSV(SheriffHue / 360, 1, 1)
      end
    end

    local humanoidRootPart7 = p18:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart7 then
      local regularLobby = workspace:FindFirstChild("RegularLobby")
        or workspace:FindFirstChild("Lobby")

      if regularLobby then
        if (humanoidRootPart7.Position - regularLobby:GetPivot().Position).Magnitude <= 120 then
          return Color3.fromRGB(150, 150, 150)
        end
      end

      return Color3.fromHSV(InnocentHue / 360, 1, 1)
    end

    return Color3.fromHSV(InnocentHue / 360, 1, 1)
  end
end

local function f34()
  for key6, value14 in pairs(players:GetPlayers()) do
    if value14.Character then
      local chamsESP = value14.Character:FindFirstChild("ChamsESP")

      if chamsESP then
        chamsESP:Destroy()
      end

      local humanoidRootPart8 = value14.Character:FindFirstChild("HumanoidRootPart")

      if humanoidRootPart8 then
        humanoidRootPart8.LocalTransparencyModifier = 0
      end
    end
  end
end

local f35

local function f36()
  if not ChamsESPEnabled then
    return
  end

  for key7, value15 in pairs(players:GetPlayers()) do
    if value15 ~= localPlayer and value15.Character then
      local v70 = f33(value15.Character)
      f35(value15.Character, v70)
    end
  end
end

function f35(p19, p20)
  if not p19 then
    return
  else
    local humanoidRootPart9 = p19:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart9 then
      humanoidRootPart9.LocalTransparencyModifier = 1
    end

    for index9, value16 in ipairs(p19:GetDescendants()) do
      if value16:IsA("BasePart") and value16 ~= humanoidRootPart9 and value16.Transparency >= 1 then
        value16.Transparency = 0.99
      end
    end

    local chamsESP2 = p19:FindFirstChild("ChamsESP")

    if chamsESP2 then
      chamsESP2.FillColor = p20
      chamsESP2.OutlineColor = p20
      chamsESP2.FillTransparency = EspFillTransparency / 100

      return
    else
      local chamsESP3 = Instance.new("Highlight")
      chamsESP3.Name = "ChamsESP"
      chamsESP3.FillTransparency = EspFillTransparency / 100
      chamsESP3.OutlineTransparency = 0.25
      chamsESP3.FillColor = p20
      chamsESP3.OutlineColor = p20
      chamsESP3.Parent = p19

      return
    end
  end
end

local function f37()
  for key8, value17 in pairs(v66) do
    if value17 and value17.Parent then
      value17:Destroy()
    end
  end

  table.clear(v66)
end

v66 = {}
local descendantAdded = workspace.DescendantAdded

local function f38()
  local huge = math.huge
  local character13 = localPlayer.Character
  local humanoidRootPart10 = character13 and character13:FindFirstChild("HumanoidRootPart")
  local v71, magnitude

  if not humanoidRootPart10 then
    return nil
  else
    local v72 = false

    if character13 and character13:FindFirstChild("Gun") then
      v72 = true
    end

    if localPlayer:FindFirstChild("Backpack") and localPlayer.Backpack:FindFirstChild("Gun") then
      v72 = true
    end

    if AimAssistOnlyWithGun and not v72 then
      return nil
    end

    for index10, value18 in ipairs(players:GetPlayers()) do
      if value18 ~= localPlayer and value18.Character then
        local humanoidRootPart11 = value18.Character:FindFirstChild("HumanoidRootPart")
        local humanoid9 = value18.Character:FindFirstChildOfClass("Humanoid")

        if humanoidRootPart11 and humanoid9 and humanoid9.Health > 0 then
          local v73 = f30(value18)

          if AimAssistOnlyWithGun then
            if v73 ~= "Murderer" then
            else
              
              magnitude = (humanoidRootPart11.Position - humanoidRootPart10.Position).Magnitude

              if magnitude < huge then
                v71 = value18
                huge = magnitude
              end
            end
          elseif AimAssistRoleFilter == "Murd/Sheriff" and v73 == "Innocent" then
          elseif AimAssistRoleFilter == "Murderer" and v73 ~= "Murderer" then
          elseif AimAssistRoleFilter == "Sheriff" and v73 ~= "Sheriff" then
          else
          end
        end
      end
    end

    return v71
  end
end

f3(descendantAdded:Connect(function(p21)
  local v74 = p21.Name == "GunDrop"
  local humanoidRootPart12, cframe2

  if v74 and p21:IsA("BasePart") then
    if GunESPEnabled then
      f29(p21)
    end

    if AutoGrabGunEnabled then
      local character14 = localPlayer.Character
      humanoidRootPart12 = character14 and character14:FindFirstChild("HumanoidRootPart")

      if humanoidRootPart12 then
        cframe2 = humanoidRootPart12.CFrame
        task.wait(0.05)
        humanoidRootPart12.CFrame = p21.CFrame + Vector3.new(0, 1.5, 0)

        task.delay(0.25, function()
          if humanoidRootPart12 then
            humanoidRootPart12.CFrame = cframe2
          end
        end)
      end
    end
  end
end))

local v75 = {}
local v76 = nil

local function f39(p22, p23)
  local currentCamera3 = workspace.CurrentCamera
  local connect6

  if not currentCamera3 then
    return
  elseif v76 == p22 then
    v76 = nil

    if p23 then
      p23.Text = "Spectate"
    end

    local character15 = localPlayer.Character

    currentCamera3.CameraSubject = character15 and character15:FindFirstChildOfClass("Humanoid")
      or workspace

    currentCamera3.CameraType = Enum.CameraType.Custom

    return
  else
    local character16 = p22 and p22.Character
    local humanoid10 = character16 and character16:FindFirstChildOfClass("Humanoid")

    if not humanoid10 then
      return
    end

    v76 = p22

    if p23 then
      p23.Text = "Unspectate"
    end

    currentCamera3.CameraType = Enum.CameraType.Follow
    currentCamera3.CameraSubject = humanoid10

    connect6 = nil

    connect6 = runService.RenderStepped:Connect(function()
      if v76 ~= p22 or not v43 then
        connect6:Disconnect()
        return
      end

      if p22 and p22.Character and p22.Character:FindFirstChildOfClass("Humanoid") then
        currentCamera3.CameraSubject = p22.Character:FindFirstChildOfClass("Humanoid")
      else
        v76 = nil

        if p23 then
          p23.Text = "Spectate"
        end

        local character17 = localPlayer.Character

        currentCamera3.CameraSubject = character17
            and character17:FindFirstChildOfClass("Humanoid")
          or workspace

        currentCamera3.CameraType = Enum.CameraType.Custom

        connect6:Disconnect()
      end
    end)

    f3(connect6)
    return
  end
end

local f40

local function f41(p24)
  if not p24:IsA("BasePart") then
    return
  end

  if f40(p24) then
    return
  end

  if v75[p24] == nil then
    v75[p24] = p24.LocalTransparencyModifier
  end

  p24.LocalTransparencyModifier = 0.65
end

function f40(p25)
  for key9, value19 in pairs(players:GetPlayers()) do
    if value19.Character and p25:IsDescendantOf(value19.Character) then
      return true
    end
  end

  return false
end

local connect7

local function f42()
  if connect7 then
    connect7:Disconnect()
  end

  connect7 = nil

  for key10, value20 in pairs(v75) do
    if key10 and key10.Parent then
      key10.LocalTransparencyModifier = value20
    end
  end

  v75 = {}
end

local function f43()
  for key11, value21 in pairs(workspace:GetDescendants()) do
    f41(value21)
  end

  if connect7 then
    connect7:Disconnect()
  end

  connect7 = workspace.DescendantAdded:Connect(f41)
  f3(connect7)
end

do
  f3(runService.RenderStepped:Connect(function()
    if not AimAssistEnabled or not v43 then
      return
    else
      local v77 = f38()

      if v77 and v77.Character then
        local v78 = AimAssistTarget == "Torso" and "HumanoidRootPart" or "Head"
        local findFirstChild = v77.Character:FindFirstChild(v78)

        if findFirstChild then
          local position = findFirstChild.Position

          if v50 then
            position = position
              + findFirstChild.AssemblyLinearVelocity
                * ((position - currentCamera.CFrame.Position).Magnitude / aimAssistPrediction)
          end

          currentCamera.CFrame = CFrame.new(currentCamera.CFrame.Position, position)
        end
      end

      return
    end
  end))

  f3(runService.Heartbeat:Connect(function()
    if not AutoShootEnabled or not v43 then
      return
    else
      local character18 = localPlayer.Character

      if not character18 then
        return
      else
        local humanoid11 = character18:FindFirstChildOfClass("Humanoid")

        local gun = character18:FindFirstChild("Gun")
          or localPlayer:FindFirstChild("Backpack")
            and localPlayer.Backpack:FindFirstChild("Gun")

        if not gun or not humanoid11 then
          return
        else
          local v79, v80 = f32()

          if v80 and v80:FindFirstChild("HumanoidRootPart") then
            local head2 = character18:FindFirstChild("Head")
            local humanoidRootPart13 = v80:FindFirstChild("HumanoidRootPart")

            if head2 and humanoidRootPart13 then
              local raycastParams = RaycastParams.new()
              raycastParams.FilterDescendantsInstances = { character18 }
              raycastParams.FilterType = Enum.RaycastFilterType.Exclude

              local v81 = humanoidRootPart13.Position
                + humanoidRootPart13.AssemblyLinearVelocity
                  * ((humanoidRootPart13.Position - head2.Position).Magnitude / 150)

              local raycast = workspace:Raycast(
                head2.Position, (v81 - head2.Position).Unit * 100, raycastParams
              )

              if raycast and raycast.Instance:IsDescendantOf(v80) then
                if gun.Parent == localPlayer.Backpack then
                  humanoid11:EquipTool(gun)
                  task.wait(0.05)
                end

                currentCamera.CFrame = CFrame.new(currentCamera.CFrame.Position, v81)
                gun:Activate()
              end
            end
          end

          return
        end
      end
    end
  end))

  instance3 = Instance.new("BlurEffect", game.Lighting)
  instance3.Size = 0

  local lookVector2 = currentCamera.CFrame.LookVector

  alienwareColorCorrection = game.Lighting:FindFirstChild("AlienwareColorCorrection")
    or Instance.new("ColorCorrectionEffect", game.Lighting)

  alienwareColorCorrection.Name = "AlienwareColorCorrection"
  alienwareColorCorrection.Saturation = SaturationValue

  f3(runService.RenderStepped:Connect(function()
    if MotionBlurEnabled and v43 then
      local lookVector3 = currentCamera.CFrame.LookVector
      local magnitude2 = (lookVector3 - lookVector2).Magnitude
      local v82 = MotionBlurThreshold / 1000

      if magnitude2 > v82 then
        instance3.Size = math.clamp((magnitude2 - v82) * MotionBlurIntensity, 0, 24)
      else
        instance3.Size = 0
      end

      lookVector2 = lookVector3
    else
      instance3.Size = 0
    end
  end))

  instance4 = Instance.new("Frame", alienware)
  instance4.Size = UDim2.new(0, 515, 0, 340)
  instance4.Position = UDim2.new(0.5, -280, 0.5, -170)
end

instance4.BackgroundColor3 = Color3.fromRGB(18, 18, 20)
instance4.Active = true
instance4.Draggable = true
instance4.ClipsDescendants = true

Instance.new("UICorner", instance4).CornerRadius = UDim.new(0, 10)

instance5 = Instance.new("UIScale", instance4)
instance5.Scale = GuiScale

instance6 = Instance.new("Frame", instance4)
instance6.Size = UDim2.new(1, 0, 1, 0)
instance6.BackgroundColor3 = instance4.BackgroundColor3
instance6.ZIndex = 50

Instance.new("UICorner", instance6).CornerRadius = UDim.new(0, 10)

instance7 = Instance.new("ImageLabel", instance6)
instance7.Image = "rbxassetid://105529967572166"
instance7.BackgroundTransparency = 1
instance7.Size = UDim2.new(0, 40, 0, 40)
instance7.Position = UDim2.new(0.5, -20, 0.5, -25)
instance7.ImageTransparency = 1
instance7.ZIndex = 51
instance7.ImageColor3 = f6()

table.insert(v45, { inst = instance7, prop = "ImageColor3" })

instance8 = Instance.new("TextLabel", instance6)
instance8.Text = ""
instance8.BackgroundTransparency = 1

do
  instance8.Font = Enum.Font.Code
  instance8.TextColor3 = f6()

  table.insert(v45, { inst = instance8, prop = "TextColor3" })

  instance8.TextSize = 30
  instance8.Size = UDim2.new(0, 150, 0, 50)
  instance8.Position = UDim2.new(0.5, -45, 0.5, -30)
  instance8.TextXAlignment = Enum.TextXAlignment.Left
  instance8.ZIndex = 51

  local instance9 = Instance.new("Frame", instance6)
  instance9.Size = UDim2.new(0, 200, 0, 5)
  instance9.Position = UDim2.new(0.5, -100, 0.5, 150)
  instance9.BackgroundColor3 = Color3.fromRGB(40, 40, 44)
  instance9.BackgroundTransparency = 1
  instance9.ZIndex = 51

  Instance.new("UICorner", instance9).CornerRadius = UDim.new(0.5, 0)

  local instance10 = Instance.new("Frame", instance9)
  instance10.Size = UDim2.new(0, 0, 1, 0)
  instance10.BackgroundColor3 = f6()
  instance10.BackgroundTransparency = 1
  instance10.ZIndex = 52

  Instance.new("UICorner", instance10).CornerRadius = UDim.new(0.5, 0)
  table.insert(v45, { inst = instance10, prop = "BackgroundColor3" })

  task.spawn(function()
    tweenService:Create(instance7, TweenInfo.new(0.5), { ImageTransparency = 0 }):Play()
    task.wait(0.6)

    tweenService:Create(
      instance7, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
      { Position = UDim2.new(0.5, -95, 0.5, -25) }
    ):Play()

    task.wait(0.5)

    for m = 1, #"Alienware" do
      instance8.Text = string.sub("Alienware", 1, m)
      task.wait(0.05)
    end

    task.wait(0.2)

    tweenService:Create(instance9, TweenInfo.new(0.5), { BackgroundTransparency = 0 }):Play()
    tweenService:Create(instance10, TweenInfo.new(0.5), { BackgroundTransparency = 0 }):Play()

    task.wait(0.5)

    tweenService:Create(instance10, TweenInfo.new(3, Enum.EasingStyle.Linear), {
      Size = UDim2.new(1, 0, 1, 0),
    }):Play()

    task.wait(3)

    tweenService:Create(instance9, TweenInfo.new(0.5), { BackgroundTransparency = 1 }):Play()
    tweenService:Create(instance10, TweenInfo.new(0.5), { BackgroundTransparency = 1 }):Play()

    task.wait(0.5)

    local create = tweenService:Create(instance6, TweenInfo.new(0.5), {
      BackgroundTransparency = 1,
    })

    tweenService:Create(instance7, TweenInfo.new(0.5), { ImageTransparency = 1 }):Play()
    tweenService:Create(instance8, TweenInfo.new(0.5), { TextTransparency = 1 }):Play()

    create:Play()
    create.Completed:Wait()

    instance6:Destroy()
  end)
end

v83 = true
local v84 = false
local v85 = {}

local function f44()
  v85 = {}

  local function f45(p26)
    if p26:IsA("GuiObject") then
      if p26.BackgroundTransparency < 1 then
        table.insert(v85, {
          inst = p26,
          prop = "BackgroundTransparency",
          opaque = p26.BackgroundTransparency,
        })
      end
    end

    if p26:IsA("TextLabel") or p26:IsA("TextButton") or p26:IsA("TextBox") then
      table.insert(v85, { inst = p26, prop = "TextTransparency", opaque = p26.TextTransparency })

      table.insert(v85, {
        inst = p26,
        prop = "TextStrokeTransparency",
        opaque = p26.TextStrokeTransparency,
      })
    end

    if p26:IsA("ImageLabel") or p26:IsA("ImageButton") then
      table.insert(v85, {
        inst = p26,
        prop = "ImageTransparency",
        opaque = p26.ImageTransparency,
      })
    end

    for index11, value22 in ipairs(p26:GetChildren()) do
      f45(value22)
    end
  end

  f45(instance4)
end

local function f46(p27)
  local v86, v87

  if v84 then
    return
  else
    v84 = true
    v83 = p27
    local v88 = p27 and 0.22 or 0.18
    local out = p27 and Enum.EasingDirection.Out or Enum.EasingDirection.In

    if p27 then
      for index12, value23 in ipairs(v85) do
        if value23.inst and value23.inst.Parent then
          value23.inst[value23.prop] = 1
        end
      end

      instance4.Visible = true
      v87 = #v85

      if v87 == 0 then
        v84 = false
        return
      end

      for index13, value24 in ipairs(v85) do
        if value24.inst and value24.inst.Parent then
          local create2 = tweenService:Create(
            value24.inst, TweenInfo.new(v88, Enum.EasingStyle.Quad, out),
            { [value24.prop] = value24.opaque }
          )

          create2:Play()

          create2.Completed:Connect(function()
            v87 = v87 - 1

            if v87 <= 0 then
              v84 = false
            end
          end)
        else
          v87 = v87 - 1

          if v87 <= 0 then
            v84 = false
          end
        end
      end

      return
    end

    v86 = #v85

    if v86 == 0 then
      instance4.Visible = false
      v84 = false
      return
    end

    for index14, value25 in ipairs(v85) do
      if value25.inst and value25.inst.Parent then
        local create3 = tweenService:Create(
          value25.inst, TweenInfo.new(v88, Enum.EasingStyle.Quad, out), { [value25.prop] = 1 }
        )

        create3:Play()

        create3.Completed:Connect(function()
          v86 = v86 - 1

          if v86 <= 0 then
            instance4.Visible = false
            v84 = false
          end
        end)
      else
        v86 = v86 - 1

        if v86 <= 0 then
          v84 = false
        end
      end
    end

    return
  end
end

do
  local instance11 = Instance.new("Frame", instance4)
  instance11.Size = UDim2.new(1, 0, 0, 36)
  instance11.BackgroundColor3 = Color3.fromRGB(24, 24, 26)

  Instance.new("UICorner", instance11)

  instance12 = Instance.new("TextButton", instance11)
  instance12.Size = UDim2.new(0, 28, 0, 22)
  instance12.Position = UDim2.new(0, 480, 0.5, -11)
  instance12.BackgroundColor3 = Color3.fromRGB(40, 40, 44)
  instance12.TextColor3 = Color3.fromRGB(220, 220, 230)
  instance12.Font = Enum.Font.GothamBold
  instance12.TextSize = 14
  instance12.Text = "-"

  Instance.new("UICorner", instance12).CornerRadius = UDim.new(0, 6)

  instance13 = Instance.new("TextLabel", instance11)
  instance13.Size = UDim2.new(1, -120, 1, 0)
  instance13.Position = UDim2.new(0, 38, 0, 1)
  instance13.BackgroundTransparency = 1
  instance13.Text = "Alienware"
  instance13.TextColor3 = Color3.fromRGB(220, 220, 230)
  instance13.Font = Enum.Font.GothamBold
  instance13.TextSize = 14
  instance13.TextXAlignment = Enum.TextXAlignment.Left

  local instance14 = Instance.new("ImageLabel", instance11)
  instance14.Size = UDim2.new(0, 20, 0, 19)
  instance14.Position = UDim2.new(0, 10, 0, 10)
  instance14.BackgroundTransparency = 1
  instance14.Image = "rbxassetid://105529967572166"
  instance14.ImageColor3 = f6()

  table.insert(v45, { inst = instance14, prop = "ImageColor3" })
end

do
  local instance15 = Instance.new("Frame", instance4)
  instance15.Size = UDim2.new(1, -16, 0, 38)
  instance15.Position = UDim2.new(0, 8, 0, 40)
  instance15.BackgroundColor3 = Color3.fromRGB(21, 21, 23)

  Instance.new("UICorner", instance15).CornerRadius = UDim.new(0, 8)

  instance16 = Instance.new("ScrollingFrame", instance15)
  instance16.Size = UDim2.new(1, -8, 1, 0)
  instance16.Position = UDim2.new(0, 4, 0, 0)
  instance16.BackgroundTransparency = 1
  instance16.ScrollBarThickness = 0
  instance16.ScrollBarImageColor3 = Color3.fromRGB(42, 42, 42)
  instance16.CanvasSize = UDim2.new(0, 0, 0, 0)
end

do
  instance16.AutomaticCanvasSize = Enum.AutomaticSize.X
  instance16.ScrollingDirection = Enum.ScrollingDirection.X

  local instance17 = Instance.new("UIListLayout", instance16)
  instance17.FillDirection = Enum.FillDirection.Horizontal
  instance17.VerticalAlignment = Enum.VerticalAlignment.Center
  instance17.SortOrder = Enum.SortOrder.LayoutOrder
  instance17.Padding = UDim.new(0, 6)

  local instance18 = Instance.new("UIPadding", instance16)
  instance18.PaddingLeft = UDim.new(0, 4)
  instance18.PaddingRight = UDim.new(0, 4)

  local function f47(text2, p28, p29)
    local instance19 = Instance.new("TextButton", p29)
    instance19.Size = UDim2.new(0, 72, 0, 26)

    instance19.BackgroundColor3 = p28 and Color3.fromRGB(40, 40, 44)
      or Color3.fromRGB(28, 28, 30)

    instance19.TextColor3 = p28 and Color3.fromRGB(230, 230, 240)
      or Color3.fromRGB(150, 150, 160)

    instance19.Font = Enum.Font.GothamBold
    instance19.TextSize = 10
    instance19.Text = text2

    Instance.new("UICorner", instance19).CornerRadius = UDim.new(0, 6)

    local instance20 = Instance.new("UIStroke", instance19)
    instance20.Color = f6()
    instance20.Thickness = 1.5
    instance20.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    instance20.Enabled = p28

    table.insert(v45, { inst = instance20, prop = "Color" })
    return instance19
  end

  v89 = f47("ESP", true, instance16)
  v90 = f47("Combat", false, instance16)
  v91 = f47("Teleport", false, instance16)
  v92 = f47("Trolling", false, instance16)
  v93 = f47("Player", false, instance16)
  v94 = f47("Graphics", false, instance16)
  v95 = f47("Misc", false, instance16)
  v96 = f47("Autofarm", false, instance16)
  v97 = f47("Fun", false, instance16)
  v98 = f47("Settings", false, instance16)
end

local instance21 = Instance.new("Frame", instance4)

do
  instance21.Position = UDim2.new(0, 8, 0, 60)
  instance21.Size = UDim2.new(1, -16, 1, -88)
  instance21.BackgroundTransparency = 1

  local function f48(p30)
    local instance22 = p30 and Instance.new("ScrollingFrame", instance21)
      or Instance.new("Frame", instance21)

    if p30 then
      instance22.ScrollBarThickness = 3
      instance22.ScrollBarImageColor3 = Color3.fromRGB(42, 42, 42)
      instance22.CanvasSize = UDim2.new(0, 0, 0, 0)
      instance22.AutomaticCanvasSize = Enum.AutomaticSize.Y
    end

    instance22.Position = UDim2.new(0, 0, 0, 22)
    instance22.Size = UDim2.new(1, 0, 1, -10)
    instance22.BackgroundTransparency = 1
    instance22.Visible = false

    local instance23 = Instance.new("UIListLayout", instance22)
    instance23.FillDirection = Enum.FillDirection.Vertical
    instance23.SortOrder = Enum.SortOrder.LayoutOrder
    instance23.Padding = UDim.new(0, 8)

    Instance.new("UIPadding", instance22).PaddingTop = UDim.new(0, 8)
    return instance22
  end

  v99 = f48(true)
  v100 = f48(true)
  v101 = f48(true)
  v102 = f48(true)
  v103 = f48(true)
  v104 = f48(true)
  v105 = f48(true)
  v106 = f48(true)
  v107 = f48(true)
  v108 = f48(true)
end

v99.Visible = true
local v109 = false
local v110 = false
local udim = UDim2.new(0, 515, 0, 340)
local udim2 = UDim2.new(0, 170, 0, 36)

local function f49(p31)
  if v110 then
    return
  end

  v110 = true
  v109 = p31
  instance12.Text = v109 and "+" or "-"

  if v109 then
    instance21.Visible = false

    local create4 = tweenService:Create(instance4, TweenInfo.new(
      0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out
    ), { Size = UDim2.new(0, 515, 0, 36) })

    create4:Play()
    create4.Completed:Wait()

    local create5 = tweenService:Create(instance4, TweenInfo.new(
      0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out
    ), { Size = udim2 })

    local create6 = tweenService:Create(instance12, TweenInfo.new(
      0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out
    ), { Position = UDim2.new(1, -38, 0.5, -11) })

    create5:Play()
    create6:Play()
    create5.Completed:Wait()
    v110 = false
  else
    local create7 = tweenService:Create(instance4, TweenInfo.new(
      0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out
    ), { Size = UDim2.new(0, 515, 0, 36) })

    local create8 = tweenService:Create(instance12, TweenInfo.new(
      0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out
    ), { Position = UDim2.new(1, -40, 0.5, -10) })

    create7:Play()
    create8:Play()
    create7.Completed:Wait()

    local create9 = tweenService:Create(instance4, TweenInfo.new(
      0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out
    ), { Size = udim })

    create9:Play()
    create9.Completed:Wait()

    instance21.Visible = true
    v110 = false
  end
end

local function f50(p32, fn)
  p32.Activated:Connect(function() fn() end)
end

instance12.Activated:Connect(function() f49(not v109) end)

local function f51(p33, text3, text4, p34, fn2, p35, p36)
  local instance24 = Instance.new("Frame", p33)
  instance24.Size = UDim2.new(1, 0, 0, 48)
  instance24.BackgroundColor3 = Color3.fromRGB(28, 28, 32)

  Instance.new("UICorner", instance24).CornerRadius = UDim.new(0, 8)

  local instance25 = Instance.new("TextLabel", instance24)
  instance25.Size = UDim2.new(0.6, 0, 0, 20)
  instance25.Position = UDim2.new(0, 12, 0, 6)
  instance25.BackgroundTransparency = 1
  instance25.Text = text3
  instance25.TextColor3 = Color3.fromRGB(220, 220, 230)
  instance25.Font = Enum.Font.GothamBold
  instance25.TextSize = 13
  instance25.TextXAlignment = Enum.TextXAlignment.Left

  local instance26 = Instance.new("TextLabel", instance24)
  instance26.Size = UDim2.new(0.7, 0, 0, 18)
  instance26.Position = UDim2.new(0, 12, 0, 24)
  instance26.BackgroundTransparency = 1
  instance26.Text = text4
  instance26.TextColor3 = Color3.fromRGB(140, 140, 150)
  instance26.Font = Enum.Font.Gotham
  instance26.TextSize = 11
  instance26.TextXAlignment = Enum.TextXAlignment.Left

  local instance27, instance28, v111, instance29

  if p35 then
    instance29 = Instance.new("TextButton", instance24)
    instance29.Size = UDim2.new(0, 120, 0, 24)
    instance29.Position = UDim2.new(1, -132, 0.5, -12)
    instance29.BackgroundColor3 = Color3.fromRGB(40, 40, 44)
    instance29.TextColor3 = Color3.fromRGB(220, 220, 230)
    instance29.Font = Enum.Font.GothamBold
    instance29.TextSize = 12
    instance29.Text = tostring(HotkeyKey.Name)

    Instance.new("UICorner", instance29).CornerRadius = UDim.new(0, 6)

    instance29.Activated:Connect(function()
      WaitingForKey = true
      instance29.Text = "Press key..."
    end)

    return instance29
  else
    instance27 = Instance.new("Frame", instance24)
    instance27.Size = UDim2.new(0, 40, 0, 20)
    instance27.Position = UDim2.new(1, -52, 0.5, -10)
    instance27.BackgroundColor3 = p34 and f6() or Color3.fromRGB(60, 60, 70)

    Instance.new("UICorner", instance27).CornerRadius = UDim.new(1, 0)
    table.insert(v45, { inst = instance27, prop = "BackgroundColor3" })

    instance28 = Instance.new("Frame", instance27)
    instance28.Size = UDim2.new(0, 18, 0, 18)
    instance28.Position = p34 and UDim2.new(1, -19, 0, 1) or UDim2.new(0, 1, 0, 1)
    instance28.BackgroundColor3 = Color3.fromRGB(210, 210, 220)

    Instance.new("UICorner", instance28).CornerRadius = UDim.new(1, 0)

    local instance30 = Instance.new("TextButton", instance24)
    instance30.Size = UDim2.new(1, 0, 1, 0)
    instance30.BackgroundTransparency = 1
    instance30.Text = ""
    instance30.ZIndex = 5

    v111 = p34

    instance30.Activated:Connect(function()
      v111 = not v111

      if v111 then
        instance28:TweenPosition(UDim2.new(1, -19, 0, 1), "Out", "Quad", 0.15, true)
        instance27.BackgroundColor3 = f6()
      else
        instance28:TweenPosition(UDim2.new(0, 1, 0, 1), "Out", "Quad", 0.15, true)
        instance27.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
      end

      fn2(v111)
    end)

    return {
      set = function(p37)
        v111 = p37

        if v111 then
          instance28:TweenPosition(UDim2.new(1, -19, 0, 1), "Out", "Quad", 0.15, true)
          instance27.BackgroundColor3 = f6()
        else
          instance28:TweenPosition(UDim2.new(0, 1, 0, 1), "Out", "Quad", 0.15, true)
          instance27.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
        end
      end,
    }
  end
end

local function f52(p38, text5, text6, p39, p40, p41, fn3, p42)
  local instance31 = Instance.new("Frame", p38)
  instance31.Size = UDim2.new(1, 0, 0, 68)
  instance31.BackgroundColor3 = Color3.fromRGB(28, 28, 32)

  Instance.new("UICorner", instance31).CornerRadius = UDim.new(0, 8)

  local instance32 = Instance.new("TextLabel", instance31)
  instance32.Size = UDim2.new(0.7, 0, 0, 20)
  instance32.Position = UDim2.new(0, 12, 0, 6)
  instance32.BackgroundTransparency = 1
  instance32.Text = text5
  instance32.TextColor3 = Color3.fromRGB(220, 220, 230)
  instance32.Font = Enum.Font.GothamBold
  instance32.TextSize = 13
  instance32.TextXAlignment = Enum.TextXAlignment.Left

  local instance33 = Instance.new("TextLabel", instance31)
  instance33.Size = UDim2.new(0, 50, 0, 20)
  instance33.Position = UDim2.new(1, -62, 0, 6)
  instance33.BackgroundTransparency = 1
  instance33.Text = tostring(math.floor(p41))
  instance33.TextColor3 = f6()
  instance33.Font = Enum.Font.GothamBold
  instance33.TextSize = 13
  instance33.TextXAlignment = Enum.TextXAlignment.Right

  local instance34 = Instance.new("TextLabel", instance31)
  instance34.Size = UDim2.new(0.8, 0, 0, 16)
  instance34.Position = UDim2.new(0, 12, 0, 24)
  instance34.BackgroundTransparency = 1
  instance34.Text = text6
  instance34.TextColor3 = Color3.fromRGB(140, 140, 150)
  instance34.Font = Enum.Font.Gotham
  instance34.TextSize = 11
  instance34.TextXAlignment = Enum.TextXAlignment.Left

  local instance35 = Instance.new("Frame", instance31)
  instance35.Size = UDim2.new(1, -24, 0, 8)
  instance35.Position = UDim2.new(0, 12, 0, 50)
  instance35.BackgroundColor3 = Color3.fromRGB(50, 50, 56)

  Instance.new("UICorner", instance35).CornerRadius = UDim.new(1, 0)

  local instance36 = Instance.new("Frame", instance35)
  instance36.Size = UDim2.new((p41 - p39) / (p40 - p39), 0, 1, 0)
  instance36.BackgroundColor3 = p42 and Color3.fromHSV(p41 / 360, 1, 1) or f6()

  Instance.new("UICorner", instance36).CornerRadius = UDim.new(1, 0)

  if not p42 then
    table.insert(v45, { inst = instance36, prop = "BackgroundColor3" })
  end

  table.insert(v45, { inst = instance33, prop = "TextColor3" })

  local instance37 = Instance.new("Frame", instance35)
  instance37.Position = UDim2.new((p41 - p39) / (p40 - p39), -8, 0.5, -8)
  instance37.Size = UDim2.new(0, 16, 0, 16)
  instance37.BackgroundColor3 = Color3.fromRGB(210, 210, 220)
  instance37.ZIndex = 3

  Instance.new("UICorner", instance37).CornerRadius = UDim.new(1, 0)
  local v112 = false

  local function f53(p43)
    local v113 = math.clamp(
      (p43 - instance35.AbsolutePosition.X) / instance35.AbsoluteSize.X, 0, 1
    )

    local v114 = math.floor(p39 + v113 * (p40 - p39))
    instance36.Size = UDim2.new(v113, 0, 1, 0)

    if p42 then
      instance36.BackgroundColor3 = Color3.fromHSV(v114 / 360, 1, 1)
    end

    instance37.Position = UDim2.new(v113, -8, 0.5, -8)
    instance33.Text = tostring(v114)
    fn3(v114)
  end

  instance35.InputBegan:Connect(function(input2)
    if input2.UserInputType == Enum.UserInputType.MouseButton1
      or input2.UserInputType == Enum.UserInputType.Touch then
      v112 = true
      instance4.Draggable = false
      f53(input2.Position.X)
    end
  end)

  instance37.InputBegan:Connect(function(input3)
    if input3.UserInputType == Enum.UserInputType.MouseButton1
      or input3.UserInputType == Enum.UserInputType.Touch then
      v112 = true
      instance4.Draggable = false
    end
  end)

  f3(userInputService.InputEnded:Connect(function(input4)
    if v112
      and (input4.UserInputType == Enum.UserInputType.MouseButton1
        or input4.UserInputType == Enum.UserInputType.Touch) then
      v112 = false
      instance4.Draggable = true
    end
  end))

  f3(userInputService.InputChanged:Connect(function(input5)
    if v112
      and (input5.UserInputType == Enum.UserInputType.MouseMovement
        or input5.UserInputType == Enum.UserInputType.Touch) then
      f53(input5.Position.X)
    end
  end))

  return {
    row = instance31,
    UpdateExternal = function(p44)
      local v115 = math.clamp((p44 - p39) / (p40 - p39), 0, 1)
      instance36.Size = UDim2.new(v115, 0, 1, 0)

      if p42 then
        instance36.BackgroundColor3 = Color3.fromHSV(p44 / 360, 1, 1)
      end

      instance37.Position = UDim2.new(v115, -8, 0.5, -8)
      instance33.Text = tostring(math.floor(p44))
    end,
  }
end

local function f54(p45, text7, text8, text9, fn4)
  local instance38 = Instance.new("Frame", p45)
  instance38.Size = UDim2.new(1, 0, 0, 48)
  instance38.BackgroundColor3 = Color3.fromRGB(28, 28, 32)

  Instance.new("UICorner", instance38).CornerRadius = UDim.new(0, 8)

  local instance39 = Instance.new("TextLabel", instance38)
  instance39.Size = UDim2.new(0.6, 0, 0, 20)
  instance39.Position = UDim2.new(0, 12, 0, 6)
  instance39.BackgroundTransparency = 1
  instance39.Text = text7
  instance39.TextColor3 = Color3.fromRGB(220, 220, 230)
  instance39.Font = Enum.Font.GothamBold
  instance39.TextSize = 13
  instance39.TextXAlignment = Enum.TextXAlignment.Left

  local instance40 = Instance.new("TextLabel", instance38)
  instance40.Size = UDim2.new(0.7, 0, 0, 18)
  instance40.Position = UDim2.new(0, 12, 0, 24)
  instance40.BackgroundTransparency = 1
  instance40.Text = text8
  instance40.TextColor3 = Color3.fromRGB(140, 140, 150)
  instance40.Font = Enum.Font.Gotham
  instance40.TextSize = 11
  instance40.TextXAlignment = Enum.TextXAlignment.Left

  local instance41 = Instance.new("TextButton", instance38)
  instance41.Size = UDim2.new(0, 120, 0, 24)
  instance41.Position = UDim2.new(1, -132, 0.5, -12)
  instance41.BackgroundColor3 = Color3.fromRGB(40, 40, 44)
  instance41.TextColor3 = Color3.fromRGB(220, 220, 230)
  instance41.Font = Enum.Font.GothamBold
  instance41.TextSize = 12
  instance41.Text = text9

  Instance.new("UICorner", instance41).CornerRadius = UDim.new(0, 6)
  instance41.Activated:Connect(function() fn4(instance41) end)
  return instance41
end

do
  f51(v99, "Freecam", "Detach and fly camera (V to unlock cursor)", FreecamEnabled, function(p46)
    FreecamEnabled = p46

    if FreecamEnabled then
      f22()
    else
      f21()
    end

    f7()
  end)

  f52(v99, "Freecam Speed", "Adjust camera speed", 10, 200, FreecamSpeed, function(p47)
    FreecamSpeed = p47
    f7()
  end)

  f51(v99, "Chams ESP", "Highlight all players", ChamsESPEnabled, function(p48)
    ChamsESPEnabled = p48

    if not p48 then
      f34()
    else
      f36()
    end

    f7()
  end)

  f51(v99, "Role Detection", "Color murderer and sheriff", RoleESPEnabled, function(p49)
    RoleESPEnabled = p49
    f36()
    f7()
  end)

  local v116 = f52(v99, "Murderer Color", "Change Murderer ESP color scale", 0, 360, MurdererHue, function(p50)
    MurdererHue = p50
    f36()
    f7()
  end, true)

  local v117 = f52(v99, "Sheriff Color", "Change Sheriff ESP color scale", 0, 360, SheriffHue, function(p51)
    SheriffHue = p51
    f36()
    f7()
  end, true)

  local v118 = f52(v99, "Innocent Color", "Change Innocent ESP color scale", 0, 360, InnocentHue, function(p52)
    InnocentHue = p52
    f36()
    f7()
  end, true)

  local v119 = f52(v99, "Gun ESP Color", "Change Dropped Gun ESP color scale", 0, 360, GunHue, function(p53)
    GunHue = p53
    f25()
    f7()
  end, true)

  local v120 = f52(v99, "Main ESP Transparency", "Set player highlight fill transparency", 0, 100, EspFillTransparency, function(p54)
    EspFillTransparency = p54
    f36()
    f7()
  end)

  local v121 = f52(v99, "Gun ESP Transparency", "Set gun highlight fill transparency", 0, 100, GunEspFillTransparency, function(p55)
    GunEspFillTransparency = p55
    f25()
    f7()
  end)

  f54(v99, "Reset Colors", "Revert ESP profiles", "Reset", function()
    MurdererHue = 0
    SheriffHue = 240
    InnocentHue = 120
    GunHue = 180
    EspFillTransparency = 100
    GunEspFillTransparency = 70
    v116.UpdateExternal(0)
    v117.UpdateExternal(240)
    v118.UpdateExternal(120)
    v119.UpdateExternal(180)
    v120.UpdateExternal(100)
    v121.UpdateExternal(70)
    f36()
    f25()
    f7()
  end)

  f51(v99, "Gun ESP", "Highlight dropped gun", GunESPEnabled, function(p56)
    GunESPEnabled = p56

    if not p56 then
      f37()
    end

    f7()
  end)
end

f51(v99, "Gun Text ESP", "Show Gun Drop text", GunTextESPEnabled, function(p57)
  GunTextESPEnabled = p57
  f25()
  f7()
end)

v122 = f51(v99, "Xray", "See through walls", XrayEnabled, function(p58)
  XrayEnabled = p58

  if XrayEnabled then
    f43()
  else
    f42()
  end

  f7()
end)

instance42 = Instance.new("TextButton", v99)
instance42.Size = UDim2.new(1, 0, 0, 40)
instance42.BackgroundColor3 = Color3.fromRGB(28, 28, 32)
instance42.TextColor3 = Color3.fromRGB(220, 220, 230)
instance42.Font = Enum.Font.GothamBold
instance42.TextSize = 12
instance42.Text = "Xray Hotkey: " .. tostring(XrayKey.Name)

Instance.new("UICorner", instance42).CornerRadius = UDim.new(0, 8)

instance42.Activated:Connect(function()
  WaitingForXrayKey = true
  instance42.Text = "Press key..."
end)

f54(v99, "View Murderer", "Spectate murderer", "Spectate", function(p59)
  local v123, v124 = f32()

  if v123 then
    f39(v123, p59)
  else
    p59.Text = "Not Found"
    task.delay(1.5, function() p59.Text = "Spectate" end)
  end
end)

do
  f54(v99, "View Sheriff", "Spectate sheriff", "Spectate", function(p60)
    local v125, v126 = f31()

    if v125 then
      f39(v125, p60)
    else
      p60.Text = "Not Found"
      task.delay(1.5, function() p60.Text = "Spectate" end)
    end
  end)

  f51(v100, "Aim Assist", "Smoothly locks camera to targets", AimAssistEnabled, function(p61)
    AimAssistEnabled = p61
    f7()
  end)

  f51(v100, "Auto Shoot Murd", "Auto equip & fire gun at murderer", AutoShootEnabled, function(p62)
    AutoShootEnabled = p62
    f7()
  end)

  f51(v100, "Lock Murderer (Need Gun)", "Aim at Murderer only if gun held", AimAssistOnlyWithGun, function(p63)
    AimAssistOnlyWithGun = p63
    f7()
  end)

  f51(v100, "Aim Prediction", "Toggle movement prediction", v50, function(p64)
    v50 = p64
    f7()
  end)

  f52(v100, "Prediction Modifier", "Lower = aims further ahead", 10, 300, aimAssistPrediction, function(p65)
    aimAssistPrediction = p65
    f7()
  end)

  local v127

  v127 = f54(v100, "Aim Target Tracking", "Toggle viewport snap positions", "Target: " .. AimAssistTarget, function()
    AimAssistTarget = AimAssistTarget == "Head" and "Torso" or "Head"
    v127.Text = "Target: " .. AimAssistTarget
    f7()
  end)

  local v128

  v128 = f54(v100, "Aim Role Filter", "Limit aim assist targets", "Filter: " .. AimAssistRoleFilter, function()
    if AimAssistRoleFilter == "All" then
      AimAssistRoleFilter = "Murd/Sheriff"
    elseif AimAssistRoleFilter == "Murd/Sheriff" then
      AimAssistRoleFilter = "Murderer"
    elseif AimAssistRoleFilter == "Murderer" then
      AimAssistRoleFilter = "Sheriff"
    else
      AimAssistRoleFilter = "All"
    end

    v128.Text = "Filter: " .. AimAssistRoleFilter
    f7()
  end)

  f51(v101, "Auto Grab Gun", "Teleports to dropped gun", AutoGrabGunEnabled, function(p66)
    AutoGrabGunEnabled = p66
    f7()
  end)

  f54(v101, "Grab Gun", "Teleport to dropped gun briefly", "Grab Gun", function()
    local character19 = localPlayer.Character

    if not character19 then
      return
    else
      local humanoidRootPart14 = character19:FindFirstChild("HumanoidRootPart")

      if not humanoidRootPart14 then
        return
      else
        local findFirstChild2 = workspace:FindFirstChild("GunDrop", true)

        if not findFirstChild2 then
          return
        else
          local cframe3 = humanoidRootPart14.CFrame

          local basePart = findFirstChild2:IsA("BasePart") and findFirstChild2
            or findFirstChild2:FindFirstChildWhichIsA("BasePart")

          if not basePart then
            return
          end

          humanoidRootPart14.CFrame = basePart.CFrame + Vector3.new(0, 2, 0)
          task.wait(0.25)
          humanoidRootPart14.CFrame = cframe3
          return
        end
      end
    end
  end)
end

do
  f54(v101, "Teleport to Murderer", "Instantly teleport to murderer", "Teleport", function(p67)
    local character20 = localPlayer.Character
    local humanoidRootPart15 = character20 and character20:FindFirstChild("HumanoidRootPart")
    local v129, v130 = f32()

    if humanoidRootPart15 and v130 and v130:FindFirstChild("HumanoidRootPart") then
      humanoidRootPart15.CFrame = v130.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
    else
      p67.Text = "Not Found"
      task.delay(1.5, function() p67.Text = "Teleport" end)
    end
  end)

  f54(v101, "Teleport to Sheriff", "Instantly teleport to sheriff", "Teleport", function(p68)
    local character21 = localPlayer.Character
    local humanoidRootPart16 = character21 and character21:FindFirstChild("HumanoidRootPart")
    local v131, v132 = f31()

    if humanoidRootPart16 and v132 and v132:FindFirstChild("HumanoidRootPart") then
      humanoidRootPart16.CFrame = v132.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
    else
      p68.Text = "Not Found"
      task.delay(1.5, function() p68.Text = "Teleport" end)
    end
  end)

  local instance43 = Instance.new("Frame", v101)
  instance43.Size = UDim2.new(1, 0, 0, 48)
  instance43.BackgroundColor3 = Color3.fromRGB(28, 28, 32)

  Instance.new("UICorner", instance43).CornerRadius = UDim.new(0, 8)

  local instance44 = Instance.new("TextLabel", instance43)
  instance44.Size = UDim2.new(0.5, 0, 0, 20)
  instance44.Position = UDim2.new(0, 12, 0, 6)
  instance44.BackgroundTransparency = 1
  instance44.Text = "Teleport to Player"
  instance44.TextColor3 = Color3.fromRGB(220, 220, 230)
  instance44.Font = Enum.Font.GothamBold
  instance44.TextSize = 13
  instance44.TextXAlignment = Enum.TextXAlignment.Left

  local instance45 = Instance.new("TextLabel", instance43)
  instance45.Size = UDim2.new(0.5, 0, 0, 18)
  instance45.Position = UDim2.new(0, 12, 0, 24)
  instance45.BackgroundTransparency = 1
  instance45.Text = "Type partial name & press Enter"
  instance45.TextColor3 = Color3.fromRGB(140, 140, 150)
  instance45.Font = Enum.Font.Gotham
  instance45.TextSize = 11
  instance45.TextXAlignment = Enum.TextXAlignment.Left

  local instance46 = Instance.new("TextBox", instance43)
  instance46.Size = UDim2.new(0, 140, 0, 26)
  instance46.Position = UDim2.new(1, -152, 0.5, -13)
  instance46.BackgroundColor3 = Color3.fromRGB(40, 40, 44)
  instance46.TextColor3 = f6()
  instance46.Font = Enum.Font.GothamBold
  instance46.TextSize = 12
  instance46.Text = "Enter name..."
  instance46.ClearTextOnFocus = true

  Instance.new("UICorner", instance46).CornerRadius = UDim.new(0, 6)
  table.insert(v45, { inst = instance46, prop = "TextColor3" })

  instance46.FocusLost:Connect(function(p69)
    if p69 then
      local lower = instance46.Text:lower()

      if lower == "" then
        return
      end

      for key12, value26 in pairs(players:GetPlayers()) do
        if value26 ~= localPlayer
          and (value26.Name:lower():sub(1, #lower) == lower
            or value26.DisplayName:lower():sub(1, #lower) == lower) then
          if localPlayer.Character and value26.Character then
            local humanoidRootPart17 = localPlayer.Character:FindFirstChild("HumanoidRootPart")
            local humanoidRootPart18 = value26.Character:FindFirstChild("HumanoidRootPart")

            if humanoidRootPart17 and humanoidRootPart18 then
              humanoidRootPart17.CFrame = humanoidRootPart18.CFrame * CFrame.new(0, 0, 3)
              instance46.Text = "Teleported!"
              task.delay(1.5, function() instance46.Text = "Enter name..." end)
              return
            end
          end
        end
      end

      instance46.Text = "Not Found"
      task.delay(1.5, function() instance46.Text = "Enter name..." end)
      return
    end
  end)
end

do
  f54(v102, "Fling Murderer", "Spins rapidly causing the Murderer to fly", "Fling", function(p70)
    local v133, v134 = f32()

    if v133 then
      f10(v133)
    else
      p70.Text = "Not Found"
      task.delay(1.5, function() p70.Text = "Fling" end)
    end
  end)

  f54(v102, "Fling Sheriff", "Spins rapidly causing the Sheriff to fly", "Fling", function(p71)
    local v135, v136 = f31()

    if v135 then
      f10(v135)
    else
      p71.Text = "Not Found"
      task.delay(1.5, function() p71.Text = "Fling" end)
    end
  end)

  local instance47 = Instance.new("Frame", v102)
  instance47.Size = UDim2.new(1, 0, 0, 48)
  instance47.BackgroundColor3 = Color3.fromRGB(28, 28, 32)

  Instance.new("UICorner", instance47).CornerRadius = UDim.new(0, 8)

  local instance48 = Instance.new("TextLabel", instance47)
  instance48.Size = UDim2.new(0.5, 0, 0, 20)
  instance48.Position = UDim2.new(0, 12, 0, 6)
  instance48.BackgroundTransparency = 1
  instance48.Text = "Loopfling Player"
  instance48.TextColor3 = Color3.fromRGB(220, 220, 230)
  instance48.Font = Enum.Font.GothamBold
  instance48.TextSize = 13
  instance48.TextXAlignment = Enum.TextXAlignment.Left

  local instance49 = Instance.new("TextLabel", instance47)
  instance49.Size = UDim2.new(0.5, 0, 0, 18)
  instance49.Position = UDim2.new(0, 12, 0, 24)
  instance49.BackgroundTransparency = 1
  instance49.Text = "Clear box to stop loop"
  instance49.TextColor3 = Color3.fromRGB(140, 140, 150)
  instance49.Font = Enum.Font.Gotham
  instance49.TextSize = 11
  instance49.TextXAlignment = Enum.TextXAlignment.Left

  local instance50 = Instance.new("TextBox", instance47)
  instance50.Size = UDim2.new(0, 140, 0, 26)
  instance50.Position = UDim2.new(1, -152, 0.5, -13)
  instance50.BackgroundColor3 = Color3.fromRGB(40, 40, 44)
  instance50.TextColor3 = f6()
  instance50.Font = Enum.Font.GothamBold
  instance50.TextSize = 12
  instance50.Text = "Enter name..."
  instance50.ClearTextOnFocus = true

  Instance.new("UICorner", instance50).CornerRadius = UDim.new(0, 6)
  table.insert(v45, { inst = instance50, prop = "TextColor3" })
  local v137

  instance50.FocusLost:Connect(function(p72)
    if p72 then
      local lower2 = instance50.Text:lower()

      if lower2 == "" or lower2 == "enter name..." then
        v137 = nil
        instance50.Text = "Enter name..."
        return
      end

      for key13, value27 in pairs(players:GetPlayers()) do
        local v138 = value27

        if v138 ~= localPlayer
          and (v138.Name:lower():sub(1, #lower2) == lower2
            or v138.DisplayName:lower():sub(1, #lower2) == lower2) then
          v137 = v138
          instance50.Text = "Looping: " .. v138.Name

          task.spawn(function()
            while v137 == v138 and v138.Character do
              f10(v138)
              task.wait(0.2)
            end
          end)

          return
        end
      end

      v137 = nil
      instance50.Text = "Not Found"
      task.delay(1.5, function() instance50.Text = "Enter name..." end)
      return
    end
  end)
end

do
  local instance51 = Instance.new("Frame", v102)
  instance51.Size = UDim2.new(1, 0, 0, 48)
  instance51.BackgroundColor3 = Color3.fromRGB(28, 28, 32)

  Instance.new("UICorner", instance51).CornerRadius = UDim.new(0, 8)

  local instance52 = Instance.new("TextLabel", instance51)
  instance52.Size = UDim2.new(0.5, 0, 0, 20)
  instance52.Position = UDim2.new(0, 12, 0, 6)
  instance52.BackgroundTransparency = 1
  instance52.Text = "Fling Target Player"
  instance52.TextColor3 = Color3.fromRGB(220, 220, 230)
  instance52.Font = Enum.Font.GothamBold
  instance52.TextSize = 13
  instance52.TextXAlignment = Enum.TextXAlignment.Left

  local instance53 = Instance.new("TextLabel", instance51)
  instance53.Size = UDim2.new(0.5, 0, 0, 18)
  instance53.Position = UDim2.new(0, 12, 0, 24)
  instance53.BackgroundTransparency = 1
  instance53.Text = "Type partial name & press Enter"
  instance53.TextColor3 = Color3.fromRGB(140, 140, 150)
  instance53.Font = Enum.Font.Gotham
  instance53.TextSize = 11
  instance53.TextXAlignment = Enum.TextXAlignment.Left

  local instance54 = Instance.new("TextBox", instance51)
  instance54.Size = UDim2.new(0, 140, 0, 26)
  instance54.Position = UDim2.new(1, -152, 0.5, -13)
  instance54.BackgroundColor3 = Color3.fromRGB(40, 40, 44)
  instance54.TextColor3 = f6()
  instance54.Font = Enum.Font.GothamBold
  instance54.TextSize = 12
  instance54.Text = "Enter name..."
  instance54.ClearTextOnFocus = true

  Instance.new("UICorner", instance54).CornerRadius = UDim.new(0, 6)
  table.insert(v45, { inst = instance54, prop = "TextColor3" })

  instance54.FocusLost:Connect(function(p73)
    if p73 then
      local lower3 = instance54.Text:lower()

      if lower3 == "" then
        return
      end

      for key14, value28 in pairs(players:GetPlayers()) do
        if value28 ~= localPlayer
          and (value28.Name:lower():sub(1, #lower3) == lower3
            or value28.DisplayName:lower():sub(1, #lower3) == lower3) then
          f10(value28)
          instance54.Text = "Flinging!"
          task.delay(2, function() instance54.Text = "Enter name..." end)
          return
        end
      end

      instance54.Text = "Not Found"
      task.delay(1.5, function() instance54.Text = "Enter name..." end)
      return
    end
  end)
end

do
  local instance55 = Instance.new("Frame", v102)
  instance55.Size = UDim2.new(1, 0, 0, 48)
  instance55.BackgroundColor3 = Color3.fromRGB(28, 28, 32)

  Instance.new("UICorner", instance55).CornerRadius = UDim.new(0, 8)

  local instance56 = Instance.new("TextLabel", instance55)
  instance56.Size = UDim2.new(0.5, 0, 0, 20)
  instance56.Position = UDim2.new(0, 12, 0, 6)
  instance56.BackgroundTransparency = 1
  instance56.Text = "Orbit Target Player"
  instance56.TextColor3 = Color3.fromRGB(220, 220, 230)
  instance56.Font = Enum.Font.GothamBold
  instance56.TextSize = 13
  instance56.TextXAlignment = Enum.TextXAlignment.Left

  local instance57 = Instance.new("TextLabel", instance55)
  instance57.Size = UDim2.new(0.5, 0, 0, 18)
  instance57.Position = UDim2.new(0, 12, 0, 24)
  instance57.BackgroundTransparency = 1
  instance57.Text = "Type name to orbit (Clear to stop)"
  instance57.TextColor3 = Color3.fromRGB(140, 140, 150)
  instance57.Font = Enum.Font.Gotham
  instance57.TextSize = 11
  instance57.TextXAlignment = Enum.TextXAlignment.Left

  local instance58 = Instance.new("TextBox", instance55)
  instance58.Size = UDim2.new(0, 140, 0, 26)
  instance58.Position = UDim2.new(1, -152, 0.5, -13)
  instance58.BackgroundColor3 = Color3.fromRGB(40, 40, 44)
  instance58.TextColor3 = f6()
  instance58.Font = Enum.Font.GothamBold
  instance58.TextSize = 12
  instance58.Text = "Enter name..."
  instance58.ClearTextOnFocus = true

  Instance.new("UICorner", instance58).CornerRadius = UDim.new(0, 6)
  table.insert(v45, { inst = instance58, prop = "TextColor3" })

  instance58.FocusLost:Connect(function(p74)
    if p74 then
      local lower4 = instance58.Text:lower()

      if lower4 == "" or lower4 == "enter name..." then
        v56 = nil
        instance58.Text = "Enter name..."
        return
      end

      for key15, value29 in pairs(players:GetPlayers()) do
        if value29 ~= localPlayer
          and (value29.Name:lower():sub(1, #lower4) == lower4
            or value29.DisplayName:lower():sub(1, #lower4) == lower4) then
          v56 = value29
          instance58.Text = value29.Name
          return
        end
      end

      v56 = nil
      instance58.Text = "Not Found"
      task.delay(1.5, function() instance58.Text = "Enter name..." end)
      return
    end
  end)
end

f52(v102, "Orbit Distance", "Set distance from target", 5, 50, orbitDistance, function(p75)
  orbitDistance = p75
  f7()
end)

f52(v102, "Orbit Speed", "Adjust rotation speed", 10, 300, orbitSpeed, function(p76)
  orbitSpeed = p76
  f7()
end)

f51(v103, "Anti Fling", "Disables collision to prevent fling", AntiFlingEnabled, function(p77)
  AntiFlingEnabled = p77
  f7()
end)

f51(v103, "Infinite Jump", "Jump endlessly in mid-air", InfiniteJumpEnabled, function(p78)
  InfiniteJumpEnabled = p78
  f7()
end)

f51(v103, "Noclip", "Walk through walls", NoclipEnabled, function(p79)
  NoclipEnabled = p79

  if NoclipEnabled then
    f23()
  elseif connect3 then
    connect3:Disconnect()
    connect3 = nil
  end

  f7()
end)

f51(v103, "Fly", "Fly using WASD", FlyEnabled, function(p80)
  FlyEnabled = p80

  if FlyEnabled then
    f28()
  else
    f27()
  end

  if type(f7) == "function" then
    f7()
  end
end)

f52(v103, "Fly Speed", "Adjust your speed while flying", 10, 200, flySpeed, function(p81)
  flySpeed = p81
  f7()
end)

f52(v103, "Walk Speed", "Default is 16", 16, 100, playerSpeed, function(p82)
  playerSpeed = p82
  f16()
  f7()
end)

f52(v103, "Jump Power", "Default is 50", 50, 250, playerJump, function(p83)
  playerJump = p83
  f16()
  f7()
end)

f52(v103, "Spin Speed", "0 = Disabled", 0, 500, playerSpinSpeed, function(p84)
  playerSpinSpeed = p84
  f7()
end)

f51(v103, "Enable FOV", "Toggle custom Field of View", v49, function(p85)
  v49 = p85
  f17()
  f7()
end)

f52(v103, "FOV", "Default 70", 30, 120, playerFOV, function(p86)
  playerFOV = p86
  f17()
  f7()
end)

do
  f51(v103, "Infinite Zoom", "Zoom out far distances", InfiniteZoomEnabled, function(p87)
    InfiniteZoomEnabled = p87

    if p87 then
      f19()
    else
      f20()
    end

    f7()
  end)

  f52(v103, "Max Zoom Distance", "How far camera zooms out", 50, 2000, maxZoomDist, function(p88)
    maxZoomDist = p88
    f7()

    if InfiniteZoomEnabled then
      localPlayer.CameraMaxZoomDistance = maxZoomDist
    end
  end)

  f54(v103, "Reset Stats", "Restore default properties", "Reset", function()
    playerSpeed = 16
    playerJump = 50
    flySpeed = 50
    playerFOV = 70
    playerSpinSpeed = 0
    InfiniteJumpEnabled = false
    f16()
    f17()
    f7()
  end)

  f51(v104, "Motion Blur", "Blurs screen when rotating camera", MotionBlurEnabled, function(p89)
    MotionBlurEnabled = p89
    f7()
  end)

  f52(v104, "Blur Intensity", "Multiplier for blur weight", 50, 400, MotionBlurIntensity, function(p90)
    MotionBlurIntensity = p90
    f7()
  end)

  f52(v104, "Min. Cam Movement", "Threshold to bypass to blur", 0, 25, MotionBlurThreshold, function(p91)
    MotionBlurThreshold = p91
    f7()
  end)

  local v139 = f52(v104, "Saturation", "Adjust screen color saturation", -100, 100, SaturationValue * 100, function(p92)
    SaturationValue = p92 / 100

    if alienwareColorCorrection then
      alienwareColorCorrection.Saturation = SaturationValue
    end

    f7()
  end)

  f54(v104, "Reset Saturation", "Restore default color saturation", "Reset", function()
    SaturationValue = 0

    if alienwareColorCorrection then
      alienwareColorCorrection.Saturation = 0
    end

    v139.UpdateExternal(0)
    f7()
  end)

  local v140 = f52(v104, "Time of Day", "Adjust the local game time", 0, 24, CustomTime, function(p93)
    CustomTime = p93
    CustomTimeEnabled = true
    game.Lighting.ClockTime = p93
    f7()
  end)

  f54(v104, "Reset Time", "Restore default server time", "Reset", function()
    CustomTimeEnabled = false
    CustomTime = 14
    game.Lighting.ClockTime = 14
    v140.UpdateExternal(14)
    f7()
  end)

  f51(v107, "Autofarm", "Travels towards all event currencies, avoids currencies where murderer is near most", CoinFarmEnabled, function(p94)
    CoinFarmEnabled = p94
    f7()
  end)

  f51(v107, "Anti AFK", "Prevents getting kicked for 20 minutes of inactivity", AntiAFKEnabled, function(p95)
    AntiAFKEnabled = p95
    f26(p95)
    f7()
  end)
end

do
  localPlayer2 = players.LocalPlayer

  task.spawn(function()
    local localPlayer3 = players.LocalPlayer

    local waitForChild = replicatedStorage:WaitForChild("Remotes", 10):WaitForChild(
      "Gameplay", 10
    ):WaitForChild(
      "CoinCollected", 10
    )

    if waitForChild then
      waitForChild.OnClientEvent:Connect(function(p96, p97, p98)
        local v141 = tonumber(p97)
        local v142 = tonumber(p98)
        local character22 = localPlayer3.Character

        local humanoid12 = character22
        humanoid12 = character22 and character22:FindFirstChild("Humanoid")

        local coinFarmEnabled = CoinFarmEnabled
        local v143 = humanoid12

        if coinFarmEnabled and v143 and v143.Health > 0 and v141 and v142 and v142 <= v141 then
          v143.Health = 0
        end
      end)
    end
  end)

  task.spawn(function()
    local v144

    while task.wait(0.5) do
      if not v43 then
        break
      elseif not CoinFarmEnabled then
      else
        local v145 = {
          pcall(function()
            local v146 = f9()

            local magnitude3, character23, humanoidRootPart19, humanoid13, localPlayer4, v147,
              v148, connect8, connect9

            if not v146 then
              return
            else
              local coinContainer = v146:FindFirstChild("CoinContainer")

              if not coinContainer then
                return
              end

              character23 = localPlayer2.Character

              if not character23 or not character23:IsDescendantOf(workspace) then
                return
              end

              humanoidRootPart19 = character23:FindFirstChild("HumanoidRootPart")
              humanoid13 = character23:FindFirstChild("Humanoid")

              if not humanoidRootPart19 or not humanoid13 or humanoid13.Health <= 0 then
                return
              else
                local regularLobby2 = workspace:FindFirstChild("RegularLobby")
                  or workspace:FindFirstChild("Lobby")

                if regularLobby2 then
                  if (humanoidRootPart19.Position - regularLobby2:GetPivot().Position).Magnitude
                    <= 120 then
                    return
                  end
                end

                localPlayer4 = players.LocalPlayer

                local v149
                v149, v147 = f32()

                local humanoid14 = v147 and v147:FindFirstChild("Humanoid")
                local humanoidRootPart20 = v147 and v147:FindFirstChild("HumanoidRootPart")
                v148 = v147 == localPlayer4.Character or v149 == localPlayer4

                if not v148 then
                  if v147 and humanoid14 and humanoid14.Health > 0 then
                    if v144 ~= v147 then
                      v144 = v147

                      connect8 = nil

                      connect8 = humanoid14.Died:Connect(function()
                        local character24 = localPlayer4.Character

                        local humanoid15 = character24
                          and character24:FindFirstChild("Humanoid")

                        if CoinFarmEnabled and humanoid15 and humanoid15.Health > 0 then
                          humanoid15.Health = 0
                        end

                        if connect8 then
                          connect8:Disconnect()
                        end
                      end)

                      connect9 = nil

                      connect9 = v147.AncestryChanged:Connect(function()
                        if not v147:IsDescendantOf(workspace) then
                          local character25 = localPlayer4.Character

                          local humanoid16 = character25
                            and character25:FindFirstChild("Humanoid")

                          if CoinFarmEnabled and humanoid16 and humanoid16.Health > 0 then
                            humanoid16.Health = 0
                          end

                          if connect9 then
                            connect9:Disconnect()
                          end
                        end
                      end)
                    end
                  elseif v144 ~= nil then
                    v144 = nil
                    local character26 = localPlayer4.Character

                    local humanoid17 = character26
                    humanoid17 = character26 and character26:FindFirstChild("Humanoid")

                    local coinFarmEnabled2 = CoinFarmEnabled
                    local v150 = coinFarmEnabled2

                    if coinFarmEnabled2 then
                      local v151 = humanoid17

                      if humanoid17 then
                        magnitude3 = "\155\27\164\219\2087"
                        v151 = humanoid17[v40[f2(magnitude3, 32289304083131)]] > 0
                      end

                      v150 = v151
                    end

                    if v150 then
                      humanoid17.Health = 0
                    end
                  end
                else
                  v144 = nil
                end

                local v152 = {}

                for index15, value30 in ipairs(coinContainer:GetChildren()) do
                  local v153 = not value30
                  local v154 = v153

                  if not v153 then
                    magnitude3 = "workspace"
                    v154 = not value30:IsDescendantOf(_ENV[magnitude3])
                  end

                  if v154 then
                  else
                    magnitude3 = "Coin_Server"
                    local v155 = value30.Name == magnitude3
                    local isA = v155

                    if v155 then
                      magnitude3 = v40
                      isA = value30:IsA(magnitude3[9722973442479])
                    end

                    if not isA then
                    else
                      local v156 = not v148
                      local v157 = v156

                      if v156 then
                        local v158 = humanoidRootPart20

                        if humanoidRootPart20 then
                          magnitude3 = (value30.Position - humanoidRootPart20.Position).Magnitude
                          v158 = magnitude3 <= 15
                        end

                        v157 = v158
                      end

                      if v157 then
                      else
                        magnitude3 = 19642970710970
                        table[v40[magnitude3]](v152, value30)
                      end
                    end
                  end
                end

                if #v152 == 0 then
                  return
                end

                table.sort(v152, function(p99, p100)
                  return (p99.Position - humanoidRootPart19.Position).Magnitude
                    < (p100.Position - humanoidRootPart19.Position).Magnitude
                end)

                for index16, value31 in ipairs(v152) do
                  local coinFarmEnabled3 = CoinFarmEnabled
                  local v159 = not coinFarmEnabled3
                  local v160 = v159

                  if not v159 then
                    coinFarmEnabled3 = v43
                    v160 = not coinFarmEnabled3
                  end

                  if v160 then
                    break
                  end

                  if not value31 or not value31:IsDescendantOf(workspace) then
                  elseif not humanoid13 or humanoid13.Health <= 0
                    or not humanoidRootPart19:IsDescendantOf(workspace) then
                    break
                  else
                    local create10 = tweenService:Create(humanoidRootPart19, TweenInfo.new((humanoidRootPart19.Position
                        - value31.Position).Magnitude
                      / 25, Enum.EasingStyle.Linear), { CFrame = value31.CFrame })

                    local v161 = true

                    local connect10

                    connect10 = runService.Heartbeat:Connect(function()
                      if v148 then
                        return
                      end

                      if not humanoidRootPart19
                        or not humanoidRootPart19:IsDescendantOf(workspace)
                        or humanoid13 and humanoid13.Health <= 0 then
                        v161 = false
                        create10:Cancel()

                        if connect10 then
                          connect10:Disconnect()
                        end

                        return
                      else
                        local v162, v163 = f32()

                        local humanoidRootPart21 = v163
                          and v163:FindFirstChild("HumanoidRootPart")

                        if humanoidRootPart21
                          and (humanoidRootPart19.Position - humanoidRootPart21.Position).Magnitude
                            <= 15 then
                          v161 = false
                          create10:Cancel()

                          humanoidRootPart19.CFrame = humanoidRootPart19.CFrame
                            - Vector3.new(0, 15, 0)

                          if connect10 then
                            connect10:Disconnect()
                          end
                        end

                        if humanoidRootPart21
                          and (humanoidRootPart19.Position - humanoidRootPart21.Position).Magnitude
                            <= 20 then
                          v161 = false
                          create10:Cancel()
                          local v164 = 15
                          local position2 = humanoidRootPart21.Position
                          local position3 = humanoidRootPart19.Position

                          local raycastParams2 = RaycastParams.new()
                          raycastParams2.FilterDescendantsInstances = { v163, character23 }
                          raycastParams2.FilterType = Enum.RaycastFilterType.Exclude

                          if not workspace:Raycast(position2, position3 - position2, raycastParams2) then
                            v164 = 55
                          end

                          humanoidRootPart19.CFrame = humanoidRootPart19.CFrame
                            - Vector3.new(0, v164, 0)

                          if connect10 then
                            connect10:Disconnect()
                          end
                        end

                        return
                      end
                    end)

                    create10:Play()
                    create10.Completed:Wait()

                    if connect10 then
                      connect10:Disconnect()
                    end

                    if not v161 then
                      if v148 then
                      else
                        if humanoidRootPart19 and humanoidRootPart19:IsDescendantOf(workspace) then
                          humanoidRootPart19.Anchored = true
                          humanoidRootPart19.AssemblyLinearVelocity = Vector3.zero
                        end

                        while true do
                          local v165, v166 = f32()

                          local humanoidRootPart22 = v166
                          humanoidRootPart22 = v166 and v166:FindFirstChild("HumanoidRootPart")

                          if not humanoidRootPart22 then
                            break
                          end

                          if math.sqrt((humanoidRootPart19.Position.X
                                  - humanoidRootPart22.Position.X)
                                ^ 2
                              + (humanoidRootPart19.Position.Z - humanoidRootPart22.Position.Z)
                                ^ 2)
                            > 20 then
                            break
                          end

                          task.wait(0.2)

                          if not humanoid13 or humanoid13.Health <= 0 then
                            break
                          end
                        end

                        if humanoidRootPart19 and humanoidRootPart19:IsDescendantOf(workspace) then
                          humanoidRootPart19.CFrame = humanoidRootPart19.CFrame
                            + Vector3.new(0, 15, 0)

                          humanoidRootPart19.AssemblyLinearVelocity = Vector3.zero
                          humanoidRootPart19.Anchored = false
                        end
                      end
                    else
                      task.wait(0.1)
                    end
                  end
                end

                return
              end
            end
          end),
        }
      end
    end
  end)

  f51(v106, "Anti Steal", "Keeps all your items and godlies safe from being stolen by other scripts", unknown, function(p101)
    unknown = p101
    f7()
  end)

  f52(v105, "GUI Size", "Adjust the scale of the menu", 50, 200, GuiScale * 100, function(p102)
    GuiScale = p102 / 100

    if instance5 then
      instance5.Scale = GuiScale
    end

    f7()
  end)

  v167 = f51(v105, "GUI Hotkey", "Select key to show/hide GUI", false, function() end, true)

  f51(v105, "Rainbow Theme", "Smoothly shifts theme colors continuously", RainbowThemeEnabled, function(p103)
    RainbowThemeEnabled = p103
    f7()
  end)

  local v168 = f52(v105, "Theme Hue", "Change the script's theme color", 0, 360, ThemeHue, function(p104)
    ThemeHue = p104
    f6()
    f8()
    f7()
  end, true)

  f54(v105, "Reset Theme", "Restore original custom theme color", "Reset", function()
    ThemeHue = 140
    v168.UpdateExternal(140)
    f6()
    f8()
    f7()
  end)

  f54(v106, "Rejoin Server", "Reconnect to server", "Rejoin", function()
    teleportService:Teleport(game.PlaceId, localPlayer2)
  end)

  f52(v106, "FPS Cap Override", "Adjust max rendering rate", 30, 600, fpsCap, function(p105)
    fpsCap = p105
    f15()
    f7()
  end)

  local instance59 = Instance.new("Frame", v106)
  instance59.Size = UDim2.new(1, 0, 0, 48)
  instance59.BackgroundColor3 = Color3.fromRGB(28, 28, 32)

  Instance.new("UICorner", instance59).CornerRadius = UDim.new(0, 8)

  gunSoundTitle = Instance.new("TextLabel", instance59)
  gunSoundTitle.Size = UDim2.new(0.5, 0, 0, 20)
  gunSoundTitle.Position = UDim2.new(0, 12, 0, 6)
  gunSoundTitle.BackgroundTransparency = 1
  gunSoundTitle.Text = "Custom Gun Sound"
  gunSoundTitle.TextColor3 = Color3.fromRGB(220, 220, 230)
  gunSoundTitle.Font = Enum.Font.GothamBold
  gunSoundTitle.TextSize = 13
  gunSoundTitle.TextXAlignment = Enum.TextXAlignment.Left

  gunSoundDesc = Instance.new("TextLabel", instance59)
  gunSoundDesc.Size = UDim2.new(0.5, 0, 0, 18)
  gunSoundDesc.Position = UDim2.new(0, 12, 0, 24)
  gunSoundDesc.BackgroundTransparency = 1
  gunSoundDesc.Text = "Paste audio ID to replace Gunshot"
  gunSoundDesc.TextColor3 = Color3.fromRGB(140, 140, 150)
  gunSoundDesc.Font = Enum.Font.Gotham
  gunSoundDesc.TextSize = 11
  gunSoundDesc.TextXAlignment = Enum.TextXAlignment.Left

  gunSoundInput = Instance.new("TextBox", instance59)
end

do
  gunSoundInput.Size = UDim2.new(0, 140, 0, 26)
  gunSoundInput.Position = UDim2.new(1, -152, 0.5, -13)
  gunSoundInput.BackgroundColor3 = Color3.fromRGB(40, 40, 44)
  gunSoundInput.TextColor3 = f6()
  gunSoundInput.Font = Enum.Font.GothamBold
  gunSoundInput.TextSize = 12

  local v169 = gunSoundInput
  v169.Text = ActiveGunSoundID == "" and "Enter ID..." or ActiveGunSoundID

  gunSoundInput.ClearTextOnFocus = true
  Instance.new("UICorner", gunSoundInput).CornerRadius = UDim.new(0, 6)
  table.insert(v45, { inst = gunSoundInput, prop = "TextColor3" })
end

local function f55(p106)
  local gsub2 = tostring(p106):gsub("%D", "")

  if gsub2 == "" then
    return
  else
    ActiveGunSoundID = "rbxassetid://" .. gsub2
    f7()

    local function f56(p107)
      local handle2 = p107:FindFirstChild("Handle")

      if not handle2 then
        return
      else
        local gunshot = handle2:FindFirstChild("Gunshot")

        if gunshot and gunshot:IsA("Sound") then
          gunshot.SoundId = ActiveGunSoundID
        end

        return
      end
    end

    local character27 = localPlayer2.Character

    if character27 then
      local gun2 = character27:FindFirstChild("Gun")

      if gun2 then
        f56(gun2)
      end
    end

    local backpack = localPlayer2:FindFirstChild("Backpack")

    if backpack then
      local gun3 = backpack:FindFirstChild("Gun")

      if gun3 then
        f56(gun3)
      end
    end

    return
  end
end

f3(localPlayer2.CharacterAdded:Connect(function(character28)
  character28.ChildAdded:Connect(function(child)
    if child.Name == "Gun" and ActiveGunSoundID ~= "" then
      task.wait(0.1)
      local handle3 = child:FindFirstChild("Handle")

      if handle3 then
        local gunshot2 = handle3:FindFirstChild("Gunshot")

        if gunshot2 and gunshot2:IsA("Sound") then
          gunshot2.SoundId = ActiveGunSoundID
        end
      end
    end
  end)
end))

f3(players.LocalPlayer.Backpack.ChildAdded:Connect(function(child2)
  if child2.Name == "Gun" and ActiveGunSoundID ~= "" then
    task.wait(0.1)
    local handle4 = child2:FindFirstChild("Handle")

    if handle4 then
      local gunshot3 = handle4:FindFirstChild("Gunshot")

      if gunshot3 and gunshot3:IsA("Sound") then
        gunshot3.SoundId = ActiveGunSoundID
      end
    end
  end
end))

gunSoundInput.FocusLost:Connect(function(p108)
  if p108 then
    local text10 = gunSoundInput.Text

    if text10 == "" or text10 == "Enter ID..." then
      return
    end

    f55(text10)
    gunSoundInput.Text = "Applied!"
    task.delay(1.5, function() gunSoundInput.Text = "Enter ID..." end)
    return
  end
end)

f52(v106, "Gun Volume", "Adjust the gunshot sound volume", 0, 10, 10, function(volume)
  local function f57(p109)
    local handle5 = p109:FindFirstChild("Handle")

    if not handle5 then
      return
    else
      local gunshot4 = handle5:FindFirstChild("Gunshot")

      if gunshot4 and gunshot4:IsA("Sound") then
        gunshot4.Volume = volume
      end

      return
    end
  end

  local character29 = localPlayer2.Character

  if character29 then
    local gun4 = character29:FindFirstChild("Gun")

    if gun4 then
      f57(gun4)
    end
  end

  local backpack2 = localPlayer2:FindFirstChild("Backpack")

  if backpack2 then
    local gun5 = backpack2:FindFirstChild("Gun")

    if gun5 then
      f57(gun5)
    end
  end
end)

f54(v106, "Reset Gun Sound", "Restore original gunshot sound and volume", "Reset", function()
  ActiveGunSoundID = ""
  f7()
  gunSoundInput.Text = "Enter ID..."

  local function f58(p110)
    local handle6 = p110:FindFirstChild("Handle")

    if not handle6 then
      return
    else
      local gunshot5 = handle6:FindFirstChild("Gunshot")

      if gunshot5 and gunshot5:IsA("Sound") then
        gunshot5.SoundId = "rbxassetid://4800558317"
        gunshot5.Volume = 1
      end

      return
    end
  end

  local character30 = localPlayer2.Character

  if character30 then
    local gun6 = character30:FindFirstChild("Gun")

    if gun6 then
      f58(gun6)
    end
  end

  local backpack3 = localPlayer2:FindFirstChild("Backpack")

  if backpack3 then
    local gun7 = backpack3:FindFirstChild("Gun")

    if gun7 then
      f58(gun7)
    end
  end
end)

cursorRow = Instance.new("Frame", v106)
cursorRow.Size = UDim2.new(1, 0, 0, 48)
cursorRow.BackgroundColor3 = Color3.fromRGB(28, 28, 32)

Instance.new("UICorner", cursorRow).CornerRadius = UDim.new(0, 8)

cursorTitle = Instance.new("TextLabel", cursorRow)
cursorTitle.Size = UDim2.new(0.5, 0, 0, 20)
cursorTitle.Position = UDim2.new(0, 12, 0, 6)
cursorTitle.BackgroundTransparency = 1
cursorTitle.Text = "Custom Cursor ID"
cursorTitle.TextColor3 = Color3.fromRGB(220, 220, 230)
cursorTitle.Font = Enum.Font.GothamBold
cursorTitle.TextSize = 13
cursorTitle.TextXAlignment = Enum.TextXAlignment.Left

cursorDesc = Instance.new("TextLabel", cursorRow)
cursorDesc.Size = UDim2.new(0.5, 0, 0, 18)
cursorDesc.Position = UDim2.new(0, 12, 0, 24)
cursorDesc.BackgroundTransparency = 1
cursorDesc.Text = "Paste asset Image ID here"
cursorDesc.TextColor3 = Color3.fromRGB(140, 140, 150)

do
  cursorDesc.Font = Enum.Font.Gotham
  cursorDesc.TextSize = 11
  cursorDesc.TextXAlignment = Enum.TextXAlignment.Left

  cursorInput = Instance.new("TextBox", cursorRow)
  cursorInput.Size = UDim2.new(0, 140, 0, 26)
  cursorInput.Position = UDim2.new(1, -152, 0.5, -13)
  cursorInput.BackgroundColor3 = Color3.fromRGB(40, 40, 44)
  cursorInput.TextColor3 = f6()
  cursorInput.Font = Enum.Font.GothamBold
  cursorInput.TextSize = 12

  local v170 = cursorInput
  v170.Text = CustomCursorID == "" and "Enter ID..." or CustomCursorID
end

do
  cursorInput.ClearTextOnFocus = true
  Instance.new("UICorner", cursorInput).CornerRadius = UDim.new(0, 6)
  table.insert(v45, { inst = cursorInput, prop = "TextColor3" })

  cursorInput.FocusLost:Connect(function()
    local text11 = cursorInput.Text

    if text11 == "" or text11 == "Enter ID..." then
      CustomCursorID = ""
    else
      CustomCursorID = text11
    end

    f14()
    f7()
  end)

  local v171 = f52(v106, "Custom Cursor Size", "Adjust crosshair viewport rendering size", 16, 150, CustomCursorSize, function(p111)
    CustomCursorSize = p111

    if customCursorOverlay.Visible then
      customCursorOverlay.Size = UDim2.new(0, CustomCursorSize, 0, CustomCursorSize)
    end

    f7()
  end)

  f51(v106, "Spin Cursor", "Constantly rotate your custom cursor", CursorSpinEnabled, function(p112)
    CursorSpinEnabled = p112
    f7()
  end)

  f52(v106, "Spin Speed", "Adjust cursor rotation speed", 1, 100, CursorSpinSpeed, function(p113)
    CursorSpinSpeed = p113
    f7()
  end)

  f51(v106, "Angle Cursor", "Force cursor transformation to fixed angle setup", CursorAngleEnabled, function(p114)
    CursorAngleEnabled = p114
    f7()
  end)

  f52(v106, "Cursor Angle", "Manually pivot the fixed view layout alignment", 0, 360, CursorAngle, function(p115)
    CursorAngle = p115
    f7()
  end)

  f54(v106, "Reset Cursor", "Revert mouse behavior configurations", "Reset", function()
    CustomCursorID = ""
    CustomCursorSize = 32
    CursorAngleEnabled = false
    CursorAngle = 0
    cursorInput.Text = "Enter ID..."
    v171.UpdateExternal(32)
    f14()
    f7()
  end)

  loadstring(game:HttpGet("https://raw.githubusercontent.com/AL1ENW4R3/Alienware-MM2/refs/heads/main/FUNNY%20MOMENTS"))()
  v172 = false
end

do
  local connect11

  f51(v108, "View RC Car", "Lets you view your RC Car.", false, function(p116)
    v172 = p116
    local currentCamera4 = workspace.CurrentCamera
    local character31 = localPlayer2.Character
    local humanoid18 = character31 and character31:FindFirstChildOfClass("Humanoid")
    local humanoidRootPart23 = character31 and character31:FindFirstChild("HumanoidRootPart")
    local head3 = character31 and character31:FindFirstChild("Head")
    local v173, connect12

    if p116 then
      if connect11 then
        connect11:Disconnect()
      end

      connect11 = runService.RenderStepped:Connect(function()
        if not v172 then
          return
        end

        if humanoid18 and humanoidRootPart23 and humanoid18.WalkSpeed == 0
          and humanoid18.JumpPower == 0 then
          local rcCars = workspace:FindFirstChild("RCCars")

          if rcCars then
            local v174 = nil
            local huge2 = math.huge

            for index17, value32 in ipairs(rcCars:GetChildren()) do
              if value32.Name == "RCCar" and value32:IsA("Model") then
                local body = value32:FindFirstChild("Body")

                if body and body:IsA("MeshPart") then
                  local magnitude4 = (body.Position - humanoidRootPart23.Position).Magnitude

                  if magnitude4 < huge2 then
                    huge2 = magnitude4
                    v174 = value32
                  end
                end
              end
            end

            if v174 then
              local body2 = v174:FindFirstChild("Body")

              if body2 then
                currentCamera4.CameraSubject = body2
              end
            else
              currentCamera4.CameraSubject = humanoid18
            end
          end
        else
          currentCamera4.CameraSubject = humanoid18
        end
      end)
    else
      if connect11 then
        connect11:Disconnect()
        connect11 = nil
      end

      if humanoid18 and head3 then
        currentCamera4.CameraSubject = humanoid18
        currentCamera4.CameraType = Enum.CameraType.Custom

        v173 = 0

        connect12 = nil

        connect12 = runService.RenderStepped:Connect(function()
          v173 = v173 + 1

          currentCamera4.CameraSubject = humanoid18
          currentCamera4.CameraType = Enum.CameraType.Custom

          if v173 > 10 then
            connect12:Disconnect()
            connect12 = nil
          end
        end)
      end
    end
  end)

  function SetPage(p117)
    v99.Visible = false
    v100.Visible = false
    v101.Visible = false
    v102.Visible = false
    v107.Visible = false
    v103.Visible = false
    v104.Visible = false
    v105.Visible = false
    v106.Visible = false
    v108.Visible = false

    for key16, value33 in pairs({ v89, v90, v91, v92, v93, v94, v95, v98, v96, v97 }) do
      value33.BackgroundColor3 = Color3.fromRGB(28, 28, 30)
      value33.TextColor3 = Color3.fromRGB(150, 150, 160)

      local uiStroke = value33:FindFirstChildOfClass("UIStroke")

      if uiStroke then
        uiStroke.Enabled = false
      end
    end

    if p117 == "ESP" then
      v99.Visible = true

      v89.BackgroundColor3 = Color3.fromRGB(40, 40, 44)
      v89.TextColor3 = Color3.fromRGB(230, 230, 240)
      v89:FindFirstChildOfClass("UIStroke").Enabled = true
    elseif p117 == "Combat" then
      v100.Visible = true

      v90.BackgroundColor3 = Color3.fromRGB(40, 40, 44)
      v90.TextColor3 = Color3.fromRGB(230, 230, 240)
      v90:FindFirstChildOfClass("UIStroke").Enabled = true
    elseif p117 == "Teleport" then
      v101.Visible = true

      v91.BackgroundColor3 = Color3.fromRGB(40, 40, 44)
      v91.TextColor3 = Color3.fromRGB(230, 230, 240)
      v91:FindFirstChildOfClass("UIStroke").Enabled = true
    elseif p117 == "Trolling" then
      v102.Visible = true

      v92.BackgroundColor3 = Color3.fromRGB(40, 40, 44)
      v92.TextColor3 = Color3.fromRGB(230, 230, 240)
      v92:FindFirstChildOfClass("UIStroke").Enabled = true
    elseif p117 == "Character" then
      v103.Visible = true

      v93.BackgroundColor3 = Color3.fromRGB(40, 40, 44)
      v93.TextColor3 = Color3.fromRGB(230, 230, 240)
      v93:FindFirstChildOfClass("UIStroke").Enabled = true
    elseif p117 == "Graphics" then
      v104.Visible = true

      v94.BackgroundColor3 = Color3.fromRGB(40, 40, 44)
      v94.TextColor3 = Color3.fromRGB(230, 230, 240)
      v94:FindFirstChildOfClass("UIStroke").Enabled = true
    elseif p117 == "Settings" then
      v105.Visible = true

      v98.BackgroundColor3 = Color3.fromRGB(40, 40, 44)
      v98.TextColor3 = Color3.fromRGB(230, 230, 240)
      v98:FindFirstChildOfClass("UIStroke").Enabled = true
    elseif p117 == "Autofarm" then
      v107.Visible = true

      v96.BackgroundColor3 = Color3.fromRGB(40, 40, 44)
      v96.TextColor3 = Color3.fromRGB(230, 230, 240)
      v96:FindFirstChildOfClass("UIStroke").Enabled = true
    elseif p117 == "Fun" then
      v108.Visible = true

      v97.BackgroundColor3 = Color3.fromRGB(40, 40, 44)
      v97.TextColor3 = Color3.fromRGB(230, 230, 240)
      v97:FindFirstChildOfClass("UIStroke").Enabled = true
    else
      v106.Visible = true

      v95.BackgroundColor3 = Color3.fromRGB(40, 40, 44)
      v95.TextColor3 = Color3.fromRGB(230, 230, 240)
      v95:FindFirstChildOfClass("UIStroke").Enabled = true
    end
  end

  f50(v89, function() SetPage("ESP") end)
  f50(v90, function() SetPage("Combat") end)
  f50(v91, function() SetPage("Teleport") end)
  f50(v92, function() SetPage("Trolling") end)
  f50(v93, function() SetPage("Character") end)
  f50(v94, function() SetPage("Graphics") end)
  f50(v98, function() SetPage("Settings") end)
  f50(v95, function() SetPage("Misc") end)
  f50(v96, function() SetPage("Autofarm") end)
end

do
  f50(v97, function() SetPage("Fun") end)

  local function f59(p118)
    local v175 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

    return string.gsub(p118, "[^" .. v175 .. "=]", ""):gsub(".", function(p119)
      if p119 == "=" then
        return ""
      else
        local text12 = ""
        local v176 = v175:find(p119) - 1
        local v177 = 7

        while true do
          v177 = -1 + v177

          if not (1 <= v177 or false) then
            break
          end

          local v178 = v177
          text12 = text12 .. (v176 % 2 ^ v178 - v176 % 2 ^ (v178 - 1) > 0 and "1" or "0")
        end

        return text12
      end
    end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(p120)
      if #p120 ~= 8 then
        return ""
      else
        local total3 = 0

        for n = 1, 8 do
          total3 = total3 + (p120:sub(n, n) == "1" and 2 ^ (8 - n) or 0)
        end

        return string.char(total3)
      end
    end)
  end

  local qwxpZW53YXJl = f59("QWxpZW53YXJl")

  if instance13.Text ~= qwxpZW53YXJl then
    while true do
      setfpscap(3)
      task.wait(0.1)
    end
  end

  f44()
  f14()
  f17()
  f15()

  if InfiniteZoomEnabled then
    f19()
  end

  if ActiveGunSoundID ~= "" then
    f55(ActiveGunSoundID)
  end

  currentCamera:GetPropertyChangedSignal("FieldOfView"):Connect(function()
    if v49 and currentCamera.FieldOfView ~= playerFOV then
      currentCamera.FieldOfView = playerFOV
    end
  end)

  loadstring(game:HttpGet("https://raw.githubusercontent.com/AL1ENW4R3/Alienware-MM2/refs/heads/main/Alienware%20V2%20STL"))()
end

do
  f3(userInputService.InputBegan:Connect(function(input6, p121)
    if p121 or not v43 then
      return
    elseif WaitingForKey then
      if input6.UserInputType == Enum.UserInputType.Keyboard then
        HotkeyKey = input6.KeyCode
        v167.Text = tostring(HotkeyKey.Name)
        WaitingForKey = false
        f7()
      end

      return
    else
      if WaitingForXrayKey then
        if input6.UserInputType == Enum.UserInputType.Keyboard then
          XrayKey = input6.KeyCode
          instance42.Text = "Xray Hotkey: " .. tostring(XrayKey.Name)
          WaitingForXrayKey = false
          f7()
        end

        return
      end

      if input6.KeyCode == HotkeyKey then
        f46(not v83)
      end

      if input6.KeyCode == XrayKey then
        XrayEnabled = not XrayEnabled
        v122.set(XrayEnabled)

        if XrayEnabled then
          f43()
        else
          f42()
        end

        f7()
      end

      return
    end
  end))

  task.spawn(function()
    while task.wait(0.4) do
      if not v43 then
        break
      elseif ChamsESPEnabled then
        f36()
      end
    end
  end)

  f3(runService.RenderStepped:Connect(function()
    if v43 and math.abs(currentCamera.FieldOfView - playerFOV) > 0.5 then
      if v49 then
        currentCamera.FieldOfView = playerFOV
      end
    end

    if v43 and CustomTimeEnabled then
      game.Lighting.ClockTime = CustomTime
    end
  end))

  if XrayEnabled then
    f43()
  end

  if NoclipEnabled then
    f23()
  end

  if FlyEnabled then
    f28()
  end

  if FreecamEnabled then
    f22()
  end

  f16()
  local connect13

  local function f60(p122)
    if p122 and p122.KeyCode ~= Enum.KeyCode.BackSlash then
      return
    else
      starterGui:SetCore("SendNotification", {
        Title = "Alienware",
        Text = "Triggered Killswitch.",
        Duration = 5,
      })

      if connect13 then
        connect13:Disconnect()
      end

      v43 = false

      for key17, value34 in pairs(v44) do
      end

      table.clear(v44)
      f34()
      f37()
      f42()
      f27()
      f21()
      f20()
      v172 = false

      if connect3 then
        connect3:Disconnect()
        connect3 = nil
      end

      userInputService.MouseIconEnabled = true
      getMouse.Icon = ""
      currentCamera.FieldOfView = 70

      if instance3 then
        instance3:Destroy()
      end

      if setfpscap then
        setfpscap(60)
      end

      local currentCamera5 = workspace.CurrentCamera

      if currentCamera5 then
        local character32 = localPlayer2.Character

        local humanoid19 = character32
        humanoid19 = character32 and character32:FindFirstChildOfClass("Humanoid")

        if humanoid19 then
          currentCamera5.CameraSubject = humanoid19
          currentCamera5.CameraType = Enum.CameraType.Custom
        end
      end

      local character33 = localPlayer2.Character

      if character33 then
        local humanoid20 = character33:FindFirstChildOfClass("Humanoid")

        if humanoid20 then
          humanoid20.WalkSpeed = 16
          humanoid20.JumpPower = 50
        end
      end

      if alienware and alienware.Parent then
        alienware:Destroy()
      end

      print("[Alienware] Killswitch activated — script destroyed.")
      return
    end
  end

  connect13 = userInputService.InputBegan:Connect(f60)

  local v179 = f51(v105, "Killswitch", "Completely unload Alienware", false, nil, true)
  v179.Text = "Unload"
  v179.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
  v179.TextColor3 = Color3.fromRGB(255, 255, 255)
  v179.Activated:Connect(function() f60() end)
end

starterGui:SetCore("SendNotification", {
  Title = "Alienware",
  Text = "Thank you for choosing Alienware!",
  Duration = 5,
})
