a=-1;
b=2;
x1=a+0.382*(b-a);
x2=a+0.618*(b-a);
f1 = func1(x1);
f2 = func1(x2);
f_loop=1;
E=0.000000001;
while f_loop
    if f1<=f2 
        b = x2;
        x2 = x1;
        f2 = f1;
        x1 = a + 0.382*(b-a);
        f1 = func1(x1);
    else
        a = x1;
        x1 = x2;
        f1 = f2;
        x2 = a+0.618*(b-a);
        f2 = func1(x2);
    end 
    if abs(b-a)<E
        f_loop = 0;
        ans1=(a+b)/2;
    else 
        f_loop = 1;
    end   
end

x = -1:pi/40:2*pi;
y = func1(x);
plot(x,y);

fprintf('The answer is %f\n', ans1);