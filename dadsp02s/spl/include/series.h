/*****************************************************************************
*                                                                            *
*   SERIES.H     Copyright (C) 1997-2002 DSP Development Corporation         *
*                               All Rights Reserved                          *
*                                                                            *
*   Author:      Randy Race                                                  *
*                                                                            *
*   Synopsis:    Data type and misc macros                                   *
*                                                                            *
*   Revisions:    7 Jun 1997  RRR  Creation                                  *
*                29 Dec 1998  RRR  Item types and extended styles            *
*                                                                            *
*****************************************************************************/

/* type of variables */
#define UNSPECIFIED_VARIABLE 0  /* temporary unspecified type */
#define GLOBAL_VARIABLE      1  /* global */
#define LOCAL_VARIABLE       2  /* local to a user defined function */
#define USER_FUNCTION        3  /* user defined function */
#define HOT_VARIABLE         4  /* global wired into the dependency graph */
#define FORMAL_VARIABLE      5  /* formal parameter to user defined function */


/* argument and variable value types */
#define INTEGER_VALUE        1
#define REAL_VALUE           2
#define COMPLEX_VALUE        3
#define STRING_VALUE         4
#define SERIES_VALUE         5
#define WINDOW_VALUE         6


/* variable type tests */
#define IS_INTEGER(v)     (argtype(v)==INTEGER_VALUE)
#define IS_REAL(v)        (argtype(v)==REAL_VALUE)
#define IS_COMPLEX(v)     (argtype(v)==COMPLEX_VALUE)
#define IS_STRING(v)      (argtype(v)==STRING_VALUE)
#define IS_SERIES(v)      (argtype(v)==SERIES_VALUE)
#define IS_WINDOW(v)      (argtype(v)==WINDOW_VALUE)

#define IS_NUMERIC(v)  (IS_INTEGER(v)||IS_REAL(v)||IS_COMPLEX(v))
#define IS_ARRAY(v)    (IS_SERIES(v)||IS_WINDOW(v))
#define IS_SCALAR(v)   (IS_NUMERIC(v))

/* extended plot styles */
#define EX_BAR_STYLE       (0x01)
#define EX_BAR_TOPCLR      (0x02)
#define EX_WIN_NOSCALE     (0x04)
#define EX_BAR_CENTER      (0x08)
#define EX_STEP_CENTER     (0x10)
#define EX_BAR_GAP         (0x20)
#define EX_BAR_NOBORDER    (0x40)


/* series item types */
#define ITEM_TYPE_SERIES    (0)
#define ITEM_TYPE_XY        (1)
#define ITEM_TYPE_LIST      (2)
#define ITEM_TYPE_ERRORBAR  (3)
#define ITEM_TYPE_EQUIVOL   (5)
#define ITEM_TYPE_YSYMPLOT  (6)
#define ITEM_TYPE_XYSYMPLOT (7)
#define ITEM_TYPE_XYZ       (8)

#define ISERRORBAR(series)   (itemtype(series) == ITEM_TYPE_ERRORBAR)
#define ISEQUIVOL(series)    (itemtype(series) == ITEM_TYPE_EQUIVOL)
#define ISLIST(series)       (itemtype(series) == ITEM_TYPE_LIST)
#define ISYSYMPLOT(series)   (itemtype(series) == ITEM_TYPE_YSYMPLOT)
#define ISXYSYMPLOT(series)  (itemtype(series) == ITEM_TYPE_XYSYMPLOT)
#define ISSYMBOLPLOT(series) (ISYSYMPLOT(series) || ISXYSYMPLOT(series))
#define ISXYSERIES(series)   (itemtype(series) == ITEM_TYPE_XY)
#define ISXYZSERIES(series)  (itemtype(series) == ITEM_TYPE_XYZ)


/* useful constants */
#ifndef TRUE
#define TRUE  1
#endif

#ifndef FALSE
#define FALSE 0
#endif


