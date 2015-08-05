! printopt.pan
! Removable Layout Element & Mode Functions
@f{_fg1}
@b{_bg1}
@panel
@h~help("printopt")

{defvar("_opscnt", 0)}

{if(_opscnt==0,setvar("_opso1", castint(getconf("PRT_LEGENDS_DEFAULT"))))}
{if(_opscnt==0,setvar("_opso2", castint(getconf("PRT_TITLES_DEFAULT"))))}
{if(_opscnt==0,setvar("_opso3", castint(getconf("PRT_WINHEADER_DEFAULT"))))}
{if(_opscnt==0,setvar("_opso4", castint(getconf("PRT_WINBORDER_DEFAULT"))))}
{if(_opscnt==0,setvar("_opso5", castint(getconf("PRT_WINMARGIN_DEFAULT"))))}
{if(_opscnt==0,setvar("_opso6", castint(getconf("PRT_WINNAME_DEFAULT"))))}
{if(_opscnt==0,setvar("_opso7", castint(getconf("PRT_HEADER_JUSTIFY_DEFAULT"))))}
{if(_opscnt==0,setvar("_opso8", castint(getconf("PRT_HEADER_LINE_DEFAULT"))))}

{if(_opscnt==0,setvar("_oprcm", getconf("PRT_COLORMODE")))}
{if(_opscnt==0,setvar("_opram", getconf("PRT_ALIGN_MARGINS")))} 
{if(_opscnt==0,setvar("_oprsh", getconf("PRT_SHADING")))}

{setvar("_opscnt", getvar("_opscnt")+1)}


 Printing Elements
 <>
 Justify Window Label <% R n           t{'" Left Justify Window Header Text | Center Window Header Text | Right Justify Window Header Text "'}  >~setvar("_pso7",  <{_opso7}> )~<Left><Center><Right>
 <>
 Use Color            <% C             t{'" Draw Plot in Color "'}           >~setvar("_oprcm",'<{_oprcm}>')~<0><1>
 Show Legends         <% C x{-1} y{-1} t{'" Show Legend Box if Present "'}   >~setvar("_pso1",  <{_opso1}> )~<0><1>
 Show Titles          <% C x{-1} y{-1} t{'" Show Window Title if Present "'} >~setvar("_pso2",  <{_opso2}> )~<0><1>
 <>
 Window Elements <L>
          Draw Header < C #                  t{'" Draw Window Header "'}                    >~setvar("_opso3", <{_opso3}> )~<0><1>
     Draw Outer Frame < C # x{-1} y{-1}      t{'" Draw Outer Window Frame "'}               >~setvar("_opso4", <{_opso4}> )~<0><1>
   Show Window Number <% C  x{-1} y{-1}      t{'" Draw W1 Window Numbers "'}                >~setvar("_pso6",  <{_opso6}> )~<0><1>
   Draw Inner Borders <% C                   t{'" Draw Inner Plot Region Frame "'}          >~setvar("_pso5",  <{_opso5}> )~<0><1>
 Align Window Margins <% C x{-1} y{-1}       t{'" Align All Left and Right Plot Margins "'} >~setvar("_opram",'<{_opram}>')~<0><1>
 Use Chiseled Shading <% C x{-1} y{-1}       t{'" Draw with 3D Effects "'}                  >~setvar("_oprsh",'<{_oprsh}>')~<0><1>
     Draw Header Line <% C e{_opso3&&_opso4} t{'" Draw Window Header Separator Line "'}     >~setvar("_pso8",  <{_opso8}> )~<0><1>


~_mc
~printopt(_pso1,_pso2,_opso3,_opso4,_pso5,_pso6,_pso7,_pso8)
~setconf("PRT_COLORMODE",_oprcm);setconf("PRT_ALIGN_MARGINS",_opram);setconf("PRT_SHADING",_oprsh)

