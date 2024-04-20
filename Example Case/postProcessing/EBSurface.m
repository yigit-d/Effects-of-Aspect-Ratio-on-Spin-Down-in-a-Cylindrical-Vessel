function [K K_x K_y K_z...
    k k_x k_y k_z...
    epsilon_m eps_m_x eps_m_y eps_m_z...
    epsilon_t eps_t_x eps_t_y eps_t_z...
    P P_x P_y P_z]=EBSurface(Dat, nrays, nsamples,nz, h, Re, eps)







%r=linspace(0+eps,1-eps,nsamples);
z=linspace(0, h-eps, nz);

%[R, Z]=meshgrid(r, z);


%%
for i=[1:nz]
    DatTemp=Dat( ismembertol(Dat(:,3), z(i), 1e-4)        , :); %only accurate to 5 decimal points
   [K(i,:) K_x(i,:) K_y(i,:) K_z(i,:)...
    k(i,:) k_x(i,:) k_y(i,:) k_z(i,:)...
    epsilon_m(i,:) eps_m_x(i,:) eps_m_y(i,:) eps_m_z(i,:)...
    epsilon_t(i,:) eps_t_x(i,:) eps_t_y(i,:) eps_t_z(i,:)...
    P(i,:) P_x(i,:) P_y(i,:) P_z(i,:)]=EBProfile( DatTemp, nrays, nsamples, Re, eps );
end
clear Dat DatTemp z


%%




