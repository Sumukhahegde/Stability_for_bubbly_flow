%% Bubbly flow 4

clc;
clear all;
close all;


zi = sqrt(-1);


omegaB0 = [0.35,0.3,0.25];

for j=1:length(omegaB0)

omega = 0.01:0.002:0.5;
k1 = zeros(length(omega),length(omegaB0));
k2 = zeros(length(omega),length(omegaB0));


k1(1,j) = solve_for_k_bubbly_flow(0.01,0.01-0.01*zi,21,0.01,0.01);
k2(1,j) = solve_for_k_bubbly_flow(0.01,0.01-0.01*zi,omegaB0(j),0.003,0.32);

for i=2:length(k2)
    k1(i,j) = solve_for_k_bubbly_flow(omega(i),k1(i-1,j),21,0.01,0.01);
    k2(i,j) = solve_for_k_bubbly_flow(omega(i),k1(i,j),omegaB0(j),0.003,0.32);
end

%% Plotting

%plot(omega,-imag(k1(:,j)),'linewidth',2)
%hold on
plot(omega,-imag(k2(:,j)),'linewidth',2)
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
legend({'${\omega_{bo}}^*=0.35$','${\omega_{bo}}^*=0.3$','${\omega_{bo}}^*=0.25$','$single\ phase$'},'Interpreter','latex','FontSize',12,'Location','northeast')
xlabel('$\omega^*$','Interpreter','latex','FontSize',15)
ylabel('$-{k_i}^*$','Interpreter','latex','FontSize',15)
set(get(gca,'ylabel'),'rotation',0)