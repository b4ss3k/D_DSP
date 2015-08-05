! serctrl.pan
@b{_bg2}
@f{_fg2}
@panel
!@justifylabels 3

{if(_intabbed, "Graphical Settings", strcat("Graphical Settings for W", strnum(getwnum)))}
{setvar("_replot", 0)}
{defvar("_titem", 1);defvar("_tmember", 1)}


 Data Series: <= #        >  ~(_titem, _tmember) = _getitem(_lst2col(<{_itm2col(&_titem, &_tmember)}>)) ~_serlist 
 Series Styles <L>
 Curve Color: <= x{5} p n   >  ~defmacro("_col",<{(getwcolor(_titem, _tmember))}>,1) ~_choosecolor  
  Line Style: <x{-1} y{-1}  >  ~defmacro("_line",'"<{_getlinestyle(getlinestyle(_titem, _tmember))}>"',1) ~<SOLID><DASHED><DOTTED><DASHDOT><DASHDOTDOT>
  Plot Style: <x{5} n      >  ~setvar("_style",<{_gplst(getplotstyle(_titem, _tmember))}>)~<Lines><Points><Sticks><Bars><Table View><Steps><Stem>
  Line Width: <x{-1} y{-1} u{10} d{1} >  ~defmacro("_lwd",<{getlinewidth(_titem, _tmember)}>,1)~input(2,"Line Thickness")
<>
 Symbols <L>
 Symbol Type:  < n            >  ~defmacro("_symb","<{(getsymbol(0, _titem, _tmember))}>",2) ~<None><Square><Triangle><Inverted Triangle><Cross><Xcross><Clear Up Arrow><Clear Down Arrow><Up Arrow><Down Arrow><Clear Diamond><Clear Square><Clear Triangle><Clear Inverted Triangle><Circle><Clear Circle>
 Show Numerical Values    <c  x{-1} y{-1}>~setvar("_symvalues", <{getsymbol(0, _titem, _tmember)>=1000}>)~<0>~<1>
 Symbol Spacing Every: <d{1}    > Points ~defmacro("_symsp",<{getsymbol(1, _titem, _tmember)}>,1)~input(2,"Symbol Spacing")
 1st Symbol at Point:  <d{1}    >        ~defmacro("_stpt",<{getsymbol(2, _titem, _tmember)}>,1)~input(2,"Start Point")
<>
 Misc <L>
 Center Bars on Values    <c             >~setvar("_barctr", <{barctr}>)   ~<0>~<1>
 Extend Bars to Bottom    <c  x{-1} y{-1}>~setvar("_barsty", <{barstyle}>) ~<0>~<1>
 Show Gaps between Bars   <c  x{-1} y{-1} w{22} >~setvar("_bargap", <{bargap}>)   ~<0>~<1>
 Center Steps on Values   <c             >~setvar("_stepctr", <{stepctr}>) ~<0>~<1>
 Draw Outline Around Bars <c  x{-1} y{-1}>~setvar("_barbdr", <{barbdr}>) ~<0>~<1>
 
{if(not(_intabbed), "<L>")}

~_MC
~if((getsymbol(0, _titem, _tmember) != eval(_symb)+1000*_symvalues) || (getsymbol(1, _titem, _tmember) != _symsp) || (getsymbol(2, _titem, _tmember) != _stpt), poff; setsymbol(eval(_symb)+1000*_symvalues,_titem,_symsp,_stpt,_tmember); _replot = 1)
~if(getwcolor(_titem, _tmember) != _col, poff; setcolor(_col,_titem, _tmember); _replot = 1)
~if(getlinewidth(_titem, _tmember) != _lwd, poff; setlinewidth(_lwd, _titem, _tmember); _replot = 1);
~if(getlinestyle(_titem, _tmember) != eval(_line), poff; setline(eval(_line),_titem, _tmember); _replot = 1); 
~if(getplotstyle(_titem, _tmember) != castint(_stplst(_style))||_titem>1, poff; _setpstyle(castint(_stplst(_style)), _titem, _tmember); _replot = 1)
~if(barctr != _barctr, poff;barctr(_barctr);_replot = 1);
~if(barstyle != _barsty, poff;barstyle(_barsty);_replot = 1)
~if(bargap != _bargap, poff;bargap(_bargap);_replot = 1)
~if(stepctr != _stepctr, poff;stepctr(_stepctr);_replot = 1)
~if(barbdr != _barbdr, poff;barbdr(_barbdr);_replot = 1)

! if not in property sheet plot it now
~if(not(_intabbed) && _replot, pon)
