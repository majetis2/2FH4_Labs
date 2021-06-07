clc;                                             %clear the command line
clear;                                           %removing all the previous variables

% initializing the variables
eo=1e-9/(36*pi);                                 % the permittivity in free space
Q=5e-9;                                          % charges on the positive plate
S=0.01*2*pi;                                     % area of the capacitor (rho defined inside the for loop)(Area = 0.01*2*pi*rho)
Ds=Q/S;                                          % electric flux density
rho_inner = 1.0*10^-3;                           % lower boundary of rho
rho_outer = 5.0*10^-3;                           % upper boundary of rho

Number_of_rho_steps=100;                         % number of steps in the rho direction 
drho=(rho_outer-rho_inner)/Number_of_rho_steps;  % rho increment

% performing the calculations
W=0;                                            % initializing the total energy to zero
for j=1:Number_of_rho_steps
    rho=rho_inner +drho/2+(j-1)*drho;           % the rho component of the centre of a grid
    er=10^3*rho;                                % current relative permittivity
    dW=0.5*Ds*Ds*S*drho/(er*eo*rho);            % energy stored inside the coaxial cable 
    W=W+dW;                                     % getting contribution of the total energy
end
    
C=Q*Q/(2*W);                                    % calculating capacitance
disp(C + " F");                                 % displaying the calculated capacitance