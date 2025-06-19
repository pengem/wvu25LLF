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
lU = 0.25;

% Values of Constants
pbar = 3;
aexp = 0.5;

% a(s) thing THIS CAN BE CHANGED !!!
a_s = @(s) -s;

% Initial Conditions given here
%uL corresponds to the left state of a characterstic, while uR corresponds
%to the right states
uL = 3;
pL = 2;
uR = 4; 
pR = 5;

% Determines case for graph titles
% Cases are determined by which of pL or pR is bigger, as well as the value
% of the constant aexp. There are 24 in total.
