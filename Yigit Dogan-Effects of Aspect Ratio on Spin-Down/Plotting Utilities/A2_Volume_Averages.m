load("EBFieldOutputRe12000A2.mat")

for i=[1:length(t)]
epsilon_t_vol(i)=trapz(z, trapz(r, epsilon_t(:,:,i).*R,2))/h;
eps_t_x_vol(i)  =trapz(z, trapz(r, eps_t_x(:,:,i).*R,2))/h;
eps_t_y_vol(i)  =trapz(z, trapz(r, eps_t_y(:,:,i).*R,2))/h;
eps_t_z_vol(i)  =trapz(z, trapz(r, eps_t_z(:,:,i).*R,2))/h;



epsilon_m_vol(i)=trapz(z, trapz(r, epsilon_m(:,:,i).*R,2))/h;
eps_m_x_vol(i)  =trapz(z, trapz(r, eps_m_x(:,:,i).*R,2))/h;
eps_m_y_vol(i)  =trapz(z, trapz(r, eps_m_y(:,:,i).*R,2))/h;
eps_m_z_vol(i)  =trapz(z, trapz(r, eps_m_z(:,:,i).*R,2))/h;




P_vol(i)=  -trapz(z, trapz(r, P(:,:,i).*R,2))/h;
P_x_vol(i)=-trapz(z, trapz(r, P_x(:,:,i).*R,2))/h;
P_y_vol(i)=-trapz(z, trapz(r, P_y(:,:,i).*R,2))/h;
P_z_vol(i)=-trapz(z, trapz(r, P_z(:,:,i).*R,2))/h;




K_vol(i)=trapz(z, trapz(r, K(:,:,i).*R,2))/h;
k_vol(i)=trapz(z, trapz(r, k(:,:,i).*R,2))/h;

k_x_vol(i)=trapz(z, trapz(r, k_x(:,:,i).*R,2))/h;
k_y_vol(i)=trapz(z, trapz(r, k_y(:,:,i).*R,2))/h;
k_z_vol(i)=trapz(z, trapz(r, k_z(:,:,i).*R,2))/h;


end
Pmag = sqrt(P_x.^2+P_y.^2+P_z.^2);

%%

t2=t;
K2=K_vol*8;
k2=k_vol*8;

kx2=k_x_vol*8;
ky2=k_y_vol*8;
kz2=k_z_vol*8;

et2=epsilon_t_vol*8;
etx2=eps_t_x_vol*8;
ety2=eps_t_y_vol*8;
etz2=eps_t_z_vol*8;



em2=epsilon_m_vol*8;
emx2=eps_m_x_vol*8;
emy2=eps_m_y_vol*8;
emz2=eps_m_z_vol*8;


P2=P_vol*8;
Px2=P_x_vol*8;
Py2=P_y_vol*8;
Pz2=P_z_vol*8;

save VolAvgA2 t2 K2 k2 kx2 ky2 kz2 et2 etx2 ety2 etz2 em2 emx2 emy2 emz2 P2 Px2 Py2 Pz2 