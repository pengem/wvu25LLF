% Initialize variables
nx = 160; % Number of cells
CFL = 0.5; % Courant number
tEnd = 2; % End time

% Define flux
flux1 = @(p) p; % First flux component
flux2 = @(u) u; % Second flux component
dflux1 = @(p) ones(size(p)); % First flux derivative (w.r.t. x)
dflux2 = @(u) ones(size(u)); % Second flux derivative (w.r.t. x)
ICase = 1; IC = 0; % Case number, initial condition

S1 = @(p) zeros(size(p)); % Source term is null
S2 = @(u) zeros(size(u));

% Create time domain
a = -1; b = 1; dx = (b-a)/nx; % Left endpoint, right endpoint, step size
x = a + dx/2 : dx : b; % Domain array. Each point in the array marks the boundary between left cell and right cell

% Initial conditions
p0 = TestingIC(x);
u0 = TestingIC(x);

% Plot range
dl=0.1; plotrange1=[a,b,min(p0)-dl,1.1*max(p0)+dl];
dl=0.1; plotrange2=[a,b,min(u0)-dl,1.1*max(u0)+dl];

%% Solver Loop

% load initial conditions
t=0; it=0; p=p0; u=u0; 

tic
while t < tEnd
    % Update/correct time step
    dt=CFL*dx/max(abs(u)); % max(abs(u)) is the our max eigenvalue
    if t+dt>tEnd, dt=tEnd-t; end % If time oversteps, no it didn't

    % Update time and iteration counter
    t=t+dt; it=it+1;

    % RK Initial step
    po = p;
    uo = u;

    % 1st stage
    dF1 = WENO5JS(p,flux1,dflux1,S1,dx);
    dF2 = WENO5JS(u,flux2,dflux2,S2,dx);
    p = po-dt*dF1;
    u = uo-dt*dF2;

    % 2nd Stage
    dF1 = WENO5JS(p,flux1,dflux1,S1,dx);
    p = 0.75*po+0.25*(p-dt*dF1);
    dF2 = WENO5JS(u,flux2,dflux2,S2,dx);
    u = 0.75*uo + 0.25*(u-dt*dF2);

    % 3rd stage
    dF1 = WENO5JS(p,flux1,dflux1,S1,dx);
    p = (po+2*(p-dt*dF1))/3;
    dF2 = WENO5JS(u,flux2,dflux2,S2,dx);
    u = (uo+2*(u-dt*dF2))/3;
end

cputime=toc; fprintf('WENO-JS cputime: %g\n',cputime);

% save result and clear space
p_JS = p; clear t it p;
u_JS = u; clear t it u;

%% Final Plot
plot(x,p0,'-k',x,p_JS,'s'); axis(plotrange1);
legend({'IC','WENO5-JS'},'interpreter','latex','FontSize',14,'orientation','horizontal'); legend boxoff;

title('Cell averages','interpreter','latex','FontSize',16);
xlabel('$\it{x}$','interpreter','latex','FontSize',18);
ylabel({'$\it{p(x)}$'},'interpreter','latex','FontSize',18);

fig = gcf;
fig.PaperUnits = 'inches';
fig.PaperPosition = [0 0 8 5];
print('-depsc',['NumericalMethods_','linear','Test.eps']);

plot(x,u0,'-k',x,p_JS,'s'); axis(plotrange2);
legend({'IC','WENO5-JS'},'interpreter','latex','FontSize',14,'orientation','horizontal'); legend boxoff;

title('Cell averages','interpreter','latex','FontSize',16);
xlabel('$\it{x}$','interpreter','latex','FontSize',18);
ylabel({'$\it{u(x)}$'},'interpreter','latex','FontSize',18);

fig = gcf;
fig.PaperUnits = 'inches';
fig.PaperPosition = [0 0 8 5];
print('-depsc',['NumericalMethods_','linear','Test.eps']);
