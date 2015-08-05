@panel

Dialog Box

{setvar("_pbjust", castint(getconf("panel_justify_buttons")))}
{setvar("_pljust", castint(getconf("panel_justify_labels")))}
!{setvar("_pejust", castint(getconf("panel_fixed_editwidth")))}
<>
Button Justification <r n x{5}          >~setvar("_pbjust", <{_pbjust}>)~<Right><Left><Center><>
Label Justification  <r n x{-1} y{-1}   >~setvar("_pljust", <{_pljust}>)~<Right><Left><Center><Top>
!Input Field Widths   <r n    >~setvar("_pejust", <{_pejust}>)~<Variable Size><Auto Size>

~setconf("panel_justify_buttons", strnum(_pbjust))
~setconf("panel_justify_labels",  strnum(_pljust))
!~setconf("panel_fixed_editwidth", strnum(_pejust))
