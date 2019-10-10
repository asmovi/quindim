classdef my_waitbar
    properties
        idx = tic;
        
        time_mask = '%3.0f %% - %.4f [%%/s] [%s - %s]';
        msg = '';
        name = '';
        
        % Simulation time
        t_sim = 0;
        t_real = 0;
        
        % Real time
        t_curr_str = '';
        t_end_str = '';
        
        % Real time
        t_real_vec = [];
        
        % Real time
        tf = 0;
        tf_real_vec = [];
                
        speed = 0;
        speed_vec = [];
         
        wb = [];
        
        previous_t = 0;
        
        t_prev = 0;
    end
    
    methods
        function obj = set.t_sim(obj, num)
            obj.t_sim = num;
        end
        
        function obj = set.t_real(obj, num)
            obj.t_real = num;
        end
        
        function obj = set.t_curr_str(obj, num)
            obj.t_curr_str = num;
        end
        
%         function obj = set.t_real_vec(obj, arr)
%             obj.t_real_vec = [obj.t_real_vec, arr];
%         end
        
        function obj = set.speed(obj, num)
            obj.speed = num;
        end
    
        function obj = my_waitbar(name)
            obj.name = name;
            
            obj.t_curr_str = datestr(seconds(0), 'HH:MM:SS');
            obj.t_end_str = datestr(seconds(0), 'HH:MM:SS');
            
            obj.msg = sprintf(obj.time_mask, 0, obj.speed, ...
                              obj.t_curr_str, obj.t_end_str);
            
            cancel_callback = 'setappdata(gcbf,''canceling'',1)';
            obj.wb = waitbar(0, obj.msg,  'Name', obj.name, ... 
                             'CreateCancelBtn', cancel_callback);
            
            wb_texts = findall(obj.wb, 'type', 'text');
            set(wb_texts, 'Interpreter', 'none');
            
            obj.previous_t = tic;
        end
        
        function h = find_handle(obj)
            h = findall(0,'type','figure','tag','TMWWaitbar');
        end
        
        function delete(obj)
            % obj is always scalar
            F = findall(0,'type','figure','tag','TMWWaitbar');
            delete(F);
        end
                
        function obj = update_waitbar(obj, t, tf)
            dt = toc(obj.previous_t);
            
            obj.tf = tf;
            obj.t_sim = t;
            
            % Variable updates - Time, percentage, display current time, 
            % display end time, average speed
            obj.t_real = obj.t_real + dt;
            
            perc = 100*t/tf;
            
            if(perc > 100)
                perc = 100;
            end
            
            if(perc == 1)
                obj.t_real = obj.t_prev;
            end
            
            obj.t_curr_str = datestr(seconds(obj.t_real), 'HH:MM:SS');                
            
            if((perc < eps))
                t_f = 0;
                obj.speed = 0;
            
            else
                obj.speed = perc/obj.t_real;
                t_f = 100/obj.speed;
            end
            
            obj.t_end_str = datestr(seconds(t_f), 'HH:MM:SS');
            obj.msg = sprintf(obj.time_mask, perc, obj.speed, ...
                              obj.t_curr_str, obj.t_end_str);
            
 % Uncomment this block if you wish to plot speed and time consuming
 % vectors
             obj.t_real_vec = [obj.t_real_vec, obj.t_real];
             obj.speed_vec = [obj.speed_vec; obj.speed];
            
            obj.tf_real_vec = [obj.tf_real_vec, t_f];
            
            waitbar(t/tf, obj.wb, obj.msg);
            
            obj.previous_t = tic;
            obj.t_prev = obj.t_real;
        end
        
        function close_window(obj)
            h = obj.find_handle();
            obj.tf_real_vec
            
            % Erase waitbar
            tf = obj.tf_real_vec(end);
            fprintf('Elapsed time is %.6f seconds.\n', tf);
            
            delete(h);
        end
    end
end