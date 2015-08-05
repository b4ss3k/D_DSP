@pause(2)

@pop("pop1",-1,-1,
"
  In this example, we replaced the outlier values with a linear

  interpolation of the previous and next non-outlier values.
")
@pause(6) @unpop("pop1")

@pop("pop1",-1,-1,
"
  We could just as easily have replaced the outliers with   

  different values...say, for example, NA or 'null' values.
")
@pause(6) @unpop("pop1")

@pop("pop1",-1,-1,
"
  NA (Not Available) values are important factors in many data 

  analysis tasks.  They are used as place holders in data series 

  and tables to mark missing or bad observations.
")

@pause(8)  @unpop("pop1")

@pop("pop1",-1,-1,
"
  Watch, as we replace the outliers in the

  original data set with NAVALUE.
")

@pause(6) @unpop("pop1")

! replace is an spl, remove macro definition
undefmacro("replace") @cr

REPLACE(W1,W2,NAVALUE) ; SETWLIKE(W1,1) ; LINES @CR
@CR @F10 @PAUSE(8)

@pop("pop1",-1,0,
"
  There are now noticeable gaps in the data series where

  the NA values have replaced the outliers.  This illustrates

  the 'place holding' properties of NA values.
")

@pause(10) @unpop("pop1") @pause(3)

@pop("pop1",-1,0,
"
  Now we can overplot this result onto the previous graph

  in order to further illustrate the replacement which occurred.
")

@pause(6) @unpop("pop1")

@F10 @ESC @CNTL_HOME 
OVERPLOT(W4,LGREEN) @CR @CR @F10

@pause(10)

@pop("pop1",-1,0,
"  Three important observations can be made here...")

@pause(3)

@pop("pop2",-1,3,
"  [1] The blue series shows us the original raw data

      which contained the unwanted outlier data points.")

@pause(6)
@unpop("pop2")

@pop("pop3",-1,3,
"  [2] The series in red shows us where the outlier values

      were replaced with linearly interpolated values of

      the previous and next non-outlier values.")

@pause(8)
@unpop("pop3")

@pop("pop4",-1,3,
"  [3] Everywhere that the series in red shows through the series

      in green, we can see the gaps left by the NA values holding

      their place in the data series.")

@pause(8)

@unpop("pop4") @unpop("pop1")

@F10 @ESC @RT REMOVEWIN(3) @CR @pause(3)

@pause(6)
dmf("AppTopic.men") @CR
