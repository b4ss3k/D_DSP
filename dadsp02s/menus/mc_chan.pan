! mc_chan.pan
! menu accepting user input for advance options in multiple channel import
@h ~help('Multi-Channel',strcat(gethome,'dspum.hlp'))
@panel
{defvar("_chanall", 0)}
{if(_chanall, setvar("_chanoffset", "-1"), if(_chanoffset=="-1",setvar("_chanoffset", "1")))}
{_setimpchans(_chanoffset,_numchans)}

     File Information (2 of 3)
           
      Total Channels in File: < ##  d{1}                >~setvar(_numchans,"<{_numchans}>")~INPUT(2, 1)
  List Of Channels To Import: < ## * k e{_chanall == 0} >~setvar("_chanoffset", ("<{_toall(_chanoffset)}>"));~_numlist(numstr(_numchans))
  All Channels                < ## c  x{-1} y{-1}       >~setvar("_chanall", <{_chanall}>)~<0><1>
          Skip Interval:      <d{0}                     >~setvar(_skipint,"<{_skipint}>")~INPUT(2, 0)
<L>
File Offset:        <d{0}           >~setvar(_offsetfile,"<{_offsetfile}>")~INPUT(2, 0)
<>
File Offset Units  <r x{5} n %         >~setvar(_unitsoffset, _tounitoffset(<{_fromunitoffset(_unitsoffset)}>))~<LINE><BYTE><POINT><>
Storage Mode       <r x{-1} y{-1} n ## >~setvar(_modestore,_tomodestore(<{_frommodestore(_modestore)}>))~<INTERLACED><SEQUENTIAL><><>
When Importing, If File Exists: <r x{-1} y{-1} n %  >~setvar(_savemode,_tosavemode(<{_fromsavemode(_savemode)}>))~<PROMPT><OVERWRITE><APPEND><CANCEL>

Restore Defaults After Writing Header <c % >~setvar(_rdfltflg,"<{_rdfltflg}>")~<NO><YES>



~menuclear






