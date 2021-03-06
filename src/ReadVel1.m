
nx=[256,256,256];                          %computational grid dimensions
Fs = 256;
    disp(['Creating 3D velocity field...'])
    
    % Create velocity field:
    x = linspace(0,2*pi(),Fs);
    [x,y,z] = meshgrid(x);
    
    U1_DNS = 20*(cos(2*y)+ cos(2*y+6*z) + cos (x+y+z))+...
             10*(cos(4*x+6*y+2*z) + cos(4*x) + cos(7*x+4*y+12*z)) +...
             5*(cos(8*x+12*y+10*z) + cos(8*y+8*z) + cos(x))+...
             2*(cos(12*x+14*y+12*z)+cos(16*x) + cos(15*x+14*y+15*z))+...
             1*(cos(12*x+15*y+17*z) + cos(44*x+70*y+26*z) + cos(14*x+20*y+44*z));      
    
    U2_DNS = 20*(sin(2*y)+ sin(2*y+6*z) + sin (x+y+z))+...
             10*(sin(4*x+6*y+2*z) + sin(4*x) + sin(7*x+4*y+12*z)) +...
             5*(sin(8*x+12*y+10*z) + sin(8*y+8*z) + sin(x))+...
             2*(sin(12*x+14*y+12*z)+sin(16*x) + sin(15*x+14*y+15*z))+...
             1*(sin(12*x+15*y+17*z) + sin(44*x+70*y+26*z) + sin(14*x+20*y+44*z));
         
    U3_DNS = 20*(cos(2*y)+ sin(2*y+6*z) + cos (x+y+z))+...
             10*(sin(4*x+6*y+2*z) + cos(4*x) + sin(7*x+4*y+12*z)) +...
             5*(cos(8*x+12*y+10*z) + sin(8*y+8*z) + cos(x))+...
             2*(sin(12*x+14*y+12*z)+cos(16*x) + sin(15*x+14*y+15*z))+...
             1*(cos(12*x+15*y+17*z) + sin(44*x+70*y+26*z) + cos(14*x+20*y+44*z));