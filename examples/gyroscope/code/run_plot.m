plot_info.titles = repeat_str('', 8);
plot_info.xlabels = {'$t$ [s]', '$t$ [s]', ...
                     '$t$ [s]', '$t$ [s]', ...
                     '$t$ [s]', '$t$ [s]', ...
                     '$t$ [s]', '$t$ [s]'};
plot_info.ylabels = {'$\theta_a$', '$\theta_b$', ...
                    '$\theta_c$', '$\theta_d$', ...
                    '$\dot \theta_a$', '$\dot \theta_b$', ...
                    '$\dot \theta_c$', '$\dot \theta_d$'};
plot_info.grid_size = [2, 2];

% States and energies plot
hfigs_states = my_plot(t, x, plot_info);
hfig_energies = plot_energies(sys, t, x);

% Energies
saveas(hfig_energies, '../imgs/energies', 'epsc');
saveas(hfigs_states, '../imgs/states', 'epsc'); 

