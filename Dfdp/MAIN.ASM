	IDT	'MAIN'
	REF	FIIR,FPMFIR,FKFIR
	REF	IIIR,IPMFIR,IKFIR
	DEF	FILTT,VIIR,VPMFIR,VKFIR
*
* Define the locations in the direct page
*
IOPAGE	EQU	0	* Use direct page 0
*
* Direct page zero starts at location 96
*
SAMPL	EQU	96
VIIR	EQU	96
VPMFIR	EQU	96
VKFIR	EQU	96
FILTT	EQU	97
SWTCH	EQU	98
SUBR	EQU	99
JTAB	EQU	100
*			*Make sure that 6 locations are
*			* saved for the JTAB table
NXTAD	EQU	106
*
DOUT	EQU	6		*D/A OUTPUT
DIN	EQU	6		*A/D INPUT
*
*************************************************
*                                               *
*                    EXAMPLE                    *
*                Low Pass Filter                *
*                                               *
*   This example provides three different       *
*   implementations of the the same filter      *
*   specification:  IIR, Parks McClellan FIR    *
*   and Kaiser Window FIR.  If an ASPI ADP      *
*   containing the TMS32020 is present this     *
*   program can be demonstrated on it using the *
*   PATCH program to select the desired         *
*   implementation.  After using TI_LOAD to     *
*   download the program you simply type:       *
*      PATCH MAIN.PCH                           *
*   You then can select the desired implementa- *
*   tion.                                       *
*                                               *
*************************************************
	PSEG
	B	START
	BSS	>30
START
************************************************
*                MAIN I/O LOOP                 *
************************************************
*
*INITIALIZE THE TMS32020
*
	LDPK	IOPAGE		*Set up the I/O direct page
	SPM	1		*Product Output shift = 1 bit
	SSXM			*Set Sign Extend Mode ON
	SOVM			*Set Overflow Arith. ON

	LACK	1		*SET CURRENT SWITCH SETTING
	SACL	SWTCH		*FOR FILTER SELECTION to 1
	LRLK	0,>0FF0
	LARP	0
	ZAC
	SACL	*		*SET FF0 to 0 (select IIR by default)
*				*Because SWTCH is 1, the first time
*				* thru the IIR initialization routine
*				* will be run.
*
	LRLK	0,JTAB		*SETUP JUMP TABLE
	LALK	FIIR
	SACL	SUBR
	SACL	*+		*IIR IMPLEMENTATION
	LALK	FPMFIR
	SACL	*+		*Parks McClellan FIR
	LALK	FKFIR
	SACL	*+		*Kaiser FIR
	LALK	IIIR
	SACL	*+		*INIT ROUTINES
	LALK	IPMFIR
	SACL	*+
	LALK	IKFIR
	SACL	*+
*
*Start Main I/O Loop
*
LPTS	LACK	1		*GET CONSTANT FOR IDLE
	SACL	FILTT		*SAVE FOR OUTPUT
	OUT	FILTT,4		*SIGNAL IDLE STATE
*
* Wait for sample clock.
LPTSA	BIOZ	GET		*WAIT FOR CLOCK
	B	LPTSA		*BRANCH IF NO CLOCK
*
* Output last sample and get new one.
GET	OUT	SAMPL,DOUT	*OUTPUT LAST OUTPUT
	IN	SAMPL,DIN	*INPUT SAMPLE
*
	LACK	0		*GET CONSTANT FOR IDLE
	SACL	FILTT
	OUT	FILTT,4		*SIGNAL BUSY STATE
	IN	FILTT,5		*CHECK FOR FILTER ACTIVE
*
	LAC	FILTT
	BNZ	LPTS		*FILTER NOT ACTIVE
*
	LRLK	0,>0FF0
	LARP	0
	LAC	*
	SUB	SWTCH		*HAS THE FILTER SELECT STATE CHANGED
	BZ	NOCHG		*BRANCH IF NO CHANGE
*
	LAC	*
	SACL	SWTCH		*UPDATE SELECTION STATE
*
	BZ	IIRSEL
	ROVM			*RESET OVERFLOW MODE FOR FIR FITLERS
	B	SETUP
IIRSEL
	SOVM			*SET OVERFLOW MODE FOR IIR FILTER
SETUP
	LALK	JTAB		*SET UP FILTER CALL ADDRESS &
	ADD	SWTCH		*INITIALIZE FILTER
	SACL	FILTT
	LAR	0,FILTT
	LARP	0
	LAC	*+
	SACL	SUBR		*Store Filter Subroutine Address
	MAR	*+
	MAR	*+
	LAC	*		*INIT routine address computed
	CALA			*CALL INIT ROUTINE
	B	LPTS
*
NOCHG
	LAC	SUBR
	CALA			*EXECUTE FILTER
	B	LPTS		*LOOP
*
	PEND
	END
