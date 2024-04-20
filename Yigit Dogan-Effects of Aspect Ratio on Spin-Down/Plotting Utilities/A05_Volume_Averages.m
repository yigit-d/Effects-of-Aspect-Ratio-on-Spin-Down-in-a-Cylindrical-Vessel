load("EBFieldOutputRe12000A05.mat")

for i=[1:length(t)]
epsilon_t_vol(i)=trapz(z, trapz(r, epsilon_t(:,:,i).*R,2))/h;
eps_t_x_vol(i)=trapz(z, trapz(r, eps_t_x(:,:,i).*R,2))/h;
eps_t_y_vol(i)=trapz(z, trapz(r, eps_t_y(:,:,i).*R,2))/h;
eps_t_z_vol(i)=trapz(z, trapz(r, eps_t_z(:,:,i).*R,2))/h;



epsilon_m_vol(i)=trapz(z, trapz(r, epsilon_m(:,:,i).*R,2))/h;
eps_m_x_vol(i)=trapz(z, trapz(r, eps_m_x(:,:,i).*R,2))/h;
eps_m_y_vol(i)=trapz(z, trapz(r, eps_m_y(:,:,i).*R,2))/h;
eps_m_z_vol(i)=trapz(z, trapz(r, eps_m_z(:,:,i).*R,2))/h;




P_vol(i)=-trapz(z, trapz(r, P(:,:,i).*R,2))/h;
P_x_vol(i)=-trapz(z, trapz(r, P_x(:,:,i).*R,2))/h;
P_y_vol(i)=-trapz(z, trapz(r, P_y(:,:,i).*R,2))/h;
P_z_vol(i)=-trapz(z, trapz(r, P_z(:,:,i).*R,2))/h;




K_vol(i)=trapz(z, trapz(r, K(:,:,i).*R,2))/h;
k_vol(i)=trapz(z, trapz(r, k(:,:,i).*R,2))/h;

k_x_vol(i)=trapz(z, trapz(r, k_x(:,:,i).*R,2))/h;
k_y_vol(i)=trapz(z, trapz(r, k_y(:,:,i).*R,2))/h;
k_z_vol(i)=trapz(z, trapz(r, k_z(:,:,i).*R,2))/h;


end
Pmag = sqrt(P_x.^05+P_y.^05+P_z.^05);

%%

t05=t;
K05=K_vol*8;
k05=k_vol*8;

kx05=k_x_vol*8;
ky05=k_y_vol*8;
kz05=k_z_vol*8;

et05=epsilon_t_vol*8;
etx05=eps_t_x_vol*8;
ety05=eps_t_y_vol*8;
etz05=eps_t_z_vol*8;



em05=epsilon_m_vol*8;
emx05=eps_m_x_vol*8;
emy05=eps_m_y_vol*8;
emz05=eps_m_z_vol*8;


P05=P_vol*8;
Px05=P_x_vol*8;
Py05=P_y_vol*8;
Pz05=P_z_vol*8;

save VolAvgA05 t05 K05 k05 kx05 ky05 kz05 et05 etx05 ety05 etz05 em05 emx05 emy05 emz05 P05 Px05 Py05 Pz05 