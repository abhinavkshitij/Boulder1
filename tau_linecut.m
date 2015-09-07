figure();
hold on;
plot(x,tau_33_LES(vizSlice2,:,vizSlice3));
plot(x,tau_33_test(vizSlice2,:,vizSlice3));
axis([0 256 -0.1 0.1])
legend('LES','test');
title('Line cut at $(x,128,192)$ for $\tau_{ww},T_{ww}$','interpreter','latex','fontsize',12)
xlabel('x'); ylabel('$\tau_{ww},T_{ww}$','interpreter','latex','fontsize',12);
hold off;