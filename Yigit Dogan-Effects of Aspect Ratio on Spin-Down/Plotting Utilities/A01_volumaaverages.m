load("EBFieldOutputRe12000A01.mat")

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
Pmag = sqrt(P_x.^01+P_y.^01+P_z.^01);

%%

t01=t;
K01=K_vol*8;
k01=k_vol*8;

kx01=k_x_vol*8;
ky01=k_y_vol*8;
kz01=k_z_vol*8;

et01=epsilon_t_vol*8;
etx01=eps_t_x_vol*8;
ety01=eps_t_y_vol*8;
etz01=eps_t_z_vol*8;



em01=epsilon_m_vol*8;
emx01=eps_m_x_vol*8;
emy01=eps_m_y_vol*8;
emz01=eps_m_z_vol*8;


P01=P_vol*8;
Px01=P_x_vol*8;
Py01=P_y_vol*8;
Pz01=P_z_vol*8;

save VolAvgA01 t01 K01 k01 kx01 ky01 kz01 et01 etx01 ety01 etz01 em01 emx01 emy01 emz01 P01 Px01 Py01 Pz01 