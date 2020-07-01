%% Fourier GUI
%  Fourier Trafo

function [a,b,S,C,CS] = FT_GUI_Fourier_Trafo(funk,nft,x)
T = x(end)-x(1);
a = zeros(1,nft);
b = a;
S = zeros(length(x));
C = S;
CS = S;
s = @(x,k) sin((k-1)*x);
c = @(x,k) cos((k-1)*x);
for k = 1:1:nft
    a(1,k) = 2/T*FT_GUI_Integral_Trapez(x(1),x(end),length(x),@(x,k) funk(x)*c(x,k),k);
    if abs(a(1,k)) < 10^-12
        a(1,k) = 0;
    end
    
    b(1,k) = 2/T*FT_GUI_Integral_Trapez(x(1),x(end),length(x),@(x,k) funk(x)*s(x,k),k);
    if abs(b(1,k)) < 10^-12
        b(1,k) = 0;
    end
    
    if k == 1
        a_0 = 1/2;
    else
        a_0 = 1;
    end
    C(k,:) = a_0*a(1,k)*c(x,k);
    S(k,:) = b(1,k)*s(x,k);
    CS(k,:) = C(k,:)+S(k,:);
end