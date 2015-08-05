
// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

t = ((1/16:1/8:1)'*2)*%pi;
x = sin(t);
y = cos(t);
// fill(x,y,''r'')
// axis square
plot(t,x);
//
