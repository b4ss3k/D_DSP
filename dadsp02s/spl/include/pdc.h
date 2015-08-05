/****************************************************************************
*                                                                           *
*   PDC.H       Copyright 1993-2002 DSP Development Corporation             *
*                                                                           *
*   Author:     Steve Clark                                                 *
*                                                                           *
*   Synopsis:   Pull Down Commands, GUI independent                         *
*                                                                           *
*   Revisions:  23 Dec 1993     SNC     Creation                            *
*                8 Aug 2002     RRR     Adaption, additions and comments    *
*                                                                           *
****************************************************************************/

/*

   PDC stands for "Pull Down Command" These macro constants can be used to 
   "drive" the menu system programatically with the PDC command. For example,
   to load a series:

         pdc(pdc_serload)

   opens the series dialog box just as if the user clicked the
   File-Open-Series pull down menu tree. This is also equivalent to

          pdc(2033)

   since PDC_SERLOAD is defined as (2000+33).

   Load these constants with the SPLLOAD command:

          splload("pdc.h")

  or the constants can be included in an SPL file with:

          #include <pdc.h>

  Not all pull down commands are available. The PDC name and comment
  provide a brief description of each command.

*/



#define PDC_BASE        (2000)  /* enumerate from here */

#define PDC_BOOKOPEN    (PDC_BASE + 1)    /* open labbook */
#define PDC_BOOKCREATE  (PDC_BASE + 2)    /* create labbook */
#define PDC_BOOKCOPY    (PDC_BASE + 3)    /* copy labbook */
#define PDC_BOOKDELETE  (PDC_BASE + 4)    /* delete labbook */

#define PDC_DIRCHANGE   (PDC_BASE + 5)    /* change directory */

#define PDC_APPEXIT       (PDC_BASE + 6)  /* quit */
#define PDC_APPPRINTSETUP (PDC_BASE + 7)  /* printer setup */
#define PDC_APPTILE       (PDC_BASE + 8)  /* tile windows */
#define PDC_APPARRANGE    (PDC_BASE + 9)  /* arrange windows */
#define PDC_APPPICKFONT   (PDC_BASE + 10) /* font configuration */
#define PDC_APPEDITOR     (PDC_BASE + 11) /* activate lined editor */
#define PDC_APPAUTOMENU   (PDC_BASE + 12) /* "/" key menus */
#define PDC_APPDISPLAY    (PDC_BASE + 13) /* display range of windows */
#define PDC_APPDISPLAYALL (PDC_BASE + 14) /* display all windows */

#define PDC_WKSLOAD     (PDC_BASE + 15)   /* load worksheet */
#define PDC_WKSSAVE     (PDC_BASE + 16)   /* save worksheet */
#define PDC_WKSSAVEAS   (PDC_BASE + 17)   /* save worksheet as */
#define PDC_WKSADD      (PDC_BASE + 18)   /* add windows */
#define PDC_WKSREMOVE   (PDC_BASE + 19)   /* remove windows */
#define PDC_WKSDELETE   (PDC_BASE + 20)   /* delete worksheet */
#define PDC_WKSCOPY     (PDC_BASE + 21)   /* copy worksheet */
#define PDC_WKSPRINT    (PDC_BASE + 22)   /* print worksheet */
#define PDC_WKSCLEAR    (PDC_BASE + 23)   /* clear worksheet */
#define PDC_WKSNEW      (PDC_BASE + 24)   /* new worksheet */
#define PDC_WKSREFRESH  (PDC_BASE + 25)   /* refresh window formulae */

#define PDC_DSCOPY      (PDC_BASE + 26)   /* copy dataset */
#define PDC_DSDELETE    (PDC_BASE + 27)   /* delete dataset */
#define PDC_DSABOUT     (PDC_BASE + 28)   /* about dataset */

#define PDC_SERCOPY     (PDC_BASE + 29)   /* copy series */
#define PDC_SERDELETE   (PDC_BASE + 30)   /* delete series */
#define PDC_SERIMPORT   (PDC_BASE + 31)   /* import series */
#define PDC_SEREXPORT   (PDC_BASE + 32)   /* export series */
#define PDC_SERLOAD     (PDC_BASE + 33)   /* load series */
#define PDC_SERSAVE     (PDC_BASE + 34)   /* save series */
#define PDC_SERABOUT    (PDC_BASE + 35)   /* about series */

#define PDC_WINPRINT    (PDC_BASE + 36)   /* print window */
#define PDC_WINCLEAR    (PDC_BASE + 37)   /* clear window */
#define PDC_WINZOOM     (PDC_BASE + 38)   /* zoom window */
#define PDC_WINTEXTCUR  (PDC_BASE + 39)   /* text cursor */
#define PDC_WINLINECUR  (PDC_BASE + 40)   /* line cursor */
#define PDC_WINHIDE     (PDC_BASE + 41)   /* hide window */
#define PDC_WINMAGNIFY  (PDC_BASE + 42)   /* magnify window */
#define PDC_WINTEXTDEL  (PDC_BASE + 43)   /* delete text */
#define PDC_WINTEXTMOVE (PDC_BASE + 44)   /* move text */
#define PDC_WINTEXTEDIT (PDC_BASE + 45)   /* edit text */
#define PDC_WINLINEDEL  (PDC_BASE + 46)   /* delete line */
#define PDC_WINLINEMOVE (PDC_BASE + 47)   /* move line */
#define PDC_WINLINECOPY (PDC_BASE + 48)   /* copy line */
#define PDC_WINRETRACEADD (PDC_BASE + 49) /* NA */
#define PDC_WINRETRACEDEL (PDC_BASE + 50) /* reserved */
#define PDC_WINLABEL    (PDC_BASE + 51)   /* label window */

#define PDC_WKSPS       (PDC_BASE + 52)   /* postscript worksheet */
#define PDC_WINPS       (PDC_BASE + 53)   /* postscript window */

#define PDC_DATAGO      (PDC_BASE + 54)   /* NA */
#define PDC_DATASTOP    (PDC_BASE + 55)   /* NA */
#define PDC_DATART      (PDC_BASE + 56)   /* NA */
#define PDC_DATAHIST    (PDC_BASE + 57)   /* NA */
#define PDC_DATAIMPORT  (PDC_BASE + 58)   /* NA */
#define PDC_DATAEXPORT  (PDC_BASE + 59)   /* NA */
#define PDC_DATASETTING (PDC_BASE + 60)   /* NA */

#define PDC_STUDIESMATH (PDC_BASE + 61)   /* NA */
#define PDC_STUDIESANAL (PDC_BASE + 62)   /* NA */
#define PDC_STUDIESOPTS (PDC_BASE + 63)   /* NA */
#define PDC_STUDIESTECH (PDC_BASE + 64)   /* NA */
#define PDC_STUDIESADD  (PDC_BASE + 65)   /* NA */

#define PDC_MACROSNEW   (PDC_BASE + 66)   /* new macro */
#define PDC_MACROSEDIT  (PAD_BASE + 67)   /* edit macro */
#define PDC_MACROSALL   (PDC_BASE + 68)   /* display all macros */
#define PDC_MACROSREAD  (PDC_BASE + 69)   /* read macro file */
#define PDC_MACROSOPEN  (PDC_BASE + 70)   /* open macro file in editor */

#define PDC_VIEWSTYLE   (PDC_BASE + 71)   /* series style menu */
#define PDC_VIEWGRID    (PDC_BASE + 72)   /* grid style menu */
#define PDC_VIEWCOLOR   (PDC_BASE + 73)   /* color menu */
#define PDC_VIEWRANGE   (PDC_BASE + 74)   /* plot range menu */
#define PDC_VERTCURSOR  (PDC_BASE + 75)   /* vertical cursor menu */
#define PDC_CROSSCURSOR (PDC_BASE + 76)   /* crosshair cursor menu */
#define PDC_LEGEND      (PDC_BASE + 77)   /* legend menu */

#define PDC_VIEWFILE    (PDC_BASE + 78)   /* view a text file */
#define PDC_WINFILE     (PDC_BASE + 79)   /* copy file into window */

#define PDC_UNWIND      (PDC_BASE + 80)   /* unwind process state */
#define PDC_GETFONTPROP (PDC_BASE + 81)   /* show fonts */
#define PDC_CONFDFLTS   (PDC_BASE + 82)   /* restore configuration defaults */

#define PDC_TESTFUNC    (PDC_BASE + 83)   /* NA */

#define PDC_SPLNEW      (PDC_BASE + 84)   /* new spl function */
#define PDC_SPLEDIT     (PDC_BASE + 85)   /* edit spl function */
#define PDC_SPLALL      (PDC_BASE + 86)   /* show all spl functions */
#define PDC_SPLREAD     (PDC_BASE + 87)   /* read spl file */
#define PDC_SPLOPEN     (PDC_BASE + 88)   /* open spl file in editor */

#define PDC_PASTELINK   (PDC_BASE + 89)   /* paste clipboard link */
#define PDC_COPYWKSBMP  (PDC_BASE + 90)   /* worksheet bitmap to clipboard */

#define PDC_WINPRINTALL   (PDC_BASE + 91) /* print all windows */
#define PDC_WINPREVIEW    (PDC_BASE + 92) /* preview window */
#define PDC_WKSPREVIEW    (PDC_BASE + 93) /* preview worksheet */
#define PDC_WINPREVIEWALL (PDC_BASE + 94) /* preview all windows */
#define PDC_SHOWBUILTINS  (PDC_BASE + 95) /* show built-in function list */

#define PDC_MACROSLIST  (PDC_BASE + 96)   /* show macro list */
#define PDC_SPLLIST     (PDC_BASE + 97)   /* show spl list */

#define PDC_TUTORIAL    (PDC_BASE + 98)   /* run tutorial */
#define PDC_AUTHORIZE   (PDC_BASE + 99)   /* authorize license */

#define PDC_ESCAPE      (PDC_BASE + 100)  /* ESC key */
#define PDC_APPQUIT     (PDC_BASE + 101)  /* quit */
#define PDC_MOVETO      (PDC_BASE + 102)  /* move to window */
#define PDC_AUTOSCALE   (PDC_BASE + 103)  /* autoscale window */
#define PDC_WINEDIT     (PDC_BASE + 104)  /* tabular edit window */

#define PDC_WINTEXTSET  (PDC_BASE + 105)  /* text settings */
#define PDC_WINLINESET  (PDC_BASE + 106)  /* lines settings */

#define PDC_WKSPREVIEWBT (PDC_BASE + 107) /* preview worksheet button */
#define PDC_WKSPRINTBT   (PDC_BASE + 108) /* print worksheet button */

#define PDC_DATACLEAR    (PDC_BASE + 109) /* clear window */

#define PDC_WINARROWCUR  (PDC_BASE + 110) /* draw arrow */
#define PDC_WINLEGSET    (PDC_BASE + 111) /* legend settings */
#define PDC_PSWDREQUEST  (PDC_BASE + 112) /* password request form */

#define PDC_APPHTILE     (PDC_BASE + 113) /* tile windows horizontally */
#define PDC_APPVTILE     (PDC_BASE + 114) /* tile windows vertically */
#define PDC_APPETILE     (PDC_BASE + 115) /* tile windows automatically */

#define PDC_WKSEXPORT    (PDC_BASE + 116) /* save DWK file */
#define PDC_WKSIMPORT    (PDC_BASE + 117) /* read DWK file */

#define PDC_PROPTEXTMOVE (PDC_BASE + 118) /* move text property menu */
#define PDC_PROPTEXTEDIT (PDC_BASE + 119) /* edit text property menu */
#define PDC_PROPTEXTDEL  (PDC_BASE + 120) /* delete text property menu */

#define PDC_PROPLINEMOVE (PDC_BASE + 121) /* move line property menu */
#define PDC_PROPLINECOPY (PDC_BASE + 122) /* copy line property menu */
#define PDC_PROPLINEDEL  (PDC_BASE + 123) /* delete line property menu */


#define PDC_DWKREMADD    (PDC_BASE + 124) /* add/remove files from DWK file */

#define PDC_MRU_FIRST    (PDC_BASE + 125) /* most recently used file list */
#define MAX_MRU          (10)             /* maximum mru entries */
#define PDC_MRU_LAST     (PDC_MRU_FIRST + MAX_MRU) /* NA */

#define PDC_NEXTKEY      (PDC_MRU_LAST + 1) /* NA */
#define PDC_PREVKEY      (PDC_NEXTKEY + 1)  /* NA */
#define PDC_SENDWORK     (PDC_PREVKEY + 1)  /* email DWK file */

#define PDC_RESETMACROS  (PDC_SENDWORK + 1)    /* reset to system macros */
#define PDC_RESETSPL     (PDC_RESETMACROS + 1) /* reset to system SPLs */


/* right click most recently used dialogs */
#define PDC_PANEL_FIRST    (PDC_RESETSPL + 1)
#define PDC_PANEL_LAST     (PDC_PANEL_FIRST + MAX_MRU) /* last dialog */

#define PDC_LAST           (PDC_PANEL_LAST + 1)

