% This is PDE specific flux, change input for problem
% RETURNS: f1 and f2 as [f1, f2]

function[f1, f2] = ourflux(v,q,b,n,k,A,g,t)

t_fix = t;

f1 = q .* exp((n-k).*t_fix) - v .* b./(n-k) - A.* (v.*exp(k.*t_fix)).^(g+1) .* exp((n-k).*t_fix);

f2 = q.^2 ./ v .* exp((n-k).*t_fix) - q.*exp((n-k).*t_fix).*A.*v.^g .* exp((k.*t_fix).*(g+1)) - q.*b./(n-k);


