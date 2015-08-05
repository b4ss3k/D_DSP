*************************************************
*    ASPI TMS32010 DIGITAL FILTER REALIZATION   *
*                                               *
* FILTER GENERATED FROM FILE ex12c.flt          *
*************************************************
*************************************************
*            LABEL DEFINITION AREA              *
*************************************************
*
FILIN   EQU       0
FILOUT  EQU       1
*
>
*************************************************
*                 15-TAP FIR FILTER             *
*************************************************
*************************************************
*  LOCATION 0 - BRANCH TO INITIALIZATION CODE   *
*************************************************
        AORG    0
        B       START
*************************************************
*          COEFFICIENT STORAGE AREA             *
*************************************************
        AORG       8
*
*  FIR COEFFICIENTS
*
        DATA     -5282
        DATA    -20263
        DATA     20263
        DATA      5282
************************************************
*          A/D CARD CONTROL PARAMETERS         *
************************************************
MASK    EQU        2
MODE    EQU        3           A/D-D/A CONTROL ADDR.
RATE    EQU        4           SAMPLING RATE ADDR.
************************************************
*        A/D CARD INITIALIZATION CODE          *
************************************************
START   B       GO
DMASK   DATA    >8000
DMODE   DATA    >A             A/D-D/A MODE
DRATE   DATA       512         SAMPLING RATE
GO      LACK    DMODE
        TBLR    MODE
        LACK    DMASK
        TBLR    MASK
        LACK    DRATE
        TBLR    RATE
        CALL    FILINT         INITIALIZE
        OUT     MODE,0         A/D SETUP
        OUT     RATE,1         SAMPLING RATE
************************************************
*                MAIN I/O LOOP                 *
************************************************
LPTS    BIOZ    GET            WAIT FOR CLOCK
        B       LPTS           BRANCH IF NO CLOCK
GET     OUT     FILOUT,2       OUTPUT LAST OUTPUT
        IN      FILIN,2        INPUT SAMPLE
        ZALS    FILIN          LOAD INPUT
        XOR     MASK           REVERSE SIGN BIT
        SACL    FILIN          SAVE IN INPUT
        CALL    FILTER         EXECUTE FILTER
        ZALS    FILOUT         GET OUTPUT
        XOR     MASK           REVERSE SIGN BIT
        SACL    FILOUT         SAVE RESULT
        B       LPTS           LOOP
*************************************************
*       FILTER INITIALIZATION SUBROUTINE        *
*************************************************
FILINT  LACK    1              GET A 1
        LDPK    0              SET PAGE POINTER
        SACL       9,0         TEMPORARY SAVE
        LT         9           LOAD 1 IN T
        MPYK    1              1 INTO P
        ROVM                   2S COMPLEMENT
        LARK    1,4            NUMBER OF POINTS
        LARK    0,5            POINTER TO DM
        LACK       8           POINTER TO DM
ILP     LARP    0              RESET AR TO 0
        TBLR    *+,1           TRANSFER DATA VALUE
        APAC                   INCREMENT POINTER
        BANZ    ILP            LOOP
        LARK    1,14           NUMBER OF POINTS
        LARK    0,9            POINTER TO DM
        ZAC                    CLEAR ACCUMULATOR
ILPA    LARP    0              RESET AR TO 0
        SACL    *+,0,1         CLEAR DATA VALUE
        BANZ    ILPA           LOOP
        RET                    INIT RETURN
*************************************************
*              FILTER SUBROUTINE                *
*************************************************
FILTER  ZALH    FILIN          GET INPUT
        SACH       9           SAVE IN Z-1
        ZAC                    INIT. ACC
        LT        23           LOAD T REGISTER
        MPYK       426         MULTIPLY
        LTD       22           LOAD T, ADD AND DELAY
        MPYK       -71         MULTIPLY
        LTD       21           LOAD T, ADD AND DELAY
        MPYK      1796         MULTIPLY
        LTD       20           LOAD T, ADD AND DELAY
        MPYK      -169         MULTIPLY
        LTD       19           LOAD T, ADD AND DELAY
        MPY        8           MULTIPLY
        LTD       18           LOAD T, ADD AND DELAY
        MPYK      -160         MULTIPLY
        LTD       17           LOAD T, ADD AND DELAY
        MPY        7           MULTIPLY
        LTD       16           LOAD T, ADD AND DELAY
        MPYK         0         MULTIPLY
        LTD       15           LOAD T, ADD AND DELAY
        MPY        6           MULTIPLY
        LTD       14           LOAD T, ADD AND DELAY
        MPYK       160         MULTIPLY
        LTD       13           LOAD T, ADD AND DELAY
        MPY        5           MULTIPLY
        LTD       12           LOAD T, ADD AND DELAY
        MPYK       169         MULTIPLY
        LTD       11           LOAD T, ADD AND DELAY
        MPYK     -1796         MULTIPLY
        LTD       10           LOAD T, ADD AND DELAY
        MPYK        71         MULTIPLY
        LTD        9           LOAD T, ADD AND DELAY
        MPYK      -426         MULTIPLY
        APAC                   FORM RESULT
        SACH    FILOUT,1       SCALE AND SAVE OUTPUT
        RET                    RETURN
        END
<
