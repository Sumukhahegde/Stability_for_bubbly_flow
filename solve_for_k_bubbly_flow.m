function x = solve_for_k_bubbly_flow(omega,k0,omegaB0,alpha,R)

zi = sqrt(-1);

[x,fval]=fsolve(@compute_error_on_upper_boundary,k0);





function error = compute_error_on_upper_boundary(k)

zi = sqrt(-1);

%2n is the domain size
n = 5;

%domain
tspan = [-n n];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%lower boundary
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%velocity
u0 = 0.5*(1 - tanh(-n));

%Lagrangian frequency
omegaL0 = omega - k*u0;

%square of inverse of the sound speed of the mixture
cm_inv_sq0 = mixture_speed_of_sound_inv_square(omegaB0,omegaL0,alpha,R);

%boundary condition
y0 = [zi*k/sqrt((k^2. - (omegaL0^2.)*cm_inv_sq0)) 1.];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%integrate
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[t,y] = ode45(@(t,y) bubbly_flow_system(t,y,omega,k,omegaB0,alpha,R), tspan, y0);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%upper boundary
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%velocity
u1 = 0.5*(1 - tanh(n));

%Lagrangian frequency
omegaL1 = omega - k*u1;

%square of inverse of the sound speed of the mixture
cm_inv_sq1 = mixture_speed_of_sound_inv_square(omegaB0,omegaL1,alpha,R);

%error
error = y(length(y(:,1)),1) + zi*y(length(y(:,1)),2)*k/sqrt((k^2. - (omegaL1^2.)*cm_inv_sq1));

end

end