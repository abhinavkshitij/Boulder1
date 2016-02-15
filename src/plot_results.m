% $$$ figure(1)
% $$$      grid=256;colormap jet;
% $$$      set(gcf, 'Color', 'w');
% $$$      imagesc(U1_DNS(:,:,vizSlice2),clims);
% $$$    
% $$$    
% $$$     ylabel('$u_1$','interpreter','latex', ...
% $$$            'fontsize',18);
% $$$     axis square tight;
% $$$     
% $$$     export_fig gcf M1_u.png -q101
% $$$     
% $$$ figure(2)
% $$$      grid=256;colormap jet;
% $$$      set(gcf, 'Color', 'w');
% $$$     imagesc(U1_LES(:,:,vizSlice2),clims);
% $$$    
% $$$     ylabel('$\widetilde{u_1}$','interpreter','latex', ...
% $$$            'fontsize',18);
% $$$     axis square tight;
% $$$     
% $$$     export_fig gcf M1_uf.png -q101
% $$$     
% $$$ figure(3)
% $$$      grid=256;colormap jet;
% $$$      set(gcf, 'Color', 'w');
% $$$     
% $$$     imagesc(U1_test(:,:,vizSlice2),clims);
% $$$     ylabel('$\widehat{\widetilde{u_1}}$','interpreter','latex', ...
% $$$            'fontsize',18);
% $$$     axis square tight;
% $$$     
% $$$     export_fig gcf M1_ut.png -q101
    
   
    figure(2)
     grid=256;colormap jet;
     set(gcf, 'Color', 'w');
    imagesc(tau_11_LES(:,:,vizSlice2),clims);
   
    ylabel('$\tau_{11}$','interpreter','latex', ...
           'fontsize',18);
    axis square tight;
    
    export_fig gcf tau1_uf.png -q101
    
figure(3)
     grid=256;colormap jet;
     set(gcf, 'Color', 'w');
    
    imagesc(tau_11_test(:,:,vizSlice2),clims);
    ylabel('$T_{11}$','interpreter','latex', ...
           'fontsize',18);
    axis square tight;
    
    export_fig gcf tau1_ut.png -q101