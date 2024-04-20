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
   [U(:,:,i) V(:,:,i) W(:,:,i) uu(:,:,i) vv(:,:,i) ww(:,:,i)...
    U_x(:,:,i) U_y(:,:,i) U_z(:,:,i) V_x(:,:,i) V_y(:,:,i) V_z(:,:,i) W_x(:,:,i) W_y(:,:,i) W_z(:,:,i)...
    u_x2(:,:,i) u_y2(:,:,i) u_z2(:,:,i) v_x2(:,:,i) v_y2(:,:,i) v_z2(:,:,i) w_x2(:,:,i) w_y2(:,:,i) w_z2(:,:,i)...
    Sxx2(:,:,i) Syy2(:,:,i) Szz2(:,:,i) Sxy2(:,:,i) Sxz2(:,:,i) Syz2(:,:,i)...
    sxx2(:,:,i) syy2(:,:,i) szz2(:,:,i) sxy2(:,:,i) sxz2(:,:,i) syz2(:,:,i) wxy2(:,:,i) wxz2(:,:,i) wyz2(:,:,i)...
    Pm(:, :,i) p2(:, :, i)]=MeanAndVarSurface(Dat(:,:,i), nrays, nsamples,nz, h, Re, eps);
    processed=i-1
end


clear Dat i processed
%%
r=linspace(eps, 1-eps, nsamples);
z=linspace(0, h-eps, nz);

[R Z]=meshgrid(r,z);

%%
str=["MeanAndVarFieldOutputRe"+num2str(Re)+"A"+num2str(h)];
str=erase(str, ".");

save(str)

