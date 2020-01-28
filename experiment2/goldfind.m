function gf=goldfind(alp,x,d)
a=0;
b=1;
tolerance=0.01;
x1=a+0.382*(b-a);
x2=a+0.618*(b-a);
f1=ps(x1,x,d);
f2=ps(x2,x,d);
while abs(b-a)>=tolerance
    if f1<f2-1e-12
        b=x2;x2=x1;f2=f1;
        x1=a+0.382*(b-a);
        f1=ps(x1,x,d);
    else 
        a=x1;x1=x2;f1=f2;
        x2=a+0.618*(b-a);
        f2=ps(x2,x,d);
    end
    
end
gf=0.5*(a+b);
%fprintf(gf);
%fprintf('(%d,%d)\n',answ,funf(answ));
%fprintf('%d\n',a);
%fprintf('%d\n',b);
%x=-2:0.001:2;
%y=funf(x);
%plot(x,y,answ,funf(answ),'r*')
end
