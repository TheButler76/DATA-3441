/*-------------------------------------------------*/
/*=(IPS10-2.146)==============*
|== Smokers and Non-Smokers   |
==============================*/


/*------------------------------/
|2(a) Creating the data we need |
-------------------------------*/
/* Yes means Smoker, No means not a smoker.*/
data Smoking_Is_Bad;
	input Survival $ Smoker $ Age_Group $ Counts;
	datalines;
Dead Yes A 19
Alive Yes A 269
Dead No A 13
Alive No A 327
Dead Yes B 78
Alive Yes B 167
Dead No B 52
Alive No B 147
Dead Yes C 42
Alive Yes C 7
Dead No C 165
Alive No C 28
;
run;

/*---------------------------------------------------------------/
|1(a) Two-Way table for Smoking(yes|no) and Survival(dead|alive) |
-----------------------------------------------------------------*/
title "Conditional Distribution of Smokers and Survival rates";
proc freq data=Smoking_Is_Bad;
	tables Survival * Smoker / nopercent norow nocum;
	weight Counts;
run;

/*----------------------------/
|1(b) Simpson's Paradox Table |
------------------------------*/

title "Conditional Table of all Age groups";
proc freq data=Smoking_Is_Bad;
	tables Survival * Age_Group * Smoker / norow nopercent;
	weight Counts;
run;


/*----------------------------------------------------------------/
|1(c) Comparing the percentage of smokers in the three age groups |
-----------------------------------------------------------------*/








/*=(IPS10-2.100)========*
|==Titanic Data Load    |
========================*/

FILENAME REFFILE '/home/u64309835/Homework_3/ex02-100titanic-1.csv';
/* Sheet: neg_linear */
proc import datafile=reffile
	dbms=CSV
	out=Titanic_data
	replace;
	getnames=yes;
run;


/*=========================================*/
/*----------------------------------------/
|2(a) Two-Way table for Survival and Class |
------------------------------------------*/
proc format;
    value Pclass_Ticket
        1 = "First"
        2 = "Second"
        3 = "Third";
    value Dead_Alive
    	0 = Dead
    	1 = Alive;
run;

title "Two-Way table for Survival and Class";
proc freq data=Titanic_data;
	tables Survived * Pclass / norow nocol nopercent;
	weight Pclass;
	format Pclass Pclass_Ticket.;
	format Survived Dead_Alive.;
run;

/*================================================*/
/*------------------------------------------------/
|2(c) Marginal Distributions                       |
--------------------------------------------------*/
title "Marginal Distribution for Survival and Class";
proc freq data=Titanic_data;
	tables Survived * Pclass / nocol nopercent;
	weight Pclass;
	format Pclass Pclass_Ticket.;
	format Survived Dead_Alive.;
run;

/*===================================================*/
/*---------------------------------------------------/
|2(d) Conditional Distribution for Survival and Class |
-----------------------------------------------------*/
title "Conditional Distribution for Survival and Class";
proc freq data=Titanic_data;
	tables Survived * Pclass / nocol norow nocum;
	weight Pclass;
	format Pclass Pclass_Ticket.;
	format Survived Dead_Alive.;
run;


/*=(IPS10-2.105)==============*
|== Which Hospital is safer?  |
==============================*/

data Hospital;
	input Survival $ Hospital_Type $ Counts;
	datalines;
Dead A 63
Dead B 16
Alive A 2037
Alive B 784
;
run;

/*-------------------------------------------------/
|Question asks for a joint distribution for A & B |
--------------------------------------------------*/
title "Conditional Distribution of Hospital and Survival Type";
proc freq data=Hospital;
	tables Survival*Hospital_Type / norow nopercent;
	weight Counts;
run;


/*=(IPS10-2.106)==============*
|== Poor and Healthy Patients |
==============================*/
data Good_Condition;
	input Survival $ Hospital_Type $ Counts;
	datalines;
Dead A 6
Dead B 8
Alive A 594
Alive B 592
;
run;

data Bad_Condition;
	input Survival $ Hospital_Type $ Counts;
	datalines;
Dead A 57
Dead B 8
Alive A 1443
Alive B 192
;
run;
/*-------------------------------------------------------------/
| (a) Death rate for "poor" A & B patients. Who fairs better? |
--------------------------------------------------------------*/
title "Conditional Distribution of Bad Hospital and Survival Type";
proc freq data=Bad_Condition;
	tables Survival*Hospital_Type / norow nopercent;
	weight Counts;
run;

title "Marginal Distribution of Bad Hospital and Survival Type";
proc freq data=Bad_Condition;
	tables Survival * Hospital_Type / nocol nopercent;
	weight Counts;
run;
/*=========================================================*/
title "Conditional Distribution of Good Hospital and Survival Type";
proc freq data=Good_Condition;
	tables Survival*Hospital_Type / norow nopercent;
	weight Counts;
run;

title "Marginal Distribution of Good Hospital and Survival Type";
proc freq data=Good_Condition;
	tables Survival*Hospital_Type / nocol nopercent;
	weight Counts;
run;








