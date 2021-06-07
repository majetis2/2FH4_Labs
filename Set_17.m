clc; %clear the command window
clear; %clear all variables
mu=4*pi*1e-7;
I=1.0;%current of the filament
phimin=0;%lowest y  corodinate of the coil
phimax=2*pi;%maxium y  corodinate of the coil
end1 = [0.01 0 0];
aN=[0 0 1];% direction normal to the surface of the coil
NumberOfphiSteps=200;%number of increasing steps of the coil area along the phi direction
NumberOfrhoSteps=200;%number of increasing steps of the coil area along the rho direction
Number_of_Segments=1750;
dphi_s=(phimax-phimin)/Number_of_Segments;% area increment along the phi direction
rhomin=0;%lowest rho corodinate of the coil
rhomax=0.04;%maxium rho corodinate of the coil
dphi=(phimax-phimin)/NumberOfphiSteps;% area increment along the phi direction
drho=(rhomax-rhomin)/NumberOfrhoSteps;% area increment along the rhi direction
flux=0;%flux through the coil
dS=dphi*drho;%increament area
zp=0.1;%x coordinate is always 0.1 on the coil
for m=1:NumberOfphiSteps %repeat for all points in the phi direction
    for n=1:NumberOfrhoSteps %repeat for allpoints in the rho direction
        phip=phimin+0.5*dphi+(m-1)*dphi;%phi coordinate of current surface element
        rhop=rhomin+0.5*drho+(n-1)*drho;%rho coordinate of current surface element
        Rp=[rhop*cos(phip) rhop*sin(phip) zp];%the position of current surface element 
        B=[0 0 0];%the magnetic field at current surface element
        for i=1:Number_of_Segments %repeat for all divisions in the phi direction
            phip_s=phimin+0.5*dphi_s+(i-1)*dphi_s;
            dL=[0.01*cos(phip_s) 0.01*sin(phip_s) 0]-end1;
            C=end1+0.5*dL +(i-1)*dL;  %center of current subsection
            R=Rp-C; %vector pointing from current subsection to the current observation point
            norm_R=norm(R); %get the distance between the current surface element and the observation point
            R_Hat=R/norm_R; %unit vector in the direction of R
            dH=(I/(4*pi*norm_R*norm_R))*cross(dL,R_Hat); %this is the contribution from current element
            B=B+mu*dH;
        end%end of i loop
        dflux=rhop*dS*dot(B,aN);%flux through current surface element
        flux=flux+dflux;%get contribution to the total flux
    end%end of n loop
end% end of m loop
M=flux/I;% the mutual inductance
disp(M);