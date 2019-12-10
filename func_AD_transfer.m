function [au,ak,dk] = func_AD_transfer(f,a,b,T,tr,n,uj)
%��������ADת��
%au ����������Ʋ�������
%ak �����ʮ���ƴ����������
%dk �����ʮ����ʵʱ��������
%f �ǲ�������  f�ڱպ�����[a,b]���ϸ�����������ȷ��,�䵼��Ҳ�������������ϲ�С���㣨���ޣ�
%a b �ǲ�������
%T�ǲ�������
%tr �ǲ�������ʱ��
%n�洢����λ��
%uj��ͼ����
syms t;
fmin=matlabFunction(f);
fmax=matlabFunction(-f);
%����ֵ����%
if((n>0)&&(rem(n,1)==0)&&(uj>0)&&(rem(uj,1)==0)&&(a<b)&&(T>0)&&(T<=(b-a))&&(tr>0)&&(tr<T))
 [min]=fminbnd_level2(fmin,a,b,uj);%��⾫���Ǹ������ˣ�����fminbnd�Ĺ�
 min=min-1;%����ֵ��ֵ��Ϊ1����֤���ɹ�
 [max1]=fminbnd_level2(fmax,a,b,uj);%��⾫���Ǹ������ˣ�����fminbnd�Ĺ�
 max=-max1;
 max=max+1;%����ֵ��ֵ��Ϊ1����֤���ɹ�
 nk=fix((b-a)/T);%��������=nk+1;
 dk=zeros(1,nk+1);%ʮ���Ʋ�������
 au=zeros(nk+1,n);%�����Ʋ�������
 ak=zeros(1,nk+1);%ʮ���ƴ����������
 for i=0:1:nk
     dk(i+1)=fmin(a+i*T);
     [uf,rk,~]= A_D_transfer(min,max,dk(i+1),n);
     ak(i+1)=uf;
     for j=1:1:n
     au(i+1,j)=rk(1,j); 
     end
 end
 x=a:(b-a)/uj:b; hold on;
 axis on;
 r1=fv(x,a,b,T,tr,nk,dk,uj);
 r2=fv(x,a,b,T,tr,nk,ak,uj);
 subplot(2,2,1);
 plot(x,fmin(x));
 title('ԭʼ��������ͼʾ��');
 xlabel('t/s');
ylabel('��ֵ');
 subplot(2,2,2); 
 plot(x,r1,'k');
  title('ʵʱ������ʵ����ͼʾ��');
 xlabel('t/s');
ylabel('��ֵ');
 subplot(2,2,3);
 plot(x,r2);
 title('ADת������ͼʾ��');
 xlabel('t/s');
ylabel('��ֵ');
 subplot(2,2,4);
 plot(x,r1,'k',x,r2);
  title('�Ƚ�ͼ');
 xlabel('t/s');
 ylabel('��ֵ');
 hold off;
%��ͼ% 
else
    disp('error��please input again��');
end

