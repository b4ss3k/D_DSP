@panel
@h~help("markmax")
Mark
{defvar("_colx", LRED);defvar("_coly", LGREEN)}
{defvar("_symbx", DN_ARROW);defvar("_symby", UP_ARROW)}
{defvar("_markmxval", 0);defvar("_markmnval", 0)}

 Data Series: <= ##        >  ~_DEFTRACE(<{_gettrace}>) ~_serlist 
<L>
   Symbol Type: <  % n          >~setvar("_symbx", <{_symbx}>)~<None><Square><Triangle><Inverted Triangle><Cross><Xcross><Clear Up Arrow><Clear Down Arrow><Up Arrow><Down Arrow><Clear Diamond><Clear Square><Clear Triangle><Clear Inverted Triangle><Circle><Clear Circle>
   Show Numerical Values  <c % x{-1} y{-1}>~setvar("_markmxval", <{_markmxval}>)~<0>~<1>
 Maximum Color: <= % p n        >~setvar("_colx", <{(_colx)}>)~_choosecolor 
       Mark Max <b x{-1} y{-1}>~~if((_mmark = _gmaxmk) > 0, unoverp(_mmark-1),  markmax(refseries(_trace), _colx, _symbx+1000*_markmxval));plotmode(1,1)
<L>
   Symbol Type: <  % n          >~setvar("_symby", <{_symby}>)~<None><Square><Triangle><Inverted Triangle><Cross><Xcross><Clear Up Arrow><Clear Down Arrow><Up Arrow><Down Arrow><Clear Diamond><Clear Square><Clear Triangle><Clear Inverted Triangle><Circle><Clear Circle>
   Show Numerical Values  <c % x{-1} y{-1}>~setvar("_markmnval", <{_markmnval}>)~<0>~<1>
 Minimum Color: <= % p n        >~setvar("_coly", <{(_coly)}>)~_choosecolor 
       Mark Min <b x{-1} y{-1}>~~if((_mmark = _gminmk) > 0, unoverp(_mmark-1),  markmin(refseries(_trace), _coly, _symby+1000*_markmnval));plotmode(1,1)

~_mc
