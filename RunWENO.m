% Initialize variables
nx = 160; % Number of cells
CFL = 0.5; % Courant number
tEnd = 2; % End time

% Define flux
flux = @(w) w; % Flux function
dflux = @(w) ones(size(w)); % Flux derivative (w.r.t. x)
ICase = 1; IC = 0; % Case number, initial condition

S = @(w) zeros(size(w)); % Source term is null

% Create time domain
a = -1; b = 1; dx = (b-a)/nx; % Left endpoint, right endpoint, step size
x = a + dx/2 : dx : b; % Domain array. Each point in the array marks the boundary between left cell and right cell

% Initial conditions
u0 = TestingIC(x);

% Plot range
dl=0.1; plotrange=[a,b,min(u0)-dl,1.1*max(u0)+dl];

%% Solver Loop

% load initial conditions
t=0; it=0; u=u0; 

tic
while t < tEnd
    % Update/correct time step
    dt=CFL*dx/max(abs(u)); % max(abs(u)) is the our max eigenvalue
    if t+dt>tEnd, dt=tEnd-t; end % If time oversteps, no it didn't

    % Update time and iteration counter
    t=t+dt; it=it+1;

    % RK Initial step
    uo = u;

    % 1st stage
    dF = WENO5JS(u,flux,dflux,S,dx); 
    u = uo-dt*dF;

    % 2nd Stage
    dF = WENO5JS(u,flux,dflux,S,dx);
    u = 0.75*uo+0.25*(u-dt*dF);

    % 3rd stage
    dF = WENO5JS(u,flux,dflux,S,dx);
    u = (uo+2*(u-dt*dF))/3;
end

cputime=toc; fprintf('WENO-JS cputime: %g\n',cputime);

% save result and clear space
u_JS = u; clear t it u;

%% Final Plot
plot(x,u0,'-k',x,u_JS,'s'); axis(plotrange);
legend({'IC','WENO5-JS'},'interpreter','latex','FontSize',14,'orientation','horizontal'); legend boxoff;

title('Cell averages','interpreter','latex','FontSize',16);
xlabel('$\it{x}$','interpreter','latex','FontSize',18);
ylabel({'$\it{u(x)}$'},'interpreter','latex','FontSize',18);

fig = gcf;
fig.PaperUnits = 'inches';
fig.PaperPosition = [0 0 8 5];
print('-depsc',['NumericalMethods_','linear','Test.eps']);
