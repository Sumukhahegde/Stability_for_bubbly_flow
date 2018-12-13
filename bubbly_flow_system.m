function dydt = bubbly_flow_system(t,y,omega,k,omegaB0,alpha,R)

zi = sqrt(-1);

%velocity
u = 0.5*(1 - tanh(t));

%first derivative of the velocity
du = -0.5/(cosh(t).^2);

%second derivative of the velocity
ddu = tanh(t)/(cosh(t).^2);

%Lagrangian frequency
omegaL = omega - k*u;

%square of inverse of the sound speed of the mixture
cm_inv_sq = mixture_speed_of_sound_inv_square(omegaB0,omegaL,alpha,R);


dydt = [zi*k*y(2) - zi*ddu*y(2)/omegaL - zi*du*cm_inv_sq*(zi*omegaL*y(1) - du*y(2))/k; -zi*k*y(1) + omegaL*cm_inv_sq*(zi*omegaL*y(1) - du*y(2))/k];
