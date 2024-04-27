data Vision;
input r c count @@;
cards;
0 0 113 0 1 6 0 2 19 1 0 36 1 1 11 1 2 7 2 0 5 2 1 0 2 2 4
;
run; 
%gMcNemar(dsin = Vision, rowv = r, colv = c, count = count);
