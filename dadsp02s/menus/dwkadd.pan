! add file to a DWK Worksheet
@panel
@justifylabel 3

{defvar("_defdwkdir", getlabpath)}
{if(1, setvar("_curdwkfname", strget(1, objectlist(6, getmiscpath))))}
Add Files

Worksheet Document Files: <% l * w{65} m{12} id{1} >~setvar("_curdwkfname", "<>")~objectlist(6, getmiscpath)
&Add Files       <## b x{-1} y{-1} id{21} t{"' Add a File to the DWK Worksheet Document '"}>~~_dwkfname = _adddwk(_defdwkdir, "Select File to Add"); if(strlen(_dwkfname), setvar("_defdwkdir", strrev(strfind(pathchar, strrev(_dwkfname)))))
&View File       <   b x{-2} t{"' View the Selected File '"}  >~~if(strlen(_curdwkfname), viewfile(getmiscpath+_curdwkfname))
&Edit File       <   b x{-2} t{"' Edit the Selected File '"}  >~~_pdcsplopen(getmiscpath+_curdwkfname)
<x{-2}>
<>
Add &Settings    <## b x{-2} t{"' Add Changed Configuration Settings '"}  >~~writecnf(getmiscpath+"dwk.cnf",0,0,0,1)

Worksheet Document Files Path: <y{-2} e{1} w{65} t{"' Location of Misc DWK Files '"}>~<{getmiscpath}>~

