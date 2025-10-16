% This is PDE specific flux, change input for problem
% RETURNS: f1 and f2 as [f1, f2]
% note that A must be calculated outside of the function (as of now)

function[f1, f2] = flux(u,p,pbar,aexp, amp, freq, t)

f1 = p.*u - p.*u.*((p/pbar).^aexp) + p.*amp/freq*sin(freq*t) - p.*amp/freq*sin(freq*t).*((p/pbar).^aexp);

f2 = p.*(u.^2) - p.*(u.^2).*((p/pbar).^aexp) + p.*u.*amp/freq*sin(freq*t) - p.*u.*amp/freq*sin(freq*t).*((p/pbar).^aexp);
end
