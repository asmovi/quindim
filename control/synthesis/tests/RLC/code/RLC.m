clear all
close all
clc

run('main.m');

% Params and parameters estimation
model_params = sys.descrip.model_params.';
imprecision = [0; 0; 0];
%imprecision = [0.99; 0.1; 0.2];
params_lims = [(1-imprecision).*model_params, ...
               (1+imprecision).*model_params];

rel_qqbar = sys.kin.q;

n = length(sys.kin.q);

% Control action
eta = 5*ones(n, 1);
poles = -10*ones(n, 1);
u = sliding_underactuated(sys, eta, poles, params_lims, rel_qqbar, true);

len_params = length(sys.descrip.model_params);

% Initial values
x0 = [0; 0];

% Saturation parameter
phi = 1;

% Tracking values
A = 1;
w = 2*pi*100;
q_p_ref_fun = @(t) [-A*cos(w*t)/w; A*sin(w*t); A*w*cos(w*t)];

% Initial conditions
tf = 1e-3;
dt = 1e-7;
tspan = 0:dt:tf;
df_h = @(t, x) df_sys(t, x, q_p_ref_fun, u, sys, tf);
sol = my_ode45(df_h, tspan, x0);

[m, ~] = size(sys.dyn.Z);

% Plot part
img_path = '../imgs/';

x = sol(1:end, :);

t_len = length(tspan);

q_p_s = [sys.kin.q; sys.kin.p];
q_p_d_s = add_symsuffix([q_p_s; sys.kin.pp], '_d');

[~, m] = size(sys.dyn.Z);

u_n = zeros(t_len, m);

for i = 1:t_len
    x_i = x(:, i);
    x_di = q_p_ref_fun(tspan(i));
    
    x_xd_i = [x_i; x_di];
    x_xd_s = [q_p_s; q_p_d_s];
    
    u_n(i, :) = subs(u.output, x_xd_s, x_xd_i);
end

q_p = [sys.kin.q; sys.kin.p];
n = length(q_p);

% States plot
plot_config.titles = repeat_str('', n);
plot_config.xlabels = repeat_str('t [s]', n);
plot_config.ylabels = {'$Q$ [C]', '$i$ [A]'};
plot_config.grid_size = [1, 2];

hfigs_x = my_plot(tspan, x', plot_config);

% Input plot
plot_config.titles = {'', ''};
plot_config.xlabels = {'t [s]'};
plot_config.ylabels = {'$u$ [V]'};
plot_config.grid_size = [1, 1];

hfigs_u = my_plot(tspan, u_n, plot_config);

% Sliding function plot
plot_config.titles = {''};
plot_config.xlabels = {'t [s]'};
plot_config.ylabels = {'Sliding function $s$'};
plot_config.grid_size = [1, 1];

s = [];

alpha_ = u.alpha;
lambda = u.lambda;

for i = 1:t_len
    x_i = x(:, i);
    x_di = q_p_ref_fun(tspan(i));
    
    x_xd_i = [x_i; x_di];
    x_xd_s = [q_p_s; q_p_d_s];
    
    s_i = double(subs(u.s, x_xd_s, x_xd_i));
    
    s = [s; s_i];
end

hfigs_s = my_plot(tspan', s, plot_config);

% States
saveas(hfigs_x, '../imgs/x.eps', 'epsc');

% States
saveas(hfigs_u, '../imgs/u.eps', 'epsc');

% Sliding function
saveas(hfigs_s, '../imgs/s.eps', 'epsc');