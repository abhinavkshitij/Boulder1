
  clims=[-20 20]   
    figure(1)
     grid=256;colormap jet;
     set(gcf, 'Color', 'w');
    imagesc(tau_11_dev(:,:,vizSlice2),clims);
   
    ylabel('$T_{11}$','interpreter','latex', ...
           'fontsize',18);
    axis square tight;
    
    export_fig gcf tau1_ut_dev.png -q101
    
