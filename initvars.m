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
g = -2;
b = 10;
n = 3;
k = -0.01; 
A = -10;

% Determines case for graph titles
caseNum = 0;
if g < -1 && k > 0
    caseNum = 1;
elseif g < 0 && g > -1 && k < 0 
    caseNum = 2;
elseif g < -1 && k < 0
    caseNum = 3;
else
    caseNum = 4;
end

% Initial Conditions given here
%qL corresponds to the right state of a characterstic, while qR corresponds
%to the right states
vL = 3;
wL = 2;
vR = 15; 
wR = 4;

