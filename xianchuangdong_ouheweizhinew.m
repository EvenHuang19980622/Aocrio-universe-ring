function [u,k,delta_theta1_delta_theta2]= xianchuangdong_ouheweizhinew(c1,c2,c3,h_up,h_down,theta_begin,Ko)
%�ߴ����ؽ�����������ַ���ؼ����Գ���
%  c1,c2,c3 Ϊ���ڽ�������ָ�ļ���������װ������Ԫ�����飬��Ҫ��ǰ����������⣬ͨ������ִ��������
% h_up,h_downΪ���²���ָ��λ�õĵ������������ز���
% theta_begin ��ָ��Ҫ�������ָ���˶���Χ
% Ko ģʽѡ�� 1Ϊ������ ��������ָ�Լ��ں���λ��ȡh_up,h_down������������������������ߵĶԱȣ�ͨ�����ȡֵ���õ����ֵ
% 0Ϊ������ �Ǵ���֪�Ĳ������߳�����ϵͳ�Զ���Ѱ�����h_up,h_down�����Ҽ��Է�����h_up,h_down���Լ�����������������ߵĶԱ�
% k Ϊ������ȡ���λ�ò��������
% u Ϊ����ɹ��ı�־ 0Ϊ����ʧ�� ���������������������̫�� 1 Ϊ����ɹ� �����������һ���̶�����������������
%******************************************************˵��***************************************************************%
global a1;global a2;global a4;global a5;global a6;global a7; global f;global fv;global h_upk;global cd1;
 global aa1;global b1;global cc1;global d1;global e1;global f1;global g1;global h1;global i1;global j1;global k1;global l1;global m1;global n1;global o1;global p1;global q1;global rr1;global s1;global t1;global u1;global v1;%������������%
global aa2;global b2;global cc2;global d2;global e2;global f2;global g2;global h2;global i2;global j2;global k2;global l2;global m2;global n2;
 global h_downk;global ak2;global bk1;global ck6;global au2;global bu3;global cu5;global du1;
a1=zeros(1,2);a2=zeros(2,2);a4=zeros(2,3);a5=zeros(3,2);a6=zeros(3,2);a7=zeros(3,6);  
a1(1,1)=c1{1,10}/(c1{1,10}+1);a1(1,2)=c2{1,10}/(c2{1,10}+1); %��ȡk���ӣ����ɸ���K������%
a2(1,1)=a1(1,1)*c1{1,11}+2;a2(2,1)=(1-a1(1,1))*c1{1,11}+2;
a2(1,2)=a1(1,2)*c2{1,11}+2;a2(2,2)=(1-a1(1,2))*c2{1,11}+2;%�洢����������²�ĺ��%
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
%*******************************************************��ʼ����ֵ**************************************************%
if Ko==1 %ģʽѡ��
  if (0<=h_up)&&(h_up<=min(a4(2,1),a4(1,2)))&&(0<=h_down)&&(h_down<=min(a4(2,2),a4(1,3))) %�ж��Ƿ񳬽�%
      ckk=zeros(4,3);gkk=zeros(3,2);
       f=matlabFunction(c1{1,1});
       h_upk=h_up;cd1=c1;
      aa1=1;b1=1;cc1=1;d1=2;e1=1;f1=4;g1=1;h1=2;i1=1;j1=5;k1=1;l1=3;m1=1;n1=2;o1=1;p1=1;q1=1;rr1=2;s1=1;t1=1;u1=1;v1=2;
    x=fsolve(@(x)myfunk(x),14,optimset('Display','off'));
      ckk(1,1)=h_up;ckk(1,2)=x;ckk(1,3)=(x-a7(1,2))*c1{i1,j1}(k1,l1)/(a7(e1,f1)-a7(g1,h1));
      f=matlabFunction(c2{1,1});
      aa2=1;b2=1;cc2=2;d2=3;e2=1;f2=2;g2=1;h2=1;i2=2;j2=3;k2=2;l2=1;m2=2;n2=2;
     x=fsolve(@(x)myfun1(x),-2,optimset('Display','off'));
      ckk(2,1)=h_up;ckk(2,2)=x;ckk(2,3)=(a2(1,1)/a7(2,3))*x;
      h_downk=h_down;ak2=2;bk1=2;ck6=6;
     x=fsolve(@(x)myfun2(x),12,optimset('Display','off'));
       ckk(3,1)=h_down;ckk(3,2)=x;ckk(3,3)=(x-a7(2,2))*a2(2,1)/(a7(2,2)-a7(2,6));
        f=matlabFunction(c3{1,1});
        au2=2;bu3=3;cu5=5;du1=1;
     x=fsolve(@(x)myfun3(x),3,optimset('Display','off'));
         ckk(4,1)=h_down;ckk(4,2)=x;ckk(4,3)=-a2(2,2)*x/a7(3,5);
      gkk(1,1)=c1{1,8}(1,2); gkk(1,2)=c1{1,9}(1,2);
        gkk(2,1)=c2{1,8}(1,2); gkk(2,2)=c2{1,9}(1,2);
          gkk(3,1)=c3{1,8}(1,2); gkk(3,2)=c3{1,9}(1,2);
      r3=sqrt((gkk(1,2)-ckk(1,2))^2+(ckk(1,3))^2);
      r1=sqrt((gkk(2,1)-ckk(2,2))^2+(ckk(2,3))^2);
      r4=sqrt((gkk(2,2)-ckk(3,2))^2+(ckk(3,3))^2);
      r2=sqrt((gkk(3,1)-ckk(4,2))^2+(ckk(4,3))^2);
      r2=sqrt(14^2+10.13^2);
      delta_theta1_delta_theta2=(r4+r2)/(r1+r3)
      x=0:1:theta_begin;
      subplot(1,2,1);
      y1= delta_theta1_delta_theta2*x;
      plot(x,y1);
      xlabel('MCP���˶��Ƕ�/��');ylabel('PIP���˶��Ƕ�/��');legend('MCP-PIP������Ϸ���ʵ������');
      subplot(1,2,2);
      y2=1.25*x;
      plot(x,y2);
       xlabel('MCP���˶��Ƕ�/��');ylabel('PIP���˶��Ƕ�/��');legend('MCP-PIP���������ƽ�����');
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

