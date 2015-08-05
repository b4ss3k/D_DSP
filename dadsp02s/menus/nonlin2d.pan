! nonlin2d.pan
! Nonlinear 2D filtering
@x0
@y0
@b{_bg1}
@f{_fg1}
@panel
NONLIN2D Nonlinear 2 Dimensional Filtering 
Format:  Nonlin2d(image matrix,filter type, kernel size)
Example: Nonlin2d(W1,2,3)
<L>
 Square Image Matrix: <*           >~_DEFSER1(strcat("'",_tocurr("<{_frmcurr(_SER1)}>"),"'"))~_pickser(_ser1)
 Filter Type:         <n           >~defmacro("_ftypstr",'<{_ftypstr}>',2)~<Median><Minimum><Maximum>
 Kernel Size (odd):   <            >~defmacro("_oddint",'<{_oddint}>',1)~input(2,"Enter Odd Integer",1)
 <L>
 {_dwinstr}
 <L>
~_mc;if((((_oddint/2)-int(_oddint/2))*2)==0,defmacro("_oddint",_oddint-1,1));if(strcmp(_ftypstr,"0")==0,defmacro("_ft",0,2),if(strcmp(_ftypstr,"1")==0,defmacro("_ft",1,2),defmacro("_ft",2,2)))
~eval(strcat("SETWF(",_dwin,",'Nonlin2D(",_ser1,",",eval('_ft'),",",strnum(eval('_oddint')),")')"))
