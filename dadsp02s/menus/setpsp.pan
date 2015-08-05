! SetPSP.pan
! PostScript Printing Configuration
@f{_fg1}
@b{_bg1}
@panel
     PostScript
Force Greyscale <% C x{-1} y{-1}   t{'" Use Black & White Shading "'}       >~setvar("_ps_gry",'<{_ps_gry}>')~<0><1>
<>
Font            <% R x{5}          t{'" Sans Serif Font | Serif Font | Fixed Pitch Font "'}       >~setvar("_ps_fnt",'"<{getvar("_ps_fnt")}>"')~<Helvetica><Times-Roman><Courier>
Orientation     <% R x{-1} y{-1} n t{'" Use Paper Height as Horizontal Axis | Use Paper Width as Horizontal Axis "'}       >~setvar("_ps_ort",<{_ps_ort}>)~<Landscape><Portrait><>
PSALL Output    <% R x{-1} y{-1} n t{'" Send PostScript Commands for Each Window to Separate Files | Send PostScript Commands for Each Window to One File "'}  >~setvar("_ps_alo",<{_ps_alo}>)~<Enumerated Files><Single File><>

Output Filename: <% w{70} j{3}     t{'" Destination File for PostScript Commands "'}       >~setvar("_ps_fil",fixslash('<{getvar("_ps_fil")}>'))~input(5)
{_defsetstr} <# b x{-1} y{-1}>~~_defpost
<>
X Dimension:  <% w{20}             t{'" Number of Pixels in X Direction "'}  >~setvar("_ps_x",  '<{getvar("_ps_x")}>')~input(2,"X Dimension")
Paper Width:  <% w{20} x{-1} y{-1} t{'" Actual Paper Width in Inches "'}     >~setvar("_ps_xpr",'<{getvar("_ps_xpr")}>')~input(1,"Paper Width (inches)","X Dimension is Width")
Y Dimension:  <% w{20}             t{'" Number of Pixels in Y Direction "'}  >~setvar("_ps_y",  '<{getvar("_ps_y")}>')~input(2,"Y Dimension")
Paper Height: <% w{20} x{-1} y{-1} t{'" Actual Paper Height in Inches "'}    >~setvar("_ps_ypr",'<{getvar("_ps_ypr")}>')~input(1,"Paper Height (inches)","Y Dimension is Height")
Line Width:   <% w{20}       d{1}  t{'" Integer Line Width Multiplier "'}    >~setvar("_ps_lw", <{_ps_lw}>-1)~input(2)
Font Scaling: <% w{20} x{-1} y{-1} t{'" Font Size Multiplier, 1.0 = 100% "'} >~setvar("_ps_fs", <{_ps_fs}>)~input(1, 0.01)

~_mc
~setconf("POSTSCRIPT_FONT", _ps_fnt)
~setconf("POSTSCRIPT_LANDSCAPE", caststring(_ps_ort==0))
~setconf("POSTSCRIPT_GREYSCALE", _ps_gry)
~setconf("POSTSCRIPT_FILE", _ps_fil)
~setconf("POSTSCRIPT_XPAPER", _ps_xpr)
~setconf("POSTSCRIPT_YPAPER", _ps_ypr)
~setconf("POSTSCRIPT_X", _ps_x)
~setconf("POSTSCRIPT_Y", _ps_y)
~setconf("POSTSCRIPT_LINEWIDTH", caststring(_ps_lw))
~setconf("POSTSCRIPT_FONT_SCALE", caststring(_ps_fs))
~setconf("POSTSCRIPT_ONEFILE", caststring(_ps_alo))
