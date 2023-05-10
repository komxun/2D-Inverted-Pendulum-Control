function ds = wheelpend(s,m,M,L,g,d,u)

Sx = sin(s(3));             % sin(theta)
Cx = cos(s(3));             % cos(theta)
D = m*L*L*(M+m*(1-Cx^2));   % Denominator

ds(1,1) = s(2); 
ds(2,1) = (1/D)*(-m^2*L^2*g*Cx*Sx + m*L^2*(m*L*s(4)^2*Sx - d*s(2))) + m*L*L*(1/D)*u;
ds(3,1) = s(4);
ds(4,1) = (1/D)*((m+M)*m*g*L*Sx - m*L*Cx*(m*L*s(4)^2*Sx - d*s(2))) - m*L*Cx*(1/D)*u;
end








