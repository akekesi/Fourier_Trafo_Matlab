%% Fourier GUI
%  Fourier Trafo

function [a,b,S,C,CS,F] = FT_GUI_Fourier_Trafo(funk,nft,x)
T = x(end)-x(1);
a = zeros(1,nft);
b = a;
S = zeros(2,length(x),nft);
C = S;
F = zeros(2,length(x),nft+1);               % 1. Zeile = 0 fuer Plot
CS = zeros(1,length(x));
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
    C(1,:,k) = a_0*a(1,k)*c(x,k);               % y-Kompontente (Groesse)
    C(2,:,k) = a_0*a(1,k)*-s(x,k);              % x-Kompontente (Groesse)
    S(1,:,k) = b(1,k)*s(x,k);                   % y-Kompontente (Groesse)
    S(2,:,k) = b(1,k)*c(x,k);                   % x-Kompontente (Groesse)
    CS(k,:) = C(1,:,k)+S(1,:,k);                % y-Werte/nft
    F(1,:,k+1) = F(1,:,k)+C(1,:,k)+S(1,:,k);    % y-Werte/nft summiert
    F(2,:,k+1) = F(2,:,k)+C(2,:,k)+S(2,:,k);    % x-Werte/nft summiert
end