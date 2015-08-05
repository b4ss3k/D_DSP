@panel

{if(isvar("_inmisc"), "Hex Converter", "Hex Values")}
{defvar("_hexval", 100)}

<>

    Hex Value: <#                   >~_hexval = "<{_hexval}>"~input(5)
<L>
Integer Value: <#                   >~_hexval = int2hex(<{hex2int(_hexval)}>)~input(1)
<L>

~setvar("_misctool_page", getmenupage)
~if(isvar("_inmisc"), setvar("_miscreturn", 1), menureturn())
