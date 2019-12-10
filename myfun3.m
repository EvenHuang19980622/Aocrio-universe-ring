 function Fr=myfun3(x)
      global f;global a6;global a7;global a2;global h_downk; global au2;global bu3;global cu5;global du1;  
        Fr=(h_downk^2/(f(x))^2+(a2(au2,au2)*x/a7(bu3,cu5))^2/(a2(au2,au2))^2)*(1-heavisides(a2(au2,au2)*x/a7(bu3,cu5),0,5000,0))*heavisides(x,a6(bu3,du1),a6(bu3,au2),0)-1;
 end

