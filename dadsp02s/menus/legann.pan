! Legann.pan - free form text annotation for a Window
@f{_fg1}
@b{_bg1}
@panel
@fixed_editwidth 0
@h~help("LEGCUR")
{setvar("_rdraw", 0)}
{defvar("_tabbed", 0)}
{defvar("_legbg", strnum(getwcolor));defvar("legbgauto", 1)}
 Legends

{if(_tabbed, "<>")}

         Position: <n #                   > ~defmacro("_legpos",'"<{_legpos}>"',1)~<Paper><Glass><Window Margin><Horizontal Margin><Worksheet Margin>
   Draw Legend Box <C x{-1} y{-1} %> ~defmacro("_legbox",'"<{_legbox}>"',1)~<0><1>
             Font: <% n                   > ~defmacro("_legfont",_n2fnt(<{_fnt2n(eval(_legfont))}>),2)~<Big><Small><User1><User2><User3>
   Config Font     <b x{-1} y{-1} %> ~~setvar("_rdraw", configfont(eval(_legfont)))
    Adjust Margin: <n{-1} % e{castint(_legpos)>1}              > ~defmacro("_legmargadj",'"<{_legmargadj}>"',1)~<No Margin><Top><Right><Bottom><Left>
<L>
       Text Color: <= # p n                    > ~setvar("_legfg","<{eval(_legfg)}>");setvar("_legfgauto", 0)~_choosesyscolor
     Automatic <c x{-1} y{-1} #> ~setvar("_legfgauto",<{_legfgauto}>);if(_legfgauto,setvar("_legfg", strnum(getwcolor(1))))~<0><1>
 Background Color: <= # p n                    > ~setvar("_legbg","<{eval(_legbg)}>");setvar("_legbgauto", 0)~_choosesyscolor
     Automatic <c x{-1} y{-1} #> ~setvar("_legbgauto",<{_legbgauto}>);if(_legbgauto,setvar("_legbg", strnum(getwcolor())))~<0><1>
<>
 Legend Text Template <r n # x{5}   >~setvar("_legtxn", <{_legtxn}>)~<Use Series Comment><Use Dataset and Series Name><Use Series Name Only><Custom Text (must include %d)>
 <y{-1}>
 <>
 <>
 <>
 Custom Template < e{_legtxn==3}   x{-1} y{-1}                           >~if(_legtxn==3, setvar("_legtxt", '<{_getcleg(_legtxn, _legtxt)}>'))~input(5, "Text Template")
<y{-2}>
{if(not(_tabbed), "<L>")}

~_mc;
~_setlegt(_legtxn, _legtxt);
~if(_rdraw, redrawall(2))
