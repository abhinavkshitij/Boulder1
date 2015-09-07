%% tau_LES

%% COMPUTE DNS PRODUCTS:

    U11_DNS = U1_DNS.*U1_DNS;
    U12_DNS = U1_DNS.*U2_DNS;
    U13_DNS = U1_DNS.*U3_DNS;
    U22_DNS = U2_DNS.*U2_DNS;
    U23_DNS = U2_DNS.*U3_DNS;
    U33_DNS = U3_DNS.*U3_DNS;

%% FILTER DNS PRODUCTS:
    
    disp(['Applying LES filter...']);
    
    U1_LES = sharp_filter(U1_DNS,LES,L);
    U2_LES = sharp_filter(U2_DNS,LES,L);
    U3_LES = sharp_filter(U3_DNS,LES,L);
    
    U11_LES = sharp_filter(U11_DNS,LES,L);
    U12_LES = sharp_filter(U12_DNS,LES,L);
    U13_LES = sharp_filter(U13_DNS,LES,L);
    U22_LES = sharp_filter(U22_DNS,LES,L);
    U23_LES = sharp_filter(U23_DNS,LES,L);
    U33_LES = sharp_filter(U33_DNS,LES,L);
   
    disp(['Completed LES filtering...']);   
    
 %% COMPUTE LES PRODUCTS:
 
 U1U1_LES = U1_LES.*U1_LES;
 U1U2_LES = U1_LES.*U2_LES;
 U1U3_LES = U1_LES.*U3_LES;
 U2U2_LES = U2_LES.*U2_LES;
 U2U3_LES = U2_LES.*U3_LES;
 U3U3_LES = U3_LES.*U3_LES;
 
%% COMPUTE TRUE SUBGRID STRESS -- tau_ij_LES:

tau_11_LES = U11_LES - U1U1_LES;
tau_12_LES = U12_LES - U1U2_LES;
tau_13_LES = U13_LES - U1U3_LES;
tau_22_LES = U22_LES - U2U2_LES;
tau_23_LES = U23_LES - U2U3_LES;
tau_33_LES = U33_LES - U3U3_LES;
