! chaninfo.pan
! menu accepting user input for advance options in multiple channel import
@h ~help('Multi-Channel',strcat(gethome,'dspum.hlp'))
@panel
{defmacro('_flyflg',0,1)}
{defvar("_schall", 1)}
{defvar("_numptsv","1")}
{if(_schall, setvar("_numpts", "-1"), if(_numpts=="-1",setvar("_numpts", _numptsv)))}
{if(strlen(strfind(",", _chanoffset)),setvar("_chanoffset", "1"))}

     File Information (2 of 3)
           
Channels in File:  <  d{1}                         w{20}    >~setvar(_numchans,"<{_numchans}>")~INPUT(2)
File Offset:       <d{0} x{-1} y{-1}               w{20}    >~setvar(_offsetfile,"<{_offsetfile}>")~INPUT(2)
Channel To Import: <d{1}                           w{20}    >~setvar(_chanoffset,"<{_chanoffset}>")~INPUT(2)
Skip Interval:     <x{-1} y{-1} d{0}               w{20}    >~setvar(_skipint,"<{_skipint}>")~INPUT(2)
<L>
Points to Import:  <# e{_schall == 0} d{1} w{20}>~setvar("_numpts", _fromall("<{_toall(_numpts)}>"));if(_numpts!="-1",setvar("_numptsv",_numpts))~input(2, 1)
All Points         <# c  x{-1} y{-1}            >~setvar("_schall", <{_schall}>)~<0><1>
<>
File Offset Units  <r x{5} n       >~setvar(_unitsoffset, _tounitoffset(<{_fromunitoffset(_unitsoffset)}>))~<LINE><BYTE><POINT><>
Storage Mode       <r x{-1} y{-1} n  >~setvar(_modestore,_tomodestore(<{_frommodestore(_modestore)}>))~<INTERLACED><SEQUENTIAL><><>
When Importing, If File Exists:   <r x{-1} y{-1} n       >~setvar(_savemode,_tosavemode(<{_fromsavemode(_savemode)}>))~<PROMPT><OVERWRITE><APPEND><CANCEL>

Restore Defaults After Writing Header <c                    >~setvar(_rdfltflg,"<{_rdfltflg}>")~<NO><YES>

~menuclear
~defmacro('_flyflg',1,1)






