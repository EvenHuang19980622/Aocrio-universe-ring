function [g]= fs(x,y,z)
%ĩ����������
if(y<=z)
 g=1;  
else
   if(x<=z)
       g=1;
   end
    if((z<x)&&(x<=y))
       g=0;
    end
end
end

