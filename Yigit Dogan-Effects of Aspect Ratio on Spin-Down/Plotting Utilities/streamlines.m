
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

N=200;
sX=linspace(0,1, N);
sY=linspace(0, A, N);


rng(1863)
sX=sX(randperm(length(sY)));
sY=sY(randperm(length(sY)));

%for i=[1:31]
i=31;

figure
h=streamline(Z',R',W(:, :,i)',U(:, :,i)', sY, sX);
%hold on
  for m=[1:length(h)]
  h(m).Color="k";
  end
% 
% h=streamline(Z',R',W(:, :,i)',U(:, :,i)', 0.03, 0.95);
%    for m=[1:length(h)]
%    h(m).Color="k";
%   end



xlabel('$z/R$', Interpreter='latex')
ylabel('$r/R$', Interpreter='latex')
%title(["$\Omega t=$" + num2str(t(i) )], Interpreter="latex")


pbaspect([A 1 1])
box on
%end


%%
