! 4DViewPC.pan  - Shading for 3D Surface on a PC
@x0
@y0
@panel
@b{_bg2}
@f{_fg2}
           {strcat("Color Shading for W", strnum(getwnum))}

! Window to Shade With: <                                  >~defmacro("_str2","<{_str2}>",2)~input(5,"Window: ") 
 Choose Palette:       <                    >~defmacro("_STR1","<{_STR1}>",2)~input(5,"Set Palette: ","Enter Palette Function","setpalette(RED,BLACK,WHITE)")
~_mc; eval(_str1)
