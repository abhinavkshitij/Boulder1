clc
clear all
close all

velLoc='/Users/Kshitij/Desktop/ALES/DNS_Data/'; 

nx=[256,256,256];                          %computational grid dimensions

    disp(['Reading binary file...'])
    
    %Read in velocity fields:
    [fid,errmsg]=fopen([velLoc,'Velocity1_0460.bin']);
    tmp=single(fread(fid,nx(1)*nx(2)*nx(3),'single','b'));
    fclose(fid);
    Uhit = reshape(tmp,nx(1),nx(2),nx(3))/100;
    clear tmp ;
    