! Toolbar.pan -- Make a toolbar button
@f{_fg1}
@b{_bg1}
@panel
@h
TOOLBAR Add a Toolbar Button

 Toolbar:   <R n          >~defmacro("_tbar","<{_tbar}>",2)~<Window><Active_Window><Cursor>
 Button #:  <  n          >~defmacro("_tbutton","<{_tbutton}>",2)~<Last Button><1><2><3><4><5><6><7><8><9><10><11><12><13><14><15><16><17><18><19><20><21><22><23><24><25>
 Color:     <= p n        >~defmacro("_tbcolr","<{eval(_tbcolr)}>",2)~_choosecolor
 Label:     <             >~defmacro("_tbstr","<{_tbstr}>",2)~input(5,"Button Label")
 Command:   <                             >~defmacro("_tbcmd",'<{_tbcmd}>',2)~input(5,"Command","Command to Execute with Button Push")
 Message:   <                             >~defmacro("_tbmsg",'<{_tbmsg}>',2)~input(5,"Message")
 <L>
~if(strcmp(_tbar,"0")==0,defmacro("_tbarn",1,2),if(strcmp(_tbar,"1")==0,defmacro("_tbarn",2,2),defmacro("_tbarn",3,2)))
~if(strcmp(_tbutton,"0")==0,defmacro("_tbutn", "-1",2),defmacro("_tbutn", _tbutton, 2))
~_MC ;eval(strcat("TOOLBAR(",_tbarn,",",_tbutn,",4,",_tbcolr,",'",_tbstr,"','",_tbcmd,"','",_tbmsg,"')"))
