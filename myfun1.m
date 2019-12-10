 function Fp=myfun1(x)
     global f;global a2;global a6;global a7;global h_upk;global aa2;global b2;global cc2;global d2;global e2;global f2;global g2;global h2;global i2;global j2;global k2;global l2;global m2;global n2;
        Fp=(h_upk^2/(f(x))^2+(x*a2(aa2,b2)/a7(cc2,d2))^2/(a2(e2,f2))^2)*heavisides((a2(aa2,b2)/a7(cc2,d2))*x,0,5000,0)*heavisides(x,a6(k2,l2),a6(m2,n2),0)-1;
 end
