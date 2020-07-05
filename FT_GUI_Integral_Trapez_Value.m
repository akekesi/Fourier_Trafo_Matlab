%% Fourier GUI
%  Integral - Trapez (Value)

function [F] = FT_GUI_Integral_Trapez_Value(x,Funk)
F = 0;
for n = 1:1:length(Funk)-1
    h = x(n+1)-x(n);
    F = F+h/2*(Funk(n)+Funk(n+1));
end
end