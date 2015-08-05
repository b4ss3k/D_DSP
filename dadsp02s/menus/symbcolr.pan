! SymbColr.pan
@b{_bg2}
@f{_fg2}
@panel
@h
SETSYMBOL  Set Symbol and Spacing       

 Data Series:  <              >  ~defmacro("_trace",<{_trace}>,1) ~ input(2,"Curve Number: ",1)

 Line Width:   <              >  ~defmacro("_lwd",<1>,1)~input(2,"Line Thickness",1)
 Symbol Type:  <              >  ~defmacro("_symb","<{_symb}>",2) ~<DOTS><SQUARE><TRIANGLE><INV_TRIANGLE><CROSS><XCROSS><CLR_UP_ARROW><CLR_DN_ARROW><UP_ARROW><DN_ARROW><CLR_DIAMOND><CLR_SQUARE><CLR_TRIANGLE><CLR_INV_TRI><CIRCLE><CLR_CIRCLE>

 Symbol Spacing Every: <    > Points ~defmacro("_symsp",<{_symsp}>,1)~input(2,"Symbol Spacing",1)
 1st Symbol at Point:  <    >        ~defmacro("_stpt",<{_stpt}>,1)~input(2,"Start Point",1)
 <L>
 
~_MC | setsymbol(eval(_symb),_trace,_symsp,_stpt);setlinewidth(_lwd)
