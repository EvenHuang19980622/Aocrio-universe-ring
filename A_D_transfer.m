function [J,a1,u_1,Cy] = A_D_transfer(min,max,u,n)
%ADת��������ļ򻯺���,Ҳ����ֱ��ʹ�� 
%min,max�ֱ�Ϊ�������������ֵ������ֵ
%u����������ĳһ��ֵ�Ĳ���ȡֵ��
%n�洢����λ��
%a1 �����������
%CyΪ���λ
%J ���ת����ĵ���ʵʮ������
%u_1 ���ת�����ʮ���Ƽ���
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

