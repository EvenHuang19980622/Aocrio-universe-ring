function [J,a1,u_1,Cy] = A_D_transfer(min,max,u,n)
%AD转换器最核心简化函数,也可以直接使用 
%min,max分别为采样区间的下限值和上限值
%u采样区间中某一个值的采样取值点
%n存储器的位数
%a1 输出二进制数
%Cy为溢出位
%J 输出转换后的的真实十进制数
%u_1 输出转换后的十进制计数
if((n>0)&&(rem(n,1)==0)&&(max>min)&&(u>=min)&&(u<=max))
    k=0;
    A=max-min;
   while(k<=(2^(n)-1))
    if(k<=2^(n)-2) 
     if((u-(min+(A*k)/(2^(n)))>=0)&&(u-(min+(A*(k+1))/(2^(n)))<=0))    
        if(u-(min+(A*k)/(2^(n)))<A/2^(n+1))
          u_1=k;
          a1=transfer2(u_1,n);
           Cy=0;
          J=min+(A*u_1)/(2^(n));
          break;
        else
           u_1=(k+1);
          a1=transfer2(u_1,n);
           Cy=0;
          J=min+(A*u_1)/(2^(n));
          break; 
        end
     end
     k=k+1;
    else
      if(u-(min+(A*k)/(2^(n)))<A/2^(n+1))
          u_1=k;
          a1=transfer2(u_1,n);
          Cy=0;
          J=min+(A*u_1)/(2^(n));
          break;
        else
           u_1=0;
          a1=transfer2(u_1,n);
          Cy=1;
          J=min+(A*u_1)/(2^(n));
          break; 
      end  
    end
end  
else
    disp('error!please input again!');
end
end

