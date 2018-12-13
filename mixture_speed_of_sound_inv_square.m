function cm_inv_sq = mixture_speed_of_sound_inv_square(omegaB0,omega,alpha,R)

% omegaB0 - bubble natural frequency under isothermal conditions
% omega - excitation frequency (or Lagrangian excitation frequency)
% alpha - void fraction of the bubbles
% R - Radius of the bubbles

% This function returns the square of inverse of the sound speed of the mixture

zi = sqrt(-1);

c = 1531.;          %sound speed of water
gamma = 1.4;        %polytropic coefficient for the air
rho = 1485.;        %density of water
mu = 0.001;         %viscosity of water
sigma = 0.0728;     %air-water surface-tension coefficient

%square of low frequency sound speed for bubbly flow in incompressible liquid
cm0_sq = (omegaB0^2.)*(R^2.)/(3.*alpha*(1. - alpha));

%static pressure
pb0 = (cm0_sq*rho*R^2. + 2.*sigma/R)/3.;

%bubble natural frequency for adiabatic conditions
omegaB = (3.*pb0*gamma - 2.*sigma/R)/(rho*R^2.);

%damping coefficient
lambda = (omega^2.)*R/c - 4.*mu/(rho*R^2.);

%cm_inv_sq = (omegaB0^2)*(1. + zi*omega*R/c)/(cm0_sq*(omegaB^2. - omega^2. - zi*omega*lambda)) + (1. - alpha)/(c^2.);

%uses omegaB for omegaB and not omegaB0
%cm_inv_sq = (3.*alpha*(1.-alpha))*(1. + zi*omega*R/c)/((R^2.)*(omegaB^2. - omega^2. - zi*omega*lambda)) + (1. - alpha)/(c^2.);

%uses omegaB0 for omegaB
cm_inv_sq = (3.*alpha*(1.-alpha))*(1. + zi*omega*R/c)/((R^2.)*(omegaB0^2. - omega^2. - zi*omega*lambda)) + (1. - alpha)/(c^2.);


