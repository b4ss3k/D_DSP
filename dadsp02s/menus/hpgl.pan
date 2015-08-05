! hpgl.pan
! HPGL Plotter Configuration
@f{_fg1}
@b{_bg1}
@panel
     HPGL

{defvar("_hpproa", 1);defvar("_hpepia", 1)}
<>
HPGL Mode  <# x{5} r n                t{'" Standard HPGL Protocol | Newer HPGL/2 Protocol "'}                                                              >~setvar("_hpgl_gl2", <{_hpgl_gl2}>)~<HPGL><HPGL 2>
PLOTALL Output    <% R x{-1} y{-1} n  t{'" Send HPGL Commands for Each Window to Separate Files | Send HPGL Commands for Each Window to One File "'}  >~setvar("_hpgl_alo",<{_hpgl_alo}>)~<Enumerated Files><Single File>
<y{-1}>
<>
<>
Number of Pens: <# w{10} j{0} x{-1} y{-1} d{1} t{'" Total Number of Pens Available "'}          >~setvar("_hpgl_np",'<{getvar("_hpgl_np")}>')~input(2)

Prologue:  <% j{3} w{22} y{-2}       e{_hpproa==0} t{'" Custom HPGL Starting Statements "'}      >~setvar("_hpgl_pro",'<{_hpprodf(_hpgl_gl2, _hpproa, _hpgl_pro)}>')~input(5, "Input Prologue")
Automatic  <# c x{-1} x{-1} y{-1}             t{'" Use Default HPGL Starting Statements "'} >~setvar("_hpproa", <{getvar("_hpproa")}> )~<0><1>
Epilogue:  <% j{3} w{22} x{-1} y{-1} e{_hpepia==0}  t{'" Custom HPGL Ending Statements "'}      >~setvar("_hpgl_epi",'<{_hpepidf(_hpgl_gl2, _hpepia, _hpgl_epi)}>')~input(5, "Input Epilogue")
Automatic  <# c x{-1} y{-1}                    t{'" Use Default HPGL Ending Statements "'} >~setvar("_hpepia", <{getvar("_hpepia")}>)~<0><1>
!<>
Output Filename: <% w{70} j{3} t{'" Destination File for HPGL Commands "'} >~setvar("_hpgl_fil",fixslash('<{getvar("_hpgl_fil")}>'))~input(5)
{_defsetstr} <# b x{-1} y{-1}>~~_defhpgl
<>
    X Dimension: <% w{20}             t{'" Number of Pixels in X Dimension "'}             >~setvar("_hpgl_x",'<{getvar("_hpgl_x")}>')~input(2,"X Dimension")
    Font Height: <% w{20} x{-1} y{-1} t{'" Font Height Multiplier, 1.0 = 100% "'}          >~setvar("_hpgl_fh",'<{getvar("_hpgl_fh")}>')~input(1)
    Y Dimension: <% w{20}             t{'" Number of Pixels in Y Direction "'}             >~setvar("_hpgl_y",'<{getvar("_hpgl_y")}>')~input(2,"Y Dimension")
    Font Width:  <% w{20} x{-1} y{-1} t{'" Font Width Multiplier, 1.0 = 100% "'}           >~setvar("_hpgl_fw",'<{getvar("_hpgl_fw")}>')~input(1)

Pen Numbering <L>
!Number of Pens: <# w{10}   d{1} t{'" Total Number of Pens Available "'}          >~setvar("_hpgl_np",'<{getvar("_hpgl_np")}>')~input(1)
!<>
  White <%             v{castint(_hpgl_np)> 0} d{0} w{10} t{'" White Pen Number, Default 0 "'}   >~setvar("_hpgl_whi", "<{getvar("_hpgl_whi")}>") ~input(2, "White Pen Number")
 Yellow <% x{-1} y{-1} v{castint(_hpgl_np)> 4} d{0} w{10} t{'" Yellow Pen Number, Default 4 "'}  >~setvar("_hpgl_yel", "<{getvar("_hpgl_yel")}>") ~input(2, "Yellow Pen Number")
  Black <%             v{castint(_hpgl_np)> 1} d{0} w{10} t{'" Black Pen Number, Default 1 "'}   >~setvar("_hpgl_blk", "<{getvar("_hpgl_blk")}>") ~input(2, "Black Pen Number")
   Blue <% x{-1} y{-1} v{castint(_hpgl_np)> 5} d{0} w{10} t{'" Blue Pen Number, Default 5 "'}    >~setvar("_hpgl_blu", "<{getvar("_hpgl_blu")}>") ~input(2, "Blue Pen Number")
    Red <%             v{castint(_hpgl_np)> 2} d{0} w{10} t{'" Red Pen Number, Default 2 "'}     >~setvar("_hpgl_red", "<{getvar("_hpgl_red")}>") ~input(2, "Red Pen Number")
Magenta <% x{-1} y{-1} v{castint(_hpgl_np)> 6} d{0} w{10} t{'" Magenta Pen Number, Default 6 "'} >~setvar("_hpgl_mag", "<{getvar("_hpgl_mag")}>") ~input(2, "Magenta Pen Number")
  Green <%             v{castint(_hpgl_np)> 3} d{0} w{10} t{'" Green Pen Number, Default 3 "'}   >~setvar("_hpgl_grn", "<{getvar("_hpgl_grn")}>") ~input(2, "Green Pen Number")
   Cyan <% x{-1} y{-1} v{castint(_hpgl_np)> 7} d{0} w{10} t{'" Cyan Pen Number, Default 7 "'}    >~setvar("_hpgl_cyn", "<{getvar("_hpgl_cyn")}>") ~input(2, "Cyan Pen Number")

~_mc;
~setconf("HPGL_HPGL2", caststring(_hpgl_gl2))
~setconf("HPGL_FILE", _hpgl_fil)
~if(_hpproa,setconf("HPGL_PROLOGUE", ""),setconf("HPGL_PROLOGUE", _hpgl_pro));
~if(_hpepia,setconf("HPGL_EPILOGUE", ""),setconf("HPGL_EPILOGUE", _hpgl_epi));
~setconf("HPGL_X", _hpgl_x)
~setconf("HPGL_Y", _hpgl_y)
~setconf("HPGL_FONT_HEIGHT", _hpgl_fh)
~setconf("HPGL_FONT_WIDTH",  _hpgl_fw)
~setconf("HPGL_NUMPENS",     _hpgl_np)

~setconf("HPGL_WHITE",   _hpgl_whi)
~setconf("HPGL_YELLOW",  _hpgl_yel)
~setconf("HPGL_BLACK",   _hpgl_blk)
~setconf("HPGL_BLUE",    _hpgl_blu)
~setconf("HPGL_RED",     _hpgl_red)
~setconf("HPGL_MAGENTA", _hpgl_mag)
~setconf("HPGL_GREEN",   _hpgl_grn)
~setconf("HPGL_CYAN",    _hpgl_cyn)
~setconf("HPGL_ONEFILE", caststring(_hpgl_alo))
