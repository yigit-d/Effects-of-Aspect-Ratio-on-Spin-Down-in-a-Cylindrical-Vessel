
function [K K_x K_y K_z...
    k k_x k_y k_z...
    epsilon_m eps_m_x eps_m_y eps_m_z...
    epsilon_t eps_t_x eps_t_y eps_t_z...
    P P_x P_y P_z]=EBProfile(Dat, nrays, nsamples, Re, eps)





r=linspace(0+eps,1-eps,nsamples);
theta=linspace(0, 2*pi*(1-1/nrays) ,nrays);

Dat(:,17)=Dat(:,1).^2+Dat(:,2).^2; %add radius column
Dat=sortrows(Dat, 17); %sort by increasing radius


b=atan2(Dat(:,2),Dat(:,1));
c=cos(b);
s=sin(b);

DatCyl(:,1:4)=Dat(:,1:4);

DatCyl(:, 5)=Dat(:,5).*cos(b)+Dat(:,6).*sin(b);
DatCyl(:, 6)=-Dat(:,5).*sin(b)+Dat(:,6).*cos(b);
DatCyl(:, 7)=Dat(:,7);

d8=Dat(:,8);
d9=Dat(:,9);
d10=Dat(:,10);
u_x=Dat(:,11);
v_x=Dat(:,12);
w_x=Dat(:,13);
d14=Dat(:,14);
d15=Dat(:,15);
d16=Dat(:,16);




%%

DatCyl(:,8) =c.*(c.*d8 + s.*u_x) + s.*(c.*d9 + s.*v_x);
DatCyl(:,9) =c.*(c.*d9 + s.*v_x) - s.*(c.*d8 + s.*u_x);
DatCyl(:,10)=c.*d10 + s.*w_x;

DatCyl(:,11)=c.*(c.*u_x - s.*d8) + s.*(c.*v_x - s.*d9);
DatCyl(:,12)=c.*(c.*v_x - s.*d9) - s.*(c.*u_x - s.*d8);
DatCyl(:,13)=c.*w_x - s.*d10;

DatCyl(:,14)=c.*d14 + s.*d15;
DatCyl(:,15)=c.*d15 - s.*d14;
DatCyl(:,16)=d16;

DatCyl(:,17)=DatCyl(:,1).^2+DatCyl(:,2).^2; %add radius column
%%
Dat=DatCyl;

clear b c d10 u_x v_x w_x d14 d15 d16 d8 d9 s DatCyl
%%
%data structure for a given cross section: each row is a set of samples at the same radius

for i=[1:nsamples]

    pp(:,i)=Dat( (i-1)*nrays+1:i*nrays   , 4);

    Up(:,i)=Dat( (i-1)*nrays+1:i*nrays   , 5);
    Vp(:,i)=Dat( (i-1)*nrays+1:i*nrays   , 6);
    Wp(:,i)=Dat( (i-1)*nrays+1:i*nrays   , 7);

    U_x_p(:,i)=Dat( (i-1)*nrays+1:i*nrays   , 8);
    V_x_p(:,i)=Dat( (i-1)*nrays+1:i*nrays   , 9);
    W_x_p(:,i)=Dat( (i-1)*nrays+1:i*nrays   , 10);

    U_y_p(:,i)=Dat( (i-1)*nrays+1:i*nrays   , 11);
    V_y_p(:,i)=Dat( (i-1)*nrays+1:i*nrays   , 12);
    W_y_p(:,i)=Dat( (i-1)*nrays+1:i*nrays   , 13);

    U_z_p(:,i)=Dat( (i-1)*nrays+1:i*nrays   , 14);
    V_z_p(:,i)=Dat( (i-1)*nrays+1:i*nrays   , 15);
    W_z_p(:,i)=Dat( (i-1)*nrays+1:i*nrays   , 16);
end
clear Dat

%% take means

p_mean=mean(pp,1);
U=mean(Up, 1);
V=mean(Vp, 1);
W=mean(Wp, 1);

U_x=mean(U_x_p, 1);
V_x=mean(V_x_p, 1);
W_x=mean(W_x_p, 1);

U_y=mean(U_y_p, 1);
V_y=mean(V_y_p, 1);
W_y=mean(W_y_p, 1);

U_z=mean(U_z_p, 1);
V_z=mean(V_z_p, 1);
W_z=mean(W_z_p, 1);

%%

pfluc=pp -p_mean .* ones([nrays nsamples]);

u=Up- U .* ones([nrays nsamples]);
v=Vp- V .* ones([nrays nsamples]);
w=Wp- W .* ones([nrays nsamples]);

u_x= U_x_p - U_x .* ones([nrays nsamples]);
v_x= V_x_p - V_x .* ones([nrays nsamples]);
w_x= W_x_p - W_x .* ones([nrays nsamples]);

u_y= U_y_p - U_y .* ones([nrays nsamples]);
v_y= V_y_p - V_y .* ones([nrays nsamples]);
w_y= W_y_p - W_y .* ones([nrays nsamples]);

u_z= U_z_p - U_z .* ones([nrays nsamples]);
v_z= V_z_p - V_z .* ones([nrays nsamples]);
w_z= W_z_p - W_z .* ones([nrays nsamples]);

%% calculate energy budgets

nu=1/Re;
rho=1;

K_x=1/2*U.^2;
K_y=1/2*V.^2;
K_z=1/2*W.^2;


K=1/2*(U.^2+V.^2+W.^2);

k_x=1/2*mean(u.^2,1);
k_y=1/2*mean(v.^2,1);
k_z=1/2*mean(w.^2,1);


k=1/2*mean( u.^2+v.^2+w.^2, 1);


%%
P_x= mean(u.*u,1).*U_x + mean(u.*v,1).*U_y + mean(u.*w,1).*U_z;
P_y= mean(v.*u,1).*V_x + mean(v.*v,1).*V_y + mean(v.*w,1).*V_z;
P_z= mean(w.*u,1).*W_x + mean(w.*v,1).*W_y + mean(w.*w,1).*W_z;

P= mean(u.*u,1).*U_x + mean(u.*v,1).*U_y + mean(u.*w,1).*U_z...
+mean(v.*u,1).*V_x + mean(v.*v,1).*V_y + mean(v.*w,1).*V_z...
+mean(w.*u,1).*W_x + mean(w.*v,1).*W_y + mean(w.*w,1).*W_z;


%P=P_x+P_y+P_z;



%%
Sxx2=(U_x).^2;
Syy2=(V_y).^2;
Szz2=(W_z).^2;

Sxy2=1/4*(U_y+V_x).^2;
Sxz2=1/4*(U_z+W_x).^2;
Syz2=1/4*(V_z+W_y).^2;

%%
eps_m_x=4*nu*(Sxx2+Sxy2+Sxz2);
eps_m_y=4*nu*(Sxy2+Syy2+Syz2);
eps_m_z=4*nu*(Sxz2+Syz2+Szz2);

epsilon_m=eps_m_x+eps_m_y+eps_m_z;




%%
sxx2=mean(u_x.^2 ,1);
syy2=mean(v_y.^2 ,1);
szz2=mean(w_z.^2 ,1);


sxy2=1/4*mean( (u_y+v_x).^2 ,1);
sxz2=1/4*mean( (u_z+w_x).^2 ,1);
syz2=1/4*mean( (v_z+w_y).^2 ,1);

%%
eps_t_x=4*nu*(sxx2+sxy2+sxz2);
eps_t_y=4*nu*(sxy2+syy2+syz2);
eps_t_z=4*nu*(sxz2+syz2+szz2);

epsilon_t=eps_t_x+eps_t_y+eps_t_z;



%%


% epsilon_t=2*nu*(   mean(s11.^2 ,1)+mean(s12.^2 ,1)+mean(s13.^2 ,1)...
%              +   mean(s21.^2 ,1)+mean(s22.^2 ,1)+mean(s23.^2 ,1)...
%              +   mean(s31.^2 ,1)+mean(s32.^2 ,1)+mean(s33.^2 ,1)...
%              );
% 
% 
% epsilon_m=2*nu*(  D11.^2+D12.^2+D13.^2 ...
%              +  D21.^2+D22.^2+D23.^2 ...
%              +  D31.^2+D32.^2+D33.^2 ...
%              );



%% yd yd
% epsilon_t=nu* (mean( d11.^2 + d12.^2 + d13.^2 + d21.^2 + d22.^2 + d23.^2 + d31.^2 + d32.^2 + d33.^2 ...
%     + d11 .*d11 + d12.*d21 + d13.*d31 + d21.*d12 + d22.*d22 + d23.*d32 + d31.*d13 + d32.*d23 + d33.*d33 ,1 ));
% 
% 
% epsilon_m=nu*(mean(D11.^2+D12.^2+D13.^2+D21.^2+D22.^2+D23.^2+D31.^2+D32.^2+D33.^2 ...
%     + D11.*D11 + D12.*D21 + D13.*D31 + D21.*D12 +D22.*D22 + D23.*D32 + D31.*D13 + D32.*D23 + D33.*D33...
%              ,1));






