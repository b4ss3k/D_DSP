! 4DView.pan  Set shading for 3D surface
@x0
@y0
@panel
@b{_bg2}
@f{_fg2}
    {strcat("4D Shading for W", strnum(getwnum))}

 Start of Shading Range  <                >~defmacro("_SCOLOR1","<{strcolor(getwcolor)}>",1)~echo("Enter Shading Color") | _COLORMEN
 End Color of Range      <                >~defmacro("_SCOLOR2","<{strcolor(getwcolor(1))}>",1)~echo("Enter Shading Color") | _COLORMEN
 Data Matrix for Shading ~_deffname('SHADEWITH Shading Matrix')|_defformat('Shadewith(matrix)')|_defxamp('Shadewith(W1*W2)')|_getser|_serform("Shadewith")
! Choose Palette

~_MC | setshading(_SCOLOR1,_SCOLOR2) | SHADEWITH() 