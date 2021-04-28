classdef camera < handle
    
    properties
        right;
        top;
        near;
        far;
        isrender;
    end
    
    methods
        function cameracopy = camera(right,top,near,far)
            cameracopy.right=right;
            cameracopy.top=top;
            cameracopy.near=near;
            cameracopy.far=far;
            
        end
        
        function  projection(cameracopy,width,height,record_Insert,sphere)
            
            
            for i = 1:height
                for j = 1:width
                    tanX=cameracopy.right*(-1/2 +j/width)/cameracopy.near;
                    tanY=cameracopy.top*(-1/2+i/height)/cameracopy.near;
                    lengthsmall=sqrt((tanX*cameracopy.near)^2+(tanY*cameracopy.near)^2+(cameracopy.near)^2);
                    start=[0;0;cameracopy.near;1];
                    direction=[tanX,tanY,1,1];
                    ray_1=ray(start,direction);
                    temp= ray_1.caculation_ray(sphere);
                    record_Insert.changeis_render(i,j,temp);
                    if temp == 1
                        for t= 1:3
                            record_Insert.changepoint(i,j,t,ray_1.crosspoint(t,1));
                            record_Insert.changenormal(i,j,t,ray_1.normal(t,1));
                        end
                        if(abs(ray_1.crosspoint(3))<cameracopy.far)
                            record_Insert.changedistance(i,j,ray_1.Length-lengthsmall);
                            
                        else
                            record_Insert.changedistance(i,j,0);
                            record_Insert.changeis_render(i,j,0);
                        end
                    else
                         record_Insert.changeis_render(i,j,0);
                    end
                end
            end
        end
    end
end

