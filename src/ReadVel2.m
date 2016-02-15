
velLoc='/Users/Kshitij/Desktop/ALES/f90/data/jhu256/bin/'; 

nx=[256,256,256];                          %computational grid dimensions

    disp(['Reading binary file...'])
    
    %Read in velocity fields:
    [fid,errmsg]=fopen([velLoc,'Velocity1_256.bin']);
    tmp=fread(fid,nx(1)*nx(2)*nx(3),'double');
    fclose(fid);
    U1_DNS = reshape(tmp,nx(1),nx(2),nx(3));
    clear tmp ;
    
    
    fid=fopen([velLoc,'Velocity2_256.bin']);
    tmp=fread(fid,nx(1)*nx(2)*nx(3),'double');
    fclose(fid);
    U2_DNS = reshape(tmp,nx(1),nx(2),nx(3));
    clear tmp ;
     
    
    fid=fopen([velLoc,'Velocity3_256.bin']);
    tmp=fread(fid,nx(1)*nx(2)*nx(3),'double');
    fclose(fid);
    U3_DNS = reshape(tmp,nx(1),nx(2),nx(3));
    clear tmp ;
    
  