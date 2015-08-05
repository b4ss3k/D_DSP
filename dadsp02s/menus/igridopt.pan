! igridopt.pan
@x0
@y0
@b{_bg2}
@f{_fg2}
@panel
@fixed_editwidth 0
Options
{defvar("_fxycmap", 0)}
{defvar("_igws", "R^-3,R^-4,R^-5")}

<>
          X Gridsize : <% d{1} w20  >~setvar("_xgrid", <{_xgrid}>)~input(1, 1)
          Y Gridsize : <% d{1} w20  >~setvar("_ygrid", <{_ygrid}>)~input(1, 1)
<L>
 Interpolation Factor: <% d{1} w20      >~setvar("_intpgrid", <{_intpgrid}>)~input(1, 1)
        Color Shading: <% =    w20 n{0} >~setvar("_fxycmap", <{_fxycmap}>)~_chooseshading

<L>
Radial Weighting Terms: <k  w30   >~setvar("_igws", "<{_igws}>")~<R^-1><R^-2><R^-3><R^-4><R^-5><R^-6>

<>

Default Weights <b #  >~~setvar("_igws", "R^-3,R^-4,R^-5")

~_igwstr=_igw2str(_igws);
