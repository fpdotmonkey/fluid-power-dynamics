% Cylinder

D = 0.032; % m, Cylinder diameter
d = 0.020; % m, Rod diameter

A_A = pi/4 * D^2; % m^2, A-side area
A_B = A_A - pi/4 * d^2; % m^2, B-side area

x_0 = 0.5; % m, Start point
x_max = 1.0; % m, Piston stroke

V_0_A_0 = 3.2e-6; % m^3, Dead volume A side
V_0_B_0 = 2.0e-6; % m^3, Dead volume B side

D_pipe = 0.012; % m, Pipe diameter
L_pipe = 0.75; % m, Pipe length
A_pipe = pi/4 * D_pipe^2; % m^2, Pipe area
V_pipe = A_pipe * L_pipe; % m^3, Pipe volume

V_0_A = V_0_A_0 + V_pipe; % m^3, Total dead volume A side
V_0_B = V_0_B_0 + V_pipe; % m^3, Total dead volume B side

K_f = 1.6e9; % Pa, Bulk modulus
rho = 1000; % kg/m^3, fluid density

m = 234; % kg, load mass

k_A = A_A^2 * K_f / (V_0_A + A_A * x_0); % N/m, A side spring stiffness
k_B = A_B^2 * K_f / (V_0_B + A_B * (x_max - x_0)); % N/m, B side spring stiffness
k_tot = k_A + k_B; % N/m, total spring stiffness
omega = sqrt(k_tot / m); % rad/s, natural angular frequency
f = omega / (2 * pi); % Hz, natural frequency

% Proportional control valve

leakage_flow = 0.45 / 60000; % m^3/s
closed_pressure_difference = 50e5; % Pa
K_10V = 40 / (60000 * sqrt(35e5)); % full opening gain
K_0V = leakage_flow / sqrt(closed_pressure_difference); % full closed gain
time_constant = 0.002;