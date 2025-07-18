% graphs p and u
%   lU: variable to control line width, increases after each iteration
%   fig: figure object with all p,u plots
%   fig2: figure object with latest p,u plot

fig = figure(1); %, clf
hold on
subplot(2,2,1), hold on
plot(X,p,'k','LineWidth',lU);
title(['                                     Case ',num2str(caseNum),': \rho bar = ',num2str(pbar),', a = ',num2str(aexp), ...
 ', Steps = ', num2str(iters), ', t = ', num2str(round(t, 2))],'FontSize',16)
	xlabel('\itx/t', 'FontSize',16), ylabel('\itp','FontSize',16)
subplot(2,2,3), hold on
plot(X,u,'k','LineWidth',lU), ylabel('\itu','FontSize',16)
xlabel(['\itx/t; \rm Data \itU_L \rm= (',num2str(pL),',', num2str(uL), ...
	'), \itU_R \rm= (',num2str(pR),',',num2str(uR),')' ],'FontSize',8)

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
plot(X,p,'k','LineWidth',lU)
% title(['Case ',num2str(caseNum),': \rho_L =',num2str(pL),'  States {\itp, u}',':  ', ...
% num2str(iters),' Steps, ', 't = ',num2str(t)],'FontSize',14)
	xlabel('\itx/t', 'FontSize',16), ylabel('\itp','FontSize',16)
subplot(2,2,4), hold off
plot(X,u,'k','LineWidth',lU), ylabel('\itu','FontSize',16)
xlabel(['\itx/t; \rm Data \itU_L \rm= (',num2str(pL),',', num2str(uL), ...
	'), \itU_R \rm= (',num2str(pR),',',num2str(uR),')' ],'FontSize',8)

% the code below graphs q (the change of variable) - not needed
%{
subplot(3,1,3), hold on 
plot(X,q,'k','LineWidth',lW), ylabel('\itq','FontSize',16)
xlabel(['\itx/t; \rm Data \itV_L \rm= (',num2str(vL),',', num2str(wL), ...
	'), \itV_R \rm= (',num2str(vR),',',num2str(wR),')' ],'FontSize',16)
%}

lU = lU + 0.05; % increase line width after each iteration
