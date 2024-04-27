libname hw8 "C:\Users\riverboy\Box\share\catagory hw8";
data seeds;
infile "C:\Users\riverboy\Box\share\catagory hw8\seeds.dat";
input pot n r cult soil;
run;
data seeds;
  set seeds;
  if _N_ > 1;
run;

PROC CONTENTS DATA=seeds;
RUN;
PROC LOGISTIC DATA=seeds;
MODEL R/N=CULT SOIL CULT*SOIL/SCALE= NONE;
RUN;

PROC LOGISTIC DATA=seeds DESC;
MODEL R/N= CULT|SOIL/LINK=LOGIT SCALE=WILLIAMS LACKFIT AGGREGATE; 
RUN;
proc logistic data=seeds;
model r/n=cult soil cult*soil/scale=pearson;
run;
proc logistic data=seeds;
model r/n=cult soil cult*soil/scale=williams;
run;
