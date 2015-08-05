! maxmin.pan - displays max & min values
@panel
Values
 Data Series: <= ##        >  ~_DEFTRACE(<{_gettrace}>) ~_serlist 
<L>

{(_xmax, _ymax, _zmax) = maxloc(refseries(_trace))}

Maximum Value: <                      >~<{_ymax}>~
<x-1 y-1>~_dummy = '<{getvunits(refseries(_trace))}>'~
Maximum Location: <                      >~<{_xmax}>~
<x-1 y-1>~_dummy = '<{gethunits(refseries(_trace))}>'~

<L>

{(_xmin, _ymin, _zmin) = minloc(refseries(_trace))}

Minimum: <                      >~<{_ymin}>~
<x-1 y-1>~_dummy = '<{getvunits(refseries(_trace))}>'~
Minimum Location: <                      >~<{_xmin}>~
<x-1 y-1>~dummy = '<{gethunits(refseries(_trace))}>'~

~_mc
