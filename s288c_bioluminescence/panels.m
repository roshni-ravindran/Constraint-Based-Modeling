function subhandles = panels(nvert,nhoriz,pos)
% function subhandles = panels(nvert,nhoriz,pos)
% This function creates several subplots in a window that are directly
% attached to each other (no gap in between as in the standard subplot
% function). Input parameters are NVERT, the number of axes systems in the
% vertical direction, and NHORIZ, the number of axes systems in the
% horizontal direction. 
% The optional parameter pos controls the vertical position of the subplot
% system. If you want to plot the x-axis at the bottom of the axes system
% (Matlab's default), then omitt this parameter. The subplots will we
% places such that there is sufficient space at the bottom to add a
% x-label. If you want to have the x-axis at the top, set the parameter to
% 'top' (note that this word must be enclosed by single quotes).
% Each axes system has its own handle to access it
% later on. These handles are stored in the vector SUBHANDLES. The
% numbering starts in the top left subplot (No 1) and continues row wise
% until the last subplot at the bottom right (No NVERT*NHORIZ). The
% following script illustrates the numbering scheme:
% 
% figure
% nv = 7;
% nh = 8;
% subhandles = panels(nv,nh,'top');
% % To illustrate the numbering system only:
% for i=1:nv
%     for j=1:nh
%         subplot(subhandles((i-1)*nh+j))
%         text(0.5,0.5,num2str((i-1)*nh+j))
%     end
% end
% 
% Plotting data:
% --------------
% After creating the subplots, access the subplot you want to use to
% display your data by the statement: subplot(subhandles(6)), for example.
% Now you can plot your data in this particular subplot. You can also use a
% nested for-loop structure as above to access the subplots successively.
% 
% Once you have plotted your data you will need to remove most of the xtick
% and yticklabels. To do so select the axes system that you want to modify
% (e.g. subhandles(n) (n is the number of the axes system, see above) and
% do the following:
%     set(gca,'yticklabel','')
%     set(gca,'xticklabel','')
% For which subplots you need to do this depends on the style of your plot
% (e.g. xaxis at the top or not ...).
% 
% One comment: These plots make only sense if ALL plots in each row have
% the same values on the y-axis and ALL plots in a column share the same
% x-values ...
% 
% Uli Theune, utheune@gmail.com
% 

% Set the bottom position of the plots:
if nargin ==2
    bot = 0.05;
else
    if pos=='top'
        bot =0.05;
    else
        bot = 0.05;
    end
end

% The width and height of the subplots
width = 0.8/nhoriz;
%height=width;
height = 0.8/nvert;

% Place the subplots
for i=1:nvert
    for j=1:nhoriz
        subhandles((i-1)*nhoriz + j)=subplot('position',...
            [0.06+(j-1)*(width+0.02) bot+(nvert-i)*(height+0.02) width height]);
    end
end
