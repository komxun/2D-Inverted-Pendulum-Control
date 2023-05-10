clc, clear, close all

% Set-up
m = 1;      % rod's mass (kg)
M = 5;      % wheel's mass (kg)
L = 2;      % rod's half length (m)
g = -9.81;  % Earth's gravity (m/s^2)
d = 1;      % drag coefficient (kg/s)

A = [0    1    0    0;
     0  -d/M -m*g/M 0;
     0    0    0    1;
     0 d/(M*L) -(m+M)*g/(M*L) 0];
 
B = [0; 1/M; 0; 1/(M*L)];

eig(A)  % This shows that the system is currently unstable
%%
new_eig = [-1.3, -1.4, -1.5, -1.6];   % slow
% new_eig = [-2, -2.1, -2.2, -2.3];       % medium
% new_eig = [-3, -3.1, -3.2, -3.3];     % fast


K = place(A, B, new_eig) 

%%
tspan = 0:0.1:20;
y0 = [-3; 0; pi-pi/6; 0];
targ_pos = 2; % Targeted position (m)
[t,state_values] = ode45(@(t,y)wheelpend(y,m,M,L,g,d,-K*(y -[targ_pos; 0; pi; 0])),tspan,y0);

x = state_values(:,1);
xdot = state_values(:,2);
theta = state_values(:,3);
thetadot = state_values(:,4);

% obj = VideoWriter('wheelpend_control_fast');
% obj.Quality =  100;
% obj.FrameRate = 20;
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
subplot(2,2,1);
plot(t, x);
yline(targ_pos, 'r--');
yline(0);
title('Position vs time')
xlabel('time (s)')
ylabel('Position (m)')

subplot(2,2,2);
plot(t,xdot);
yline(0);
title('Linear velocity vs time')
xlabel('time (s)')
ylabel('velocity (m/s)')

subplot(2,2,3);
plot(t,theta*180/pi);
yline(180);
title('Angle vs time')
xlabel('time (s)')
ylabel('Angle (degree)')

subplot(2,2,4);
plot(t,thetadot);
yline(0);
title('Angular velocity vs time')
xlabel('time (s)')
ylabel('Angular velocity (rad/s)')

