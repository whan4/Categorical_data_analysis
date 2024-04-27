PROC IMPORT DATAFILE='C:\Users\riverboy\Box\share\catagory hw10\intake.csv'
     OUT=hw10
     DBMS=CSV
     REPLACE;
     GETNAMES=YES;
RUN;
data hw10_1;
set hw10;
if ms>=0 & ms<2 then msn=0;
else if ms >=2 & ms<=6 then msn=1;
else if ms >6 then msn=2;
run;
ods rtf file="C:\Users\riverboy\Box\share\catagory hw10\1b.rtf";
proc genmod data=hw10_1;
class gender msn;
model cp10 = age gender msn /dist=poisson link=log type3 lrci;
run;
ods rtf close;ods rtf file="C:\Users\riverboy\Box\share\catagory hw10\2a.rtf";
PROC GENMOD DATA=hw10_1;
class gender msn;
MODEL cp10 = age gender msn/ DIST=POISSON LINK=LOG TYPE3 scale=deviance
LRCI;
run;
PROC GENMOD DATA=hw10_1;
class gender msn;
MODEL cp10 = age gender msn
/ DIST=POISSON LINK=LOG TYPE3 scale=pearson
LRCI;
RUN;
ods rtf close;

data hw10_2;
set hw10_1;
id=_n_;
run;
ods rtf close;ods rtf file="C:\Users\riverboy\Box\share\catagory hw10\2c.rtf";
PROC GENMOD DATA=hw10_2;
class gender msn id;
MODEL cp10 = age gender msn
/ DIST=p LINK=LOG TYPE3 LRCI;
repeated subject=id;
RUN;
ods rtf close;
ods rtf close;ods rtf file="C:\Users\riverboy\Box\share\catagory hw10\3a.rtf";
proc genmod data=hw10_1;
class gender msn;
model cp10 = age gender msn/dist=nb1 link=log type3 lrci;
contrast 'description of contrast' msn 1 -1;
run;
proc countreg data=hw10_1;
class gender msn;
model cp10 = age gender msn/dist=NEGBIN(P=1);
run;
ods rtf close;
ods rtf close;ods rtf file="C:\Users\riverboy\Box\share\catagory hw10\3b.rtf";
proc genmod data=hw10_1;
class gender msn;
model cp10 = age gender msn/dist=nb2 link=log type3 lrci;
contrast 'description of contrast' msn 1 -1;
run;
proc countreg data=hw10_1;
class gender msn;
model cp10 = age gender msn/dist=NEGBIN(P=2);
run;
ods rtf close;
ods rtf close;ods rtf file="C:\Users\riverboy\Box\share\catagory hw10\3c.rtf";
proc fmm data=hw10_1;
class gender msn;
model cp10 = age gender msn/dist=GENPOISSON;
run;
ods rtf close;
ods rtf close;ods rtf file="C:\Users\riverboy\Box\share\catagory hw10\4b.rtf";
proc genmod DATA=hw10_1;
class gender msn;
model cp10 = age gender msn/ d=zip;
ZEROMODEL gender /link=logit;
run;
proc countreg DATA=hw10_1;
class gender msn;
model cp10 = age gender msn/ d=zip;
ZEROMODEL cp10 ~ gender /link=logistic;
run;
ods rtf close;
ods rtf close;ods rtf file="C:\Users\riverboy\Box\share\catagory hw10\4c.rtf";
proc genmod DATA=hw10_1;
class gender msn;
model cp10 = age gender msn/ d=zinb;
ZEROMODEL gender /link=logit;
run;
proc countreg DATA=hw10_1;
class gender msn;
model cp10 = age gender msn/ d=zinb;
ZEROMODEL cp10 ~ gender /link=logistic;
run;
ods rtf close;
