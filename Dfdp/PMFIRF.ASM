	IDT	'PMFIR'		*Unique Identifier
*************************************************
*    ASPI TMS32020 DIGITAL FILTER REALIZATION   *
*************************************************
*           INTERNAL DELAY MEMORY
*          COEF. in PROGRAM MEMORY
*
* NOTE: This realization uses internal memory
*       BANK 0 for program memory.  This allows
*       for very fast execution of the filter
*       by storing the coefficients in BANK 0.
*       However, BANK 0 can not be accessed
*       as data in this mode.  Also, the delay
*       memory must reside in BANK 1 or BANK 2
*
*                PARK-MCCLELLAN
*               101-TAP FIR FILTER
*
*           FILTER GENERATED FROM FILE
*                   PMFIR.FLT
*           Thu Jun 18 08:45:03 1987
*
*   Filter type: LOWPASS
* Sampling freq: 10000 HZ
*
*************************************************
	PSEG
	B       START				   
	BSS	30
************************************************
*         ASPI CARD INITIALIZATION CODE        *
************************************************
START
	ROVM			*2S COMPLEMENT
	SSXM			*SIGN EXTEND MODE
	LDPK	IOPAGE		*SET PAGE POINTER
	SPM	1		*P output is shifted left 1 bit
	CALL	INIT		*INITIALIZE
*
************************************************
*                MAIN I/O LOOP                 *
************************************************
DOUT	EQU	6		*D/A OUTPUT
DIN	EQU	6		*A/D INPUT
*
* The following three instructions are used in conjunction
* with the PATCH program to indicate an idle state where no
* machine cycles are being used to perform filter operations
* (i.e. The time that location 4 is 1 could be used to do
* other useful things).  PATCH monitors location 4 to determine
* percentage utilization of the processor by the filter.
*
LPTS	LACK	1
	SACL	FILTT
	OUT	FILTT,4		*SIGNAL IDLE STATE
*
LPTSA	BIOZ	GET		*WAIT FOR CLOCK
	B	LPTSA		*BRANCH IF NO CLOCK
*
GET	OUT	VSAMPL,DOUT	*OUTPUT LAST OUTPUT
	IN	VSAMPL,DIN	*INPUT SAMPLE
*
* The following three instructions are used in conjunction
* with the PATCH program to indicate either a busy state or
* that the filter is in operation.
*
	LACK	0		*GET CONSTANT FOR IDLE
	SACL	FILTT		*SAVE FOR OUTPUT
	OUT	FILTT,4		*SIGNAL BUSY STATE
*
* The following three instructions are used to determine whether
* or not the filter should be active.  In the non-active state the
* input data is simply passed to the output.  In the active state
* the input data is filtered, then passed to the output.
*
	IN	FILTT,5		*CHECK FOR ACTIVE STATE
	LAC	FILTT
	BNZ	LPTS		*NOT ACTIVE, PASS DATA THROUGH
*
	CALL	FILTER		*ACTIVE EXECUTE FILTER
	B	LPTS		*LOOP
*************************************************
*           DATA MEMORY DEFINITION              *
*************************************************
*     CONTAINS:
*          STORAGE FOR FILTER INPUT AND OUTPUT
*          STORAGE FOR COEFFICIENTS
*          STORAGE FOR DELAY ELEMENTS
*************************************************
*
* FILTER INPUT and OUTPUT STORAGE
*
FILTT	EQU	96		*TEMPORARY FILTER DATA
VSAMPL	EQU	97		*INPUT/OUTPUT FILTER DATA
IOPAGE	EQU	0
*
COEF
*
*  FIR COEFFICIENTS
*
	DATA	-327		*C100
	DATA	535		*C099
	DATA	405		*C098
	DATA	302		*C097
	DATA	137		*C096
	DATA	-81		*C095
	DATA	-276		*C094
	DATA	-357		*C093
	DATA	-267		*C092
	DATA	-27		*C091
	DATA	265		*C090
	DATA	471		*C089
	DATA	473		*C088
	DATA	240		*C087
	DATA	-148		*C086
	DATA	-518		*C085
	DATA	-685		*C084
	DATA	-536		*C083
	DATA	-100		*C082
	DATA	447		*C081
	DATA	848		*C080
	DATA	886		*C079
	DATA	491		*C078
	DATA	-202		*C077
	DATA	-889		*C076
	DATA	-1234		*C075
	DATA	-1016		*C074
	DATA	-265		*C073
	DATA	723		*C072
	DATA	1496		*C071
	DATA	1640		*C070
	DATA	993		*C069
	DATA	-247		*C068
	DATA	-1559		*C067
	DATA	-2306		*C066
	DATA	-2025		*C065
	DATA	-677		*C064
	DATA	1261		*C063
	DATA	2940		*C062
	DATA	3472		*C061
	DATA	2341		*C060
	DATA	-277		*C059
	DATA	-3463		*C058
	DATA	-5780		*C057
	DATA	-5774		*C056
	DATA	-2551		*C055
	DATA	3809		*C054
	DATA	12135		*C053
	DATA	20453		*C052
	DATA	26584		*C051
	DATA	28838		*C050
	DATA	26584		*C049
	DATA	20453		*C048
	DATA	12135		*C047
	DATA	3809		*C046
	DATA	-2551		*C045
	DATA	-5774		*C044
	DATA	-5780		*C043
	DATA	-3463		*C042
	DATA	-277		*C041
	DATA	2341		*C040
	DATA	3472		*C039
	DATA	2940		*C038
	DATA	1261		*C037
	DATA	-677		*C036
	DATA	-2025		*C035
	DATA	-2306		*C034
	DATA	-1559		*C033
	DATA	-247		*C032
	DATA	993		*C031
	DATA	1640		*C030
	DATA	1496		*C029
	DATA	723		*C028
	DATA	-265		*C027
	DATA	-1016		*C026
	DATA	-1234		*C025
	DATA	-889		*C024
	DATA	-202		*C023
	DATA	491		*C022
	DATA	886		*C021
	DATA	848		*C020
	DATA	447		*C019
	DATA	-100		*C018
	DATA	-536		*C017
	DATA	-685		*C016
	DATA	-518		*C015
	DATA	-148		*C014
	DATA	240		*C013
	DATA	473		*C012
	DATA	471		*C011
	DATA	265		*C010
	DATA	-27		*C009
	DATA	-267		*C008
	DATA	-357		*C007
	DATA	-276		*C006
	DATA	-81		*C005
	DATA	137		*C004
	DATA	302		*C003
	DATA	405		*C002
	DATA	535		*C001
	DATA	-327		*C000
*
	PEND
*
	CSEG	'DPMFIR'
*
* DELAY STORAGE
*
Z000	BSS	1
	BSS	100-1
ZLAST	BSS	1
	BSS	1		*Extra storage: MACD destroys this
*				                Location.
	CEND
*
* COEFFICIENT DATA STORAGE
*
	CSEG	'CPMFIR'
*
FDATA	BSS	100+1
*
	CEND
*
	PSEG
*************************************************
*       FILTER INITIALIZATION SUBROUTINE        *
*************************************************
INIT
	LARP	0
	CNFD
	LRLK	0,FDATA		*POINTER TO COEF. MEMORY
	RPTK	100
	BLKP	COEF,*+		*MOVE COEF.
	CNFP
	LRLK	0,Z000		*POINTER TO DELAY MEMORY
	ZAC			*CLEAR ACCUMULATOR
	RPTK	100
	SACL	*+		*CLEAR DELAY MEMORY
	RET	
*************************************************
*              FILTER SUBROUTINE                *
*************************************************
* ASSUMPTIONS:
*     BANK 0 is set to PROGRAM MEMORY.
*     COEFFICIENTS are located at 'FDATA'.
*     DELAY elements are located at 'DELAY'.
* NOTE: COEF's must be in BANK 0 and DELAY's
*       must be in BANK 1 or BANK 2.
*     'DELAR' AR is destroyed by filter routine.
*     P output shift is set to 1.
*     SIGN EXTEND mode is ON.
*     Two's Complement Arithmetic.
*
*************************************************
DELAR	EQU	1		*DELAY AR REGISTER
*
FILTER
	LARP	DELAR		*POINT TO THE DELAY INDEX REGISTER
	LRLK	DELAR,Z000	*INDEX POINTS TO Z-0 (INPUT)
	LAC	VSAMPL,14	*GET & SCALE INPUT
	SACH	*		*SAVE SCALED INPUT

	MPYK	0		*P = 0
	ZAC			*AC = 0
	LRLK	DELAR,ZLAST	*INDEX POINTS TO Z-N
	RPTK	100
	MACD	FDATA+>FD00,*-	*MULTIPLY, ACCUM. and  DELAY
	APAC			*FORM RESULT
	SACH    VSAMPL,0	*SAVE OUTPUT
	RET			*RETURN
*
	PEND
	END
