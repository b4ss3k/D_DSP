@panel
@x0
@y0
{defmacro('_flyflg',0,1)}
Import Information for Series   {xx}

Series Name  : <               >~eval(strcat("setvar('_seriesname",strnum(xx),"','<{_seriesname",strnum(xx),"}>')"))~INPUT(5)
Horiz. Units  : <               >~eval(strcat("setvar('_unitsh",strnum(xx),"','<{_unitsh",strnum(xx),"}>')"))~pickunit
Vert. Units  : <               >~eval(strcat("setvar('_unitsv",strnum(xx),"','<{_unitsv",strnum(xx),"}>')"))~pickunit
X Offset  : <               >~eval(strcat("setvar('_offsetx",strnum(xx),"','<{_offsetx",strnum(xx),"}>')"))~INPUT(1)
Y Offset  : <               >~eval(strcat("setvar('_offsety",strnum(xx),"','<{_offsety",strnum(xx),"}>')"))~INPUT(1)
Slope  : <               >~eval(strcat("setvar('_slopey",strnum(xx),"','<{_slopey",strnum(xx),"}>')"))~INPUT(1)
Points Per Channel  : <               >~eval(strcat("setvar('_numpts",strnum(xx),"','<{_numpts",strnum(xx),"}>')"))~INPUT(5)
~menuclear;defmacro('_flyflg',1,1)