! Txtann.pan - free form text annotation for a Window
@f{_fg1}
@b{_bg1}
@panel
@h~help("TEXTCUR")
{setvar("_rdraw", 0)}
{defvar("_tabbed", 0)}
{defvar("_textbg", strnum(getwcolor));defvar("textbgauto", 1)}
 Text Annotations

{if(_tabbed, "<>")}

 Text Position:   <n #            > ~defmacro("_textpos",'"<{_textpos}>"',1)~<Paper><Glass><Window Margin><Horizontal Margin><Worksheet Margin>
 Text Font:       <# n            > ~defmacro("_textfont",_n2fnt(<{_fnt2n(eval(_textfont))}>),2)~<Big><Small><User 1><User 2><User 3>
 Config Font      <b x{-1} y{-1}  > ~~setvar("_rdraw", configfont(eval(_textfont)))
 Adjust Margin:   <n{-1} % e{castint(_textpos)>1}       > ~defmacro("_textmargadj",'"<{_textmargadj}>"',1)~<No Margin><Top><Right><Bottom><Left>
 <L>
 Text Color:      <= % p n        > ~defmacro("_textcolor",'"<{_textcolor}>"',1)~_choosecolor
 Background Color: <= # p n                    > ~setvar("_textbg","<{eval(_textbg)}>",1);setvar("_textbgauto", 0)~_choosesyscolor
     Automatic <c x{-1} y{-1} #> ~setvar("_textbgauto",<{_textbgauto}>);if(_textbgauto,setvar("_textbg", strnum(getwcolor())))~<0><1>
 <L>
 Draw Text Box    <C %            > ~defmacro("_textbox",'"<{_textbox}>"',1)~<0><1>
 Stretch to Fit   <C % x{-1} y{-1}> ~defmacro("_textstretch",'"<{_textstretch}>"',1)~<0><1>
 <>
{if(not(_tabbed), "<L>")}

~_mc;
~if(_textbgauto, setvar("_textbg", "-1"))
~if(_rdraw, redrawall(2))

