% Autogen Script
% NOTE: You only need to run this script. This calls everything else.
% Iterates through laxfried desired amount of times
%   numInner: controls precisely how many times laxfried is run for each
%             point
%   numOuter: controls how many points are run, only need this variable if 
%             using the random equations, if not change the outer for loop
%             to be 1:length(randomVR) 
% 

clear all;
clc; 
close all;

% vars to control loop
numInner = 20; % numInner controls how many times laxfried is run
numOuter = 3; % numOuter controls how many points/ figures are generated

% NOTE: the following takes random points but you can comment this out and preset
% randomVR and randomVR as vectors with your desired coordinates instead of
% using the random point generation
%
% for N random numbers between [a, b], use r = a + (b-a).*rand(1,N) from
% MATLAB documentation 
randomVR = [1];
%4.5 4.5 4.5 7.5 3.01 2.2 1.7 3.4 4
%5.*rand(1,numOuter); randomVR = floor(randomVR .* 10) ./ 10; % generates numOuter numbers between 0 and 5
randomWR = [-1];
%2.5 1.7 1.9 1.9 1.9 0.2 -1.2 1.05 1.39
%-5 + 10.*rand(1,numOuter); randomWR = floor(randomWR .* 10) ./ 10; % generates numOuter numbers between -5 and 5

% generate numOuter figures
for j = 1:length(randomVR)
    
    initvars; % initialize variables

    % create filename base
    nameFile = ['Case' num2str(caseNum) 'Iteration' num2str(j)];
    vR = randomVR(j); wR = randomWR(j); % assign right states each iteration

    % setup taken from initvars since it reruns every time 
    %
    qL = vL*wL + vL*b/(n-k);
    qR = vR*wR + vR*b/(n-k);

    UL=[vL qL];
    UR=[vR qR];
    
    v = vL * ones(1,lx0); 
    q = qL * ones(1,lx0);
    w = wL * ones(1,lx0);
%meow
    %Will need to add right endpoints and finish constructing inital variables
    for i = 3:lx0
        v(i) = v(i) + (vR - vL);
        q(i) = q(i) + (qR - qL);
        w(i) = w(i) + (wR - wL);
    end
    %
    % end of setup

    % loop through laxfried numInner times
    for i = 1:numInner
        laxfried; % call laxfried
    end
    
    % save files as png
    saveas(fig,[nameFile 'Complete.png']);
    % saveas(fig2,[nameFile 'Single.png']);

    clc; close all; % clear console, close figures after each iteration

end

% create figure and get curves for shocks
fig3 = figure(3);
plotX = linspace(0.9,6,100);
w1 = wL .* ones(size(plotX));
w2 = wL - (A / vL) * (vL * exp(k*t))^(g+1) + (A ./ plotX) .* (plotX .* exp(k*t)).^(g+1);
w3 = wL + (A ./ plotX) .* (plotX .* exp(k*t)).^(g+1);

% plot vw curves and all points
hold on;
plot(plotX,w1,'-k');
plot(plotX,w2,'-k');
plot(plotX,w3,'-k');
plot(randomVR,randomWR,'.r');
