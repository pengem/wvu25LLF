% create figure and get curves for shocks
clear all;
clc; 
close all;

% initialize variables
initvars;
randomVR = [1];
randomWR = [-1];

figure;
plotX = linspace(0,10,100);
u1 = uL .* ones(size(plotX));
u2 = (((pL^aexp) - (plotX.^aexp))./((plotX.^aexp) - (pbar^aexp))) .* (uL + A) + uL;

% plot vw curves and all points
hold on;
plot(plotX,u1,'-k');
plot(plotX,u2,'-r');
plot(randomVR,randomWR,'.r');
