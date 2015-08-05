! SerConf.pan
@f{_fg1}
@b{_bg1}
@h {cnfhlp("serconf.hlp")}
@panel
      Series
<>
  Default Plot Style <% R n x{5} t{'" Straight Line Segments | Points Only | Vertical Lines | Vertical Bars | Tabular Listing | Staircase Segments | Vertical Lines with Solid Circles "'} >~setvar("_plstvar",<{_plstvar}>)~<Lines><Points><Sticks><Bars><Tableview><Steps><Stem>
<y{-1}>
<>
<>
          Line Width : <% x{-1} y{-1} u{50} d{0} w{25} t{'" Series Line Width in Pixels "'} >~setvar("_dlnwid", '<{_dlnwid}>')~input(2,"Enter Number for Linewidth")
          Symbol Size: <% x{-2}       u{50} d{1} w{25} t{'" Size of Symbols in Pixels "'}       >~setvar("_dsymsz", '<{_dsymsz}>')~_ININT("Symbol Size")
<x{-2}>
<>
 Buffer Size (Samples) : <# x{-2} w{25} t{sprintf('" Series Buffer Size in Samples ( %d Bytes ) "', _dbufsz * _typ2siz(_dtypvar)) }  >~setvar("_dbufsz",<{_dbufsz}>)~input(2,"Bufsize in Bytes", 128)
           Data Type :   <# x{-2} w{25} t{'" Default Data Type for Series "'}  >~setvar("_dtypvar",'<{_dtypvar}>')~<FLOAT><DOUBLE><INTEGER><UINTEGER><BYTE><UBYTE><LONG><ULONG>
<x{-2}>
<>
 Default Vertical Units:   <% x{-2} * w{25} t{'" Default Y Units "'}          >~setvar("_dyunit", "<{_dyunit}>")~_unitslist
 Default Horizontal Units: <% x{-2} * w{25} t{'" Default X Units "'}          >~setvar("_dxunit", "<{_dxunit}>")~_unitslist
 <>
 Convert Horizontal Units using Base Units <% c w{50} x{-2} t{'" Convert Units such as kHz to base Units of 1000 Hz by Adjusting Delta X "'}>~setvar("_dhucnv", <{_dhucnv}>)~<0><1>
<>
{_defsetstr} <# b    >~~_defscnf()

~_mc;
~setconf("SYMBOL_SIZE", _dsymsz);setconf("LINEWIDTH", _dlnwid);
~_defDTYP(_dtypvar);setconf("PLOT_STYLE",caststring(_stplst(_plstvar)));setconf("DATA_TYPE",eval('_dtyp'))
~setconf("BUFSIZE", caststring(_dbufsz))
~_setdun(_dyunit, 1);_setdun(_dxunit, 2)
~setconf("units_convert_hunits", caststring(_dhucnv))
