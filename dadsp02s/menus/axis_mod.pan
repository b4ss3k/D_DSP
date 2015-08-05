! axis_mod.pan
! menu accepting user input for advance options in multiple channel import
@h ~help('Y-Axis Modification',strcat(gethome,'dspum.hlp'))
@panel


Series Information (3 of 3)
<>
Series Parameters <L>         
Series Name:      <                      >~setvar(_seriesname,"<{_seriesname}>")~INPUT(5,1,15)
Vertical Units:   <x{-1} y{-1} *         >~setvar(_unitsv,"<{_unitsv}>")~_unitslist
Sample Rate:      <                      >~setvar(_samprate,"<{_samprate}>")~INPUT(1)
Horizontal Units: <x{-1} y{-1} *         >~setvar(_unitsh,"<{_unitsh}>")~_unitslist
<>
Data & Axis Scaling <L>         
Y Offset: <               >~setvar(_offsety,"<{_offsety}>")~INPUT(1)
 Y Slope: < x{-1} y{-1}   >~setvar(_slopey,"<{_slopey}>")~INPUT(1)
X Offset: <               >~setvar(_offsetx,"<{_offsetx}>")~INPUT(1)


~menuclear

