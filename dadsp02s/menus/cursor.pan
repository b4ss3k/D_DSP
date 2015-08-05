!cursor.pan
@f{_fg1}
@b{_bg1}
@panel
@h~help("Cursor Functions")

 Cursors
{if(_intabbed, "<>")}
{if(not(menuinrefresh()),setvar("_cur1clr",  castint(getconf("cursor1_color"))))}
{if(not(menuinrefresh()),setvar("_cur2clr",  castint(getconf("cursor2_color"))))}
{if(not(menuinrefresh()),setvar("_cur1sclr", _cur1clr==-1))}
{if(not(menuinrefresh()),setvar("_cur2sclr", _cur2clr==-1))}
{if(not(menuinrefresh()),if(_cur1clr==-1,setvar("_cur1clr",getwcolor(1))))}
{if(not(menuinrefresh()),if(_cur2clr==-1,setvar("_cur2clr",getwcolor(1))))}

 Current Style                     <R n #              x{5} t{'" Full Window Cross Hair Cursor | Vertical Line Cursor "'} >~setvar("_vcurs", <{_vcurs}>)~<Cross Hair><Vertical>
 Display Vertical Cursor Values    <R n % e{_vcurs==1} x{-1} y{-1} t{'" Vertical Cursor Values Displayed in Separate Pop-Up Window | Vertical Cursor Values Displayed Directly in Plot Window "'}    >~setvar("_vcurstype", <{_vcurstype}>)~<In Pop-Up Window><In Plot Window>
 <>
 Cursor 1 Color:                   <= n p #  t{'" Color of Main Cursor "'}> ~setvar("_cur1clr", <{(_cur1clr)}>);setvar("_cur1sclr",0)~_choosecolor
 Use Series Color                  <c # x{-1} y{-1}>~setvar("_cur1sclr", <{_cur1sclr}>);if(_cur1sclr,setvar("_cur1clr", getwcolor(1)))~<0><1>
 Cursor 2 Color:                   <= n p #  t{'" Color of Delta Cursor "'}>~setvar("_cur2clr", <{(_cur2clr)}>);setvar("_cur2sclr",0)~_choosecolor
 Use Series Color                  <c # x{-1} y{-1}>~setvar("_cur2sclr", <{_cur2sclr}>);if(_cur2sclr,setvar("_cur2clr", getwcolor(1)))~<0><1>
 <>
Cursor Memory <L>
 Cursor 1 Returns to Last Position   <C % t{'" Cursor 1 Returns to Previous Position when First Activated "'}             >~setvar("_vcursmem1",  <{getvar("_vcursmem1")}>)~<0><1>
 Cursor 2 Returns to Last Position   <C % t{'" Cursor 2 Returns to Previous Position when First Activated "'} x{-1} y{-1} >~setvar("_vcursmem2",  <{getvar("_vcursmem2")}>)~<0><1>
 <>
Cursor Movement <L>
 Cursor 1 Sticks at Initial Position <C % t{'" Cursor 1 Requires Initial Mouse Click to Move after Activation "'}             >~setvar("_vcursstk1",  <{getvar("_vcursstk1")}>)~<0><1>
 Cursor 2 Sticks at Initial Position <C % t{'" Cursor 2 Requires Initial Mouse Click to Move after Activation "'} x{-1} y{-1} >~setvar("_vcursstk2",  <{getvar("_vcursstk2")}>)~<0><1>
{if(not(_intabbed), "<L>")}
~_mc
~setconf("VERT_CURSOR", caststring(_vcurs))
~setconf("VERT_CURSOR_STYLE", if(_vcurstype==0, "4", "0"))
~setconf("CURSOR1_STICKS", caststring(_vcursstk1))
~setconf("CURSOR2_STICKS", caststring(_vcursstk2))
~setconf("CURSOR1_MEMORY", caststring(_vcursmem1))
~setconf("CURSOR2_MEMORY", caststring(_vcursmem2))
~if(_cur1sclr,setconf("CURSOR1_COLOR", "-1"),setconf("CURSOR1_COLOR", caststring(_cur1clr)))
~if(_cur2sclr,setconf("CURSOR2_COLOR", "-1"),setconf("CURSOR2_COLOR", caststring(_cur2clr)))
