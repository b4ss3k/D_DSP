! activex.pan
@panel
@apply

{setvar("_eowm",  _eowi * 25.4)}
{setvar("_eohm",  _eohi * 25.4)}

    ActiveX
<>

ActiveX Enabled      <% c              t{'" Enable ActiveX Capability "'}                >~setvar("_axenb", <{_axenb}>)~<0><1>
Register Server      <% c x{-1} y{-1}  t{'" Register ActiveX Server on Startup "'}       >~setvar("_axreg", <{_axreg}>)~<0><1>
{_defsetstr}         <# b x{-1} y{-1} >~~_defatx
Transpose Arrays     <% c              t{'" Swap Rows and Columns on Array Transfers "'} >~setvar("_axtrn", <{_axtrn}>)~<0><1>
Transfer as Variants <% c x{-1} y{-1}  t{'" Transfer Binary Series Data as Array of Variants "'} >~setvar("_axvrt", <{_axvrt}>)~<0><1>

<>
Embedded Object Server <L>
Width (in):  <#               w{20} t{'" Width of Embedded Worksheet Image in Inches "'}       >~setvar("_eowi",  <{_eowi}>)~input(1)
Width (mm):  <# x{-1} y{-1}   w{20} t{'" Width of Embedded Worksheet Images in Millimeters "'} >~setvar("_eowm",  <{_eowm}>);setvar("_eowi", _eowm/25.4)~input(1)
Height (in): <#               w{20} t{'" Height of Embedded Worksheet Image in Inches "'}      >~setvar("_eohi",  <{_eohi}>)~input(1)
Height (mm): <# x{-1} y{-1}   w{20} t{'" Height of Embedded Worksheet Image in Millimeters "'} >~setvar("_eohm",  <{_eohm}>);setvar("_eohi", _eohm/25.4)~input(1)
<>
Display Format     <# r n x{5}                       t{'" Display Embedded Worksheet Image as Metafile Picture | Display Embedded Worksheet Image as Bitmap "'}               >~setvar("_axebfmt", _saxfmt(<{_gaxfmt(_axebfmt)}>));if(_axebfmt==2,setvar("_axres",0))~<Metafile><Bitmap>
Display Resolution <% r n x{-1} y{-1} e{_axebfmt!=2} t{'" Draw Embedded Worksheet Image using Screen Resolution | Draw Embedded Worksheet Image using Printer Resolution "'}  >~setvar("_axres",   <{_axres}>)~<Screen><Printer>
Print Format       <% r n x{-1} y{-1}                t{'" Print Embedded Worksheet Image as Metafile Picture | Print Embedded Worksheet Image as Bitmap "'}                   >~setvar("_axprfmt", _saxfmt(<{_gaxfmt(_axprfmt)}>))~<Metafile><Bitmap>
!<>
File Locations <L>
DWK Path : <j{3} e{_dpauto==0} % w{75}  t{'" Default Location of External DWK Worksheet Documents "'} >~setvar("_axdp", '<{_gaxdp(_axdp, _dpauto)}>')~input(5)
Automatic <c # x{-1} y{-1}         t{'" Use System Default "'}                                   >~setvar("_dpauto", <{_dpauto}>)~<0><1>
Temp Path : <j{3} e{_mpauto==0} % w{75} t{'" Default Location of Temporary Files "'}                  >~setvar("_axmp", '<{_gaxmp(_axmp, _mpauto)}>')~input(5)
Automatic <c # x{-1} y{-1}         t{'" Use System Default "'}                                   >~setvar("_mpauto", <{_mpauto}>)~<0><1>

~_mc

~setconf("ACTIVEX_ENABLED", caststring(_axenb));setconf("ACTIVEX_REGISTER", caststring(_axreg))
~setconf("ACTIVEX_ARRAY_TRANSPOSE", caststring(_axtrn));
~setconf("ACTIVEX_EMBEDDED_WIDTH", caststring(_eowi));setconf("ACTIVEX_EMBEDDED_HEIGHT", caststring(_eohi));
~setconf("ACTIVEX_EMBEDFORMAT", caststring(_axebfmt));setconf("ACTIVEX_PRINTFORMAT", caststring(_axprfmt));
~setconf("ACTIVEX_USE_PRINTER", caststring(_axres))
~setconf("ACTIVEX_CASTVARIANT", caststring(_axvrt))
~if(_dpauto,setconf("ACTIVEX_DOCDIR", ""),setconf("ACTIVEX_DOCDIR", sprintf('"%s"', fixslash(_axdp))))
~if(_mpauto,setconf("ACTIVEX_TEMPDIR", ""),setconf("ACTIVEX_TEMPDIR", sprintf('"%s"', fixslash(_axmp))))
