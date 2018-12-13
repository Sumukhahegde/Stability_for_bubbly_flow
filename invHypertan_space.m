function [A,B]=invHypertan(nosmod,omega,T0,T1,T2,T4)

%
% Function to create Orr-Sommerfeld matrices (spacewise problem) using Chebyshev
% pseudospectral discretization for hyperbolic tangent profile
%
% Inviscid problem
%
% nosmod = number of modes
% alp = alpha
% beta = beta
% T0 = coordinate transformed zero'th derivative matrix
% T1 = coordinate transformed first derivative matrix
% T2 = coordinate transformed second derivative matrix
% T4 = coordinate transformed fourth derivative matrix

% imaginary number
zi=sqrt(-1);

% mean velocity
Nos = nosmod+1;

% indices and new coordinate variable
vec = (0:1:nosmod)';
chi = cos(pi*vec/nosmod);

% velocity
u = 0.5*(1 - chi);
ddu = chi.*(1 - chi.^2);

%lagrangian frequency
omega_L = omega - k*u;

B11 = zeros(size(T0));
B12 = (u*ones(1,length(u))).*T0;