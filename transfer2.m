function [a] =transfer2(b,n)
%ʮ����ת�����ƺ��� 
%bʮ����������
%nת���Ķ����Ƶ�λ��
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


