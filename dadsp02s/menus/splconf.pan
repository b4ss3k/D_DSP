! splconf.pan
@f{_fg1}
@b{_bg1}
@panel
@fixed_editwidth 0

    SPL

SPL Editor: <* w{70}   t{'" Select Program to Create and Edit SPL Files "'}      >~setconf("spl_editor", sprintf("'%s'", fixslash('<{getconf("spl_editor")}>')))~pickflst(getconf("spl_editor"), "_edfnamelst")
 Browse...  <b # x{-1} y{-1} > ~~if(strlen(temp = Pickfile(gethome,"Select Editor Path",strescape("Exe Files(*.exe)\0*.exe\0All Files(*.*)\0*.*\0\0"),0)) > 0, setconf("spl_editor", sprintf("'%s'", fixslash(temp))))
Error Handling <L>
Show Compile Errors                 <c             t{'" Automatically Display SPL Compile Errors in Message Box "'}    >~setconf("SPL_VIEW_ERRFILE",'<{getconf("SPL_VIEW_ERRFILE")}>')~<0><1>
Show Run Time Errors in Message Box <c x{-1} y{-1} t{'" Automatically Display SPL Processing Errors in Message Box "'} >~setconf("SPL_GUI_ERROR",'<{getconf("SPL_GUI_ERROR")}>')~<0><1>
Enable Run Time Error Handlers      <c             t{'" Enable User Defined SPL Error Handlers "'}                     >~setconf("SPL_ERROR_HANDLING",'<{getconf("SPL_ERROR_HANDLING")}>')~<0><1>
Show Line Numbers in Error Messages <c x{-1} y{-1} t{'" Add Line Number Information to Error Messages "'}              >~setconf("SPL_LINE_NUMBERS",'<{getconf("SPL_LINE_NUMBERS")}>')~<0><1>
<>
Misc <L>
Save Line Numbers         <c             t{'" Add Line Number Information to OPL Files "'}                                        >~setconf("SPL_SAVE_LINE_NUMBERS",'<{getconf("SPL_SAVE_LINE_NUMBERS")}>')~<0><1>
Show Macro Defines        <c x{-1} y{-1} t{'" Display Run Time Macro Processing Messages "'}                                      >~setconf("SPL_VERBOSE_MACDEFINE",'<{getconf("SPL_VERBOSE_MACDEFINE")}>')~<0><1>
Enable Automatic Commands <c             t{sprintf("'%s'", ' Automatically Convert FUNCTION STRING to FUNCTION("STRING") Form ')} >~setconf("SPL_COMMANDS",'<{getconf("SPL_COMMANDS")}>')~<0><1>
Save Last Answer          <c x{-1} y{-1} t{'" Save Last Scalar Result to ANS Variable "'}                                         >~setconf("SPL_SAVE_ANSWER",'<{getconf("SPL_SAVE_ANSWER")}>')~<0><1>
View Line Numbers         <c             t{'" Show Line Numbers with View Function "'}                                            >~setconf("SPL_VIEW_LINE_NUMBERS",'<{getconf("SPL_VIEW_LINE_NUMBERS")}>')~<0><1>
Use j as Imaginary Unit   <c x{-1} y{-1} t{'" Let j = i = sqrt(-1), the Basic Imaginary Unit "'}                                  >~setconf("SPL_COMPLEX_J",'<{getconf("SPL_COMPLEX_J")}>')~<0><1>
<>
Processing <L>
Read SPL Functions from File <r x{5} n                    t{'" Load SPL Functions by User Commands Only | Automatically Load SPL Functions as Needed | Reload Needed SPL Functions Even if Already Resident "'} >~setconf("SPL_AUTO_LOAD", '<{getconf("SPL_AUTO_LOAD")}>')~<Manually><Automatically><Always>
Start Index for Arrays:      <x{-1} y{-1} d{-10000} w{20} t{'" First Index Value for A[i] References "'} >~setconf("SPL_START_INDEX",'<{getconf("SPL_START_INDEX")}>')~input(1)
<x{-2}>
<>
<>
Array Reference Results Inherit Series Attributes <c w{50} x{-2} y{-1} t{'" A[n, m] Operations Inherit Units, DeltaX and Xoffset from array A "'} >~setconf("SPL_ARRAY_INHERIT",'<{getconf("SPL_ARRAY_INHERIT")}>')~<0><1>
<x{-2}>
Empty Series Comparison Returns Empty <c w{50} x{-2} y{-1} t{'" Always Return Empty Series for Empty == Scalar Comparisons "'} >~setconf("EMPTY_COMPARISON",'<{getconf("EMPTY_COMPARISON")}>')~<0><1>
~_mc;

