! pswdmode.pan - password request retrieval panel 
@panel
@suppress 2   ! suppress cancel button
@focus 1      ! set focus to OK

{_sys_pswdstr()}

{defvar("_pswdmode", 0)}
{setvar("_sys_pswdmode", -1)}

<i{1} x{5}> ! info icon
We will now generate your Password Request Form. To process your request, you may either:  <x{45} y{-1}>
<>

Password Request Method <r n h x{35} t{"' Request password directly from the Internet (recommended) | Use your email service to send the Password Request Form | Use Notepad to create a text file of the Password Request Form '"} >~setvar(_pswdmode, <{_pswdmode}>)~<Get Password from Web Now><Email Password Request><Create Hardcopy for Later>


~menuclear()
~setvar("_sys_pswdmode", getvar("_pswdmode"))

