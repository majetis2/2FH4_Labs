clc; %clear the command line
clear; %remove all previous variables

V=0; %initialize volume of the closed surface to 0 
S1=0; %initialize the area of S1 to 0
S2=0; %initialize the area of S2 to 0
S3=0; %initialize the area of S3 to 0
S4=0; %initialize the area of S4 to 0
S5=0; %initialize the area of S5 to 0

r=0;%initialize r to the its lower boundary  
theta=pi/4;%initialize theta to the its lower boundary  
phi=pi/4;%initialize phi to the its lower boundary


Number_of_r_Steps=100; %initialize the r discretization
Number_of_theta_Steps=100;%initialize the theta discretization
Number_of_phi_Steps=100;%initialize the theta discretization
dr=(2-0)/Number_of_r_Steps;%The r increment
dtheta=(pi/2-pi/4)/Number_of_theta_Steps;%The theta increment
dphi=(pi/2-pi/4)/Number_of_phi_Steps;%The phi increment

%%the following routine calculates the volume of the enclosed surface  
for k=1:Number_of_r_Steps
    for j=1:Number_of_theta_Steps
        for i=1:Number_of_phi_Steps
            V=V+(r*r*sin(theta)*dr*dtheta*dphi);%add contribution to the volume
        end
        theta=theta+dtheta;%r increases each time when phi has been traveled from its lower boundary to its upper boundary
    end
    theta=pi/4;%reset theta to its lower boundary end
    r=r+dr;%r increases each time when phi has been traveled from its lower boundary to its upper boundary 
end
r = 0;

%%the following routine calculates the area of S1

r_upper=2;

for k=1:Number_of_theta_Steps
    for i=1:Number_of_phi_Steps
        S1=S1+(r_upper*r_upper*sin(theta)*dtheta*dphi);%get contribution to the the area of S1 
    end
    theta=theta+dtheta;
end
theta=pi/4;

%%the following routine calculates the area of S2 and S3
for k=1:Number_of_r_Steps
    for j=1:Number_of_theta_Steps
        S2=S2+(r*dtheta*dr);%get contribution to the the area of S2 
    end
    r=r+dr;
end
r=0;
S3=S2;

theta_lower = pi/4;
theta_upper = pi/2;

%%the following routine calculates the area of S4 and S5
for j=1:Number_of_r_Steps
    for i=1:Number_of_phi_Steps 
        S4=S4+(r*sin(theta_lower)*dr*dphi);%get contribution to the the area of S4
        S5=S5+(r*sin(theta_upper)*dr*dphi);%get contribution to the the area of S5
    end
    r=r+dr;
end


S=S1+S2+S3+S4+S5;

disp("The volume of the closed surface is: " + V);
disp("The area of enclosed surface is: " + S);


