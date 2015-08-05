*************************************************
*    ASPI TMS32010 DIGITAL FILTER REALIZATION   *
*                                               *
* FILTER GENERATED FROM FILE ex13.flt           *
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
*            2-STAGE RECURSIVE FILTER           *
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
*  SECOND-ORDER SECTION #  1
*
        DATA     29344
        DATA    -32538
        DATA     17806
        DATA    -30981
        DATA     17806
*
*  SECOND-ORDER SECTION #  2
*
        DATA     29510
        DATA    -32544
        DATA     10223
        DATA    -18918
        DATA     10223
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
        SACL      15,0         TEMPORARY SAVE
        LT        15           LOAD 1 IN T
        MPYK    1              1 INTO P
        SOVM                   SATURATION ARITHMETIC
        LARK    1,10           NUMBER OF POINTS
        LARK    0,5            POINTER TO DM
        LACK       8           POINTER TO DM
ILP     LARP    0              RESET AR TO 0
        TBLR    *+,1           TRANSFER DATA VALUE
        APAC                   INCREMENT POINTER
        BANZ    ILP            LOOP
        LARK    1,3            NUMBER OF POINTS
        LARK    0,15           POINTER TO DM
        ZAC                    CLEAR ACCUMULATOR
ILPA    LARP    0              RESET AR TO 0
        SACL    *+,0,1         CLEAR DATA VALUE
        BANZ    ILPA           LOOP
        RET                    INIT RETURN
*************************************************
*              FILTER SUBROUTINE                *
*************************************************
*
* SECOND-ORDER FILTER SECTION #  1
*
FILTER  LAC     FILIN,14       GET & SCALE INOUT
        SACH    FILIN          SAVE SCALED INPUT
        LT      FILIN          GET SCALE INPUT
        MPY        7           B0 MULTIPLY
        ZALH      15           GET Z-1
        APAC                   FORM OUTPUT
        ADDH      15           MULTIPLY BY 2
        APAC                   FORM OUTPUT
        SACH    FILOUT         SAVE OUTPUT
        MPY        8           B1 MULTIPLY
        ZALH      16           GET Z-2
        LTA     FILOUT         GET CURRENT OUTPUT
        MPY        5           A1 MULTIPLY
        LTA     FILOUT         GET CURRENT OUTPUT
        APAC                   EXTRA LOOP ADD
        SACH      15           SAVE Z-1
        MPY        6           A2 MULTIPLY
        ZAC                    INIT. ACC
        LTA     FILIN          GET SCALED INPUT
        MPY        9           B2 MULTIPLY
        APAC                   FORM RESULT
        SACH      16           SAVE Z-2
*
* SECOND-ORDER FILTER SECTION #  2
*
        LAC     FILOUT,14      GET & SCALE PRE. OUT.
        SACH    FILIN          SAVE SCALED INPUT
        LT      FILIN          GET SCALE INPUT
        MPY       12           B0 MULTIPLY
        ZALH      17           GET Z-1
        APAC                   FORM OUTPUT
        ADDH      17           MULTIPLY BY 2
        APAC                   FORM OUTPUT
        SACH    FILOUT         SAVE OUTPUT
        MPY       13           B1 MULTIPLY
        ZALH      18           GET Z-2
        LTA     FILOUT         GET CURRENT OUTPUT
        MPY       10           A1 MULTIPLY
        LTA     FILOUT         GET CURRENT OUTPUT
        APAC                   EXTRA LOOP ADD
        SACH      17           SAVE Z-1
        MPY       11           A2 MULTIPLY
        ZAC                    INIT. ACC
        LTA     FILIN          GET SCALED INPUT
        MPY       14           B2 MULTIPLY
        APAC                   FORM RESULT
        SACH      18           SAVE Z-2
        RET                    RETURN
        END
<
