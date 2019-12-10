function [u,k]= xianchuangdong_ouheweizhi(c1,c2,c3,h_up,h_down,theta_begin,Ko)

global b1;global cc1;global d1;global e1;global f1;global g1;global h1;global i1;global j1;global k1;global l1;global m1;global n1;global o1;global p1;global q1;global r1;global s1;global t1;global u1;global v1;
%线传动关节拟合弯曲部分仿真关键测试程序
%  c1,c2,c3 为相邻接三段手指的几何特征和装配特征元胞数组，需要提前进行特征检测，通过方可执行主程序
% h_up,h_down为上下部手指的位置的调整参数，主控参数
% theta_begin 是指主要的耦合手指的运动范围
% Ko 模式选择 1为正运算 正运算是指自己在合理方位内取h_up,h_down，反馈出仿真曲线与测试曲线的对比，通过多次取值，得到最佳值
% 0为反运算 是从已知的测试曲线出发，系统自动搜寻合理的h_up,h_down，并且加以反馈出h_up,h_down，以及仿真曲线与测试曲线的对比
% k 为反馈出取点的位置参数，输出
% u 为计算成功的标志 0为计算失败 仿真耦合曲线与理想的相差太大 1 为计算成功 仿真的曲线在一定程度上与理想的曲线耦合
a1=zeros(1,2);a2=zeros(2,2);a4=zeros(2,3);a5=zeros(3,2);a6=zeros(3,2);a7=zeros(3,6);  
a1(1,1)=c2{1,10}/(c2{1,10}+1);a1(1,2)=c3{1,10}/(c3{1,10}+1); %提取k因子，生成复合K’因子%
a2(1,1)=a1(1,1)*c2{1,11}+2;a2(2,1)=(1-a1(1,1))*c2{1,11}+2;
a2(1,2)=a1(1,2)*c3{1,11}+2;a2(2,2)=(1-a1(1,2))*c3{1,11}+2;%存储各外骨骼上下层的厚度%
a5(1,1)=c1{1,2}(1,2); a5(1,2)=c1{1,3}(1,2); 
a5(2,1)=c2{1,2}(1,2); a5(2,2)=c2{1,3}(1,2);
a5(3,1)=c3{1,2}(1,2); a5(3,2)=c3{1,3}(1,2); %存储各个外骨骼中边界点的Y坐标%
a7(1,1)=a5(1,1);a7(1,2)=a5(1,2);a7(1,3)=c1{1,4}(1,2);a7(1,4)=c1{1,5}(1,2);a7(1,5)=c1{1,6}(1,2);a7(1,6)=c1{1,7}(1,2);
a7(2,1)=a5(2,1);a7(2,2)=a5(2,2);a7(2,3)=c2{1,4}(1,2);a7(2,4)=c2{1,5}(1,2);a7(2,5)=c2{1,6}(1,2);a7(2,6)=c2{1,7}(1,2);
a7(3,1)=a5(3,1);a7(3,2)=a5(3,2);a7(3,3)=c3{1,4}(1,2);a7(3,4)=c3{1,5}(1,2);a7(3,5)=c3{1,6}(1,2);a7(3,6)=c3{1,7}(1,2);           %存储各个外骨骼中边界点、上边界点、下边界点的Y坐标%
f=matlabFunction(c1{1,1});  %转换为匿名函数
a4(1,1)=f(a5(1,1));a4(2,1)=f(a5(1,2));  %存储各个外骨骼中边界点X坐标%
a6(1,1)=min(a7(1,:));a6(1,2)=max(a7(1,:)); %存储各个外骨骼中边界点、上边界点、下边界点的Y坐标上下限%
f=matlabFunction(c2{1,1});  %转换为匿名函数
a4(1,2)=f(a5(2,1));a4(2,2)=f(a5(2,2));  %存储各个外骨骼中边界点X坐标%
a6(2,1)=min(a7(2,:));a6(2,2)=max(a7(2,:)); %存储各个外骨骼中边界点、上边界点、下边界点的Y坐标上下限%
f=matlabFunction(c3{1,1});  %转换为匿名函数
a4(1,3)=f(a5(3,1));a4(2,3)=f(a5(3,2));  %存储各个外骨骼中边界点X坐标%
a6(3,1)=min(a7(3,:));a6(3,2)=max(a7(3,:)); %存储各个外骨骼中边界点、上边界点、下边界点的Y坐标上下限%
if Ko==1 %模式选择
  if (0<=h_up)&&(h_up<=min(a4(2,1),a4(1,2)))&&(0<=h_down)&&(h_down<=min(a4(2,2),a4(1,3))) %判断是否超界%
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
      xlabel('PIP的运动角度/°');ylabel('DIP的运动角度/°');legend('PIP-DIP弯曲耦合仿真实验曲线');
      subplot(1,2,2);
      y2=0.8*x;
      plot(x,y2);
       xlabel('PIP的运动角度/°');ylabel('DIP的运动角度/°');legend('PIP-DIP弯曲采样逼近曲线');
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