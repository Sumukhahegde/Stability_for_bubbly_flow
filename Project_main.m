%% Project

clc;
close all;
%clear all;

zi=sqrt(-1);

% number of modes
nosmod = 100;

% generate Chebyshev differentiation matrices
  [D0,D1,D2,D3,D4] = Dmat(nosmod);
  
% coordinate transform the differentiation matrices
  [T0,T1,T2,T4] = Ctransform(nosmod,D0,D1,D2,D3,D4);

  
  omega = 0.206692;
  
  
  
  
zi=sqrt(-1);
k = 0.4 - zi*0.2;
%k = kr(1) + ki(1)*zi;
  
 
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

er=-200*zi;


% %setup A and B matrices
% B11 = zeros(size(T0));
% B12 = (omega_L*ones(1,length(omega_L))).*T0;
% B21 = zi*T0;
% B22 = zeros(size(T0));
% 
% A11 = (omega_L*ones(1,length(omega_L))).*T1;
% A12 = zi*(ddu*ones(1,length(ddu))).*T0;
% A21 = zeros(size(T0));
% A22 = -T1;
% 
% A11=[T1(1,:); A11(2:Nos-1,:); T1(Nos,:)];
% A12=[er*T1(1,:); A12(2:Nos-1,:); er*T1(Nos,:)];
% A21=[er*T1(1,:); A21(2:Nos-1,:); er*T1(Nos,:)];
% A22=[-T1(1,:); A22(2:Nos-1,:); -T1(Nos,:)];
% 
% B11=[er*T0(1,:); B11(2:Nos-1,:); er*T0(Nos,:)];
% B12=[zi*T0(1,:); B12(2:Nos-1,:); zi*T0(Nos,:)];
% B21=[zi*T0(1,:); B21(2:Nos-1,:); zi*T0(Nos,:)];
% B22=[er*T0(1,:); B22(2:Nos-1,:); er*T0(Nos,:)];
% 
% 
% % combine all the blocks
% A=[A11 A12; A21 A22];
% B=[B11 B12; B21 B22];
% 
% [xs,es] = iord2(A,B);
%   
% format long;
% kr = real(es);
% ki = imag(es);
% 
% ki(1)



A = -(u*ones(1,length(u))).*T0;
B = omega*T0;
C = (u*ones(1,length(u))).*T2 - (ddu*ones(1,length(ddu))).*T0;
D = -omega*T2;

A=[er*T0(1,:); er*T1(1,:); A(3:Nos-2,:); er*T1(Nos,:); er*T0(Nos,:)];
B=[er*T0(1,:); er*T1(1,:); B(3:Nos-2,:); er*T1(Nos,:); er*T0(Nos,:)];
D=[er*T0(1,:); er*T1(1,:); D(3:Nos-2,:); er*T1(Nos,:); er*T0(Nos,:)];
C=[T0(1,:); T1(1,:); C(3:Nos-2,:); T1(Nos,:); T0(Nos,:)];


[X,e] = polyeig(D,C,B,A);


%e=diag(e);
[eimag,is]=sort(-imag(e(1:101)));
es1=e(is);
[eimag,is]=sort(-imag(e(102:202)));
es2=e(is);
[eimag,is]=sort(-imag(e(203:303)));
es3=e(is);
%xs=X(:,is);




