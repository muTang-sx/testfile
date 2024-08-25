clc,clear
%%Backward Stochastic Differential Equation
%-dYt = f(t,Yt,Zt)dt - ZtdWt
% Number of iterations 70
itera = 2000;
% Number of partitions 120
N = 120;
% Number of truncation 25
Y = zeros(N,itera);
Z = zeros(N,itera);
x = linspace(0,1,N);
delta = 1/N;
sdelta = sqrt(1/N);
tic
for k = 1:itera
    z=zeros(N);
    y=zeros(N);

    y(N,:) = Precios(1/N,N);
    for j = N-1:-1:1
            z(j,1:j) = (y(j+1,1:j) - y(j+1,2:j+1))./(2*sdelta);
            y(j,1:j) = (y(j+1,1:j) + y(j+1,2:j+1))/2 + f(j*delta,(y(j+1,1:j) + y(j+1,2:j+1))/2,z(j,1:j))*delta;
    end
    Y(:,k)=y(:,1);
    Z(:,k)=z(:,1);
  %  clear z;
  %  clear y;
end
toc
