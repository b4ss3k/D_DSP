! Lineann.pan - free form line drawing for a Window
@f{_fg1}
@b{_bg1}
@panel
@h ~help("lineann")
     Line Drawing

{if(_tabbed, "<>")}

 Line Color:     <               > ~defmacro("_linecolor", '"<{_linecolor}>"',1)~_colormen
 Line Style:     <               > ~defmacro("_linestyle",  '"<{_linestyle}>"',1)~<SOLID><DASHED><DOTTED>
 Line Position:  <               > ~defmacro("_linepos",  '"<{_linepos}>"',1)~<PAPER><GLASS>
 Overplot:       <               > ~defmacro("_lineser",  '"<{_lineser}>"',1)~_ININT("Series Index")

~_mc;echo("Move Cursor, Press '.' to Anchor Line, ESC to Quit");linecur(eval(_linecolor), eval('_linestyle'), eval('_linepos'), eval('_lineser'));echo(" ")
