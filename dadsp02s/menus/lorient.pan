! LOrient.pan
@f{_fg1}
@b{_bg1}
@x10
@y0
@h{hlp("lorient.hlp")}
@panel
Text & Axis Orientation
<>
 X Axis Labels <r x{5}          >~defmacro("_t1x",'"<{_t1x}>"',1)~<Horiz><Vert>
 Y Axis Labels <r x{-1} y{-1}   >~defmacro("_t1y",'"<{_t1y}>"',1)~<Horiz><Vert>
 X Tick Labels <r x{5}          >~defmacro("_t2x",'"<{_t2x}>"',1)~<Horiz><Vert>
 Y Tick Labels <r x{-1} y{-1}   >~defmacro("_t2y",'"<{_t2y}>"',1)~<Horiz><Vert>
<>
~_mc;setarotx(eval(_t1x));setaroty(eval(_t1y));settrotx(eval(_t2x));settroty(eval(_t2y))
