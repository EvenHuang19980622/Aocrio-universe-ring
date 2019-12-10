function [agg] = fv(t,a,b,T,tr,nk,r,uj)
%采样函数绘图显示
flag=0;
agg=zeros(1,uj+1);
for j=1:1:(uj+1)
i=0;
while(i<=nk)
   if(((a+i*T)<=t(j))&&(t(j)<=(a+i*T+tr))&&(i<=(nk-1)))
       flag=1;
       break;
   elseif (((a+i*T)<=t(j))&&(t(j)<=(a+i*T+tr))&&(i==nk))
       flag=2;
       break;
   else
       flag=0;
       i=i+1;
   end
end
if(flag==1)
agg(j)=r(i+1);
elseif(flag==2)
agg(j)=r(i+1)*fs(t(j),a+i*T+tr,b); 
else
agg(j)=0;
end
end
end

