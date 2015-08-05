! Textann.pan - free form text annotation for a Window
@f{_fg1}
@b{_bg1}
@panel
   Free Form Text Annotation for {strcat("W",strnum(getwnum))}

 Text Color:      <             >~defmacro("_textcolor",'"<{_textcolor}>"',1)~(_colormen)
 Text Position:   <             >~defmacro("_textpos",'"<{_textpos}>"',1)~<PAPER><GLASS>
 Text Font:       <             >~defmacro("_textfont",'"<{_textfont}>"',1)~<BIG><SMALL>
 Text Box:        <             >~defmacro("_textbox",'"<{_textbox}>"',1)~[]

~_mc;echo("Move Cursor to Desired Text Location then Type Text");textcur(eval(_textpos), eval(_textcolor), -1, eval(_textfont), eval(_textbox))
