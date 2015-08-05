! scheader.pan
! Header File Generation Menu For Single Channel Import
@x0
@y0
!{if(strcmp(_rdfltflg,"YES")==0,set_defaults)}
@h ~help('Importing a Single Channel',strcat(gethome,'dspum.hlp'))
@panel
@fixed_editwidth 0
{defvar("_headpickdir", getlabpath)}

    Single Channel Header Wizard (1 of 3)

Header File Name: <* # w{70}             >~setvar("_headfile", '<{getvar("_headfile")}>')~pickflst(_headfile, "_hfnamelst")
 Browse...  <b # x{-1} y{-1} > ~~if(strlen(temp = Pickfile(_headpickdir,"Header File Selection",strescape("Header Files(*.hed)\0\*.hed\0All Files(*.*)\0\*.*\0"),1)) > 0, setvar("_headfile", temp);setvar("_headpickdir", strrev(strfind(pathchar, strrev(_headfile)))))
<L>
File Type:        <                 #    >~setvar(_filetype,"<{_filetype}>")~<ASCII><BYTE><UBYTE><INTEGER><UINTEGER><LONG><ULONG><FLOAT><DOUBLE>
Swap Bytes <c % x{-1} y{-1} e{_filetype!="ASCII"} >~setvar(_swapflag,<{_swapflag}>)~<0><1>
<L>
Dataset Name:     <                 #    >~setvar(_datasetname,"<{_datasetname}>")~INPUT(5,1,15)
Date Acquired:    <x{-1} y{-1}      #    >~setvar(_dateacq,"<{getdate}>")~INPUT(5)
Version Number:   <                 #    >~setvar(_versnum,"<{_versnum}>")~INPUT(5,1,4)
Time Acquired:    <x{-1} y{-1}      #    >~setvar(_timeacq,"<{gettime}>")~INPUT(5)
<L>
Comment:          <w{70}            #    >~setvar(_usercomm,"<{_usercomm}>")~INPUT(5,0,128)

~setvar(_scflag,1);setvar(_impchans,"1");menuclear
                                                             


