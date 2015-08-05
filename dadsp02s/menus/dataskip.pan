! dataskip.pan
! menu accepting user input for advance options in multiple channel import
{defmacro('_flyflg',0,1)}
@h ~help('Data Skipping',strcat(gethome,'dspum.hlp'))
@panel

     Data Skipping

Points To Import   <       >~setvar(_numpts,"<{_numpts}>")~INPUT(5)
File Offset        <       >~setvar(_offsetfile,"<{_offsetfile}>")~INPUT(2)
File Offset Units  <r      >~setvar(_unitsoffset,"<{_unitsoffset}>")~<LINE><BYTE><POINT>
Skip Interval      <       >~setvar(_skipint,"<{_skipint}>")~INPUT(2)

~menuclear;defmacro('_flyflg',1,1)






