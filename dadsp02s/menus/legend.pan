! legend.pan - standard legend attributes and location
@f{_fg1}
@b{_bg1}
@panel
   Legend Attributes for {strcat("W",strnum(getwnum))}

 Text Color:      <             >~defmacro("_textcolor", '"<{_textcolor}>"',1)~(_colormen)
 Text Position:   <             > ~defmacro("_textpos",  "<{_textpos}>",1)~<GLASS><PAPER><WIN_MARGIN><WS_MARGIN>
 Text Font:       <             > ~defmacro("_textfont",  "<{_textfont}>",1)~<BIG><SMALL>
 Text Box:        <             > ~defmacro("_textbox",  "<{_textbox}>",1)~[]
~_mc;echo("Move Cursor to Desired Text Location then Type Text");textcur(_textpos, eval(_textcolor), -1, _textfont, _textbox,1,0)
