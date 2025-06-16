% This is PDE specific flux, change input for problem
% RETURNS: f1 and f2 as [f1, f2]
% note that A must be calculated outside of the function (as of now)

function[f1, f2] = flux(u,p,pbar,aexp,A)

f1 = p.*u - p.*u.*((p/pbar).^aexp) + p.*A - p.*A.*((p/pbar).^aexp);

f2 = p.*(u.^2) - p.*(u.^2).*((p/pbar).^aexp) + p.*u.*A - p.*u.*A.*((p/pbar).^aexp);
end