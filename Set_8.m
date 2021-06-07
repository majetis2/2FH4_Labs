clc; %clear the command line
clear; %remove all previous variables

Epsilono=8.85e-12; %use permittivity of air
D=2.0e-6;%the surface charge density

Number_of_r_Steps=50;%initialize discretization in the r direction     
Number_of_theta_Steps=50;%initialize discretization in the theta direction        
Number_of_phi_Steps=50;%initialize discretization in the phi direction
r_lower=2;%the lower boundary of r
r_upper=3;%the upper boundary of r
theta_lower=0;%the lower boundary of theta
theta_upper=pi;%the upper boundary of theta
phi_lower=0;%the lower boundary of phi
phi_upper=2*pi;%the upper boundary of phi
dr=(r_upper-r_lower)/Number_of_r_Steps;%the r increment    
dtheta=(theta_upper-theta_lower)/Number_of_theta_Steps;%the theta increment
dphi=(phi_upper-phi_lower)/Number_of_phi_Steps;%the phi increment


WE = 0; %initilaizing the energy inside the region to zero
for j=1:Number_of_theta_Steps
    for k=1:Number_of_r_Steps
        for i=1:Number_of_phi_Steps
            r= r_lower +dr/2+(i-1)*dr;%the r component of the center of agrid     
            theta= theta_lower +dtheta/2+(i-1)*dtheta;%the theta component of the center of agrid
            phi= phi_lower +dphi/2+(j-1)*dphi;%the phi component of the center of agrid
            E=(D/(Epsilono*r*r)); %Electric field formula
            dV=r*r*sin(theta)*dtheta*dphi*dr;%volume of current element
            dWE=0.5*Epsilono*E*E*dV;%energy stored in current element
            WE=WE+dWE;%get contribution to the total energy
        end
    end
end

disp(WE); %displaying the total energy 