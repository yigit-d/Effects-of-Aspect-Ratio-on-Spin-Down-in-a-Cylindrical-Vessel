clear
clc
close all

nrays=40;
nsamples=300;
nz=50;

h=0.1;


eps=0.0002; %edge tolerance, as rounding errors sometimes create points w/ r>1 and center point will be repeated


r=linspace(0+eps,1-eps,nsamples);
theta=linspace(0, 2*pi*(1-1/nrays) ,nrays);
z=linspace(0,h-eps, nz);


k=1;
for j=1:length(theta)
    for i=1:length(r)

    x(k)=r(i)*cos(theta(j));
    y(k)=r(i)*sin(theta(j));
    k=k+1;

    end
end

%%
clc


fid = fopen( ['CoordinateListZ' num2str(h) '.txt'], 'wt' );




%fprintf( fid, ['(0 0' ' ', num2str(z)   ')']);
%fprintf(fid,'\n');

for l=1:length(z)
k=1;


for j=1:length(theta)
    for i=1:length(r)

    fprintf( fid, ['(',num2str(x(k)), ' ', num2str(y(k)), ' ', num2str(z(l))   ')']);
    fprintf(fid,'\n');
    k=k+1;

    end
end
end

