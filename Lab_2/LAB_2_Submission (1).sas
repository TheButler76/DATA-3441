FILENAME reffile '/home/u64309835/LAB_2/EX02-144MEIS.csv';
/*=======================*
|2.144) Scatterplots     |
*========================*/
proc import datafile=reffile
	dbms=CSV
	out=Permit_Sales;
	getnames=yes;
RUN;

/*=======================*
|2.144 A) Scatterplot    |
*========================*/
TITLE "Scatter plot of Dweller Permits and Sales";
proc sgplot data=Permit_Sales;
	scatter x=DwellPermit y=Sales;
RUN;

/*======================================*
|2.144 B) Scatterplot w/Regression Line |
*=======================================*/
TITLE "Scatter plot of Dweller Permits and Sales (w/ Regression Line)";
proc sgplot data=Permit_Sales;
	reg x=DwellPermit y=Sales;
	scatter x=DwellPermit y=Sales;
RUN;
/*==================================================================*/
FILENAME reffile '/home/u64309835/LAB_2/EX02-144MEIS.csv';
/*=======================*
|2.145) Scatterplots     |
*========================*/
proc import datafile=reffile
	dbms=CSV
	out=Permit_Prod;
	getnames=yes;
RUN;

/*=======================*
|2.145 A) Scatterplot    |
*========================*/
TITLE "Scatter plot of Dweller Permits and Production";
proc sgplot data=Permit_Prod;
	scatter x=DwellPermit y=Production;
RUN;

/*======================================*
|2.145 B) Scatterplot w/Regression Line |
*=======================================*/
TITLE "Scatter plot of Dweller Permits and Production (w/Regression Line)";
proc sgplot data=Permit_Prod;
	reg x=DwellPermit y=Production;
	scatter x=DwellPermit y=Production;
RUN;

/*======================================*
|2.153)   Marginal Distributions        |
*=======================================*/
FILENAME REFFILE '/home/u64309835/LAB_2/EX02-153FOS.csv';
proc import datafile=reffile
	dbms=CSV
	out=College_Graduates;
	getnames=yes;
RUN;



/*======================================*
|2.153 A)   Marginal Totals             |
*=======================================*/
TITLE "Tables of countries with counts for each field of study";
proc freq data=College_Graduates;
	tables (Canada France Germany Italy Japan UK US) / list ;
RUN;


/*======================================*
|2.156   Salaries and Raises            |
*=======================================*/
FILENAME REFFILE '/home/u64309835/LAB_2/EX02-156RAISES.csv';
proc import datafile=reffile
	dbms=CSV
	out=Salary;
	getnames=yes;
RUN;

/*======================================*
|2.156 A)   Scatter Plot (Describe)     |
*=======================================*/
TITLE "Scatter plot of Salary and Year";
proc sgplot data=Salary;
	reg x=Year y=Salary;
	scatter x=Year y=Salary;
	footnote "It seems that the longer the employee is employed at xyz company, her salary increases by $2,000 each year.";
run;
	