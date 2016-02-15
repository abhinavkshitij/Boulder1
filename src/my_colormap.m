

% T= [ 0, 0,   143        %// dark blue
%      0, 0,   255        %// blue
%      0, 255, 255        %// cyan
%      255, 255, 0        %// yellow
%      255, 0, 0          %// red
%      128, 0, 0]./255;    %// dark red
%  
%  x = [0
%      50
%      70
%      150
%      200
%      240  ]; %%  Change the CData range here %% 
%  


T= [ 0, 0,   143        %// dark blue
     0, 3,   255        %// blue
     1, 163, 254
     1, 255, 254        %// cyan
     145, 255,110
     255, 255, 1        %// yellow
     254,212,1
     254,169,103
     254, 77, 1          %// red
     128, 0, 0]./255;    %// dark red
 
 x = [0
     66
     95
     99
     103
     105
     109
     115
     131
     240  ]; %%  Change the CData range here %% 
 

 map = interp1(x/240,T,linspace(0,1,240));
