classdef recordInsert < handle
    
    
    properties
        point;
        normal;
        distance;
        is_render;
        
    end
    
    methods
        function record = recordInsert (m,n)
            record.point= zeros(m,n,3);
            record.normal=zeros(m,n,3);
            record.distance=zeros(m,n);
            record.is_render=ones(m,n);
        end
        
        function changepoint(record,m,n,i,target)
            record.point(m,n,i)=target;
        end
        function changenormal(record,m,n,i,target)
             record.normal(m,n,i)=target;
        end
        function changedistance(record,m,n,target)
            record.distance(m,n)=target;
            
        end
        function changeis_render(record,m,n,target)
            record.is_render(m,n)=target;
        end
    end
end

