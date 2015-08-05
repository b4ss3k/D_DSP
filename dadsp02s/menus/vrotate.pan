! VRotate.pan
@f{_fg1}
@b{_bg1}
!@x10
!@y0
@h{hlp("vrotate.hlp")}
@panel
Default Vertical Rotation
<>
X Axis Labels: <            >~defmacro("_tv1x","<{_tv1x}>",2)~<Vdef90><Vdef270><VdefChar90><Vdef90_270><Vdef270_90>
Y Axis Labels: <x{-1} y{-1} >~defmacro("_tv1y","<{_tv1y}>",2)~<Vdef90><Vdef270><VdefChar90><Vdef90_270><Vdef270_90>
<>
X Tick Labels: <            >~defmacro("_tv2x","<{_tv2x}>",2)~<Vdef90><Vdef270><VdefChar90><Vdef90_270><Vdef270_90>
Y Tick Labels: <x{-1} y{-1} >~defmacro("_tv2y","<{_tv2y}>",2)~<Vdef90><Vdef270><VdefChar90><Vdef90_270><Vdef270_90>
<L>
!X Axis Labels <         >~defmacro("_tv1x","<{_tv1x}>",2)~<90 deg CCW><270 deg CCW><Horiz Char, Vert Seq><90 deg Left, Bottom; 270 deg Right, Top><270 deg Left, Bottom; 90 deg Right, Top>
!X Axis Labels ~defmacro("_DfltTyp",1,1);_mf("DfltRot.men")
!X Tick Labels ~defmacro("_DfltTyp",2,1);_mf("DfltRot.men")
!Y Axis Labels ~defmacro("_DfltTyp",3,1);_mf("DfltRot.men")
!Y Tick Labels ~defmacro("_DfltTyp",4,1);_mf("DfltRot.men")

~_mc;setavdefx(eval(_tv1x));setavdefy(eval(_tv1y));settvdefx(eval(_tv2x));settvdefy(eval(_tv2y))
