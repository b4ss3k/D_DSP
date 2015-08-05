! pswdi.pan - international password panel 
@panel
@suppress 2   ! suppress cancel button
@focus 1      ! set focus to OK

DADiSP 2002 International Authorization

{defvar("_authmode", 0)}

<i{2} x{5}> ! alert icon
Your International Version of DADiSP Requires a Password for Full Operation. <x{35} y{-1}>
Without a Password, you can run DADiSP in Browser Mode:                   <x{35}      >
<>

* 9 Windows per Worksheet             <x{80} y{-1}>
* 32K Data Points per Series          <x{80}>
* No Saving of Series or Worksheets   <x{80}>
<>


Authorization <r n h x{35}     >~setvar(_authmode, <{_authmode}>)~<I Need a Password><I Have a Password><Run in Browser Mode>

~menuclear()
~setvar("_sys_authmode", getvar("_authmode"))

