! maxlist.pan - displays max & min values
@panel
Values

 Data Series: <= ##        >  ~_DEFTRACE(<{_gettrace}>) ~_serlist 

<L>
{(_xmax, _ymax, _zmax) = maxloc(refseries(_trace))}

Maximum Value: <                      >~<{_zmax}>~
<x-1 y-1>~_dummy = '<{getzunits(refseries(_trace))}>'~
X Location: <                      >~<{_xmax}>~
<x-1 y-1>~_dummy = '<{gethunits(refseries(_trace))}>'~
Y Location: <                      >~<{_ymax}>~
<x-1 y-1>~_dummy = '<{getvunits(refseries(_trace))}>'~

<L>
{(_xmin, _ymin, _zmin) = minloc(refseries(_trace))}

Minimum Value: <                      >~<{_zmin}>~
<x-1 y-1>~_dummy = '<{getzunits(refseries(_trace))}>'~
X Location: <                      >~<{_xmin}>~
<x-1 y-1>~_dummy = '<{gethunits(refseries(_trace))}>'~
Y Location: <                      >~<{_ymin}>~
<x-1 y-1>~_dummy = '<{getvunits(refseries(_trace))}>'~


~_mc
