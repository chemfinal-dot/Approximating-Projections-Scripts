clear all
clc

%1.
c=phi_lin(path_func(5));
d=phi_quad(path_func(5));
error=abs(c-d)

%2.
%clique number of wheel(5)=3
phi_quad(wheel(5))>=3  
error=abs(3-phi_quad(wheel(5)))

%3.
G=complete(11)-(edge(1,2,11)+edge(2,1,11));
comp_G=ones(11)-G;
phi_quad((comp_G))>=LovTheta(G)*(LovTheta(G)-1)/11 +1 
error=abs((LovTheta(G)*(LovTheta(G)-1)/11 +1)-(phi_quad((comp_G))))

%4.
a=phi_quad(strong_product(path_func(5),path_func(5)));
b=phi_quad(path_func(5))*phi_quad(path_func(5));
error=abs(a-b)


%5.
a=LovTheta(star(5))
b=phi_lin(star(5))
error=abs(a-b)