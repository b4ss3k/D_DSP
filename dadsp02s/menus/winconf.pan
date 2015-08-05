! WinConf.pan
@f{_fg1}
@b{_bg1}
@h {cnfhlp("winconf.hlp")}
@panel
!@step
              Window
! <>
 X Tic Format: <* =             w{35} t{'" Format of X Tic Numeric Labels "'} >~setxticformat(_tic2fmt("<{_fmt2tic(setxticformat)}>"));setvar("_rdraw", 1)~_ticlst("setxticformat")
 Y Tic Format: <* = x{-1} y{-1} w{35} t{'" Format of Y Tic Numeric Labels "'} >~setyticformat(_tic2fmt("<{_fmt2tic(setyticformat)}>"));setvar("_rdraw", 1)~_ticlst("setyticformat")
 <L>

 X Grid Style     <R x{5}         n{1}    t{'" Solid Vertical Grid Lines | Dashed Vertical Grid Lines | Dotted Vertical Grid Lines "'}       >~setvar("_xgsty",<{_xgsty}>)~<Solid><Dashed><Dotted>
 Y Grid Style     <R x{-1} y{-1}  n{1}    t{'" Solid Horizontal Grid Lines | Dashed Horizontal Grid Lines | Dotted Horizontal Grid Lines "'} >~setvar("_ygsty",<{_ygsty}>)~<Solid><Dashed><Dotted>
 Tic Location     <R x{-1} y{-1}  n{1}    t{'" Extend Tic Marks Outward From Axis | Extend Tic Marks Inward from Axis "'}                    >~setvar("_ticloc", <{_ticloc}>)~<{_outticstr}><{_inticstr}><>
 Autoscaling Mode <R x{-1} y{-1}  n       t{'" Center Plot Between Min and Max Values | Align Plot Limits on Tic Marks "'}               >~setvar("_asot", <{_asot}>)~<Peak Centering><Tic Marks><>
 Display X Grids  <C x{5}                 t{'" Display Vertical Grids "'}                                                                    >~setvar("_xgr",'<{_xgr}>')~<0><1>
 Display Y Grids  <C x{-1} y{-1}          t{'" Display Horizontal Grids "'}                                                                  >~setvar("_ygr",'<{_ygr}>')~<0><1>
 Tic All Axes     <C x{-1} y{-1} w{12}    t{'" Draw Tic Marks on Left, Right, Top, and Bottom Axes "'} >~setvar("_ticall", <{_ticall}>)~<0><1>
 Tic Size:        <x{-1} y{-1} d{0} w{10} j{16} t{'" Tic Mark Size in Pixels "'}                                                                   >~setvar("_ticsz", <{_ticsz}>)~input(2)
 <L>

 X Log Scale         <C              t{'" Default X Axis to Logarithmic "'}             >~setvar("_xlg",'<{_xlg}>')~<0><1>
 Label X Log Subtics <C x{-1} y{-1}  t{'" Label Each X Log Subtic "'}                   >~setvar("_xlgls",'<{_xlgls}>')~<0><1>
 10^n on X Log Tics  <C x{-1} y{-1}  t{'" Use 10^1, 10^2, etc. for X Log Tic Labels "'} >~setvar("_xlgxt",'<{_xlgxt}>')~<0><1>
 10^0 == 1 on Log Tics <C x{-1} y{-1} t{'" Display 10^0 as 1 on Log Tic Labels "'} >~setvar("_lt0f",<{_lt0f}>)~<0><1>

 Y Log Scale         <C              t{'" Default Y Axis to Logarithmic "'}             >~setvar("_ylg",'<{_ylg}>')~<0><1>
 Label Y Log Subtics <C x{-1} y{-1}  t{'" Label Each Y Log Subtic "'}                   >~setvar("_ylgls",'<{_ylgls}>')~<0><1>
 10^n on Y Log Tics  <C x{-1} y{-1}  t{'" Use 10^1, 10^2, etc. for Y Log Tic Labels "'} >~setvar("_ylgxt",'<{_ylgxt}>')~<0><1>
 10^1 == 10 on Log Tics <C w{20} x{-1} y{-1} t{'" Display 10^1 as 10 on Log Tic Labels "'} >~setvar("_lt1f",<{_lt1f}>)~<0><1>
 <L>
 Window Resizing <C                   t{'" Enable Mouse Sizing of Windows "'}  >~setvar("_wrsz",'<{_wrsz}>')~<0><1>
  Rotate Y Label <C x{-1} y{-1}       t{'" Rotate Y Axis Label 90 Degress "'}  >~setvar("_vcurs",'<{_vcurs}>')~<0><1>
 Preserve Axes Labels <C x{-1} y{-1}  t{'" Do Not Clear Axes Labels "'}      >~setvar("_plabel", "<{_plabel}>")~<0><1>
 Square Aspect Ratio  <C x{-1} y{-1}  t{'" Keep Plot Area Square "'}      >~setvar("_daspect", "<{_daspect}>")~<0><1>
 <L>
 Reverse X Axis   <C                   t{'" X Axis Values Display High (Left) to Low (Right) "'}  >~setvar("_xaxrev",'<{_xaxrev}>')~<0><1>
 Reverse Y Axis   <C x{-1} y{-1}       t{'" Y Axis Values Display High (Bottom) to Low (Top) "'}  >~setvar("_yaxrev",'<{_yaxrev}>')~<0><1>
 Plot INF as Gaps <C x{-1} y{-1}       t{'" Plot +- inf Series Values as Gaps "'}  >               ~setvar("_plotinf",'<{_plotinf}>')~<0><1>
{_defsetstr} <# b x{-1} y{-1}   >~~_defwncf()

<L>
 Scales Location: <= w{35}             t{'" Display and Location of Axes Labels "'}               >~setvar("_axs",'<{_axs}>')~strfile(_mh("scaleopt.txt")) 
 Sync Axes:       <n w{35} x{-1} y{-1} t{'" Scroll and Expand Synchronization of Overlay Axes "'} >~setvar("_winsync", <{_winsync}>)~<Independent><X><Y><XY><X Expand><Y Expand><XY Expand>


~_mc
~setconf("RESIZE_WINDOWS",(_wrsz));
~setconf("LABEL_ORIENT", eval("_vcurs"));
~setconf("DEFAULT_SCALES",caststring(_asty2si(_axs)));setconf("X_GRID_ON",(_xgr));
~setconf("X_GRID_STYLE",strnum(_xgsty))
~setconf("Y_GRID_ON",(_ygr));setconf("Y_GRID_STYLE",strnum(_ygsty));
~if((_ticloc != _gticloc) || (_ticall != _gticall), setvar("_rdraw", 1))
~_sticloc(_ticloc);_sticall(_ticall)
~setconf("CLEAR_LABELS", caststring(_plabel=='0'))
~setconf("SCALE_ON_TICS", caststring(_asot))
~setconf("SYNC_MODE", caststring(_winsync))
~setconf("TIC_X_LENGTH", strnum(_ticsz))
~setconf("TIC_Y_LENGTH", strnum(_ticsz))
~setconf("X_LOG_SCALE",_xlg);setconf("X_LABEL_SUBTICS",_xlgls);setconf("X_EXP_LOGTICS",_xlgxt)
~setconf("Y_LOG_SCALE",_ylg);setconf("Y_LABEL_SUBTICS",_ylgls);setconf("Y_EXP_LOGTICS",_ylgxt)
~setconf("EXP_LOGFORMAT", caststring(_lt0f + 2*_lt1f))
~setconf("DEFAULT_ASPECT", caststring(_daspect=='1'))
~setconf("X_AXIS_DIRECTION", caststring(_xaxrev=='1'))
~setconf("Y_AXIS_DIRECTION", caststring(_yaxrev=='1'))
~setconf("PLOT_INF", caststring(_plotinf=='1'))

