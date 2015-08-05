! MsgConf.pan
@f{_fg1}
@b{_bg1}
@h {cnfhlp("msgconf.hlp")}
!@fixed_editwidth 0
@panel

{setvar("_ynp", 1+castint(getconf("YN_PROCESSING")))}

! set run time warning flags to configuration values 
{defvar("_ignsrcflag", not(int(numstr(getconf("WARNING_SRCEQDES")))))}
{defvar("_ignlenflag", not(int(numstr(getconf("WARNING_OVERWRITE_WIN")))))}

       Messages

File Search Messages <R x{5}        n t{'" Don Not Display File Seatch Messages | Display Filenames that were Found | Display Filenames that were not Found | Display All File Search Messages "'} >~setvar("_dbfile",'<{getconf("DEBUG_FILE")}>')~<OFF><Successful Opens><Failed Opens><All Searches>
Yes/No Questions     <R x{-1} y{-1} n t{'" Always Ask User to Respond to Yes/No Questions | Automaticaly Respond with Yes to All Yes/No Questions | Automatically Respond with No to All Yes/No Questions "'} >~setvar("_ynp",caststring(-1+<{_ynp}>))~<Prompt User><Yes to All><No to All><>
Justify Status Text  <R x{-1} y{-1} n t{'" Right Justify Status Messages | Left Justify Status Messages | Center Status Messages "'} >~setvar("_cstxt",  '<{getconf("STATUS_JUSTIFY")}>')~<Right><Left><Center><>

Status and Error Messages <L>
Display Messages on Status Line   <c              t{'" Display Informational Messages on the Bottom Line "'}     >~setvar("_cslmes",    <{_getgmes(1)}>)~<0><1>
Display Messages in Message Box   <c  x{-1} y{-1} t{'" Display Informational Messages in a Popup Message Box "'} >~setvar("_cmbmes",    <{_getgmes(2)}>)~<0><1>
Display Errors on Status Line     <c              t{'" Display Error Messages on the Bottom Line "'}             >~setvar("_cslerrmes", <{_getgmes(3)}>)~<0><1>
Display Errors in Message Box     <c  x{-1} y{-1} t{'" Display Error Messages in a Popup Message Box "'}         >~setvar("_cmberrmes", <{_getgmes(4)}>)~<0><1>
<>
Show Messages <L>
Command Line Messages          <C              t{'" Show Line Editor Input "'}   >~setvar("_ipm",  '<{getconf("INPUT_PROCESSING")}>')~<0><1>
Command File Input Display     <C x{-1} y{-1}  t{'" Show Line Editor Input During Command File Processing "'}   >~setvar("_cfipm",'<{getconf("COMFILE_INPUT_PROCESSING")}>')~<0><1>
'Source = Destination'  Warning <C x{-1} y{-1} t{'" Display Warning if Source and Destination Windows Identical "'}    >~setvar("_ignsrcflag", not(<{not(_ignsrcflag)}>))~<0><1>
Window Update Messages         <C              t{'" Display Messages when Windows Recalculate "'}  >~setvar("_upm",  '<{getconf("UPDATE_PROCESSING")}>')~<0><1>
'More...'  Processing              <C x{-1} y{-1} t{'" Toggle Long Status Line Messages "'}   >~setvar("_mpm",  '<{getconf("MORE_PROCESSING")}>')~<0><1>
'Overwrite Window'  Warning     <C x{-1} y{-1} t{'" Display Warning if Destination Window Contains Data "'}   >~setvar("_ignlenflag", not(<{not(_ignlenflag)}>))~<0><1>
<>
Message Logging <L>
Log Messages    <C #   t{'" Log User Input and System Messages to File "'}           >~setconf("MESSAGE_LOGGING", '<{getconf("MESSAGE_LOGGING")}>')~<0><-1>
Log File Name:  <x{-1} y{-1} w{60} e{getconf("MESSAGE_LOGGING")!="0"} t{'" Name of File that Contains User Input and System Messages "'}    >~setconf("MESSAGE_LOGNAME", '<{getconf("MESSAGE_LOGNAME")}>')~_INLIT("Message Log")


~_mc
~messagelog(castint(getconf("MESSAGE_LOGGING")))
~setconf("MORE_PROCESSING",_mpm);setconf("INPUT_PROCESSING",_ipm);setconf("YN_PROCESSING",_ynp);setconf("COMFILE_INPUT_PROCESSING",_cfipm);setconf("UPDATE_PROCESSING",_upm);setconf("DEBUG_FILE", _dbfile);
~setconf("STATUS_JUSTIFY", _cstxt);_setgmes(_cslmes,_cmbmes,_cslerrmes,_cmberrmes)
