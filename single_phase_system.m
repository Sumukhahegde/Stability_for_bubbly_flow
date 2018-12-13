function dydt = single_phase_system(t,y,omega,k)

zi = sqrt(-1);

u = 0.5*(1 - tanh(t));
ddu = tanh(t)/(cosh(t).^2);

omegaL = omega - k*u;


dydt = [zi*k*y(2) - zi*ddu*y(2)/omegaL; -zi*k*y(1)];
