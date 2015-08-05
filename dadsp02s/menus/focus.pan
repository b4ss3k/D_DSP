! Focus.pan
@x0
@y0
@f{_fg1}
@b{_bg1}
@panel
@h 
FOCUS   Set Focus to

Curve Number: <      >~defmacro("_cvn",<{_cvn}>,1)~Input(2,"Curve Number",strcat("Enter Integer between 1 & ",strnum(numitems)),"",1,numitems)

~_mc;Focus(_cvn)
