function drawwheel(state,m,M,L)
x = state(1);
th = state(3);

% dimensions
R = sqrt(M/5);              % Wheel's radius

% positions
y = R;                      % Wheel's vertical position
x_rod = x + 2*L*sin(th);    % Rod's horizontal position
y_rod = y - 2*L*cos(th);    % Rod's vertical position

% Drawing
plot([-10 10],[0 0],'k','LineWidth',2), hold on % Draw a ground level
rectangle('Position',[x-R,y-R,2*R,2*R],'Curvature',[1 1]...
    ,'FaceColor',[.5 0.5 1],'LineWidth',1.5);   % Draw a Wheel
plot([x x_rod],[y y_rod],'k','LineWidth',4);    % Draw a Rod

axis([-1.5*L 1.5*L -L 1.8*2*L]);
axis equal
set(gcf,'Position',[100 100 1000 400])
drawnow, hold off

