function [a] =transfer2(b,n)
%十进制转二进制函数 
%b十进制正整数
%n转换的二进制的位数
j=1;
if((n>0)&&(rem(n,1)==0)&&(b>=0)&&(rem(b,1)==0))
   a=zeros(1,n);
while(fix(b/2)~=0)
    a(1,j)=(b-2*fix(b/2));
    b=fix(b/2);
    j=j+1;
end
if(b==0)
 a(j)=0; 
else  
 a(j)=1; 
end
else
    disp('error!please input again!');
end
end


