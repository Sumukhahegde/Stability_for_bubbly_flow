%% Bubbly flow 1

clc;
clear all;
close all;


zi = sqrt(-1);


omegaB0 = [21];

for j=1:length(omegaB0)

omega = 0.01:0.005:0.45;
k = zeros(length(omega),length(omegaB0));


k(1,j) = solve_for_k_bubbly_flow(0.01,0.01-0.01*zi,omegaB0(j),0.01,0.01);

for i=2:length(k)
    k(i,j) = solve_for_k_bubbly_flow(omega(i),k(i-1,j),omegaB0(j),0.01,0.01);
end

%% Plotting

plot(omega,-imag(k(:,j)),'linewidth',2)
hold on

end



%%%


omegaB0 = [15];

for j=1:length(omegaB0)

omega = 0.01:0.005:0.4;
k = zeros(length(omega),length(omegaB0));


k(1,j) = solve_for_k_bubbly_flow(0.01,0.01-0.01*zi,omegaB0(j),0.01,0.01);

for i=2:length(k)
    k(i,j) = solve_for_k_bubbly_flow(omega(i),k(i-1,j),omegaB0(j),0.01,0.01);
end

%% Plotting

plot(omega,-imag(k(:,j)),'linewidth',2)
hold on

end



omegaB0 = [12];

for j=1:length(omegaB0)

omega = 0.01:0.005:0.35;
k = zeros(length(omega),length(omegaB0));


k(1,j) = solve_for_k_bubbly_flow(0.01,0.01-0.01*zi,omegaB0(j),0.01,0.01);

for i=2:length(k)
    k(i,j) = solve_for_k_bubbly_flow(omega(i),k(i-1,j),omegaB0(j),0.01,0.01);
end

%% Plotting

plot(omega,-imag(k(:,j)),'linewidth',2)
hold on

end





omegaB0 = [9];

for j=1:length(omegaB0)

omega = 0.01:0.005:0.15;
k = zeros(length(omega),length(omegaB0));


k(1,j) = solve_for_k_bubbly_flow(0.01,0.01-0.01*zi,omegaB0(j),0.01,0.01);

for i=2:length(k)
    k(i,j) = solve_for_k_bubbly_flow(omega(i),k(i-1,j),omegaB0(j),0.01,0.01);
end

%% Plotting

plot(omega,-imag(k(:,j)),'linewidth',2)
hold on

end



omega = 0.01:0.01:0.5;
k = zeros(size(omega));


k(1) = solve_for_k_single_phase(0.01,0.01-0.01*zi);

for i=2:length(k)
    k(i) = solve_for_k_single_phase(omega(i),k(i-1));
end

%%Plotting

plot(omega,-imag(k),'b-','linewidth',2)
hold on



title('$Effect\ of\ bubble\ resonance\ frequency$','Interpreter','latex','FontSize',18)
legend({'${\omega_{bo}}^*=21$','${\omega_{bo}}^*=15$','${\omega_{bo}}^*=12$','${\omega_{bo}}^*=9$','$single\ phase$'},'Interpreter','latex','FontSize',12,'Location','northeast')
xlabel('$\omega^*$','Interpreter','latex','FontSize',15)
ylabel('$-{k_i}^*$','Interpreter','latex','FontSize',15)
set(get(gca,'ylabel'),'rotation',0)




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