function Fq=myfun2(x)
     global f;global a6;global a7;global a2;global h_downk;
     global ak2;global bk1;global ck6;
        Fq=(h_downk^2/(f(x))^2+((x-a7(ak2,ak2))*a2(ak2,bk1)/(a7(ak2,ak2)-a7(ak2,ck6)))^2/(a2(ak2,bk1))^2)*(1-heavisides((x-a7(ak2,ak2))*a2(ak2,bk1)/(a7(ak2,ak2)-a7(ak2,ck6)),0,500,0))*heavisides(x,a6(ak2,bk1),a6(ak2,ak2),0)-1;
 end

