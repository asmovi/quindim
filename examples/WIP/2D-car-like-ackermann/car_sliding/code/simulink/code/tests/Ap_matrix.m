function dA_1delta = Ap_matrix(x, kappa_1, kappa_2, alpha_1, alpha_2, w, L, R)
%DCONSTRAINTMATRIX
%    A_1DELTA = DCONSTRAINTMATRIX(L,R,ALPHA_1,ALPHA_2,DELTA_I,DELTA_O,KAPPA_1,KAPPA_2,THETA,W)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    16-Oct-2020 14:33:54
    
    x_pos =  x(1);
    y_pos =  x(2);
    theta =  x(3);

    delta_i = x(4);
    delta_o = x(5);

    phi_i = x(6);
    phi_l = x(7);
    phi_o = x(8);
    phi_r = x(9);

    t2 = tan(delta_i);
    t3 = 1.0./L;
    t4 = t2.*w;
    t5 = L+t4;
    t6 = 1.0./t5;
    t7 = t2.*t6;
    t8 = tan(t7);
    t9 = delta_i+theta;
    t10 = cos(t9);
    t11 = sin(t9);
    t12 = tan(alpha_1);
    t13 = cos(delta_i);
    t14 = sin(delta_i);
    t15 = t14.*w.*(1.0./2.0);
    t16 = kappa_1.*t10.*t12;
    t17 = kappa_1.*t11.*t12;
    t18 = kappa_1.*t12.*(t15-L.*t13);
    t19 = L.*t8;
    t20 = atan(t19);
    t21 = t20+theta;
    t22 = delta_o+theta;
    t23 = tan(alpha_2);
    t24 = L.^2;
    t25 = t8.^2;
    t26 = t24.*t25;
    t27 = t26+1.0;
    t28 = 1.0./sqrt(t27);
    t29 = sin(t21);
    t30 = cos(t22);
    t31 = kappa_2.*t23.*t30;
    t32 = cos(t21);
    t33 = sin(t22);
    t34 = kappa_2.*t23.*t33;
    t35 = cos(delta_o);
    t36 = L.*t35;
    t37 = sin(delta_o);
    t38 = t37.*w.*(1.0./2.0);
    t39 = t36+t38;
    dA_1delta = reshape([0.0, ...
                         0.0, ...
                         t10+t16, ...
                         -t11+t16, ...
                         t31+t32, ...
                         -t29+t31, ...
                         0.0,0.0, ...
                         t11+t17, ...
                         t10+t17, ...
                         t29+t34,t32+t34, ...
                         0.0,0.0, ...
                         t15+t18-L.*t13,t18+L.*t14+t13.*w.*(1.0./2.0), ...
                         -L.*t28-kappa_2.*t23.*t39-L.*t8.*t28.*w.*(1.0./2.0), ...
                         t28.*w.*(-1.0./2.0)-kappa_2.*t23.*t39+t8.*t24.*t28, ...
                         t3.*(t2.^2+1.0).*(L-L.*t8.*w),0.0,0.0,0.0,0.0,0.0, ...
                         -t3.*t5.*t27,0.0,0.0,0.0,0.0,0.0,0.0,0.0,-R, ...
                         0.0,0.0,0.0,0.0,0.0,0.0,0.0,-R,0.0,0.0, ...
                         -t2.*t3.*w-1.0,0.0,0.0,0.0,0.0,0.0, ...
                         1.0,0.0,0.0,0.0,0.0],...
                         [6,9]);

    