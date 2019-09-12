function plant = plantfun(t, x, x_d)
%PLANTFUN
%    PLANT = PLANTFUN(P1,P1_D,PP1_D,X,X_D)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    09-Sep-2019 17:17:09

x_ = x(1);
p1 = x(2);
x = x_;

x_d_ = x_d(1);
p1_d = x_d(2);
pp1_d = x_d(3);
x_d = x_d_;

plant = [p1;p1.*5.0-p1_d.*5.0+pp1_d+sign(-p1+p1_d+x.*5.0-x_d.*5.0).*1.0];
