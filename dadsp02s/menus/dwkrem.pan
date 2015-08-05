! remove files from a DWK Worksheet
@panel
@justifylabel 3

{setvar("_dellist", "")}
{defvar("_defdwkdir", getlabpath)}

Remove Files

Worksheet Document Files: <% l * k w65 m11 >~setvar("_dellist", "<>")~objectlist(6, getmiscpath)
&Remove <## b x{-1} y{-1} t{"' Remove Checked Files from DWK '"} >~~_remdwk(_dellist, "Remove File from Worksheet", "Remove %s?")
<>
Worksheet Document Files Path: <y{-2} e{1} w{65} t{"' Location of Misc DWK Files '"}>~<{getmiscpath}>~

