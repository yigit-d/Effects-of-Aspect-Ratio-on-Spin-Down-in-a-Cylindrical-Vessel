
clear
clc
close all
load("MeanAndVarFieldOutputRe12000A01.mat")
A=0.1;
%%

clear
clc
close all
load("MeanAndVarFieldOutputRe12000A05.mat")
A=0.5;

%%
clear
clc
close all
load("MeanAndVarFieldOutputRe12000A2.mat")
A=2;


%%
i=30;
i=i+1;



surf(R, Z,  Pm(:,:,i) )


shading interp
view(2)


%caxis([-5 5])
grid off
box on
xlabel("$r/R$", Interpreter="latex", FontSize=20)
ylabel("$z/R$", Interpreter="latex", FontSize=20)


%title(["$\Omega t=$" + num2str(t(i) )], Interpreter="latex")
ylabel(colorbar, ["$U_r/(\Omega R)$"], Interpreter="latex", FontSize=20)
pbaspect([1 A 1])

%%
%caxis([-0.05 0.05])
xlim([0.8 1])
ylim([0 A])
pbaspect([1 A/0.2 1])
%caxis([0 1.3])
set(gca,'view',[90 90])
%caxis([0 0.01])

%%
i=1;
i=i+1;

[gPx gPy]=gradient(Pm(:,:,i), 1/150);
%[gPx gPy]=gradient(V(:,:,i));

surf(R, Z,   V(:,:,i).^2./R-gPx )
shading interp
view(2)



grid off

xlabel("$r/R$", Interpreter="latex")
ylabel("$z/R$", Interpreter="latex")


title(["$\Omega t=$" + num2str(t(i) )], Interpreter="latex")
ylabel(colorbar, ["$<uu>$"], Interpreter="latex")
pbaspect([1 0.5 1])
%caxis([-0.05 0.05])


%%


i=24;
i=i+1;

h=surf(R, Z, wxy2(:,:,i), FaceColor=[1 0 0]);
set(h,'edgecolor', 'none')


hold on

h=surf(R, Z, wxz2(:,:,i), FaceColor=[0 1 0]);
set(h,'edgecolor', 'none')

h=surf(R, Z, wyz2(:,:,i), FaceColor=[0 0 1]);
set(h,'edgecolor', 'none')



%caxis([-0.01 0.01])


%colorbar
%shading flat
view(2)




grid off

xlabel("$r/R$", Interpreter="latex")
ylabel("$z/R$", Interpreter="latex")


title(["$\Omega t=$" + num2str(t(i) )], Interpreter="latex")
%ylabel(colorbar, ["$W$"], Interpreter="latex")
pbaspect([1 0.5 1])

%%
%sY=[ones(1, N)*0, ones(1, N)*0.4 ones(1, N)*0.6 ones(1, N)*0.8 ones(1, N)*0.99];
N=20;
sX=linspace(0,1, 10*N);
sY=linspace(0, 0.5, N);
sY=[sY sY sY sY sY];
sY=[sY sY];

rng(50) %50
sX=sX(randperm(length(sY)));
sY=sY(randperm(length(sY)));


% %%
% sX=linspace(0, 0.5, N);
% sX=[sX sX sX sX];
% sY=[ ones(1, N)*0.49  ones(1, N)*0.46  ones(1, N)*0.47  ones(1, N)*0.35];
% 

%%
N=175;
sX=linspace(0,1, N);
sY=linspace(0, A, N);


rng(1863)
sX=sX(randperm(length(sY)));
sY=sY(randperm(length(sY)));

%for i=[1:31]
i=4;

figure
h=streamline(R,Z,U(:, :,i),W(:, :,i), sX, sY);
%hold on
  for m=[1:length(h)]
  h(m).Color="k";
  end


xlabel('$r/R$', Interpreter='latex')
ylabel('$z/R$', Interpreter='latex')
title(["$\Omega t=$" + num2str(t(i) )], Interpreter="latex")


pbaspect([1 A 1])
%end

%%
j=31  ;

figure
cmap = colormap("turbo"); 
cmap=[cmap, linspace(1, 0.4, 256)'];



% load("WRColorMap.mat")
% cmap = colormap(flipud(WRColorMap)); 
% cmap=[cmap, linspace(1, 0.2, 501)'];


zmap = linspace(0, max(z), length(cmap));
hold on



for i = [1:2:length(z)]

    color = interp1( zmap, cmap, z(i));

    plot(r, ( V(i,:,j) )  , 'color',color);    %y
    alpha(0.3)

  %  plot(r, ( U_z(i,:,j)-W_x(i,:,j) )  , 'color',color);    %y
  %  plot(r, ( W_y(i,:,j)-V_z(i,:,j) )  , 'color',color);    %x
  %  plot(r, ( V_x(i,:,j)-U_y(i,:,j) )  , 'color',color);    %z


  %   plot(r, sqrt(       ( U_z(i,:,j)-W_x(i,:,j) ).^2  +     ( W_y(i,:,j)-V_z(i,:,j)) .^2       + ( V_x(i,:,j)-U_y(i,:,j) ).^2  ) , 'color',color);    %z

end

caxis([min(z), A])

bar=colorbar;
ylabel(bar, '$z/R$' , Interpreter='latex', FontSize=20)

ylabel('$U_\varphi/(\Omega R)$', Interpreter='latex', FontSize=20)
xlabel('$r/R$', Interpreter='latex', FontSize=20)
%title(["$\Omega t=$" + num2str(t(j) )], Interpreter="latex")

xline(0.68)
%yline(0.81, LineWidth=2)

%[m]=polyfit(r(1:100), V(300,1:100,j), 1)

%plot([0 1], [0 m(1)], 'k--', LineWidth=2)
box on
grid on
%xline(0.69, LineWidth=2)

%%

load("WRColorMap.mat")

cmap = colormap("turbo"); 
%cmap = colormap(flipud(WRColorMap)); 

zmap = linspace(0, max(t), length(cmap));
%hold on
%    color = interp1( zmap, cmap, t(1));
%    plot([1 1 0], [0 A A]  , 'color',color);    
hold on


for j = [1:2:length(t)]

    color = interp1( zmap, cmap, t(j));

%    plot([ (U(:, i, j))  ], [ Z(:, i) ]  , 'color',color);    

    plot( r, V(1,:,j)./r, 'color',color);    


end
bar=colorbar;
ylabel(bar, '$\Omega t$' , Interpreter='latex', FontSize=20)
caxis([min(t), max(t)])

xlabel('$\frac{1}{\pi R^2}\int U_\varphi \mathrm{d}A /(\Omega R)$', Interpreter='latex', FontSize=20)
ylabel('$z/R$', Interpreter='latex', FontSize=20)
box on
grid on

%%
i=241;
r(i)
load("WRColorMap.mat")

cmap = colormap("turbo"); 
%cmap = colormap(flipud(WRColorMap)); 

zmap = linspace(0, max(t), length(cmap));
%hold on
%    color = interp1( zmap, cmap, t(1));
%    plot([1 1 0], [0 A A]  , 'color',color);    
hold on

color = interp1( zmap, cmap, 0);

plot([0, 2/3 2/3], [0.5, 0.5 0], 'color', color, LineWidth=1.2);    


for j = [2:2:length(t)]

    color = interp1( zmap, cmap, t(j));

%    plot([ (U(:, i, j))  ], [ Z(:, i) ]  , 'color',color);    

    plot( trapz(r, V(:,:,j).*R,2)*2, z , 'color',color);    


end
bar=colorbar;
ylabel(bar, '$\Omega t$' , Interpreter='latex', FontSize=20)
caxis([min(t), max(t)])

xlabel('$\frac{1}{\pi R^2}\int U_\varphi \mathrm{d}A /(\Omega R)$', Interpreter='latex', FontSize=20)
ylabel('$z/R$', Interpreter='latex', FontSize=20)


grid on
box on
xlim([0 2/3])

%set(gca, 'YScale', 'log')


%%

%i=241;

i=220;
r(i)

j=18;
%plot([ (ww(:, i, j))  ], [ Z(:, i) ]  , 'color',color);    


A=fft(ww(:, i, j) )


semilogy(abs(A))

hold on