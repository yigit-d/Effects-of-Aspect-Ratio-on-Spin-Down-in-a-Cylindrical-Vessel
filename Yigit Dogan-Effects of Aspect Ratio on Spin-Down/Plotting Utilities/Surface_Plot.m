
clear
close all
clc
load("EBFieldOutputRe12000A01.mat")
A=0.1;

%%

clear
close all
clc
load("EBFieldOutputRe12000A05.mat")
A=0.5;

%%
clear
close all
clc
load("EBFieldOutputRe12000A2.mat")
A=2;
%%



i=29;
i=i+1;


surf(R, Z, -P_z(:, :, i)*8 );
% hold on
% surf(R, -Z, k(:, :, i)*8 );

colorbar
shading interp
view(2)

grid off
set(gca,'ColorScale','log')

xlabel("$r/R$", Interpreter="latex", FontSize=20)
ylabel("$z/R$", Interpreter="latex", FontSize=20)


%title(["$\Omega t=$" + num2str(t(i) )], Interpreter="latex")
ylabel(colorbar, "$k/[K_0]$", Interpreter="latex", FontSize=20)
pbaspect([1 A 1])
box on

%%
xlim([0.8 1])
ylim([-A A])
pbaspect([1 1 1])
caxis([0 3.5663e-04])
%set(gca,'view',[90 90])
%caxis([0 1.7])
box on

%%

j=6  ;
cmap = colormap('turbo'); 

zmap = linspace( 0, max(z), length(cmap));
hold on



for i = [1:length(z)]

    color = interp1( zmap, cmap, z(i));

    plot(r, K(i,:,j)*8  , 'color',color);    

end



caxis([min(z), 0.1])

bar=colorbar;
ylabel(bar, '$z/R$' , Interpreter='latex')

ylabel('$K/[K_0]$', Interpreter='latex')
xlabel('$r/R$', Interpreter='latex')
%title(["$\Omega t=$" + num2str(t(j) )], Interpreter="latex")


plot(r, r.^2/2*8, 'k--', LineWidth=2)
box on
grid on
