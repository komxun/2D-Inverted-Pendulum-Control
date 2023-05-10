clc, clear, close all

% Set-up
m = 1;      % rod's mass (kg)
M = 5;      % wheel's mass (kg)
L = 2;      % rod's half length (m)
g = -9.81;  % Earth's gravity (m/s^2)
d = 1;      % drag coefficient (kg/s)

tspan = 0:0.1:20;          % Time span of the simulation
y0 = [0; 0; 0+pi/4; 0];    % Initial conditions
[t,state_values] = ode45(@(t,y)wheelpend(y,m,M,L,g,d,0),tspan,y0);

x = state_values(:,1);
xdot = state_values(:,2);
theta = state_values(:,3);
thetadot = state_values(:,4);

% obj = VideoWriter('animation.gif');
% obj.Quality =  100;
% obj.FrameRate = 30;
% open(obj);

for k = 1:length(t)
    drawwheel(state_values(k,:),m,M,L);
    title(num2str(t(k),'time = %4.3f s'));
%     f = getframe(gcf);
%     writeVideo(obj, f);
end
% obj.close();
fh = figure();
fh.WindowState = 'maximized';
subplot(2,2,1)
plot(t, x)
yline(0)
title('Position vs time')
xlabel('time (s)')
ylabel('displacement (m)')

subplot(2,2,2)
plot(t,xdot)
yline(0)
title('Linear velocity vs time')
xlabel('time (s)')
ylabel('velocity (m/s)')

subplot(2,2,3)
plot(t,theta*180/pi)
yline(0)
title('Angle vs time')
xlabel('time (s)')
ylabel('Angle (degree)')

subplot(2,2,4)
plot(t,thetadot)
yline(0)
title('Angular velocity vs time')
xlabel('time (s)')
ylabel('Angular velocity (rad/s)')
