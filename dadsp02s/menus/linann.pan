! Linann.pan - free form line drawing for a Window
@f{_fg1}
@b{_bg1}
@panel
@h~help("LINECUR")

{defvar("_linewidth", 1)}
{defvar("_tabbed", 0)}
{defvar("_arrowlen",   castint(getconf("ARROW_LENGTH")))}
{defvar("_arrowwidth", castint(getconf("ARROW_WIDTH")))}
{defvar("_arrowdir",   castint(getconf("ARROW_DIRECTION")))}

 Line Drawing

 Line Style      <R n h        >~defmacro("_linestyle", '"<{eval(_linestyle)-1}>+1"',1)~<Solid><Dashed><Dotted><Dash Dot><Dash Dot Dot>
<>
 Line Position:  <n            >~defmacro("_linepos",  _n2apos(<{_apos2n(_linepos,1)}>,1),2)~<Paper><Glass><Window Margin><Worksheet Margin>
 Line Width      <x{-1} y{-1} u{50} d{1}   >~setvar("_linewidth", <{_linewidth}>)~ input(2, "Line Width")
 Line Color:     <= p n        >~defmacro("_linecolor", '"<{_linecolor}>"',1)~_choosecolor
 Overplot:       <x{-1} y{-1} u{50} d{1}   > ~defmacro("_lineser", '"<{_lineser}>"',1)~_ININT("Series Index")
<>
 Arrow Head Location  <R n h        >~setvar("_arrowdir", <{_arrowdir}>)~<End Point><Beginning Point><Both Ends>
<>
 Arrow Stem Length    <d{1}   >~setvar("_arrowlen", <{_arrowlen}>)~ input(2, "Arrow Length")
 Arrow Base Width     <x{-1} y{-1} d{1}   >~setvar("_arrowwidth", <{_arrowwidth}>)~ input(2, "Arrow Width")
<>
{if(not(_tabbed), "<L>")}
~_mc
