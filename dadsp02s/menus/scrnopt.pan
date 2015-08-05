! scrnopt.pan
@f{_fg1}
@b{_bg1}
@panel
@h~help("SCREENOPT")
{setvar("_osso1",  castint(getconf("SCREEN_LEGENDS_DEFAULT")))}
{setvar("_osso2",  castint(getconf("SCREEN_TITLES_DEFAULT")))}
{setvar("_osso3",  castint(getconf("SCREEN_WINHEADER_DEFAULT")))}
{setvar("_osso4",  castint(getconf("SCREEN_WINBORDER_DEFAULT")))}
{setvar("_osso5",  castint(getconf("SCREEN_WINMARGIN_DEFAULT")))}
{setvar("_osso6",  castint(getconf("SCREEN_WINNAME_DEFAULT")))}
{setvar("_osso7",  castint(getconf("SCREEN_HEADER_JUSTIFY_DEFAULT")))}
{setvar("_osso8",  castint(getconf("SCREEN_ALIGN_MARGINS")))}

{setvar("_osso11", castint(getconf("DEPENDENCIES_DISPLAY")))}
{setvar("_osso12", castint(getconf("DEPENDENCIES_STYLE")))}

{setvar("_osso13", castint(getconf("GUI_SYSTEM_FONT_CAPTION")))}


 Screen Elements
 <>
 Justify Window Label <R n x{5}        t{'" Left Justify Window Header Text | Center Window Header Text | Right Justify Window Header Text "'}  >~setvar("_sso7", <{_osso7}>)~<Left><Center><Right>
 Window Elements <L>
 Draw Header          <C               t{'" Display Window Header "'}                  >~setvar("_sso3", <{_osso3}>)~<0><1>
 Draw Outer Frame     <C x{-1} y{-1}   t{'" Display Outer Window Frame  "'}            >~setvar("_sso4", <{_osso4}>)~<0><1>
 Show Window Number   <C x{-1} y{-1}   t{'" Display W1 Window Number "'}               >~setvar("_sso6", <{_osso6}>)~<0><1>
 Draw Inner Borders   <C               t{'" Display Inner Plot Region Frame "'}        >~setvar("_sso5", <{_osso5}>)~<0><1>
 Align Window Margins <% C x{-1} y{-1} t{'" Align All Left and Right Plot Margins "'}  >~setvar("_sso8", <{_osso8}>)~<0><1>
 Use Custom Window Label Font <% C w{30} x{-1} y{-1} t{'" Use WINLABEL_FONT for Window Caption "'}  >~setvar("_sso13", <{not(_osso13)}>)~<0><1>
 Show Legends         <C               t{'" Show Legend Box if Present "'}                                                                      >~setvar("_sso1", <{_osso1}>)~<0><1>
 Show Titles          <C x{-1} y{-1}   t{'" Show Window Title if Present "'}                                                                    >~setvar("_sso2", <{_osso2}>)~<0><1>
 <>
 Show Window Dependencies    <r % n x{5}        t{'" Do Not Highlight Window Dependencies | Highlight All Window Dependencies | Highlight Immediate Window Dependencies "'} >~setvar("_sso11", <{_osso11}>)~<Off><Show All><Show Immediate>
 Window Dependencies Style   <r % n x{-1} y{-1} t" Highlight Current Window's Ancestors and Descendants | Highlight Windows that Depend on the Current Window | Highlight Windows the Current Window Dependents On " >~setvar("_sso12", <{_osso12}>)~<Parents and Children><Children Only><Parents Only>
 <x{-2} y{-1}>
 <>
 " Dependencies Colors " <b x{-1} t{'" Set Window Header Colors for Displaying Dependencies "'} >~~_mf("depclr.pan")

~_mc;
~if((_osso1!=_sso1)||(_osso2!=_sso2)||(_osso3!=_sso3)||(_osso4!=_sso4)||(_osso5!=_sso5)||(_osso6!=_sso6)||(_osso7!=_sso7), _scro=1, _scro=0)
~if(_scro, screenopt(_sso1,_sso2,_sso3,_sso4,_sso5,_sso6,_sso7))
~if(_osso8!=_sso8,   setconf("SCREEN_ALIGN_MARGINS", caststring(_sso8)))
~if(_osso11!=_sso11, setconf("DEPENDENCIES_DISPLAY", caststring(_sso11));setvar("_rdraw",1))
~if(_osso12!=_sso12, setconf("DEPENDENCIES_STYLE",   caststring(_sso12));setvar("_rdraw",1))
~if(_osso13==_sso13, setconf("GUI_SYSTEM_FONT_CAPTION", caststring(not(_sso13)));setvar("_rdraw",1))

