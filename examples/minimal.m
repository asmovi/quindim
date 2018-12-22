% Minimal example
% @Author: Bruno Peixoto

% This line is  necessary if you do not added $ROB4FUN_PATH to Matlab
% folder
addpath('..')

% The 'real' statement on end is important
% for inner simplifications
syms F x xp xpp m b g real;

% Paramater symbolics of the system
sys.syms = [m, b, g];

% Body inertia
I = sym('I%d%d', [3, 3]);

% Position relative to body coordinate system
L = zeros(3, 1);

% Bodies definition
T = {T3d(0, [0, 0, 1].', [x; 0; 0])};

block = build_body(m, I, b, T, L, ... 
                   x, xp, xpp, ...
                   true, struct(''));

sys.bodies = {block};

% Gravity utilities
sys.gravity = [0; 0; -g];
sys.g = g;

% Generalized coordinates
sys.q = x;
sys.qp = xp;
sys.qpp = xpp;               

% External excitations
sys.Fq = F;
sys.u = F;

% Sensors
sys.y = x;

% State space representation
sys.states = [x; xp];

% Kinematic and dynamic model
sys = kinematic_model(sys);
sys = dynamic_model(sys);
