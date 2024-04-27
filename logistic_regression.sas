libname hw4 "Z:\Desktop\2023 fall\7150 categorical data analysis\hw3";
data hw5;
set Hw4.Dos;
if dep>0 then depd = 1;
else if dep = 0 then depd = 0;
if 0<=Cirsttl < 6 then CIRS3= 1;
else if 6 <=Cirsttl <10 then CIRS3= 2;
else if Cirsttl >= 10 then CIRS3= 3;
if MARITAL=1 THEN MS = 1;
ELSE IF MARITAL ^=1 THEN MS =0;
RUN;

proc logistic data=hw5;
	class CIRS3 (ref = "3") Depd (ref = "1") / param = ref;
    model Depd = CIRS3 / link=glogit;
	contrast "CIRS3=1 vs CIRS3=2" CIRS3 1, CIRS3 2;
run;
