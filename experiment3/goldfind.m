function gf=goldfind(x,d,s)
a=0;
b=1;
tolerance=0.001;
x1=a+0.382*(b-a);
x2=a+0.618*(b-a);
f1=ps(x1,x,d,s);%一个数
f2=ps(x2,x,d,s);%一个数
while abs(b-a)>=tolerance
    if f1<f2-1e-12
        b=x2;x2=x1;f2=f1;
        x1=a+0.382*(b-a);
        f1=ps(x1,x,d,s);%一个数
    else 
        a=x1;x1=x2;f1=f2;
        x2=a+0.618*(b-a);
        f2=ps(x2,x,d,s);%一个数
    end
end
gf=0.5*(a+b);%一个数
end
