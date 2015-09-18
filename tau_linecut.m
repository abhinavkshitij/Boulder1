figure();
hold on;
plot(x,tau_11_LES(vizSlice1,:,vizSlice3),'.');
plot(x,tau_11_test(vizSlice1,:,vizSlice3),'.');
%scatter(x,E_LES(vizSlice1,:,vizSlice3));
%scatter(x,E_test(vizSlice1,:,vizSlice3));

axis([0 256 -50 50]);
%axis([0 256 0 200])
legend('LES','test');
%title('Line cut at $(x,128,192)$ for $\tau_{ww},T_{ww}$','interpreter','latex','fontsize',12)
%title('Kinetic energy fields');

xlabel('x'); ylabel('$\tau_{ww},T_{ww}$','interpreter','latex','fontsize',12);
%ylabel('$KE_{LES},KE_{test}$','interpreter','latex','fontsize',12);
hold off;