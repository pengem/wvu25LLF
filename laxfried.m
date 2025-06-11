% Local Lax-Friedrich method implementation 
% -----------------------------
% Variables 
%   x: spatial domain
%   lambda: computed as largest magnitude, see systemeigen.m
%   CFL: must be less than 1, usually less than or equal to 0.5, used for 
%        relating change in spatial domain to change in time 
%   dt: time domain
%   q: change of variable for computing the flux of w to preserve simple
%      [v q] flux calculation opposed to [v vw + vb/(n-k)]

% Initial Iteration 
if start==0
    lx = lx0; t = 0; iters = 0; start = 1; norm = 1; % set initial conditions
    x = 1:1:lx; centerx = (lx+1)/2; x = 2*dx*(x-centerx);
    lambda = systemeigen(v, w, b, g, n, k, A, t); dt = CFL / lambda; % calculate eigenvalue and use to get initial dt
end

% Lax-Friedrich loop
for i = start:totalTime
    
    w = (q ./ v) - (b ./ (n - k)); % recalculate w from q

    % check if data should be renormed, happens every renorm iterations (usually 100) 
    norm=norm+1;  if norm==renorm, ourrenorm; norm=0; end

    lambda = systemeigen(v, w, b, g, n, k, A, t); % get new eigenvalue
    dt = CFL / lambda; % update dt time step based on calculated eigenvalue

    % update time and iteration var
    t = t+dt; 
    iters = iters+1; 


    q = v.*w + v.*b/(n-k); % change of variable to have only [v q]^T in flux 
    [f1,f2] = ourflux(v,q,b,n,k,A,g,t); % calculate flux
    
    % LF-scheme 
    vr=[v(1) v];  vr(lx+1)=[];  
	wr=[w(1) w];  wr(lx+1)=[];
    qr=[q(1) q];  qr(lx+1)=[];
    

	f1r=[f1(1) f1];  f1r(lx+1)=[];  
	f2r=[f2(1) f2];  f2r(lx+1)=[];  

    % calculate eigenvalue again

    v=(v+vr)/2 + dt * (f1r-f1)/2;
	q=(q+qr)/2 + dt * (f2r-f2)/2; 
    w = q ./ v - b ./ (n-k);

    % put right state back in 
    v=[v v(lx)]; 
    q=[q q(lx)];  
    w=[w w(lx)];

    % calculate new x
    x=x-dx;x=[x x(lx)+2*dx]; lx=lx+1; X=x/t;
end

% actually update figure

graphs; % calls graphs after

