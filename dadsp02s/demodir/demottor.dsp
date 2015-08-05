@pause(1)

@pop("pop1",-1,1,
"                   Now YOU can experiment with DADiSP interactively.

  Use the pulldown menus or the / button to access DADiSP menus and functions.
")
@pause(4) @unpop("pop1")
@pop("pop2",-1,5,
"
   If you have questions, or if you would like to place an order   

   for DADiSP/2002 and/or one of DADiSP's modules please call...    
")
@pause(2)
@pop("pop3",-1,12,
"  DSP Development Corporation  ")
@pause(1)
@pop("pop4",-1,15,
"          at (800)-424-3131          ")
@pause(1)
@pop("pop5",-1,18,
"           HAVE FUN!!!           ")
@highlight_message("DSP Development Corp TEL:(617) 969-0185 FAX:(617) 969-0446")
@pause(2) 
@unpop("pop5") @unpop("pop4") @unpop("pop3") @unpop("pop2")
@RETURN
