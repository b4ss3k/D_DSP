! gcolor.pan - global window colors
@x0
@y0
@b{_bg3}
@f{_fg3}
@panel
@apply
@justifylabels 3
@h~help("setgcolor")
Global Colors
!<>
               Window Frame: <% = p n               t{'" Outer Window Frame Color "'}     >~setvar("_GCV17",eval("<{(_GCV17)}>"))~_choosesyscolor
                Window Scales: <% = p n  x{-1} y{-1} id{1} t{'" Plot Axes Scale Color "'}         >~setvar("_GCV18",eval("<{(_GCV18)}>"))~_choosesyscolor
{_defsetstr} <# b x{-1} y{-1}  >~~_defgclr

            Window Highlite: <% = p n               t{'" 3D Frame Highlight Color "'}     >~setvar("_GCV20",eval("<{(_GCV20)}>"))~_choosesyscolor
              Window Shadow: <% = p n  x{-1} y{-1}  t{'" 3D Frame Shadow Color "'}        >~setvar("_GCV21",eval("<{(_GCV21)}>"))~_choosesyscolor
         Inner Window Color: <% = p n               t{'" Plot Background Color "'}        >~setvar("_GCV07",eval("<{(_GCV07)}>"))~_choosesyscolor
               Series Color: <% = p n  x{-1} y{-1}  t{'" Default Series Color "'}         >~setvar("_GCV05",eval("<{(_GCV05)}>"))~_choosesyscolor
                 Grid Color: <% = p n               t{'" Default Grid Color "'}           >~setvar("_GCV19",eval("<{(_GCV19)}>"))~_choosesyscolor
        Error Message Color: <% = p n  x{-1} y{-1}  t{'" Default Error Message Color "'}  >~setvar("_GCV41",eval("<{(_GCV41)}>"))~_choosesyscolor
<L>
        Normal Caption Text: <% = p n               t{'" Caption Text Color for Normal Window "'}         >~setvar("_GCV31",eval("<{(_GCV31)}>"))~_choosesyscolor
  Normal Caption Background: <% = p n  x{-1} y{-1}  t{'" Caption Background Color for Normal "'}          >~setvar("_GCV32",eval("<{(_GCV32)}>"))~_choosesyscolor
      Inactive Caption Text: <% = p n               t{'" Caption Text Color for Inactive Window "'}       >~setvar("_GCV36",eval("<{(_GCV36)}>"))~_choosesyscolor
Inactive Caption Background: <% = p n  x{-1} y{-1}  t{'" Caption Background Color for Inactive Window "'} >~setvar("_GCV35",eval("<{(_GCV35)}>"))~_choosesyscolor
        Active Caption Text: <% = p n  e{castint(_hiactwin)}             t{'" Caption Text Color for Active Window "'}        >~setvar("_GCV38",eval("<{(_GCV38)}>"))~_choosesyscolor
  Active Caption Background: <% = p n  x{-1} y{-1} e{castint(_hiactwin)} t{'" Caption Background Color for Active Window "'}  >~setvar("_GCV37",eval("<{(_GCV37)}>"))~_choosesyscolor
<>
Highlight Active Window Caption <# c w{20}        t{'" Highlight Caption when Window is Active or Zoomed "'}      >~setvar("_hiactwin", "<{_hiactwin}>")~<0><1>
" Label Colors " < b x{-1} y{-1} t{'" Window Label Colors "'}>~~_mf("labcolor.pan");setcontrolvalue(1, _GCV18)
" Dependencies Colors " <b x{-1} y{-1} t{'" Window Dependencies Caption Colors "'}>~~_mf("depclr.pan")

~_MC
~if(_chkgcol, setvar("_replot", 1))
~setgcolor(17, _GCV17);setgcolor(18, _GCV18);setgcolor(20, _GCV20);setgcolor(21, _GCV21);setgcolor(7, _GCV07);setgcolor(5, _GCV05);setgcolor(19, _GCV19);
~setgcolor(31, _GCV31);setgcolor(32, _GCV32);setgcolor(35, _GCV35);setgcolor(36, _GCV36);
~setgcolor(37, _GCV37);setgcolor(38, _GCV38);setgcolor(41, _GCV41);
~setconf("GUI_HIGHLIGHT_CAPTION", _hiactwin)
~setgcolor(42, _GCV42);setgcolor(43, _GCV43);setgcolor(44, _GCV44);setgcolor(45, _GCV45);
