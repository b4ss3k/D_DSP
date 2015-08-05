! ViewClrs.pan
@f(_fg1}
@b(_bg1}
@panel
@h
COLORS  Set Individual Window Colors

 Window Color:    <               >~defmacro("_wincol",<{strcolor(getwcolor)}>,1) ~ _COLORMEN 
 Grid Color:      <               >~defmacro("_gridcol",<{strcolor(getgridcolor)}>,1) ~ _COLORMEN 

 Data Series:  <              >  ~defmacro("_trace",<{_trace}>,1) ~ input(2,"Curve Number")
 Curve Color:  <              >  ~defmacro("_col",<{strcolor(getwcolor(_trace))}>,1) ~ _COLORMEN 

~_mc; wincolor(_wincol); gridcolor(_gridcol); setcolor(_col,_trace)
 