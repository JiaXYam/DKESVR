function createfigure(X1, Y1)



% create figure
figure1 = figure('InvertHardcopy','off','WindowState','maximized',...
    'Color',[1 1 1],...
    'OuterPosition',[-6.2 33.8 1550.4 838.4]);

% create axes
axes1 = axes('Parent',figure1,...
    'Position',[0.31875 0.109925293489861 0.351041666666667 0.71931696905016]);
hold(axes1,'on');

% create plot
plot(X1,Y1,'Parent',axes1,'MarkerFaceColor',[0 0 1],...
    'MarkerEdgeColor',[0 0 1],...
    'MarkerSize',4,...
    'Marker','o',...
    'LineStyle','none',...
    'Color',[0 0 1]);

% Using polyfit to Fit Regression Lines
coefficients = polyfit(X1, Y1, 1);
extended_labels = [X1; 0; 400];
extended_fitline = polyval(coefficients, extended_labels);
% create Regression Lines
plot(extended_labels, extended_fitline, 'Parent', axes1, 'Color', [0 0 1]);
% axis(axes1, 'square');
% hold(axes1, 'off');

% Regional division
plot([0 400],[0 400],'k:')                  % Theoretical 45? regression line
plot([0 175/3],[70 70],'k-')
% plot([175/3 320],[70 400],'k-')
plot([175/3 400/1.2],[70 400],'k-')         % replace 320 with 400/1.2 because 100*(400 - 400/1.2)/(400/1.2) =  20% error
plot([70 70],[84 400],'k-')
plot([0 70],[180 180],'k-')
plot([70 290],[180 400],'k-')               % Corrected upper B-C boundary
% plot([70 70],[0 175/3],'k-')
plot([70 70],[0 56],'k-')                   % replace 175.3 with 56 because 100*abs(56-70)/70) = 20% error
% plot([70 400],[175/3 320],'k-')
plot([70 400],[56 320],'k-')
plot([180 180],[0 70],'k-')
plot([180 400],[70 70],'k-')
plot([240 240],[70 180],'k-')
plot([240 400],[180 180],'k-')
plot([130 180],[0 70],'k-')                 % Lower B-C boundary slope OK

% create text
text('Parent',axes1,'FontSize',24,'FontName','Times New Roman','String','A',...
    'Position',[27.3821989528795 32.565445026178 1.4210854715202e-14]);

% create text
text('Parent',axes1,'FontSize',24,'FontName','Times New Roman','String','D',...
    'Position',[28.9528795811518 127.486910994764 1.4210854715202e-14]);

% create text
text('Parent',axes1,'FontSize',24,'FontName','Times New Roman','String','E',...
    'Position',[28.4293193717277 295.706806282723 1.4210854715202e-14]);

% create text
text('Parent',axes1,'FontSize',24,'FontName','Times New Roman','String','C',...
    'Position',[136.910994764398 336.020942408377 1.4210854715202e-14]);

% create text
text('Parent',axes1,'FontSize',24,'FontName','Times New Roman','String','C',...
    'Position',[158.952879581152 23.6649214659686 1.4210854715202e-14]);

% create text
text('Parent',axes1,'FontSize',24,'FontName','Times New Roman','String','E',...
    'Position',[286.282722513089 36.7539267015707 1.4210854715202e-14]);

% create text
text('Parent',axes1,'FontSize',24,'FontName','Times New Roman','String','D',...
    'Position',[315.602094240838 129.424083769634 1.4210854715202e-14]);

% create text
text('Parent',axes1,'FontSize',24,'FontName','Times New Roman','String','B',...
    'Position',[312.984293193717 217.068062827225 1.4210854715202e-14]);

% create text
text('Parent',axes1,'FontSize',24,'FontName','Times New Roman','String','B',...
    'Position',[201.465968586388 282.094240837696 1.4210854715202e-14]);

text('Parent',axes1,'FontSize',24,'FontName','Times New Roman','String','(a)',...
    'Position',[200 475 1.4210854715202e-14]);



% create ylabel
ylabel('Predicted Concentration mg·dL^{-1}','FontName','Times New Roman');

% create xlabel
xlabel('Reference Concentration mg·dL^{-1}','FontName','Times New Roman');

box(axes1,'on');
axis(axes1,'square');
hold(axes1,'off');
% Set other coordinate area properties
set(axes1,'FontName','Times New Roman','FontSize',25);
% create axes
axes2 = axes('Parent',figure1,...
    'Position',[0.31875 0.827374599786555 0.351041666666667 0.104589114194237]);
hold(axes2,'on');
% Nuclear density map
[f_1, xi_1] = ksdensity(X1);
% create plot
plot(xi_1,f_1,'LineWidth',2,...
    'Color',[0.650980392156863 0.650980392156863 0.650980392156863]);

 % Fill area
    fill([xi_1, fliplr(xi_1)], [f_1, zeros(size(f_1))], [0.650980392156863 0.650980392156863 0.650980392156863], 'FaceAlpha', 0.3);

xlim(axes2,[0 400]);
box(axes2,'on');
hold(axes2,'off');
% Set other coordinate area properties
set(axes2,'XTickLabel','','YTick',[],'YTickLabel','');
% create axes
axes3 = axes('Parent',figure1,...
    'Position',[0.669453124999996 0.109925293489861 0.0590625000000012 0.71931696905016]);
hold(axes3,'on');
[f_2, xi_2] = ksdensity(Y1);
% create plot
plot(f_2,xi_2,'LineWidth',2,...
    'Color',[0.650980392156863 0.650980392156863 0.650980392156863]);

%  %Fill area
fill([zeros(size(f_2)), fliplr(f_2)], [xi_2, fliplr(xi_2)], [0.650980392156863 0.650980392156863 0.650980392156863], 'FaceAlpha', 0.3);

ylim(axes3,[0 400]);
box(axes3,'on');
hold(axes3,'off');
% Set other coordinate area properties
set(axes3,'XTick',[],'XTickLabel','','YTickLabel','');
