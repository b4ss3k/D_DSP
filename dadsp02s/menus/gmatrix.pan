! gmatrix.pan -- Generate a matrix
@f{_fg2}
@b{_bg2}
@panel
@h~help(_gmatrix)
{defvar("_gmatrix", "Rand");defvar("_nrows", 10);defvar("_ncols", 10)}
 Matrix Generation
 <>
       Matrix Type: <%             >~setvar("_gmatrix", "<{_gmatrix}>")~<Ones><Eye><Rand><RandN><Zeros>
    Number of Rows: <              >~setvar("_nrows", <{_nrows}>)~input(2, 1)
 Number Of Columns: <              >~setvar("_ncols", <{_nrows}>)~input(2, 1)
<L>
{_dwinstr}
<L>

~_formstr = sprintf("%s(%s, %s)", _gmatrix, _nrows, _ncols)
~_verifydlen
