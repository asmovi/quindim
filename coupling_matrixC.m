function C = coupling_matrixC(mechanism, q)
    n_bullet = length(mechanism.q_bullet);
    n_circ = length(mechanism.q_circ);
    
    if(n_bullet + n_circ ~= legnth(q))
        error('The dimensions of q_bullet plus q_circ MUST be equal to dimension of provided q')        
    end
    
    % Jacobians
    Jac_bullet = subs(mechanism.Jac_bullet, ...
                      [mechanism.q_bullet, mechanism.q_circ], q);
    Jac_circ = subs(mechanism.Jac_circ, ...
                      [mechanism.q_circ, mechanism.q_circ], q);
    
    % Generalized speed to coordinates derivatives
    D_bullet = subs(mechanism.D_bullet, ...
                    mechanism.q_bullet, q(1:n_bullet));
    D_circ = subs(mechanism.D_circ, ...
                  mechanism.q_circ, q(n_bullet+1:end));
    
    % Coupling matrix
    C = [eyes(n_bullet); -(D_circ\Jac_bullet)*Jac_circ*pinv(D_bullet)];
end