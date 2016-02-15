%% READS VELOCITIES AND WRITES FILTERED FIELDS ON DISK:

clc
clear all
close all

grid = 256;                            
vizSlice1 = 64;vizSlice2 = 128;vizSlice3 = 192;

LES_filter = 64;
Test_filter = 32;
%L=0.00259;
L=256;
clims=[-20 20]; c_tau=[-75 75];
 
%% READ VELOCITY FILES:
run ReadVel;
      
   %% Task 1a: u_i in three DNS planes:
   
   
    
    %% Compute Filters - LES and Test filters
     disp('Computing Filters...');
    LES = zeros(grid,grid,grid);
    test = zeros(grid,grid,grid);

center = 0.5*grid+1;

for i=1:grid
        for j=1:grid
            for k=1:grid
                d = sqrt( (i-center)^2 + (j-center)^2 + (k-center)^2 );
               
                 if (d <= LES_filter)               
                 LES(i,j,k) = 1;
                 end
                 if (d  <= Test_filter)               
                 test(i,j,k) = 1;
                end
            end
        end
end
   
  
  
    %% Compute TAU_LES: 
    
    run tau_LES; %True SGS stress from DNS and LES data
                 %run plot_LES;
    
    %% Compute TAU_TEST :(^)
        
    run tau_test; %Test stress from LES and test-filtered data
                  %    run plot_test;
  
    
% $$$     tau_dev = (tau_11_LES + tau_22_LES + tau_33_LES)/3;
% $$$     tau_11_dev = tau_11_LES - tau_dev;
% $$$ 
% $$$     tau_11_dev(15,24,10)
    
% $$$     tau_22_LES(200,156,129)
% $$$     tau_22_test(200,156,129)
% $$$     U3_DNS(200,156,129)
% $$$     U3_LES(200,156,129)
% $$$     U3_test(200,156,129)
% $$$     run maxminval; % FOR COMMON SCALES
% $$$     run plot_tau_LES;
% $$$     run plot_tau_test;
    
    %run plot_DNS;
    
  
