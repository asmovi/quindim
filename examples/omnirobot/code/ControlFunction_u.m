function u = ControlFunction_u(in1,in2,in3)

%    This function was generated by the Symbolic Math Toolbox version 7.2.

%    12-Dec-2021 20:00:06



p1 = in1(7,:);

p2 = in1(8,:);

p3 = in1(9,:);

phi1 = in1(4,:);

phi2 = in1(5,:);

phi3 = in1(6,:);

th = in1(3,:);

v1 = in2(1,:);

v2 = in2(2,:);

v3 = in2(3,:);

x = in1(1,:);

y = in1(2,:);

y1_ref = in3(1,:);

y2_ref = in3(4,:);

y3_ref = in3(7,:);

yp1_ref = in3(2,:);

yp2_ref = in3(5,:);

yp3_ref = in3(8,:);

ypp1_ref = in3(3,:);

ypp2_ref = in3(6,:);

ypp3_ref = in3(9,:);

t2 = th+5.235987755982989e-1;

t3 = th+1.047197551196598;

t4 = sin(t2);

t5 = sin(t3);

t6 = sin(phi1);

t7 = sin(phi2);

t8 = sin(phi3);

t9 = cos(t2);

t10 = t6.^2;

t11 = t10.*1.862411627770002e-9;

t12 = t7.^2;

t13 = t12.*1.862411627770002e-9;

t14 = t8.^2;

t15 = t14.*1.862411627770002e-9;

t16 = t11+t13+t15-1.044894955682166e-4;

t17 = 1.0./t16;

t18 = cos(t3);

t19 = cos(th);

t20 = sin(th);

t21 = cos(phi1);

t22 = cos(phi2);

t23 = cos(phi3);

t24 = p3.^2;

t25 = t4.*t5.*t17.*1.63236267389886e1;

t26 = t9.*t17.*t19.*1.63236267389886e1;

t27 = t17.*t18.*t20.*-1.63236267389886e1;

t28 = t5.*t17.*t19.*1.63236267389886e1;

t29 = t4.*t17.*t20.*1.63236267389886e1;

t30 = t9.*t17.*t18.*1.63236267389886e1;

t31 = t25+t26+t27+t28+t29+t30;

t32 = 1.0./t31;

t33 = p1.*-2.0e1;

t34 = x.*-1.0e2;

t35 = y1_ref.*1.0e2;

t36 = yp1_ref.*2.0e1;

t37 = t7.*t19.*t22.*t24.*6.008948770734595e-6;

t38 = t8.*t19.*t23.*t24.*-6.008948770734595e-6;

t39 = t6.*t20.*t21.*t24.*6.938536380660578e-6;

t40 = t7.*t20.*t22.*t24.*-3.469268190330289e-6;

t41 = t8.*t20.*t23.*t24.*-3.469268190330289e-6;

t42 = t33+t34+t35+t36+t37+t38+t39+t40+t41+v1+ypp1_ref;

t43 = t5.*t17.*5.924170616113744e-1;

t44 = p2.*-2.0e1;

t45 = y.*-1.0e2;

t46 = y2_ref.*1.0e2;

t47 = yp2_ref.*2.0e1;

t48 = t6.*t19.*t21.*t24.*-6.938536380660578e-6;

t49 = t7.*t19.*t22.*t24.*3.469268190330289e-6;

t50 = t8.*t19.*t23.*t24.*3.469268190330289e-6;

t51 = t7.*t20.*t22.*t24.*6.008948770734595e-6;

t52 = t8.*t20.*t23.*t24.*-6.008948770734595e-6;

t53 = t44+t45+t46+t47+t48+t49+t50+t51+t52+v2+ypp2_ref;

t54 = p3.*-2.0e1;

t55 = th.*-1.0e2;

t56 = y3_ref.*1.0e2;

t57 = yp3_ref.*2.0e1;

t58 = t21.^2;

t59 = t58.*1.164007267356251e62;

t60 = t22.^2;

t61 = t60.*1.164007267356251e62;

t62 = t23.^2;

t63 = t62.*1.164007267356251e62;

t64 = t59+t61+t63+6.530244270833333e66;

t65 = 1.0./t64;

t66 = phi1.*2.0;

t67 = sin(t66);

t68 = t24.*t67.*1.691871028134086e62;

t69 = phi2.*2.0;

t70 = sin(t69);

t71 = t24.*t70.*1.691871028134086e62;

t72 = phi3.*2.0;

t73 = sin(t72);

t74 = t24.*t73.*1.691871028134086e62;

t75 = t24.*3.926713624160408e26;

t76 = p2.*p3.*t6.*t19.*t21.*2.706993645014537e63;

t77 = p1.*p3.*t7.*t19.*t22.*-2.344325264465624e63;

t78 = p2.*p3.*t7.*t19.*t22.*-1.353496822507269e63;

t79 = p1.*p3.*t8.*t19.*t23.*2.344325264465624e63;

t80 = p2.*p3.*t8.*t19.*t23.*-1.353496822507269e63;

t81 = p1.*p3.*t6.*t20.*t21.*-2.706993645014537e63;

t82 = p1.*p3.*t7.*t20.*t22.*1.353496822507269e63;

t83 = p2.*p3.*t7.*t20.*t22.*-2.344325264465624e63;

t84 = p1.*p3.*t8.*t20.*t23.*1.353496822507269e63;

t85 = p2.*p3.*t8.*t20.*t23.*2.344325264465624e63;

t86 = t68+t71+t74+t75+t76+t77+t78+t79+t80+t81+t82+t83+t84+t85;

t87 = t65.*t86.*1.0;

t88 = t54+t55+t56+t57+t87+v3+ypp3_ref;

t89 = t9.*t17.*5.924170616113744e-1;

t90 = t4.*t17.*5.924170616113744e-1;

t91 = t17.*t19.*5.924170616113744e-1;

u = [t32.*t53.*(t43+t89).*-1.0+t32.*t42.*(t90-t17.*t18.*5.924170616113744e-1).*1.0+t32.*t88.*(t4.*t5.*7.592384529762141e2+t9.*t18.*7.592384529762141e2);t32.*t53.*(t43+t17.*t20.*5.924170616113744e-1)+t32.*t42.*(t91+t17.*t18.*5.924170616113744e-1)+t32.*t88.*(t5.*t19.*7.592384529762141e2-t18.*t20.*7.592384529762141e2);t32.*t42.*(t90+t91).*-1.0+t32.*t53.*(t89-t17.*t20.*5.924170616113744e-1)+t32.*t88.*(t4.*t20.*7.592384529762141e2+t9.*t19.*7.592384529762141e2)];

end