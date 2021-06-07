clc; %clear the command line
clear; %remove all previous variables

Epsilono=8.854e-12; %use permittivity of air
D=2e-6;%the surface charge density
P=[0 0 1];%the position of the observation point
E=zeros(1,3);% initialize E=(0 ,0, 0)

Number_of_rho_Steps=1000;%initialize discretization in the rho direction        
Number_of_phi_Steps=1000;%initialize discretization in the phi direction
rho_lower=0;%the lower boundary of x
rho_upper=1;%the upper boundary of x
phi_lower=0;%the lower boundary of y
phi_upper=2*pi;%the upper boundary of y
drho=(rho_upper-rho_lower)/Number_of_rho_Steps;%the rho incrementor the width of a grid                  
dphi=(phi_upper-phi_lower)/Number_of_phi_Steps;%The phi incrementor the length of a grid
ds=drho*dphi;%the area of a single grid (the rho is included inside the loop)
dQ=D*ds;% the charge on a single grid

for j=1: Number_of_rho_Steps
    for i=1:Number_of_phi_Steps
        rho= rho_lower +drho/2+(i-1)*drho;%the rho component of the center of agrid     
        phi= phi_lower +dphi/2+(j-1)*dphi;%the phi component of the center of agrid
        R=P-[rho*cos(phi) rho*sin(phi) 0];%vector R is the vector seen from the center of the grid to the observation point
        RMag=norm(R);% magnitude of vector R
        E=E+(rho*dQ/(4*Epsilono*pi* RMag ^3))*R;% get contribution to the E field
    end
end
disp(E);