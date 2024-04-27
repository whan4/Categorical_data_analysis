/*Fisher's exact test*/
libname cat "C:\Users\riverboy\Desktop\7150 categorical data analysis\hw2";
data Dos;
set Cat.Dos;
IF education <= 12 THEN education_dichotomous = '<=12';
    ELSE education_dichotomous = '>12';
	IF dep = 0 THEN depression_dichotomous = 0;
    ELSE IF dep^= 0 tHEN depression_dichotomous = 1;
	run;
PROC FREQ DATA=Dos order=data;
TABLES education_dichotomous*depression_dichotomous / cmh chisq;
RUN;
