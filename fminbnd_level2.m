function [min] = fminbnd_level2(f,value_left,value_right,uj)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
 x=value_left:(value_right-value_left)/uj:value_right;
plot(x,f(x));
A_left = input('Input the possible maxmium value_left:');
disp(['You input the possible maxmium value_left is:',num2str(A_left)]);
A_right = input('Input the possible maxmium value_right:');
disp(['You input the possible maxmium value_right is:',num2str(A_right)]);
 [~,min_test]=fminbnd(f,A_left,A_right);
if (f(value_left)<f(value_right))
    if(min_test<=f(value_left))
        min=min_test;
    else
        min=f(value_left);
    end
else
     if(min_test<=f(value_right))
          min=min_test;
     else
         min=f(value_right); 
     end
end
end

