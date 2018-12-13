%% Single phase limit

clc;
clear all;
close all;


zi = sqrt(-1);


omega = 0.01:0.01:0.5;
k = zeros(size(omega));


k(1) = solve_for_k_single_phase(0.01,0.01-0.01*zi);

for i=2:length(k)
    k(i) = solve_for_k_single_phase(omega(i),k(i-1));
end

%% Plotting

plot(omega,-imag(k),'b-','linewidth',2)
hold on

michalke_omega = [0.05,0.075,0.1,0.125,0.15,0.175,0.2,0.225,0.25,0.3,0.35,0.4,0.45,0.5];
michalke_ki = [-0.054846,-0.086273,-0.120373,-0.156126,-0.190165,-0.215913,-0.227691,-0.226142,-0.215502,-0.180226,-0.137151,-0.091618,-0.045556,0];

plot(michalke_omega,-michalke_ki,'ro','MarkerSize',10)
title('$Verification\ for\ single\ phase\ (C_M \rightarrow \infty)$','Interpreter','latex','FontSize',18)
legend({'$current\ solver$','$Michalke,JFM,(1965)$'},'Interpreter','latex','FontSize',12,'Location','south')
xlabel('$\omega^*$','Interpreter','latex','FontSize',15)
ylabel('$-{k_i}^*$','Interpreter','latex','FontSize',15)
set(get(gca,'ylabel'),'rotation',0)
