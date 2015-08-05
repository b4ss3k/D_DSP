! setsysp.pan
! System Printing Configuration
@f{_fg1}
@b{_bg1}
@panel

       Misc
<>
Print to File         <# c             w{13}   t{'" Send Print Output to Disk File "'   }   >~setvar("_prntof", <{_prntof}>)~<0><1>
Cancel Print on Error <% c w{18} x{-1} y{-1}   t{'" Stop Printing if Errors Encountered "'} >~setvar("_prncoe", <{_prncoe}>)~<0><1>
Display Setup Dialog  <% c w{18} x{-1} y{-1}   t{'" Show Print Setup Dialog on Initial Print "'} >~setvar("_prnsdg", <{_prnsdg}>)~<0><1>
<>
Plot Decimation       <% r n x{5}              t{'" Plot Each Point Regardless of Printer Resolution | Decimate Points Based on Printer Resolution "'} >~setvar("_prndec", '<{_prndec}>')~<None><Automatic><>
Portrait Adjust       <% r n x{-1} y{-1}       t{'" No Size Adjustment | Adjust Height and Width to Match Landscape Mode | Maximize Height "'}         >~setvar("_prnadp", '<{_prnadp}>')~<None><Height && Width><Height Only>
Default Orientation   <% r n x{-1} y{-1}       t{'" Use Paper Height as Horizontal Axis | Use Paper Width as Horizontal Axis "'}                       >~setvar("_prnort", '<{_prnort}>')~<Landscape><Portrait><>
   Print Filename:    <% w{70} j{3} e{_prntof} t{'" Destination for PRINT TO FILE Option "'}                                                           >~setvar("_prnfn",  '<{_prnfn}>')~input(5)
{_defsetstr} <# b x{-1} y{-1}>~~_defprt
<>
Scaling <L>
X Pixel Dimension:  <% w{20} *               t{'" Pixels in X Direction (AUTOMATIC Queries Printer for Default Size) "'}  >~setvar("_prnxext",_fromauto('<{_toauto(_prnxext)}>'))~_confautolist("PRT_X")
Line Width:   <% w{20} x{-1} y{-1}d{1} t{'" Line Width Multiplier in Pixels "'}                                     >~setvar("_prnlw", <{_prnlw}>-1)~input(2)
Y Pixel Dimension:  <% w{20} *               t{'" Pixels in Y Direction (AUTOMATIC Queries Printer for Default Size) "'}  >~setvar("_prnyext",_fromauto('<{_toauto(_prnyext)}>'))~_confautolist("PRT_Y")
Font Scaling: <% w{20} x{-1} y{-1}     t{'" Font Size Multiplier, 1.0 = 100% "'}                                    >~setvar("_prnfs", <{_prnfs}>)~input(1, 0.01)
~_mc

~setconf("PRT_DECIMATE",        caststring(_prndec))
~setconf("PRT_ADJUST_PORTRAIT", caststring(_prnadp))
~setconf("PRT_ORIENTATION",     caststring(_prnort))
~setconf("PRT_CHECK_ERROR",     caststring(_prncoe))
~setconf("PRT_USE_FILE",        caststring(_prntof))
~setconf("PRT_FILE",            fixslash(_prnfn))
~setconf("PRT_LINEWIDTH",       caststring(_prnlw))
~setconf("PRT_FONT_SCALE",      caststring(_prnfs))
~setconf("PRT_X",               caststring(_prnxext))
~setconf("PRT_Y",               caststring(_prnyext))
~setconf("PRT_SETUP_DIALOG",    caststring(_prnsdg))

