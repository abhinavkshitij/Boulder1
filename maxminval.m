large = ones(1,12);
small = ones(1,12);

disp('Max values -LES');
large(1)=(max(max(max(tau_11_LES))));
large(2)=(max(max(max(tau_12_LES))));
large(3)=(max(max(max(tau_13_LES))));
large(4)=(max(max(max(tau_22_LES))));
large(5)=(max(max(max(tau_23_LES))));
large(6)=(max(max(max(tau_33_LES))));

disp('Min values -LES');
small(1)=(min(min(min(tau_11_LES))));
small(2)=(min(min(min(tau_12_LES))));
small(3)=(min(min(min(tau_13_LES))));
small(4)=(min(min(min(tau_22_LES))));
small(5)=(min(min(min(tau_23_LES))));
small(6)=(min(min(min(tau_33_LES))));

disp('Max values -Test');
large(7)=(max(max(max(tau_11_test))));
large(8)=(max(max(max(tau_12_test))));
large(9)=(max(max(max(tau_13_test))));
large(10)=(max(max(max(tau_22_test))));
large(11)=(max(max(max(tau_23_test))));
large(12)=(max(max(max(tau_33_test))));

disp('Min values - Test');
small(7)=(min(min(min(tau_11_test))));
small(8)=(min(min(min(tau_12_test))));
small(9)=(min(min(min(tau_13_test))));
small(10)=(min(min(min(tau_22_test))));
small(11)=(min(min(min(tau_23_test))));
small(12)=(min(min(min(tau_33_test))));

largest = max(large)/2;
smallest = min(small)/2;

c_tau = [smallest largest]; 

