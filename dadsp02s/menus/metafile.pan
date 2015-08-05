! metafile.pan
@f{_fg1}
@b{_bg1}
@panel

{setvar("_mfwm",  _mfwi * 25.4)}
{setvar("_mfhm",  _mfhi * 25.4)}

       Metafile
<>
Copy Metafile to File <# c   w{21}       t{'" Send Metafile Output to Disk File "'   }                      >~setvar("_mftof", <{_mftof}>)~<0><1>
<>
Metafile Size         <# r n x{5}        t{'" Use Same Size as Screen Image | Use Explicit Size "'}              >~setvar("_mfdim", <{_mfdim}>)~<Screen><Custom><>
Metafile Resolution   <% r n x{-1} y{-1} t{'" Use Same Resolution as Screen | Use Current Printer Resolution "'} >~setvar("_mfres", <{_mfres}>)~<Screen><Printer><>
Metafile Output File Type <% r n x{-1} y{-1} e{_mftof} t{'" Save to Standard (Aldus) Placeable Metafile | Save to Enhanced Metafile (EMF) | Save to Windows Metafile (WMF) "'} >~setvar("_mftyp", _smftyp(<{_gmftyp(_mftyp)}>))~<Standard><Enhanced (EMF)><Windows (WMF)>
<y{-1}>
<>
<>
<y{-2}>
   Metafile Filename:    <% j{3} w{70} e{_mftof} t{'" Destination for COPY METAFILE TO FILE Option "'} >~setvar("_mffn",  '<{_mffn}>')~input(5)
{_defsetstr} <# b x{-1} y{-1}>~~_defmeta
<>
Custom Size<L>
Width (in):  <#              e{_mfdim>0} w{20}   t{'" Custom Width in Inches "'}       >~setvar("_mfwi",  <{_mfwi}>)~input(1)
Width (mm):  <# x{-1} y{-1}  e{_mfdim>0} w{20}   t{'" Custom Width in Millimeters "'}  >~setvar("_mfwm",  <{_mfwm}>);setvar("_mfwi", _mfwm/25.4)~input(1)
Height (in): <#              e{_mfdim>0} w{20}   t{'" Custom Height in Inches "'}      >~setvar("_mfhi",  <{_mfhi}>)~input(1)
Height (mm): <# x{-1} y{-1}  e{_mfdim>0} w{20}   t{'" Custom Height in Millimeters "'} >~setvar("_mfhm",  <{_mfhm}>);setvar("_mfhi", _mfhm/25.4)~input(1)

~_mc

~if(_mfdim, setconf("metafile_width", strnum(_mfwi));setconf("metafile_height", strnum(_mfhi)), setconf("metafile_width", "-1");setconf("metafile_height", "-1"))
~setconf("metafile_use_printer", caststring(_mfres))
~setconf("metafile_type",        caststring(_mftyp))
~setconf("metafile_use_file",    caststring(_mftof))
~setconf("metafile_filename",    fixslash(_mffn))


