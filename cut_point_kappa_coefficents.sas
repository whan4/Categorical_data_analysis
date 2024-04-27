libname hw2 'C:\Users\riverboy\Desktop';
data Ppd;
set Hw2.Ppd;
array new(27) a0-a26;
Do J=1 To 27;
if epds< j-1 then new(j)=0;
if epds>= j-1 then new(j)=1;
end;
drop j;
run;
ods pdf file = "C:\Users\riverboy\Desktop";
proc freq data=Ppd;
table a1-a26*Cmajmin/ agree;
run;
proc freq data=Ppd;
proc freq data=Hw2.Ppd;
table bdi*epds/agree;
exact mcnem;
run;
/*Cut Point of kappa coefficients*/
data ppd;
set Cat.Ppd;
run;
%macro compute_kappas;
%do cut = 1 %to 20;
DATA ppd_temp;
SET ppd;
        
        /* ????????????EPDS?? */
        EPDS_dichotomized = (EPDS <= &cut);
    RUN;
    
    /* ???????Kappa?? */
    PROC FREQ DATA=ppd_temp;
        WEIGHT kappa;
        TABLES Cmajmin*EPDS_dichotomized / AGREE;
    RUN;
    
    /* ???????Kappa?? */
    ODS OUTPUT Kappa=kappa_results(rename=(Value=kappa_cut&cut.));
    QUIT;
%end;
%mend;

%compute_kappas;
