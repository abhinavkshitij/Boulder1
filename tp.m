clc
clear all
A= linspace(1,100,100);
B= linspace(1,50,50);
fileID = fopen ('exp.txt','w');
fprintf(fileID,'%5d %5d',A,B);