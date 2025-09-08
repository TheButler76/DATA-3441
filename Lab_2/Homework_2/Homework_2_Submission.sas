/*================================================================================================*/
/*---------------------------------------------*
| Loading data sheets from LAB_2 demonstration |
-----------------------------------------------*/
/*================================================================================================*/
FILENAME REFFILE '/home/u64309835/LAB_2/Datasets.xlsx';
/* Sheet: neg_linear */
proc import datafile=reffile
	dbms=xlsx
	out=neg_linear
	replace;
	sheet='neg_linear';
	getnames=yes;
run;

/* Sheet: no_correlation */
proc import datafile=reffile
	dbms=xlsx
	out=no_correlation
	replace;
	sheet='no_correlation';
	getnames=yes;
run;

/* Sheet: nonlinear */
proc import datafile=reffile
	dbms=xlsx
	out=nonlinear
	replace;
	sheet='nonlinear';
	getnames=yes;
run;
/*================================================================================================*/
/*-------------------------------*
| (IPS10-2.6) Make some sketches |
---------------------------------*/
/*================================================================================================*/

/*==================================*
|  (a) Scatter plot of neg linear   |
/*==================================*/
title "A WEAK NEGATIVE LINEAR RELATIONSHIP (x,y)";
proc sgplot data=neg_linear;
	loess x=x y=y;
	scatter x=x y=y;
run;

/*==================================*
|  (b) Scatter plot of no correlation   |
/*==================================*/
title "NO CORRELATION (x,y)";
proc sgplot data=no_correlation;
	loess x=x y=y;
	scatter x=x y=y;
run;

/*==================================*
|  (c) Scatter plot of nonlinear    |
/*==================================*/
title "A STRONG CURVILINEAR RELATIONSHIP (x,y)";
proc sgplot data=nonlinear;
	loess x=x y=y;
	scatter x=x y=y;
run;

/*==================================*
|  (d) Scatter plot of nonlinear    |
/*==================================*/
data sample;
	input index $ x $ y;
	datalines;
1 1 1
2 2 2
3 3 3
4 4 4
5 5 3
6 6 2
7 7 1
8 8 2
9 9 3
10 10 4
11 11 3
12 12 2
13 13 1
14 14 2
15 15 3
16 16 4
17 17 3
18 18 2
19 19 1
;
run;

title 'A MORE COMPLICATED RELATIONSHIP (x,y)';
proc sgplot data=sample;
	loess x=x y=y;
	scatter x=x y=y;
run;
/*================================================================================================*/
/*--------------------------------------------*
|(IPS10-2.8) Blueberries and Anthocyanins     |
*---------------------------------------------*/
/*-Load the blueberry data --------------------*/
FILENAME REFFILE '/home/u64309835/Homework_2/ex02-008berries.csv';
proc import datafile=reffile
	dbms=CSV
	out=bluebar
	replace;
	getnames=yes;
run;

/*========================================*
|  (a) Scatter plot of Antho4 & Antho3    |
/*========================================*/
title "Scatter plot of Antho4 & Antho3 ";
proc sgplot data=bluebar;
	scatter x=Antho4 y=Antho3;
run;

/*====================================================*
|  (b) Describing the form, direction, and strength   |
/*====================================================*/

/*================================================*
|  (c) Outliers or unusual observations?          |
/*================================================*/

/*================================================*
|  (d) Scatter plot of Antho4 & Antho3 (w/LSRL)   |
/*================================================*/
title "Scatter plot of Antho4 & Antho3 (w/LSRL) ";
proc sgplot data=bluebar;
	loess x=Antho4 y=Antho3;
	scatter x=Antho4 y=Antho3;
run;

/*=====================================================*
|  (e) Scatter plot of Antho4 & Antho3 (w/smoothing)   |
/*=====================================================*/
proc sgplot data=bluebar;
	pbspline x=Antho4 y=Antho3;
	scatter x=Antho4 y=Antho3;
run;

/*================================================================================================*/
/*-----------------------------------------------------*
|(IPS10-2.9) Blueberries and Anthocyanins (w/logs)     |
*------------------------------------------------------*/
/*-Load the blueberry data --------------------*/
FILENAME REFFILE '/home/u64309835/Homework_2/ex02-008berries.csv';
proc import datafile=reffile
	dbms=CSV
	out=bluebar
	replace;
	getnames=yes;
run;

/*-Making a log transformation on the variables----*/
/*========================================*
|  (a) Scatter plot of Antho4 & Antho3    |
/*========================================*/
title "Scatter plot of Antho4 & Antho3 (log transformation) ";
proc sgplot data=bluebar;
	scatter x=Antho4 y=Antho3;
	xaxis type=log;
	yaxis type=log;
run;

/*====================================================*
|  (b) Describing the form, direction, and strength   |
/*====================================================*/

/*================================================*
|  (c) Outliers or unusual observations?          |
/*================================================*/

/*================================================*
|  (d) Scatter plot of Antho4 & Antho3 (w/LSRL)   |
/*================================================*/
title "Scatter plot of Antho4 & Antho3 (w/LSRL) ";
proc sgplot data=bluebar;
	loess x=Antho4 y=Antho3;
	scatter x=Antho4 y=Antho3;
	xaxis type=log;
	yaxis type=log;
run;

/*=====================================================*
|  (e) Scatter plot of Antho4 & Antho3 (w/smoothing)   |
/*=====================================================*/
proc sgplot data=bluebar;
	pbspline x=Antho4 y=Antho3;
	scatter x=Antho4 y=Antho3;
	xaxis type=log;
	yaxis type=log;
run;

/*================================================================================================*/
/*-------------------------------------------------------*
|(IPS10-2.16) Compare the baseball players with controls |
*--------------------------------------------------------*/
/*--Load the baseball data--------*/
FILENAME REFFILE '/home/u64309835/Homework_2/ex02-016armstr.csv';
proc import datafile=reffile
	dbms=CSV
	out=baseball_data
	replace;
	getnames=yes;
run;
	

/*=================================================================================*
|  (a) Scatter plot of Baseball Players and Non-Baseball Players (Dominant Hand)   |
/*=================================================================================*/
ods graphics / width=4in height=3in;
title "Scatter plot of Baseball Players and Non-Baseball Players (Dominant Hand)";
proc sgplot data=baseball_data;
	scatter x=Group y=Dom / group=Group;
run;
ods graphics / reset=all;

/*=============================*
|  (b) Summary of observations |
/*=============================*/

/*================================================================================================*/
/*-------------------------------------------------------*
|(IPS10-2.30) Blueberries and Anthocyanins (correlation)  |
*--------------------------------------------------------*/
/*--Load the blueberry data------------*/
FILENAME REFFILE '/home/u64309835/Homework_2/ex02-008berries.csv';
proc import datafile=reffile
	dbms=CSV
	out=bluebar
	replace;
	getnames=yes;
run;

/*==========================================*
|  (a) Correlations between Antho4 & Antho3 |
/*==========================================*/
title "Correlation of Antho4 and Antho3";
proc corr data=bluebar;
	var Antho4 Antho3;
run;
/*==========================================*
|  (b) Scatter plot between Antho4 & Antho3 |
/*==========================================*/
title "Scatter plot of Antho4 & Antho3 ";
proc sgplot data=bluebar;
	scatter x=Antho4 y=Antho3;
run;
quit;
/*=============================*
|  (c) Summary of observations |
/*=============================*/

/*================================================================================================*/
/*--------------------------------------------------*
|(IPS10-2.34) Strong association but no correlation |
*---------------------------------------------------*/
data corr_data;
	input x y;
	datalines;
45 30
55 50
65 70
75 50
85 30
;
run;

/*==================*
|  (a) Scatter plot |
/*==================*/
title "Scatter plot of x & y";
proc sgplot data=corr_data;
	scatter x=x y=y;
run;
/*=================================*
|  (b) Description of relationship |
/*=================================*/
proc sgplot data=corr_data;
	scatter x=x y=y;
	loess x=x y=y;
run;
/*==================*
|  (c) Correlation  |
/*==================*/
title "Scatter plot of x & y";
proc corr data=corr_data;
	var x y;
run;
/*=====================================================*
|  (d) The importance of correlation for this exercise |
/*=====================================================*/

