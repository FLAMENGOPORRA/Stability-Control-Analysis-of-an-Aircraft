classdef LiftCoefficientsGlider
    % This object is designed to compute the zero-lift coefficient (CLo)
    % and the lift curve slope (CLα​) for a glider, encapsulating the
    % aerodynamic contributions of both the wing and the horizontal tail.
    
    properties
        aw % Wing's lift curve slope
        iw % Wing's angle of incidence
        a0Lw % Zero-lift angle of attack for the wing
        at % Tail's lift curve slope
        neta_t % Dynamic Pressure Ratio at the tail
        St % Area of the horizontal tail
        Sw % Area of the wing
        it % Tail's angle of incidence
        d_epsilon_d_alpha % Downwash gradient
    end
    
    methods
        function obj = LiftCoefficientsGlider(aw, iw, a0Lw, at, neta_t, St, Sw, it, d_epsilon_d_alpha)
            obj.aw = aw;
            obj.iw = iw;
            obj.a0Lw = a0Lw;
            obj.at = at;
            obj.neta_t = neta_t;
            obj.St = St;
            obj.Sw = Sw;
            obj.it = it;
            obj.d_epsilon_d_alpha = d_epsilon_d_alpha;
        end
        
        function CL0 = calculateCL0(obj)
            CL0 = obj.aw * (obj.iw - obj.a0Lw) + obj.at * obj.neta_t * (obj.St / obj.Sw) * (obj.it - obj.d_epsilon_d_alpha * (obj.iw - obj.a0Lw));
        end
        
        function CLalpha = calculateCLalpha(obj)
            CLalpha = obj.aw + obj.at * obj.neta_t * (obj.St / obj.Sw) * (1 - obj.d_epsilon_d_alpha);
        end
    end
end
