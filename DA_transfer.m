function [u]=DA_transfer(min,max,c,cy)
A=max-min;
[~,length]=size(c);
n=length;
flag=0;
for i=1:1:n
   if (c(i)==1)||(c(i)==0)
     flag=0;
   else
     flag=1;
   break; 
   end
end
if(flag==0)
sum=0;
switch cy
    case 0
        for i=1:1:n 
        sum=sum+2^(i-1)*c(i); 
        end
        u=min+(A*sum/2^(n));
    case 1 
        u=max;
end
else
    disp('error!please input again!')
end
end