function [u,k]= xianchuangdong_ouheweizhi(c1,c2,c3,h_up,h_down,theta_begin,Ko)

global b1;global cc1;global d1;global e1;global f1;global g1;global h1;global i1;global j1;global k1;global l1;global m1;global n1;global o1;global p1;global q1;global r1;global s1;global t1;global u1;global v1;
%�ߴ����ؽ�����������ַ���ؼ����Գ���
%  c1,c2,c3 Ϊ���ڽ�������ָ�ļ���������װ������Ԫ�����飬��Ҫ��ǰ����������⣬ͨ������ִ��������
% h_up,h_downΪ���²���ָ��λ�õĵ������������ز���
% theta_begin ��ָ��Ҫ�������ָ���˶���Χ
% Ko ģʽѡ�� 1Ϊ������ ��������ָ�Լ��ں���λ��ȡh_up,h_down������������������������ߵĶԱȣ�ͨ�����ȡֵ���õ����ֵ
% 0Ϊ������ �Ǵ���֪�Ĳ������߳�����ϵͳ�Զ���Ѱ�����h_up,h_down�����Ҽ��Է�����h_up,h_down���Լ�����������������ߵĶԱ�
% k Ϊ������ȡ���λ�ò��������
% u Ϊ����ɹ��ı�־ 0Ϊ����ʧ�� ���������������������̫�� 1 Ϊ����ɹ� �����������һ���̶�����������������
a1=zeros(1,2);a2=zeros(2,2);a4=zeros(2,3);a5=zeros(3,2);a6=zeros(3,2);a7=zeros(3,6);  
a1(1,1)=c2{1,10}/(c2{1,10}+1);a1(1,2)=c3{1,10}/(c3{1,10}+1); %��ȡk���ӣ����ɸ���K������%
a2(1,1)=a1(1,1)*c2{1,11}+2;a2(2,1)=(1-a1(1,1))*c2{1,11}+2;
a2(1,2)=a1(1,2)*c3{1,11}+2;a2(2,2)=(1-a1(1,2))*c3{1,11}+2;%�洢����������²�ĺ��%
a5(1,1)=c1{1,2}(1,2); a5(1,2)=c1{1,3}(1,2); 
a5(2,1)=c2{1,2}(1,2); a5(2,2)=c2{1,3}(1,2);
a5(3,1)=c3{1,2}(1,2); a5(3,2)=c3{1,3}(1,2); %�洢����������б߽���Y����%
a7(1,1)=a5(1,1);a7(1,2)=a5(1,2);a7(1,3)=c1{1,4}(1,2);a7(1,4)=c1{1,5}(1,2);a7(1,5)=c1{1,6}(1,2);a7(1,6)=c1{1,7}(1,2);
a7(2,1)=a5(2,1);a7(2,2)=a5(2,2);a7(2,3)=c2{1,4}(1,2);a7(2,4)=c2{1,5}(1,2);a7(2,5)=c2{1,6}(1,2);a7(2,6)=c2{1,7}(1,2);
a7(3,1)=a5(3,1);a7(3,2)=a5(3,2);a7(3,3)=c3{1,4}(1,2);a7(3,4)=c3{1,5}(1,2);a7(3,5)=c3{1,6}(1,2);a7(3,6)=c3{1,7}(1,2);           %�洢����������б߽�㡢�ϱ߽�㡢�±߽���Y����%
f=matlabFunction(c1{1,1});  %ת��Ϊ��������
a4(1,1)=f(a5(1,1));a4(2,1)=f(a5(1,2));  %�洢����������б߽��X����%
a6(1,1)=min(a7(1,:));a6(1,2)=max(a7(1,:)); %�洢����������б߽�㡢�ϱ߽�㡢�±߽���Y����������%
f=matlabFunction(c2{1,1});  %ת��Ϊ��������
a4(1,2)=f(a5(2,1));a4(2,2)=f(a5(2,2));  %�洢����������б߽��X����%
a6(2,1)=min(a7(2,:));a6(2,2)=max(a7(2,:)); %�洢����������б߽�㡢�ϱ߽�㡢�±߽���Y����������%
f=matlabFunction(c3{1,1});  %ת��Ϊ��������
a4(1,3)=f(a5(3,1));a4(2,3)=f(a5(3,2));  %�洢����������б߽��X����%
a6(3,1)=min(a7(3,:));a6(3,2)=max(a7(3,:)); %�洢����������б߽�㡢�ϱ߽�㡢�±߽���Y����������%
if Ko==1 %ģʽѡ��
  if (0<=h_up)&&(h_up<=min(a4(2,1),a4(1,2)))&&(0<=h_down)&&(h_down<=min(a4(2,2),a4(1,3))) %�ж��Ƿ񳬽�%
      ckk=zeros(4,3);gkk=zeros(3,2);
      f=matlabFunction(c1{1,1});
      fv=matlabFunction(c1{1,10}); 
      fk=f;fvk=fv;a6k=a6;a7k=a7;c1k=c1;h_upk=h_up;
      a1=1;b1=1;cc1=1;d1=2;e1=1;f1=4;g1=1;h1=2;i1=1;j1=5;k1=1;l1=3;m1=1;n1=2;o1=1;p1=1;q1=1;r1=2;s1=1;t1=1;u1=1;v1=2;
    x=fsolve(@(x)myfun(x),[1,1,1],optimset('Display','off'));
      ckk(1,1)=x(1);ckk(1,2)=x(2);ckk(1,3)=x(3);
      f=matlabFunction(c2{1,1});
      fk1=f;a6k1=a6;a7k1=a7;a2k1=a2;h_upk1=h_up;
     x=fsolve(@(x)myfun1(x),[1,1,1],optimset('Display','off'));
      ckk(2,1)=x(1);ckk(2,2)=x(2);ckk(2,3)=x(3);
       fk2=f;a6k2=a6;a7k2=a7;a2k2=a2;h_downk2=h_down;
     x=fsolve(@(x)myfun2(x),[1,1,1],optimset('Display','off'));
       ckk(3,1)=x(1);ckk(3,2)=x(2);ckk(3,3)=x(3);
        f=matlabFunction(c3{1,1});
         fk3=f;a6k3=a6;a7k3=a7;a2k3=a2;h_downk3=h_down;
     x=fsolve(@(x)myfun3(x),[1,1,1],optimset('Display','off'));
         ckk(4,1)=x(1);ckk(4,2)=x(2);ckk(4,3)=x(3);
      gkk(1,1)=c1{1,8}(1,2); gkk(1,2)=c1{1,9}(1,2);
        gkk(2,1)=c2{1,8}(1,2); gkk(2,2)=c2{1,9}(1,2);
          gkk(3,1)=c3{1,8}(1,2); gkk(3,2)=c3{1,9}(1,2);
      r3=sqrt((gkk(1,2)-ckk(1,2))^2+(ckk(1,3))^2);
      r1=sqrt((gkk(2,1)-ckk(2,2))^2+(ckk(2,3))^2);
      r4=sqrt((gkk(2,2)-ckk(3,2))^2+(ckk(3,3))^2);
      r2=sqrt((gkk(3,1)-ckk(4,2))^2+(ckk(4,3))^2);
      delta_theta1_delta_theta2=(r4+r2)/(r1+r3);
      x=0:1:theta_begin;
      subplot(1,2,1);
      y1= delta_theta1_delta_theta2*x;
      plot(x,y1);
      xlabel('PIP���˶��Ƕ�/��');ylabel('DIP���˶��Ƕ�/��');legend('PIP-DIP������Ϸ���ʵ������');
      subplot(1,2,2);
      y2=0.8*x;
      plot(x,y2);
       xlabel('PIP���˶��Ƕ�/��');ylabel('DIP���˶��Ƕ�/��');legend('PIP-DIP���������ƽ�����');
      hold on;
       plot(x,y2);
     k=ckk;
     dv=y1-y2;
     ssk=sum(dv.*dv)/theta_begin;
     div=sum(dv)/theta_begin;
     u=[div ssk];
  else
     disp('error! the value of h_up and h_down is error,the range is so big!');
    u=1;k=1;
  end 
else
    u=1;k=1;
end
end