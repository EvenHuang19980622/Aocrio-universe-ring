function u=heavisides(x,a,b,k)
switch k
    case 0
if (a<=x)&(x<=b)
u=1;
else
 u=0;
end
    case 1
     if (a<x)&(x<=b)
u=1;
else
 u=0;
     end   
    case 2
        if (a<=x)&(x<b)
u=1;
else
 u=0;
        end   
    case 3
         if (a<x)&(x<b)
u=1;
else
 u=0;
         end   
end
end

