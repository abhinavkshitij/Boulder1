

figure();
colormap jet;
  subplot(331);imagesc(U1_test(:,:,vizSlice1),clims);
    title('$\widehat{\widetilde{u_1}}$','interpreter','latex','fontsize',12);
    h = gca; h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    ylabel('z = 64');
    axis square;
  subplot(332);imagesc(U2_test(:,:,vizSlice1),clims);
    title('$\widehat{\widetilde{u_2}}$','interpreter','latex','fontsize',12);
    h=gca; h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
  subplot(333);imagesc(U3_test(:,:,vizSlice1),clims);
    title('$\widehat{\widetilde{u_3}}$','interpreter','latex','fontsize',12);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
  subplot(334);imagesc(U1_test(:,:,vizSlice2),clims);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    ylabel('z = 128');
    axis square;
  subplot(335);imagesc(U2_test(:,:,vizSlice2),clims);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
  subplot(336);imagesc(U3_test(:,:,vizSlice2),clims);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
  subplot(337);imagesc(U1_test(:,:,vizSlice3),clims);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid]; 
    ylabel('z = 192');
    axis square;
  subplot(338);imagesc(U2_test(:,:,vizSlice3),clims);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
  subplot(339);imagesc(U3_test(:,:,vizSlice3),clims);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;