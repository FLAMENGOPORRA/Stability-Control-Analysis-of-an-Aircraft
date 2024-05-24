classdef CmacCalculation
    %{ The purpose of this class is to calculate the Corrected Cmac for
    %  Twist Angle and Mach affects and Aerodynamic Center in % of C_bar
    %}
    properties
        X_cr_ac % X coordinate wing aerodynamic center position from datcom figure 4.1.4.2-26
        X_bar_mac % Mean Aerodynamic Chord position
        Cmac % Coefficient of moment at the aerodynamic center Table G.1 Datmcom
        Sweep_C4 % Sweep angle at the quarter chord (degrees)
        A % Aspect Ratio of the wing
        Del_Cmnot_theta % Change in moment coefficient due to twist from datcom figure 4.1.4.1-5
        Comp_Corr % Compressibility correction factor from datcom figure 4.1.4.1-6
        C_bar % Mean Chord Length (ft)
        TWISTA % Wing twist angle
        Cr % Chord Root Length
    end
    
    methods
        function obj = CmacCalculation(X_cr_ac, X_bar_mac, Cmac, Sweep_C4, A, Del_Cmnot_theta, Comp_Corr, C_bar, TWISTA, Cr)
            obj.X_cr_ac = X_cr_ac;
            obj.X_bar_mac = X_bar_mac;
            obj.Cmac = Cmac;
            obj.Sweep_C4 = Sweep_C4;
            obj.A = A;
            obj.Del_Cmnot_theta = Del_Cmnot_theta;
            obj.Comp_Corr = Comp_Corr;
            obj.C_bar = C_bar;
            obj.TWISTA = TWISTA;

            obj.Cr = Cr;
        end    

        % Calculate Cmac for Aspect Ratio and Sweep@c/4
        function Cmac_theta0 = calcCmacTheta0(obj)
            Cmac_theta0 = obj.Cmac * (obj.A * (cosd(obj.Sweep_C4))^2) / (obj.A + (2 * cosd(obj.Sweep_C4)));
        end
        
        % Calculate Corrected Cmac for Twist Angle and Mach affects
        function Cmac_Corrected = calcCmacCorrected(obj)
            Cmac_theta0 = obj.calcCmacTheta0();
            Cmac_Corrected = (Cmac_theta0 + (obj.Del_Cmnot_theta * obj.TWISTA)) * obj.Comp_Corr;
        end
        
        % Calculate Location of the Aerodynamic Center in % of C_bar
        function X_mac = calcX_mac(obj)
            X_mac = ((obj.X_cr_ac * obj.Cr) - obj.X_bar_mac) / obj.C_bar;
        end
    end
end
