hol_constraints = sys.descrip.hol_constraints{1};
dhol_constraints = dvecdt(hol_constraints, sys.kin.q, sys.kin.qp);
A_hol = equationsToMatrix(dhol_constraints, sys.kin.qp);

unhol_constraints = sys.descrip.unhol_constraints{1};
A_unhol = simplify_(equationsToMatrix(unhol_constraints, sys.kin.qp));

A_1delta = [A_hol; A_unhol];

A = simplify_(sys.kin.A);
C = simplify_(sys.kin.C);

% delta varsigma ell
% A_1delta = subs([A_hol; A_unhol], varsigma, varsigma_subs);
% C_1delta = null(A_1delta);
% 
% C_delta = simplify_(C_1delta - C);
 