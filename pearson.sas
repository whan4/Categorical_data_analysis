libname hw3 "Z:\Desktop\";
data hw3;
set Hw3.Dos;
if education<=12 then edu=0;
else if education>12 then edu=1;
run;
proc freq data=hw3;
tables edu*dep/chisq; 
exact chisq; run;
data new;
set hw3;
if dep = 2 then deps = 3;
else if dep = 1 then deps = 1;
else if dep = 0 then deps = 0;
run;
proc freq data=new;
tables edu*deps/cmh chisq;
run;
proc corr data=hw3 pearson;
   var edu dep;
run;

