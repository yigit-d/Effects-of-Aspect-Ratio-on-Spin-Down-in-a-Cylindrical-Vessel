function [U V W uu vv ww...
    U_x U_y U_z V_x V_y V_z W_x W_y W_z...
    u_x2 u_y2 u_z2 v_x2 v_y2 v_z2 w_x2 w_y2 w_z2...
    Sxx2 Syy2 Szz2 Sxy2 Sxz2 Syz2...
    sxx2 syy2 szz2 sxy2 sxz2 syz2 wxy2 wxz2 wyz2...
    Pm p2]=MeanAndVarSurface(Dat, nrays, nsamples,nz, h, Re, eps)







%r=linspace(0+eps,1-eps,nsamples);
z=linspace(0, h-eps, nz);

%[R, Z]=meshgrid(r, z);


%%
for i=[1:nz]
    DatTemp=Dat( ismembertol(Dat(:,3), z(i), 1e-4)        , :); %only accurate to 5 decimal points
    
   [U(i,:) V(i,:) W(i,:) uu(i,:) vv(i,:) ww(i,:)...
    U_x(i,:) U_y(i,:) U_z(i,:) V_x(i,:) V_y(i,:) V_z(i,:) W_x(i,:) W_y(i,:) W_z(i,:)...
    u_x2(i,:) u_y2(i,:) u_z2(i,:) v_x2(i,:) v_y2(i,:) v_z2(i,:) w_x2(i,:) w_y2(i,:) w_z2(i,:)...
    Sxx2(i,:) Syy2(i,:) Szz2(i,:) Sxy2(i,:) Sxz2(i,:) Syz2(i,:)...
    sxx2(i,:) syy2(i,:) szz2(i,:) sxy2(i,:) sxz2(i,:) syz2(i,:) wxy2(i,:) wxz2(i,:) wyz2(i,:)...
    Pm(i,:) p2(i,:)]=MeanAndVarProfile( DatTemp, nrays, nsamples, Re, eps );
end
clear Dat DatTemp z


%%




