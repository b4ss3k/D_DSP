! sysset.pan
@panel
@f{_fg1}
@b{_bg1}
@h {cnfhlp("wksconf.hlp")}
    Settings
<>
      Number Format: <% * = w{40}      t{'" Format and Precision of Numeric Display "'}                                                                                                                               >~setformat(_fstr2i("<{_fi2str(setformat())}>"))~_formlst()
<L>
<>
Angle Calculations   <% r n x{5}        t{'" Use Radians for Trignometric Functions | Use Degrees for Trignometric Functions "'}                                                                                       >~degreeflag(<{degreeflag}>)~<Radians><Degrees><>
Conformity           <% r   x{-1} y{-1} t{'" Align Calculations by Indices with Zero Padding | Align Calculations by the Union of Data Points with NA Padding | Align Calculations by the Intersection of X Values "'} >~conformity(_cnstr2i("<{_cni2str(conformity)}>"))~<{_cnfrm0str}><{_cnfrm1str}><{_cnfrm2str}>
NA Display           <% r   x{-1} y{-1} t{'" Use NA for NAVALUE Results | Use NaN for NAVALUE Results | Use NULL for NAVALUE Results "'} >~setconf("navalue_str", "<{getconf('navalue_str')}>")~<NA><NaN><NULL>

Dialog Boxes <L>
<>

Justify Buttons <% r n x{5}        t{'" Right Justify Ok Cancel Buttons | Left Justify Ok Cancel Buttons | Center Ok Cancel Buttons "'}  >~setvar("_pbjust", <{_pbjust}>)~<Right><Left><Center><>
Justify Labels  <% r n x{-1} y{-1} t{'" Right Justify Labels | Left Justify Labels | Center Labels | Draw Labels Above Control "'}       >~setvar("_pljust", <{_pljust}>)~<Right><Left><Center><Top>
Tooltip Style   <# r n x{-1} y{-1} t{'" Do Not Display Tips | Show Rectangular Style Tip | Show Balloon Style Tip "'}                    >~setvar("_ptipst", <{_ptipst}>);setconf("panel_tooltips", caststring(_ptipst!=0));if(_ptipst==2,setconf("panel_tooltip_style", caststring(0x40)),setconf("panel_tooltip_style", "0"))~<Disabled><Standard><Balloon><>
<y{-1}>
<>
<>

~setconf("panel_justify_buttons", strnum(_pbjust))
~setconf("panel_justify_labels",  strnum(_pljust))

~_mc;
