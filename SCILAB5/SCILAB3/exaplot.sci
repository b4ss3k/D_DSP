/////////////////////////////////////////////
// PLOT
///////////////////////////////////////////
// x initialisation 
x=[0:0.1:2*%pi]';
//simple plot
plot2d(sin(x))
clf()
plot2d(x,sin(x))
//multiple plot
clf()
plot2d(x,[sin(x) sin(2*x) sin(3*x)])
// multiple plot giving the dimensions of the frame
clf()
plot2d(x,[sin(x) sin(2*x) sin(3*x)],rect=[0,0,6,0.5])
//multiple plot with captions and given tics + style
clf()
plot2d(x,[sin(x) sin(2*x) sin(3*x)],..
  [1,2,3],leg="L1@L2@L3",nax=[2,10,2,10],rect=[0,-2,2*%pi,2])
// isoview
clf()
plot2d(x,sin(x),1,frameflag= 4) 
// scale 
clf()
plot2d(x,sin(x),1,frameflag= 6) 
// auto scaling with previous plots + style
clf()
plot2d(x,sin(x),-1)
plot2d(x,2*sin(x),12) 
plot2d(2*x,cos(x),3) 
// axis on the right 
clf()
plot2d(x,sin(x),leg="sin(x)") 
a=gca(); // Handle on axes entity 
a.y_location ="right"; 
// axis centered at (0,0) 
clf()
plot2d(x-4,sin(x),1,leg="sin(x)") 
a=gca() // Handle on axes entity
a.x_location = "middle"; 
a.y_location = "middle"; 
// Some operations on entities created by plot2d ...
a=gca();
a.isoview='on'; 
a.children // list the children of the axes : here it is an Agregation child composed of 2 entities 
poly1= a.children.children(2); //store polyline handle into poly1 
poly1.foreground = 4; // another way to change the style...
poly1.thickness = 3;  // ...and the tickness of a curve.
poly1.clip_state='off' // clipping control
leg= a.children.children(1); // store legend handle into leg
leg.font_style = 9; 
leg.foreground = 6;
a.isoview='off'; 

