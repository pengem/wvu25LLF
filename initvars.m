%This script provides the initial conditions used in the LLF method. The
%purpose of each initalized variable is commented beside it. To adjust for
%a different problem, simply edit parameters and change the left and right
%inital states.

% Figures are initalized here
figure(1), clf
% figure(2), clf

% Grid Variables
dx = 1; 
lx0 = 4; %Inital vector size
CFL = 0.5; %Numerical stability condition, controls dt/dx
renorm = 100; 
start = 0; 
totalTime = 1000; % total steps 

% initial line width for graphing
lW = 0.25;

% Values of Constants
pbar = 1;
aexp = 2;

% Initial Conditions given here
%uL corresponds to the left state of a characterstic, while uR corresponds
%to the right states
uL = 3;
pL = 2;
uR = 15; 
pR = 4;

% Determines case for graph titles
% Cases are determined by which of pL or pR is bigger, as well as the value
% of the constant aexp. There are 24 in total.
