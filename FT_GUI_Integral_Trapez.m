%% Fourier GUI
%  Integral - Trapez

function [F] = FT_GUI_Integral_Trapez(xa,xe,nx,funk,k)
F = 0;
h = (xe-xa)/nx;
for n = 1:1:nx
    F = F+h/2*(funk(xa+(n-1)*h,k)+funk(xa+n*h,k));
end
end