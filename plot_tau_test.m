
figure();
colormap jet;


    subplot(231);imagesc(tau_11_test(:,:,vizSlice1),c_tau);
    title('$T_{uu}$','interpreter','latex','fontsize',12);
    h = gca; h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    ylabel('z = 64');
    axis square;
    
    subplot(232);imagesc(tau_12_test(:,:,vizSlice1),c_tau);
    title('$T_{uv}$','interpreter','latex','fontsize',12);
    h=gca; h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
    subplot(233);imagesc(tau_13_test(:,:,vizSlice1),c_tau);
    title('$T_{uw}$','interpreter','latex','fontsize',12);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
    subplot(234);imagesc(tau_22_test(:,:,vizSlice1),c_tau);
    title('$T_{vv}$','interpreter','latex','fontsize',12);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
    subplot(235);imagesc(tau_23_test(:,:,vizSlice1),c_tau);
    title('$T_{vw}$','interpreter','latex','fontsize',12);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
    s2=subplot(236);imagesc(tau_33_test(:,:,vizSlice1),c_tau);
    title('$T_{ww}$','interpreter','latex','fontsize',12);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
   

   
 figure();
 colormap jet;
    subplot(231);imagesc(tau_11_test(:,:,vizSlice2),c_tau);
    title('$T_{uu}$','interpreter','latex','fontsize',12);
    h = gca; h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    ylabel('z = 128');
    axis square;
    
    subplot(232);imagesc(tau_12_test(:,:,vizSlice2),c_tau);
    title('$T_{uv}$','interpreter','latex','fontsize',12);
    h=gca; h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
    subplot(233);imagesc(tau_13_test(:,:,vizSlice2),c_tau);
    title('$T_{uw}$','interpreter','latex','fontsize',12);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
    subplot(234);imagesc(tau_22_test(:,:,vizSlice2),c_tau);
    title('$T_{vv}$','interpreter','latex','fontsize',12);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
    subplot(235);imagesc(tau_23_test(:,:,vizSlice2),c_tau);
    title('$T_{vw}$','interpreter','latex','fontsize',12);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
    subplot(236);imagesc(tau_33_test(:,:,vizSlice2),c_tau);
    title('$T_{ww}$','interpreter','latex','fontsize',12);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
 figure();
 colormap jet;
    subplot(231);imagesc(tau_11_test(:,:,vizSlice3),c_tau);
    title('$T_{uu}$','interpreter','latex','fontsize',12);
    h = gca; h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    ylabel('z = 192');
    axis square;
    
    subplot(232);imagesc(tau_12_test(:,:,vizSlice3),c_tau);
    title('$T_{uv}$','interpreter','latex','fontsize',12);
    h=gca; h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
    subplot(233);imagesc(tau_13_test(:,:,vizSlice3),c_tau);
    title('$T_{uw}$','interpreter','latex','fontsize',12);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
    subplot(234);imagesc(tau_22_test(:,:,vizSlice3),c_tau);
    title('$T_{vv}$','interpreter','latex','fontsize',12);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
    subplot(235);imagesc(tau_23_test(:,:,vizSlice3),c_tau);
    title('$T_{vw}$','interpreter','latex','fontsize',12);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
    subplot(236);imagesc(tau_33_test(:,:,vizSlice3),c_tau);
    title('$T_{ww}$','interpreter','latex','fontsize',12);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;