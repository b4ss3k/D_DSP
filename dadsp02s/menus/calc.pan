! Calc
@panel
@justifylabels 3
@fixed_editwidth 0

{sprintf("%s Calc", _getcwin)}
{defvar("calcval", 0);defvar("_calcstr", "")}

<>
  Mean <b #                  >~~beginwait();calcval = mean;_calcstr = "Mean";endwait();
  Sum  <b # x{-1} y{-1}      >~~beginwait();calcval = sum;_calcstr = "Sum";endwait();
  Prod <b # x{-1} y{-1}      >~~beginwait();calcval = prod;_calcstr = "Prod";endwait();
Median <b # x{-1} y{-1}      >~~beginwait();calcval = median;_calcstr = "Median";endwait();
   RMS <b # x{-1} y{-1}      >~~beginwait();calcval = rms(curr);_calcstr = "RMS";endwait();
  <>
   Max <b #                  >~~calcval = max;_calcstr = "Max"
   Min <b # x{-1} y{-1}      >~~calcval = min;_calcstr = "Min"
  Rows <b # x{-1} y{-1}      >~~calcval = numrows;_calcstr = "Numrows"
  Cols <b # x{-1} y{-1}      >~~calcval = numcols;_calcstr = "Numcols"
  Area <b # x{-1} y{-1}      >~~calcval = area;_calcstr = "Area"
<>
<L>
  Result: <                                         >~<{calcval}>~
Function: <x{-1} y{-1}        >~<{_calcstr}>~
<L>

~setvar("_misctool_page", getmenupage)
~if(isvar("_inmisc"), setvar("_miscreturn", 1), menureturn())
