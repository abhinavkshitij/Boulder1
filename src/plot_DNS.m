
figure();
%colormap jet

T= [ 0, 0,   143        %// dark blue
     0, 0,   255        %// blue
     0, 255, 255        %// cyan
     255, 255, 0        %// yellow
     255, 0, 0          %// red
     128, 0, 0]./255;    %// dark red
 
 x = [0
     50
     70
     150
     200
     240  ]; %%  Change the CData range here %% 
 
 map = interp1(x/240,T,linspace(0,1,240));
 
 colormap(map)
    subplot(331); imagesc(U1_DNS(:,:,vizSlice1),clims);
    title('$u_1$','interpreter','latex','fontsize',12);
    h = gca; h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    ylabel('z = 64');
    axis square;
    subplot(332);imagesc(U2_DNS(:,:,vizSlice1),clims);
    title('$u_2$','interpreter','latex','fontsize',12);
    h=gca; h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    subplot(333);imagesc(U3_DNS(:,:,vizSlice1),clims);
    title('$u_3$','interpreter','latex','fontsize',12);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
    subplot(334);imagesc(U1_DNS(:,:,vizSlice2),clims);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    ylabel('z = 128');
    axis square;
    subplot(335);imagesc(U2_DNS(:,:,vizSlice2),clims);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    subplot(336);imagesc(U3_DNS(:,:,vizSlice2),clims);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    
    subplot(337);imagesc(U1_DNS(:,:,vizSlice3),clims);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    ylabel('z = 192');
    axis square;
    subplot(338);imagesc(U2_DNS(:,:,vizSlice3),clims);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
    subplot(339);imagesc(U3_DNS(:,:,vizSlice3),clims);
    h=gca;h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    axis square;
   