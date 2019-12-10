function [au,ak,dk] = func_AD_transfer(f,a,b,T,tr,n,uj)
%函数采样AD转换
%au 是输出二进制采样矩阵
%ak 是输出十进制处理采样矩阵
%dk 是输出十进制实时采样矩阵
%f 是采样函数  f在闭合区间[a,b]上严格连续有上下确界,其导数也连续，在区间上不小于零（局限）
%a b 是采样区间
%T是采样周期
%tr 是采样保持时间
%n存储器的位数
%uj绘图精度
syms t;
fmin=matlabFunction(f);
fmax=matlabFunction(-f);
%求最值函数%
if((n>0)&&(rem(n,1)==0)&&(uj>0)&&(rem(uj,1)==0)&&(a<b)&&(T>0)&&(T<=(b-a))&&(tr>0)&&(tr<T))
 [min]=fminbnd_level2(fmin,a,b,uj);%求解精度是个致命伤，都是fminbnd的锅
 min=min-1;%修正值阈值设为1，保证求解成功
 [max1]=fminbnd_level2(fmax,a,b,uj);%求解精度是个致命伤，都是fminbnd的锅
 max=-max1;
 max=max+1;%修正值阈值设为1，保证求解成功
 nk=fix((b-a)/T);%采样次数=nk+1;
 dk=zeros(1,nk+1);%十进制采样矩阵
 au=zeros(nk+1,n);%二进制采样矩阵
 ak=zeros(1,nk+1);%十进制处理采样矩阵
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
 title('原始采样曲线图示意');
 xlabel('t/s');
ylabel('幅值');
 subplot(2,2,2); 
 plot(x,r1,'k');
  title('实时采样真实曲线图示意');
 xlabel('t/s');
ylabel('幅值');
 subplot(2,2,3);
 plot(x,r2);
 title('AD转换曲线图示意');
 xlabel('t/s');
ylabel('幅值');
 subplot(2,2,4);
 plot(x,r1,'k',x,r2);
  title('比较图');
 xlabel('t/s');
 ylabel('幅值');
 hold off;
%绘图% 
else
    disp('error！please input again！');
end

