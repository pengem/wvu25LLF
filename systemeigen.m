function [lambdamax] = systemeigen(v, w, b, g, n, k, A, t)
% Computes the local system eigenvalues for specified 
% time and characteristics and returns the max
% Matlab will automatically discard imaginary parts
% RETURNS: max of absolute value of lambda1 and lambda2

lambda1 = (-b ./ (n-k)) + (w + (b ./ (n-k)) - (A ./ v) .* (v .* exp(k*t)).^(g+1)*(g+1)) .* exp((n-k)*t);
lambda2 = (-b ./ (n-k)) + (w + (b ./ (n-k)) - (A ./ v) .* (v .* exp(k*t)).^(g+1)) .* exp((n-k)*t);

lambdamax = max(max(abs(lambda1), abs(lambda2)));

end

