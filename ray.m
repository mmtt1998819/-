classdef ray < handle
    properties
        start;
        direction;
        Length;
        crosspoint;
        pre_caculationX;
        pre_caculationY;
        pre_caculationZ;
        normal;
        
    end
    
    methods
        function raycopy=ray(start,direction)
            
         
            if nargin == 0
                raycopy.crosspoint=[0;0;0;1];
            else
                raycopy.start=start;
                raycopy.direction=direction;
               
            end
        end
        
        function  precaculation_ray(raycopy)
            syms a b c x y z r x_a y_b z_c r z0
            pre=(solve(x==[a*(z-z_c)+x_a,y==b*(z-z_c)+y_b, r^2==(z-z0)^2+x^2+y^2],[x,y,z]));
           raycopy.pre_caculationX=extractAfter(char(simplify(pre.x)),"x");
           raycopy.pre_caculationY=extractAfter(char(simplify(pre.y)),"x");
           raycopy.pre_caculationZ=extractAfter(char(simplify(pre.z)),"x");
           disp(raycopy.pre_caculationX);
            disp(raycopy.pre_caculationY);
             disp(raycopy.pre_caculationZ);
           
 
        end
        
        
        function Whichpoint(raycopy,pointgroupX,pointgroupY,pointgroupZ)
           vector_1=[pointgroupX(1);pointgroupY(1);pointgroupZ(1);1];
           vector_2=[pointgroupX(2);pointgroupY(2);pointgroupZ(2);1];
           if(norm(vector_1-raycopy.start)<=norm(vector_2-raycopy.start))
              raycopy.crosspoint=vector_1;
              raycopy.Length=norm(vector_1-raycopy.start);         
           else
              raycopy.crosspoint=vector_2;
              raycopy.Length=norm(vector_2-raycopy.start);
           end
        end
        
        function isrender = caculation_ray(raycopy,sphere)%sphere参数这里是指sphere类的一个实例而非类名
            persistent  caculationX caculationY  caculationZ;
         
            if isempty([caculationX,caculationY,caculationZ])
                raycopy.precaculation_ray();
                caculationX=raycopy.pre_caculationX;
                caculationY=raycopy.pre_caculationY;
                caculationZ=raycopy.pre_caculationZ;
            end
            z0=-1;
            r=sphere.radius;
            a=raycopy.direction(1);
            b=raycopy.direction(2);
            c=raycopy.direction(3);
            x_a=raycopy.start(1);
            y_b=raycopy.start(2);
            z_c=raycopy.start(3);
            pointXgroup=eval(caculationX);
            pointYgroup=eval(caculationY);
            pointZgroup=eval(caculationZ);
            if( isreal(pointXgroup))
              raycopy.Whichpoint(pointXgroup,pointYgroup,pointZgroup);
                raycopy.normal=(raycopy.crosspoint-sphere.center)/norm(raycopy.crosspoint-sphere.center);
                isrender=1;
            else
                 isrender = 0;
            end
              
        end
    end
end