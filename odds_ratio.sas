libname hw4 "Z:\Desktop\2023 fall\7150 categorical data analysis\hw3";
data hw4;
set Hw4.Dos;
if 0<=education<=12 then edu=0;
else if education>12 then edu=1;
if cirsttl<=6 then CIRS=0;
else if cirsttl>6 then CIRS=1;
if dep>=1 then depd=1;
else if dep=0 then depd=0;
run;
proc freq data=hw4;
tables gender*depd/chisq OR;
EXACT CHISQ;
RUN;

proc freq data=hw4; 
tables CIRS*edu*gender*depd /cmh BDT; run;
