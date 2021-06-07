% Snigdha Majeti - 400263044
% Exercise (Set 1)

R_1 = [1 2 3]; %Vector components of R1
R_2 = [3 2 1]; %Vector components of R2

%Dot product between R1 and R2

R_1_dot_R_2 = dot(R_1,R_2);

disp(R_1_dot_R_2);

%Projection of R1 on R2

R_2_dot_R_2 = dot(R_2,R_2); %Dot product between R2 and R2 

Proj_R_1_ON_R_2 = (R_1_dot_R_2/R_2_dot_R_2) * R_2; 

disp(Proj_R_1_ON_R_2);

%Angle between R1 and R2

Mag_R_1 = norm(R_1); %norm of vector R1
Mag_R_2 = norm(R_2); %norm of vector R2

COS_theta = (R_1_dot_R_2)/(Mag_R_1 * Mag_R_2); % cosine value of the angle
theta = acos(COS_theta);

disp(theta);
