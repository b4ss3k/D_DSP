! mcheader.pan
@x0
@y0
@panel
@h ~help('Importing Multi-Channel Data into a Dataset',strcat(gethome,'dspum.hlp'))
@fixed_editwidth 0
{defvar("_headpickdir", getlabpath)}

    Multi Channel Header Wizard (1 of 3)
< >
Header File Name: <* # w{70}                          >~setvar("_headfile", '<{getvar("_headfile")}>')~pickflst(_headfile, "_hfnamelst")
 Browse...  <b # x{-1} y{-1} > ~~if(strlen(temp = Pickfile(_headpickdir,"Header File Selection",strescape("Header Files(*.hed)\0\*.hed\0All Files(*.*)\0\*.*\0"),1)) > 0, setvar("_headfile", temp);setvar("_headpickdir", strrev(strfind(pathchar, strrev(_headfile)))))
<L>
File Type:        <                 #    >~setvar(_filetype,"<{_filetype}>");if(_filetype=="ASCII",_swapflag=0)~<ASCII><BYTE><UBYTE><INTEGER><UINTEGER><LONG><ULONG><FLOAT><DOUBLE>
Swap Bytes <c % x{-1} y{-1} e{_filetype!="ASCII"} >~setvar(_swapflag,<{_swapflag}>)~<0><1>

<L>
Dataset Name:     <                 #    >~setvar(_datasetname,"<{_datasetname}>")~INPUT(5,1,15)
Date Acquired:    <x{-1} y{-1}      #    >~setvar(_dateacq,"<{getdate}>")~INPUT(5)
Version Number:   <                 #    >~setvar(_versnum,"<{_versnum}>")~INPUT(5,1,4)
Time Acquired:    <x{-1} y{-1}      #    >~setvar(_timeacq,"<{gettime}>")~INPUT(5)
<L>
<>
Comment:          <w{70}            #    >~setvar(_usercomm,"<{_usercomm}>")~INPUT(5,0,128)

~menuclear
                                                             


