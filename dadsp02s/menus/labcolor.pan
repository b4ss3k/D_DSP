! labcolor.pan
@f{_fg1}
@b{_bg1}
@panel

 Label Colors
{if(_intabbed, "<>")}
{if(not(menuinrefresh()),setvar("_GCV18",  castint(getconf("window_text_color"))))}
{if(not(menuinrefresh()),setvar("_GCV48",  castint(getconf("window_title_color"))))}
{if(not(menuinrefresh()),setvar("_GCV49",  castint(getconf("x_label_color"))))}
{if(not(menuinrefresh()),setvar("_GCV50",  castint(getconf("y_label_color"))))}
{if(not(menuinrefresh()),setvar("_GCV51",  castint(getconf("z_label_color"))))}
{if(not(menuinrefresh()),setvar("_wlabsclr", _GCV48==-1))}
{if(not(menuinrefresh()),setvar("_slabsclr", _GCV18==-1 || _GCV18 == castint(getconfdef("window_text_color"))))}
{if(not(menuinrefresh()),setvar("_xlabsclr", _GCV49==-1))}
{if(not(menuinrefresh()),setvar("_ylabsclr", _GCV50==-1))}
{if(not(menuinrefresh()),setvar("_zlabsclr", _GCV51==-1))}
{if(not(menuinrefresh()),if(_GCV18==-1,setvar("_GCV18",castint(getconf("window_text_color")))))}
{if(not(menuinrefresh()),if(_GCV48==-1,setvar("_GCV48",castint(getconf("window_text_color")))))}
{if(not(menuinrefresh()),if(_GCV49==-1,setvar("_GCV49",getwcolor(1))))}
{if(not(menuinrefresh()),if(_GCV50==-1,setvar("_GCV50",getwcolor(1))))}
{if(not(menuinrefresh()),if(_GCV51==-1,setvar("_GCV51",getwcolor(1))))}

 Window Label Color                <= n p #  t{'" Color of Printed Window Title "'}> ~setvar("_GCV48", <{(_GCV48)}>);setvar("_wlabsclr",0)~_choosecolor
 Use Default                       <c # x{-1} y{-1} t{'" Use Scales Color "'} >~setvar("_wlabsclr", <{_wlabsclr}>);if(_wlabsclr,setvar("_GCV48", castint(getconf("window_text_color"))))~<0><1>
 <L>
 Window Scales Color               <= n p #  t{'" Color of Numeric Scales "'}> ~setvar("_GCV18", <{(_GCV18)}>);setvar("_slabsclr",0);if(_wlabsclr,setvar("_GCV48", _GCV18))~_choosecolor
 Use Default                       <c # x{-1} y{-1} t{'" Use Configuration Default "'}>~setvar("_slabsclr", <{_slabsclr}>);if(_slabsclr,setvar("_GCV18", castint(getconfdef("window_text_color")));if(_wlabsclr,setvar("_GCV48", _GCV18)))~<0><1>
 <L>
 X Label Color                     <= n p #  t{'" Color of Horizontal Axis Label "'}> ~setvar("_GCV49", <{(_GCV49)}>);setvar("_xlabsclr",0)~_choosecolor
 Use Series Color                  <c # x{-1} y{-1} t{'" Automatically use Current Series Color "'}>~setvar("_xlabsclr", <{_xlabsclr}>);if(_xlabsclr,setvar("_GCV49", getwcolor(1)))~<0><1>
 Y Label Color                     <= n p #  t{'" Color of Vertical Axis Label "'}>~setvar("_GCV50", <{(_GCV50)}>);setvar("_ylabsclr",0)~_choosecolor
 Use Series Color                  <c # x{-1} y{-1} t{'" Automatically use Current Series Color "'}>~setvar("_ylabsclr", <{_ylabsclr}>);if(_ylabsclr,setvar("_GCV50", getwcolor(1)))~<0><1>
 Z Label Color                     <= n p #  t{'" Color of Z Axis Label "'}>~setvar("_GCV51", <{(_GCV51)}>);setvar("_zlabsclr",0)~_choosecolor
 Use Series Color                  <c # x{-1} y{-1} t{'" Automatically use Current Series Color "'}>~setvar("_zlabsclr", <{_zlabsclr}>);if(_zlabsclr,setvar("_GCV51", getwcolor(1)))~<0><1>
 <>
{_defsetstr} <# b >~~_deflclr
 <>
 <L>

~menuclear(1)
~if(_wlabsclr,_chklcol(48, -1);setconf("window_title_color", "-1"),_chklcol(48, _GCV48);setconf("window_title_color", caststring(_GCV48)))
~if(_slabsclr,_chklcol(18, castint(getconfdef("window_text_color")));setconf("window_text_color", getconfdef("window_text_color")),_chklcol(18, _GCV18);setconf("window_text_color", caststring(_GCV18)))
~if(_xlabsclr,_chklcol(49, -1);setconf("x_label_color", "-1"),_chklcol(49, _GCV49);setconf("x_label_color", caststring(_GCV49)))
~if(_ylabsclr,_chklcol(50, -1);setconf("y_label_color", "-1"),_chklcol(50, _GCV50);setconf("y_label_color", caststring(_GCV50)))
~if(_zlabsclr,_chklcol(51, -1);setconf("z_label_color", "-1"),_chklcol(51, _GCV51);setconf("z_label_color", caststring(_GCV51)))
