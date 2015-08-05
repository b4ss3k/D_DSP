 FUNCTION ARGUMENTS                                                      
                                                                         
 The following is a brief description of the shorthand used to describe  
 the arguments of DADiSP's functions.  The basic format is:              
                                                                         
            <arg1:type1, arg2:type2, ...>                                
                                                                         
 where argN is a short description of the Nth argument.  TypeN is the    
 type that DADiSP expects this argument to be.  These are the            
 argument types used:                                                    
                                                                         
            I -- Integer                                                 
            R -- Real                                                    
            C -- Complex                                                 
            S -- Signal                                                  
            W -- Window                                                  
            " -- String                                                  
                                                                         
 These arguments may be modified either by an asterisk ('*') or by       
 an 's'.  An asterisk means that the argument is optional; an 's' means  
 that more than one argument of that type is allowed.                    
                                                                         
                                                                         
 BASIC MATHEMATICAL FUNCTIONS                                            
                                                                         
 These functions may be applied to integers, real or complex numbers or  
 signals with equal facility:                                            
                                                                         
    +        Addition                                                    
    -        Subtraction or Unary Negation                               
    *        Multiplication                                              
    /        Division                                                    
    ^        Exponentiation                                              
                                                                         
                                                                         
 MATHEMATICAL FUNCTIONS                                                  
                                                                         
 DADiSP supports a number of more advanced mathematical functions        
 including trigonometric, logarithmic and other functions.  These can    
 be applied to any valid signal or scalar or signal/scalar expression.   
 When applied to a signal, they are applied successively to each point   
 of the signal and the resulting signal is placed in the current window. 
 When applied to scalars (integers, real numbers, or complex numbers),   
 the resulting value is displayed at the bottom of the screen.           
                                                                         
    The value of PI (3.1415926535...) is available by typing PI.         
                                                                         
    To change the input/output of the trigonometric functions from       
 degrees to radians or vice versa, use the functions SETRADIAN or        
 SETDEGREE described below.                                              
                                                                         
    SIN      Sine                                  (<anything>)          
    COS      Cosine                                (<anything>)          
    TAN      Tangent                               (<anything>)          
    SEC      Secant                                (<anything>)          
    CSC      Cosecant                              (<anything>)          
    COT      Cotangent                             (<anything>)          
    ASIN     Arcsine                               (<anything>)          
    ACOS     Arccosine                             (<anything>)          
    ATAN     Arctangent                            (<anything>)          
    ASEC     Arcsecant                             (<anything>)          
    ACSC     Arccosecant                           (<anything>)          
    ACOT     Arccotangent                          (<anything>)          
    SINH     Hyperbolic sine                       (<anything>)          
    COSH     Hyperbolic cosine                     (<anything>)          
    TANH     Hyperbolic tangent                    (<anything>)          
    SECH     Hyperbolic secant                     (<anything>)          
    CSCH     Hyperbolic cosecant                   (<anything>)          
    COTH     Hyperbolic cotangent                  (<anything>)          
    ASINH    Hyperbolic arcsine                    (<anything>)          
    ACOSH    Hyperbolic arccosine                  (<anything>)          
    ATANH    Hyperbolic arctangent                 (<anything>)          
    ASECH    Hyperbolic arcsecant                  (<anything>)          
    ACSCH    Hyperbolic arccosecant                (<anything>)          
    ACOTH    Hyperbolic arccotangent               (<anything>)          
    EXP      Exponentiation (base e = 2.7182...)   (<anything>)          
    LOG      Natural log (base = e)                (<anything>)          
    LN       Natural log (base = e)                (<anything>)          
    LOG10    Common  log (base = 10)               (<anything>)          
    SQRT     Square root                           (<anything>)          
    ABS      Absolute value                        (<anything>)          
    SINC     Sinc function (sin(x) / x)            (<anything>)          
    ABS      Absolute value                        (<anything>)          
    FLOOR    Greatest Integer Less Than            (<anything>)          
    CEILING  Smallest Integer Greater Than         (<anything>)          
                                                                         
                                                                         
 CALCULUS FUNCTIONS                                                      
                                                                         
 These functions are for calculating derivatives and integrals of        
 signals.  Since the signals are discrete, DADiSP provides a means       
 of performing left derivative and right derivative calculations.        
 Four of these functions take one signal as an argument and return       
 a new one (DERIV, LDERIV, RDERIV, INTEG).  AREA takes two additional    
 arguments, the starting point and the number of points to use from      
 the signal.  Note also that AREA returns a scalar whereas the other     
 four return signals.  The algorithm for calculating the integral is     
 a modification of Simpson's Rule -- it is more accurate than a simple   
 trapezoidal approximation.                                              
                                                                         
    DERIV    Derivative          (<sig:S>)                               
    LDERIV   Left derivative     (<sig:S>)                               
    RDERIV   Right derivative    (<sig:S>)                               
    INTEG    Integral            (<sig:S>)                               
    AREA     Area                (<sig:S*>, <start:I*>, <len:I*>)        
                                                                         
                                                                         
 STATISTICAL FUNCTIONS                                                   
                                                                         
 These functions provide statistical information about a signal          
 (or two signals in the case of LINREG2).  MEAN and STDEV return         
 appropriate values which can be nested in more complicated              
 expressions.  STATS does not return anything, but displays both         
 the mean and the standard deviation at the bottom of the screen.        
 LINREG and LINREG2 display the regression coefficients and then         
 create a new signal -- the line generated by the linear regression.     
 This is very useful for overplotting.  Finally, AMPDIST generates       
 a new signal which is really a bar graph of the distibution of the      
 values of a signal.  It takes a second argument, a real number,         
 which is the delta-y variation.                                         
                                                                         
    MEAN     Mean                    (<sig:S*>, <start:I*>, <len:I*>)    
    STDEV    Standard Deviation      (<sig:S*>, <start:I*>, <len:I*>)    
    STATS    Displays Both           (<sig:S*>, <start:I*>, <len:I*>)    
    LINREG   Linear Regression       (<sig:S>)                           
    LINREG2  Linear Regression       (<sig1:S>, <sig2:S>)                
    AMPDIST  Amplitude Distribution  (<sig:S>, <delta-y:R>)              
                                                                         
                                                                         
 SIGNAL ANALYSIS (INCLUDING FOURIER)                                     
                                                                         
 DADiSP provides functions for frequency domain analysis.  Fourier       
 analysis is provided with both the Discrete Transform and the           
 much faster Fast Fourier Transform.  The FFT will not operate on        
 a signal unless its length is a power of 2.  PARTSUM creates a new      
 signal of the partial sums of the input.  MOVAVG provides a smoothing   
 function.  SUMS adds any number of signals together and AVG takes       
 the point by point average of a group of signals.                       
                                                                         
    PARTSUM  Partial Sums                  (<sig:S>)                     
    MOVAVG   Moving Average                (<sig:S>, <num:I>)            
    SUMS     Sum Several Signals           (<sig1,..,sigN:Ss>)           
    AVG      Average Serval Signals        (<sig1,..,sigN:Ss>)           
    DFT      Discrete Fourier Transform    (<sig:S>)                     
    IDFT     Inverse DFT                   (<sig:S>)                     
    FFT      FFT (Real/Imag Form)          (<sig:S>)                     
    FFTP     FFT (Mag/Phase Form)          (<sig:S>)                     
    IFFT     Inverse FFT (Real/Imag Form)  (<sig:S>)                     
    IFFTP    Inverse FFT (Mag/Phase Form)  (<sig:S>)                     
    CONV     Convolves Two Signals         (<sig1:S>, <sig2:S>)          
                                                                         
                                                                         
 COMPLEX SUPPORT FUNCTIONS                                               
                                                                         
 DADiSP provides a means of accessing complex numbers and signals.       
 These functions operate on signals or complex numbers returning         
 an appropriate real/complex signal or number depending on the           
 function and arguments used.  The functions can take arguments          
 of any type which are internally interpreted as complex numbers.        
                                                                         
    REAL       Real Part                      (<anything>)               
    IMAGINARY  Imaginary Part                 (<anything>)               
    MAGNITUDE  Magnitude                      (<anything>)               
    ANGLE      Angle                          (<anything>)               
    CONJUGATE  Complex Conjugate              (<anything>)               
    POLAR      To (Mag/Phase) Representation  (<anything>)               
    CARTESIAN  To (Real/Imag) Representaion   (<anything>)               
                                                                         
                                                                         
 SIGNAL EDITING FUNCTIONS                                                
                                                                         
 These functions are "signal" editing functions.  They allow the         
 user to create new signals from old ones.  EXTRACT creates a new        
 signal from an old one by extracting a part of it.  If the new signal   
 contains points not in the argument signal, then EXTRACT pads           
 the argument with 0.0's.  REVERSE simply reverses the given signal.     
 CONCAT concatenates any number of signals together.  PROTECT            
 protects a signal from propogation; PROTECT takes a second argument     
 (a string) which is a new string to display instead of the formula      
 string.  CLEAR removes the signals from their windows (if no window     
 is given, the default is the current window) and CLEARALL removes       
 ALL signals from ALL windows.                                           
                                                                         
    EXTRACT  Extract Part Of Signal  (<sig:S>, <start:I>, <len:I>)       
    REVERSE  Reverse Signal          (<sig:S>)                           
    CONCAT   Concat Several Signals  (<sig1,..,sigN:Ss>)                 
    PROTECT  Give Signal New  Name   (<sig:S>, <string:">)               
    CLEAR    Delete Given Windows    (<win1,..,winN:Ws>)                 
    CLEARALL Clear ALL Windows       ()                                  
                                                                         
                                                                         
 SIGNAL INFORMATION FUNCTIONS                                            
                                                                         
 These functions return information about a signal.  All except GETPT    
 take only one argument, a signal.  GETPT takes an additional argument   
 which is the sample number desired.                                     
                                                                         
    GETPT    N'th Point Of Signal        (<sig:S*>, <n:I>)               
    DELTAX   Time Between Samples        (<sig:S*>)                      
    RATE     Signal Sampling Rate        (<sig:S*>)                      
    MAX      Maximum Value Of Signal     (<sig:S*>)                      
    MIN      Minimum value Of Signal     (<sig:S*>)                      
    SIGSIZE  Number Of Points In Signal  (<sig:S*>)                      
                                                                         
                                                                         
 CHARACTERISTIC SETTING FUNCTIONS                                        
                                                                         
 These functions set various characteristics of a signal or of           
 the worksheet environment.  SETVUNITS, SETHUNITS and SETDELTAX          
 operate on the current window.  SETDEGREE and SETRADIAN set the         
 input and output characteristics for the trigonometric functions.       
                                                                         
    SETVUNITS   Set Vertical Axis Units    (<unit:">)                    
    SETHUNITS   Set Horizontal Axis Units  (<unit:">)                    
    SETDELTAX   Set Time Between Samples   (<real>)                      
    SETDEGREE   Trig Functions In Degrees  ()                            
    SETRADIAN   Trig Functions In Radians  ()                            
                                                                         
                                                                         
 SIGNAL GENERATION FUNCTIONS                                             
                                                                         
 The DADiSP Worksheet enables the user to produce a variety of           
 waveforms through use of the functions beginning with the letter        
 "G".  An endless variety of waveforms can be synthesized through        
 combination of these functions.                                         
                                                                         
 With the exception of GLINE, each function requires two                 
 arguments:                                                              
                                                                         
      (1) Number of Points in the Generated Curve;                       
      (2) Delta-X (Inverse of the Sample Rate).                          
                                                                         
 After these two arguments, they also take two more optional arguments:  
                                                                         
      (1) Frequency Specification in Hertz,                              
      (2) Phase Shift.                                                   
                                                                         
 Unlike the other signal generation functions, GLINE (for generating     
 a line) takes two mandatory arguments, the slope and y-intercept.       
                                                                         
 The other exception to the above descriptions is GSIG.  GSIG takes a    
 list of real numbers which it turns into a signal.                      
                                                                         
 Following is a complete list of DADiSP's waveform generating functions. 
 The actual waveforms produced by these functions.  The arguments of     
 these functions are described above.                                    
                                                                         
    GSIN    Sine Wave          (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GCOS    Cosine Wave        (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GTAN    Tangent Curve      (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GSEC    Secant Curve       (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GCSC    Cosecant Curve     (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GCOT    Cotangent Curve    (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GASIN   Arcsine            (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GACOS   Arccosine          (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GATAN   Arctangent         (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GASEC   Arcsecant          (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GACSC   Arccosecant        (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GACOT   Arccotangent       (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GSINH   Hyperbolic Sin     (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GCOSH   Hyperbolic Cos     (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GTANH   Hyperbolic Tan     (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GSECH   Hyperbolic Sec     (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GCSCH   Hyperbolic Csc     (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GCOTH   Hyperbolic Cot     (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GASINH  Hyperbolic Arcsin  (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GACOSH  Hyperbolic Arccos  (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GATANH  Hyperbolic Arctan  (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GASECH  Hyperbolic Arcsec  (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GACSCH  Hyperbolic Arccsc  (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GACOTH  Hyperbolic Arccot  (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GEXP    Exponential (e)    (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GLOG    Natural Log (e)    (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GLN     Natural Log (e)    (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GLOG10  Common  Log (10)   (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GSQRT   Square Root        (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GSINC   Sinc (Sin(x) / x)  (<num:I>, <dx:R>, <f:R*>, <p:R*>)         
    GLINE   Line               (<num:I>, <dx:R>, <m:R>, <b:R>)           
    GSIG    Input Points       (<pt1,..,ptN>:Rs>                         
                                                                         
                                                                         
 PEAK ANALYSIS AND CURSOR MOVEMENT                                       
                                                                         
 DADiSP provides a number of functions for locating specific signal      
 characteristics.  These functions have the effect of moving the         
 cursor to the location on the current signal which fits the function    
 specification.                                                          
                                                                         
 The peak and valley finding functions take several optional arguments.  
 For instance, all of them accept a first argument which is the window   
 where the peak/valley finding is to be performed.  The second           
 argument is a threshold value, mandatory only for FPEAK and FVALL.      
 The third argument is an optional width for the peaks (number of points 
 above the threshold).  Note that these functions do not return any      
 values; instead, they move the cursor.                                  
                                                                         
 MOVE, PUT, NMOVE, and NPUT also take an optional window as their        
 first arguements.  In addition, MOVE and PUT require a real number (a   
 measurement in the units on the X-axis or time-axis) whereas NMOVE and  
 NPUT require an integer argument since they measure distances in terms  
 of sample numbers.                                                      
                                                                         
    FMIN     Minimum Value     (<sig:S*>)                                
    FMAX     Maximum Value     (<sig:S*>)                                
    FPEAK    First Peak        (<sig:S*>, <thresh:R>, <wid:I*>)          
    FVALL    First Valley      (<sig:S*>, <thresh:R>, <wid:I*>)          
    FPEAKN   Next Peak         (<sig:S*>, <thresh:R*>, <wid:I*>)         
    FVALLN   Next Valley       (<sig:S*>, <thresh:R*>, <wid:I*>)         
    FPEAKP   Find Prev Peak    (<sig:S*>, <thresh:R*>, <wid:I*>)         
    FVALLP   Find Prev Valley  (<sig:S*>, <thresh:R*>, <wid:I*>)         
    MOVE     Move Cursor       (<sig:S*>, <deltaxunits:R>)               
    NMOVE    Move Cursor       (<sig:S*>, <numpoints:I>)                 
    PUT      Put Cursor        (<sig:S*>, <deltaxunits:R>)               
    NPUT     Put Cursor        (<sig:S*>, <numpoints:I>)                 
                                                                         
                                                                         
 MISCELLANEOUS                                                           
                                                                         
 The following functions change the characteristics of the currently     
 active window.  The optional real numbers are factors measured in terms 
 of the current window.                                                  
                                                                         
    SCROLLL    Scroll Window Left            (<winfactor:R*>)            
    SCROLLR    Scroll Window Right           (<winfactor:R*>)            
    SCROLLU    Scroll Window Up              (<winfactor:R*>)            
    SCROLLD    Scroll Window Down            (<winfactor:R*>)            
    COMPRESSH  Compress Window Horizontally  (<winfactor:R*>)            
    COMPRESSV  Compress Window Vertically    (<winfactor:R*>)            
    EXPANDH    Expand Window Horizontally    (<winfactor:R*>)            
    EXPANDV    Expand Window Vertically      (<winfactor:R*>)            
    SCALESON   Turn Scales On                ()                          
    SCALESOFF  Turn Scales Off               ()                          
    GRIDSOL    Solid Grids                   ()                          
    GRIDDOT    Dotted Grids                  ()                          
    GRIDOFF    Grids Off                     ()                          
    LINES      Turn On Interpolation         ()                          
    POINTS     Turn Off Interpolation        ()                          
    CURSORON   Turn Cursor On                ()                          
    CURSOROFF  Turn Cursor Off               ()                          
    ZOOM       Zoom Window                   ()                          
    UNZOOM     Unzoom Window                 ()                          