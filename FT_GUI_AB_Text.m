%% Fourier GUI
%  AB - Text

function [ab] = FT_GUI_AB_Text(a,b)
a = string(round(a,2));
b = string(round(b,2));
a = ['a' a];
b = ['b' b];
N = length(a);
Info = zeros(N+1,6);
for n = 1:1:N
    a_l = strlength(a(n));
    a_p = strfind(a(n),'.');
    if isempty(a_p)
        a_r = 0;
        a_rp = a_r;
        a_f = a_l;
    else
        a_r = a_l-a_p;
        a_rp = a_r+1;
        a_f = a_p-1;
    end
    b_l = strlength(b(n));
    b_p = strfind(b(n),'.');
    if isempty(b_p)
        b_r = 0;
        b_rp = b_r;
        b_f = b_l;
    else
        b_r = b_l-b_p;
        b_rp = b_r+1;
        b_f = b_p-1;
    end
    Info(n,1) = a_f;
    Info(n,2) = a_rp;
    Info(n,3) = a_r;
    Info(n,4) = b_f;
    Info(n,5) = b_rp;
    Info(n,6) = b_r;
end
Info(end,:) = max(Info);
c = string(length(a));
d = string(length(a));
ab = string(length(a));
for n = 1:1:N
    a(n) = ' '+a(n);
    for m = 1:1:Info(end,1)-Info(n,1)
        a(n) = ' '+a(n);
    end
    a(n) = a(n)+' ';
    b(n) = ' '+b(n);
    for m = 1:1:Info(end,4)-Info(n,4)
        b(n) = ' '+b(n);
    end
    b(n) = b(n)+' ';
    c(n) = ' |';
    for m = 1:1:Info(end,2)-Info(n,2)
        c(n) = ' '+c(n);
    end
    c(n) = c(n)+'| ';
    d(n) = '';
    for m = 1:1:Info(end,5)-Info(n,5)
        d(n) = ' '+d(n);
    end
    if n > 1
        num = [' ',num2str(n-1),': '];
    else
        num = '    ';
    end
    ab(n) = num+a(n)+c(n)+b(n)+d(n);
end
end