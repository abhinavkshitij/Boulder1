figure();
colormap jet;

    subplot(231);imagesc(tau_11_LES(:,:,vizSlice1),c_tau);
    title('$\tau_{uu}$','interpreter','latex','fontsize',12);
    h = gca; h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    ylabel('z = 64');
    axis square;
    
    subplot(232);imagesc(tau_12_LES(:,:,vizSlice1),c_tau);
    title('$\tau_{uv}$','interpreter','latex','fontsize',12);
    h=gca; h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
    subplot(233);imagesc(tau_13_LES(:,:,vizSlice1),c_tau);
    title('$\tau_{uw}$','interpreter','latex','fontsize',12);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
    subplot(234);imagesc(tau_22_LES(:,:,vizSlice1),c_tau);
    title('$\tau_{vv}$','interpreter','latex','fontsize',12);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
    subplot(235);imagesc(tau_23_LES(:,:,vizSlice1),c_tau);
    title('$\tau_{vw}$','interpreter','latex','fontsize',12);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
    subplot(236);imagesc(tau_33_LES(:,:,vizSlice1),c_tau);
    title('$\tau_{ww}$','interpreter','latex','fontsize',12);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    

 figure();
 colormap jet;
    subplot(231);imagesc(tau_11_LES(:,:,vizSlice2),c_tau);
    title('$\tau_{uu}$','interpreter','latex','fontsize',12);
    h = gca; h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    ylabel('z = 128');
    axis square;
    
    subplot(232);imagesc(tau_12_LES(:,:,vizSlice2),c_tau);
    title('$\tau_{uv}$','interpreter','latex','fontsize',12);
    h=gca; h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
    subplot(233);imagesc(tau_13_LES(:,:,vizSlice2),c_tau);
    title('$\tau_{uw}$','interpreter','latex','fontsize',12);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
    subplot(234);imagesc(tau_22_LES(:,:,vizSlice2),c_tau);
    title('$\tau_{vv}$','interpreter','latex','fontsize',12);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
    subplot(235);imagesc(tau_23_LES(:,:,vizSlice2),c_tau);
    title('$\tau_{vw}$','interpreter','latex','fontsize',12);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
    subplot(236);imagesc(tau_33_LES(:,:,vizSlice2),c_tau);
    title('$\tau_{ww}$','interpreter','latex','fontsize',12);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
 figure();
 colormap jet;
    subplot(231);imagesc(tau_11_LES(:,:,vizSlice3),c_tau);
    title('$\tau_{uu}$','interpreter','latex','fontsize',12);
    h = gca; h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    ylabel('z = 192');
    axis square;
    
    subplot(232);imagesc(tau_12_LES(:,:,vizSlice3),c_tau);
    title('$\tau_{uv}$','interpreter','latex','fontsize',12);
    h=gca; h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
    subplot(233);imagesc(tau_13_LES(:,:,vizSlice3),c_tau);
    title('$\tau_{uw}$','interpreter','latex','fontsize',12);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
    subplot(234);imagesc(tau_22_LES(:,:,vizSlice3),c_tau);
    title('$\tau_{vv}$','interpreter','latex','fontsize',12);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
    subplot(235);imagesc(tau_23_LES(:,:,vizSlice3),c_tau);
    title('$\tau_{vw}$','interpreter','latex','fontsize',12);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
    subplot(236);imagesc(tau_33_LES(:,:,vizSlice3),c_tau);
    title('$\tau_{ww}$','interpreter','latex','fontsize',12);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;