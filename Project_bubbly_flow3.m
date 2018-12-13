%% Bubbly flow 3

clc;
clear all;
close all;


zi = sqrt(-1);



alpha = 0.01;


R = 0.005;

omegaB0 = 3:17;
max_k1 = length(omegaB0);

for j=1:length(omegaB0)

omega = 0.01:0.005:0.5;
k = zeros(length(omega),length(omegaB0));


k(1,j) = solve_for_k_bubbly_flow(0.01,0.01-0.01*zi,omegaB0(j),alpha,R);

for i=2:length(k)
    k(i,j) = solve_for_k_bubbly_flow(omega(i),k(i-1,j),omegaB0(j),alpha,R);
end

max_k1(j) = max(-imag(k(:,j)));

end

%Plotting

plot(omegaB0,max_k1,'linewidth',2)
hold on

%% 

R = 0.01;

omegaB0 = 9:21;
max_k2 = length(omegaB0);

for j=1:length(omegaB0)

omega = 0.01:0.005:0.5;
k = zeros(length(omega),length(omegaB0));


k(1,j) = solve_for_k_bubbly_flow(0.01,0.01-0.01*zi,omegaB0(j),alpha,R);

for i=2:length(k)
    k(i,j) = solve_for_k_bubbly_flow(omega(i),k(i-1,j),omegaB0(j),alpha,R);
end

max_k2(j) = max(-imag(k(:,j)));

end

%%Plotting

plot(omegaB0,max_k2,'linewidth',2)
hold on


%% 

R = 0.02;

omegaB0 = 12:21;
max_k3 = length(omegaB0);

for j=1:length(omegaB0)

omega = 0.01:0.005:0.5;
k = zeros(length(omega),length(omegaB0));


k(1,j) = solve_for_k_bubbly_flow(0.01,0.01-0.01*zi,omegaB0(j),alpha,R);

for i=2:length(k)
    k(i,j) = solve_for_k_bubbly_flow(omega(i),k(i-1,j),omegaB0(j),alpha,R);
end

max_k3(j) = max(-imag(k(:,j)));

end

%%Plotting

plot(omegaB0,max_k3,'linewidth',2)
hold on
