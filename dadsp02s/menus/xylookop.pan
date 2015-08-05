! xylookop.pan - Xylookup options
@f{_fg1}
@b{_bg1}
@panel
@justifylabels 3
@h~help("xylookup")
Options
<>
{defvar("_xylintp", 0);defvar("_xyloor", 0)}
 Interpolation Method <# r n x{5}                       t" Return Nearest Neighbor | Straight Line Interpolation | Cubic Spline Interpolation " >~setvar("_xylintp", <{_xylintp}>)~<None><Linear><Spline>
 Out of Range Method  <% r n e{_xylintp!=0} x{-1} y{-1} t" Interpolate Out of Range Values from the End Points | Clip Out of Range Values to End Points | Set Out of Range Values to NaN " >~setvar("_xyloor", <{_xyloor}>)~<Interpolate><Clip><Set to NA>

