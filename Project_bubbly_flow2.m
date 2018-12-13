%% Bubbly flow 2

clc;
clear all;
close all;


zi = sqrt(-1);



alpha = 0.001;

omegaB0 = 3:12;
max_k1 = length(omegaB0);

for j=1:length(omegaB0)

omega = 0.01:0.005:0.5;
k = zeros(length(omega),length(omegaB0));


k(1,j) = solve_for_k_bubbly_flow(0.01,0.01-0.01*zi,omegaB0(j),alpha,0.01);

for i=2:length(k)
    k(i,j) = solve_for_k_bubbly_flow(omega(i),k(i-1,j),omegaB0(j),alpha,0.01);
end

max_k1(j) = max(-imag(k(:,j)));

end

%Plotting

plot(omegaB0,max_k1,'linewidth',2)
hold on

%% 

alpha = 0.005;

omegaB0 = 7:21;
max_k2 = length(omegaB0);

for j=1:length(omegaB0)

omega = 0.01:0.005:0.5;
k = zeros(length(omega),length(omegaB0));


k(1,j) = solve_for_k_bubbly_flow(0.01,0.01-0.01*zi,omegaB0(j),alpha,0.01);

for i=2:length(k)
    k(i,j) = solve_for_k_bubbly_flow(omega(i),k(i-1,j),omegaB0(j),alpha,0.01);
end

max_k2(j) = max(-imag(k(:,j)));

end

%%Plotting

plot(omegaB0,max_k2,'linewidth',2)
hold on


%% 

alpha = 0.01;

omegaB0 = 8:21;
max_k3 = length(omegaB0);

for j=1:length(omegaB0)

omega = 0.01:0.005:0.5;
k = zeros(length(omega),length(omegaB0));


k(1,j) = solve_for_k_bubbly_flow(0.01,0.01-0.01*zi,omegaB0(j),alpha,0.01);

for i=2:length(k)
    k(i,j) = solve_for_k_bubbly_flow(omega(i),k(i-1,j),omegaB0(j),alpha,0.01);
end

max_k3(j) = max(-imag(k(:,j)));

end

%%Plotting

plot(omegaB0,max_k3,'linewidth',2)
hold on


title('$Effect\ of\ void\ fraction$','Interpreter','latex','FontSize',18)
legend({'$\alpha=0.001$','$\alpha=0.005$','$\alpha=0.01$'},'Interpreter','latex','FontSize',12,'Location','southeast')
xlabel('${\omega_{bo}}^*$','Interpreter','latex','FontSize',15)
y=ylabel('$-{k_i}^*_{MAX}$','Interpreter','latex','FontSize',15)
set(get(gca,'ylabel'),'rotation',0)
set(y, 'Units', 'Normalized', 'Position', [-0.15, 0.5, 0]);



% 
% michalke_omega = [0.05,0.075,0.1,0.125,0.15,0.175,0.2,0.225,0.25,0.3,0.35,0.4,0.45,0.5];
% michalke_ki = [-0.054846,-0.086273,-0.120373,-0.156126,-0.190165,-0.215913,-0.227691,-0.226142,-0.215502,-0.180226,-0.137151,-0.091618,-0.045556,0];
% 
% plot(michalke_omega,-michalke_ki,'ro','MarkerSize',10)
% title('$Verification\ for\ single\ phase\ (C_M \rightarrow \infty)$','Interpreter','latex','FontSize',18)
% legend({'$current\ solver$','$Michalke,JFM,(1965)$'},'Interpreter','latex','FontSize',12,'Location','south')
% xlabel('$\omega$','Interpreter','latex','FontSize',15)
% ylabel('$k_i$','Interpreter','latex','FontSize',15)

k1 = solve_for_k_single_phase(0.2,0.4-0.2*zi);
k2 = solve_for_k_bubbly_flow(0.2,0.4-0.1*zi,21.,0.01,0.01);