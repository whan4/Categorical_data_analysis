data Hw3.hw3;
set Hh;
run;
proc sort data=Hw3.hw3; by descending cp47 descending cp9 ;run;
proc freq data=Hw3.hw3 order=data;
tables cp47 * cp9/all;
run;
proc freq data=Hw3.hw3;
table cp47*cp9/agree;
exact mcnem;
run;

