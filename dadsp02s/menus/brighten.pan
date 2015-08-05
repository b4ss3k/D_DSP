! brighten.pan
@f{_fg1}
@b{_bg1}
@panel
@h
{_funcstr}
{_formatstr}
{_examplestr}

{defvar("_brightval", 0.2)}

 <L>
       Brightness Value (-1.0 to 1.0): <            >~setvar("_brightval", <{_brightval}>)~input(1, -1.0, 1.0)
 <L>
{_cwinstr}
 <L>

~_mc
~eval(sprintf('setwf("brighten(%g)")', _brightval))
