%% Fourier GUI
%  Squar-Wave

function [y] = FT_GUI_Square_Wave(x,w,N)
y = size(x);
for n = 1:1:N
    for m = 1+fix((n-1)/N*length(x)):1:fix((n)/N*length(x))
        if mod(n,2) == 1
            y(m) = w;
        else
            y(m) = -w;
        end
    end
end
end