! ser3dctl.pan
@b{_bg2}
@f{_fg2}
@panel

{if(_intabbed, "Graphical Settings", strcat("Graphical Settings for W", strnum(getwnum)))}
{defvar("_fxycmap", "None");defvar("_concol", 0)}
{setvar("_replot", 0)}

<>
  Curve Color: <= x{5} % p n >  ~setvar("_fxycol",<{(_fxycol)}>) ~_choosecolor 
<>
 Plot Type:       <= #           >~setvar("_fxyptype", "<{_fxyptype}>")~_ptyplst
 Show Cross Hatching <c % x{-1} y{-1} e{_fxyptype == _zsurfstr}>~setvar("_hatch", <{_hatch}>) ~<0><1>
<>
 Contour Levels: < % e{_fxyptype==_contourstr} d{1}  >~setvar(_conlev, <{int(numstr(contourset))}>)~input(2)	
 Show Contour Shading <c % x{-1} y{-1} e{_fxyptype == _contourstr}>~setvar("_concol", <{int(numstr(strfind(",",contourset)))}>) ~<0><1>
<L>
 Color Shading:   <= # n{0}       >~setvar("_fxycmap",  <{_fxycmap}>)~_chooseshading
 Limit Color Range  <# c x{-1} y{-1} e{_fxycmap != 0} >~setvar("_clrset", <{_clrset}>);_gcrange(_clrset)~<0><1>
 <>
 Color Shading Minimum: <% e{_clrset&&(_fxycmap != 0)}       >~setvar("_clrlo", "<{_clrlo}>")~input(1)
 Color Shading Maximum: <% e{_clrset&&(_fxycmap != 0)}       >~setvar("_clrhi", "<{_clrhi}>")~input(1)
{if(not(_intabbed), "<L>")}

~_MC
~if(_getptyp != _str2pty(_fxyptype), poff; _setptyp(_str2pty(_fxyptype)); _replot = 1)
~if(gethatch != _hatch, poff; sethatch(_hatch); _replot = 1)
~if(getwcolor(1) != _fxycol, poff; setcolor(_fxycol,1); _replot = 1)
~if(_fxyptype == _contourstr, if((numstr(contourset) != _conlev) || (int(numstr(strfind(",",contourset))) != _concol), poff;contourset(_conlev, _concol); _replot = 1))
~if(_clrset, setcrange(numstr(_clrlo), numstr(_clrhi)), setcrange())
~if(_fxycmap != 0, poff; eval(_i2cmap(_fxycmap)); _replot = 1, poff; shadewith(); _replot = 1)

! if not in property sheet plot it now
~if(not(_intabbed) && _replot, pon)
