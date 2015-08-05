! tblconf.pan tableview configuration
@f{_fg1}
@b{_bg1}
@panel
@h~help("tableview")
{setvar("_otbv1",  castint(getconf("TABLE_STYLE")))}
{setvar("_otbv2",  castint(getconf("TABLE_COLHEADER")))}
{setvar("_otbv3",  castint(getconf("TABLE_COL_JUSTIFY")))}
{setvar("_otbv4",  castint(getconf("TABLE_JUSTIFY")))}
{setvar("_tbvn",  if(_otbv2 & 0x20, 2, if(_otbv2 & 0x10, 1, 0)))}
{setvar("_tbvi",  _otbv2 & 0x0f);if(_tbvi == 4, _tbvi = 0, _tbvi += 1)}
{setvar("_tbvc",  if(_otbv2 & 0x40, 1, 0))}

 Table
 <>
 Justify Table Values  <R n x{-1} y{-1} t{'" Left Justify Table Values | Center Table Values | Right Justify Table Values "'}  >~setvar("_tbv4", <{_otbv4}>)~<Left><Center><Right>
 Justify Column Header <R n x{-1} y{-1} t{'" Left Justify Table Column Header | Center Table Column Header | Right Justify Table Column Header "'}  >~setvar("_tbv3", <{_otbv3}>)~<Left><Center><Right>
 Table Display Style   <R n x{-1} y{-1} t{'" Table with No Borders | Table with 3D Row and Column Borders "'} >~setvar("_tbv1", <{_otbv1}>)~<Simple><Spreadsheet Style><>
 Table Column Header Text <L>
 <>
 Column Number         <r n x{5}          t{'" Add Column Number to First Header Line | Make Column Number the First Header Line "'}>~setvar("_tbvc", <{_tbvc}>)~<Combine><Separate Header><><><>
 Header Name           <r n x{-1} y{-1}}  t{'" Do Not Display Series Name | Display Series Name | Display Dataset and Series Name "'}>~setvar("_tbvn", <{_tbvn}>)~<None><Series Name><Full Name><><>
 Header Info           <r n x{-1} y{-1}}  t{'" Do Not Display Units or Comment | Display Units or Display Comment if Not Default Comment | Display Units Only | Display Comment Only | Display Both Units and Comment "'}>~setvar("_tbvi", <{_tbvi}>)~<None><Units or Comment><Units><Comment><Units and Comment>
~_mc;
~setvar("_otbv1",  castint(getconf("TABLE_STYLE")))
~setvar("_otbv2",  castint(getconf("TABLE_COLHEADER")))
~setvar("_otbv3",  castint(getconf("TABLE_COL_JUSTIFY")))
~setvar("_otbv4",  castint(getconf("TABLE_JUSTIFY")))

~_tbv2 = _tbvn * 0x10;
~if(_tbvi == 0, _tbvi = 4, _tbvi -= 1)
~_tbv2 += _tbvi
~_tbv2 += _tbvc * 0x40;
~if(_otbv4 != _tbv4, setconf("TABLE_JUSTIFY", caststring(_tbv4));setvar("_rdraw",1))
~if(_otbv3 != _tbv3, setconf("TABLE_COL_JUSTIFY", caststring(_tbv3));setvar("_rdraw",1))
~if(_otbv1 != _tbv1, setconf("TABLE_STYLE", caststring(_tbv1));      setvar("_rdraw",1))
~if(_otbv2 != _tbv2, setconf("TABLE_COLHEADER", caststring(_tbv2));  setvar("_rdraw",1))
~if(_rdraw, _replot = 1)
