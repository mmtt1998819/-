classdef sphere < handle
    properties(Access = public)
        radius;
        center;
        position;
    end
    
    methods
        
        function move(obj,offset)
            obj.center=offset*obj.center;
            
        end
        function obj = sphere(radius)
            obj.radius=radius;
            obj.center=[0;0;0;1];
        end
        
        
        function rotation(obj,angle_X,angle_Y,angle_Z)
            x_ro=[1,0,0,0;0,cos(angle_X),-sin(angle_X),0;0,sin(angle_X),cos(angle_X),0;0,0,0,1];
            y_ro=[cos(angle_Y),0,sin(angle_Y),0;0,1,0,0;-sin(angle_Y),0,cos(angle_Y),0;0,0,0,1];
            z_ro=[cos(angle_Z),-sin(angle_Z),0,0;sin(angle_Z),cos(angle_Z),0,0;0,0,1,0;0,0,0,1];
            obj.position=x_ro*y_ro*z_ro*obj.position;
        end
        
    end
    
end

