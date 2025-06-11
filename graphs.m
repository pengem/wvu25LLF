% graphs v and w
%   lW: variable to control line width, increases after each iteration
%   fig: figure object with all v,w plots
%   fig2: figure object with latest v,w plot

fig = figure(1); %, clf
hold on
subplot(2,2,1), hold on
plot(X,v,'k','LineWidth',lW);
title(['                                                   Case ',num2str(caseNum),': \gamma =',num2str(g),'  States {\itv, w}',':  ', ...
num2str(iters),' Steps, ', 't = ',num2str(t)],'FontSize',16)
	xlabel('\itx/t', 'FontSize',16), ylabel('\itv','FontSize',16)
subplot(2,2,3), hold on
plot(X,w,'k','LineWidth',lW), ylabel('\itw','FontSize',16)
xlabel(['\itx/t; \rm Data \itU_L \rm= (',num2str(vL),',', num2str(wL), ...
	'), \itU_R \rm= (',num2str(vR),',',num2str(wR),')' ],'FontSize',8)

% the code below graphs q (the change of variable) - not needed
%{
subplot(3,1,3), hold on 
plot(X,q,'k','LineWidth',lW), ylabel('\itq','FontSize',16)
xlabel(['\itx/t; \rm Data \itV_L \rm= (',num2str(vL),',', num2str(wL), ...
	'), \itV_R \rm= (',num2str(vR),',',num2str(wR),')' ],'FontSize',16)
%}

% fig2 = figure(2);
% clf;
hold off
subplot(2,2,2)
plot(X,v,'k','LineWidth',lW)
%title(['Case ',num2str(caseNum),': \gamma =',num2str(g),'  States {\itv, w}',':  ', ...
%num2str(iters),' Steps, ', 't = ',num2str(t)],'FontSize',14)
	xlabel('\itx/t', 'FontSize',16), ylabel('\itv','FontSize',16)
subplot(2,2,4), hold off
plot(X,w,'k','LineWidth',lW), ylabel('\itw','FontSize',16)
xlabel(['\itx/t; \rm Data \itU_L \rm= (',num2str(vL),',', num2str(wL), ...
	'), \itU_R \rm= (',num2str(vR),',',num2str(wR),')' ],'FontSize',8)

% the code below graphs q (the change of variable) - not needed
%{
subplot(3,1,3), hold on 
plot(X,q,'k','LineWidth',lW), ylabel('\itq','FontSize',16)
xlabel(['\itx/t; \rm Data \itV_L \rm= (',num2str(vL),',', num2str(wL), ...
	'), \itV_R \rm= (',num2str(vR),',',num2str(wR),')' ],'FontSize',16)
%}

lW = lW + 0.05; % increase line width after each iteration

