function [lambdamax] = systemeigen(u,p,pbar,aexp,A)
% Computes the local system eigenvalues for specified 
% time and characteristics and returns the max
% Matlab will automatically discard imaginary parts
% RETURNS: max of absolute value of lambda1 and lambda2

lambda1 = -(u + A) .* ((1 + aexp) .* (p ./ pbar).^aexp - 1);
lambda2 = -(u + A) .* ((p ./ pbar).^aexp - 1);

% basically lambda1 = [lambda_1^L, lambda_1^R]
% and       lambda2 = [lambda_2^L, lambda_2^R]

%lambdamax is used for CFL condition
lambdamax = max(max(abs(lambda1), abs(lambda2)));

end