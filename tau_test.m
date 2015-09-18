%% tau_test

%% FILTER VELOCITIES AND PRODUCTS: 
   disp(['Applying test filter...']); 
        
    U1_test = sharp_filter(U1_LES,test,L);
    U2_test = sharp_filter(U2_LES,test,L);
    U3_test = sharp_filter(U3_LES,test,L);
    
    U11_test = sharp_filter(U1U1_LES,test,L);
    U12_test = sharp_filter(U1U2_LES,test,L);
    U13_test = sharp_filter(U1U3_LES,test,L);
    U22_test = sharp_filter(U2U2_LES,test,L);
    U23_test = sharp_filter(U2U3_LES,test,L);
    U33_test = sharp_filter(U3U3_LES,test,L);
    
    disp(['Completed test filtering...']);           
    
%% COMPUTE TEST STRESS -- tau_ij_test:

tau_11_test = U11_test - (U1_test.*U1_test);
tau_12_test = U12_test - (U1_test.*U2_test);
tau_13_test = U13_test - (U1_test.*U3_test);
tau_22_test = U22_test - (U2_test.*U2_test);
tau_23_test = U23_test - (U2_test.*U3_test);
tau_33_test = U33_test - (U3_test.*U3_test);