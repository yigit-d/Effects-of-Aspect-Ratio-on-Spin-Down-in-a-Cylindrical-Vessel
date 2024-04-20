clear
clc
close all


%% copy from file that generated sampleEB points
nsamples=300;
nrays=40;
nz=50;
eps=0.0002; %edge tolerance, data overflows
h=0.1; 

Re=12000;



%%
t=[0:30];
for i=[1:length(t)]
PTemp=csvread(['./sampleEBA01/' num2str(t(i)) '/data_p.csv'], 1);
Dat(:,1:4,i)=PTemp;
UTemp=csvread(['./sampleEBA01/' num2str(t(i)) '/data_U.csv'], 1);
Dat(:,5:7,i)=UTemp(:, 4:6);
GradUTemp=csvread(['./sampleEBA01/' num2str(t(i)) '/data_grad(U).csv'], 1);
Dat(:,8:16,i)=GradUTemp(:, 4:12);

read=i-1
end

clear GradUTemp PTemp UTemp i read


%%
for i=[1:length(t)]
   [K(:,:,i) K_x(:,:,i) K_y(:,:,i) K_z(:,:,i)...
    k(:,:,i) k_x(:,:,i) k_y(:,:,i) k_z(:,:,i)...
    epsilon_m(:,:,i) eps_m_x(:,:,i) eps_m_y(:,:,i) eps_m_z(:,:,i)...
    epsilon_t(:,:,i) eps_t_x(:,:,i) eps_t_y(:,:,i) eps_t_z(:,:,i)...
    P(:,:,i) P_x(:,:,i) P_y(:,:,i) P_z(:,:,i)]=EBSurface(Dat(:,:,i), nrays, nsamples,nz, h, Re, eps);
    processed=i-1
end


clear Dat i processed
%%
r=linspace(eps, 1-eps, nsamples);
z=linspace(0, h-eps, nz);

[R Z]=meshgrid(r,z);



str=["EBFieldOutputRe"+num2str(Re)+"A"+num2str(h)];
str=erase(str, ".");

save(str)


