function x = solve_for_k_single_phase(omega,k0)

zi = sqrt(-1);

[x,fval]=fsolve(@compute_error_on_upper_boundary,k0);

function error = compute_error_on_upper_boundary(k)

zi = sqrt(-1);
n = 5;

tspan = [-n n];
y0 = [zi 1.];
[t,y] = ode45(@(t,y) single_phase_system(t,y,omega,k), tspan, y0);

error = y(length(y(:,1)),1) + zi*y(length(y(:,1)),2)

end

end