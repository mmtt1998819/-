classdef realize < handle
    properties
        
    end
    
    methods(Static)
        function renderdepth()
            obj_1=sphere(0.9);
            record_Insert=recordInsert(500,500);
            camera_1=camera(2,2,1,5);
            camera_1.projection(500,500,record_Insert,obj_1);
            gama=(255-min(255,record_Insert.distance/max(max(record_Insert.distance))*255)).*record_Insert.is_render;
            imshow(gama,[0,255]);
            disp(record_Insert.distance);

        end
        
    end
    
    methods
        function  realize_1 = realize()
        end
    end
end
