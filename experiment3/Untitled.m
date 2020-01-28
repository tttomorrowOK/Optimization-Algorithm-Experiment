clear;
% x=[0.4;1.2;1.2];
x=[0.4;1.23;1.08];
s=1;
k=1;
q=[x];
accuracy1=0.01;% \:8fdb\:884c\:5171\:8f6d\:68af\:5ea6\:4f7f\:7528\:7684\:7cbe\:5ea6
accuracy2=0.01;
flag=0;
while flag==0
    x=cg(x,s,accuracy1);% \:4e00\:4e2a\:5217\:5411\:91cf
    q=[q,x];
    if(abs(func(x)-0)<=accuracy2)
        flag=1;
    else
        s=3.75*s;
        k=k+1;
    end
end
fprintf('step is :% d \n',k);
fprintf('s is :% d \n',s);
fprintf('funf value is :% f \n',funf(x));
fprintf('func value is :% f \n',func(x));
fprintf('% f \n',x)

t1=-3:0.1:5;
t2=-3:0.1:1.22;
t3=-3:0.1:5;
[x,y,z]=meshgrid(t1,t2,t3);
G=@(x,y,z)1.5.*x.*x+y.*y+0.5.*z.*z-x.*y-y.*z+x+y+z;% \:8bb0\:4f4f\:7528\:70b9\:8fd0\:7b97
F=@(x,y,z)x+2*y+z-4;
isosurface(x,y,z,G(x,y,z),3);hold on;
isosurface(x,y,z,G(x,y,z),4);hold on;
isosurface(x,y,z,G(x,y,z),5);hold on;
isosurface(x,y,z,G(x,y,z),6);hold on;
isosurface(x,y,z,F(x,y,z),0);hold on;

[m,n]=size(q);
i=2;
% fprintf('% d',m);
% fprintf('% d,% d',q(1));
while n>=i
    xx=q(:,i);
    yy=q(:,i-1);
    % fprintf('% d,% d',xx(1),xx(2));
    plot3(yy(1),yy(2),yy(3),'r*');hold on;
    line([xx(1) yy(1)],[xx(2) yy(2)],[xx(3) yy(3)],'color','r');hold on;
    pause();
    i=i+1;
end
plot3(xx(1),xx(2),xx(3),'r*');hold on;
% yy=q(:,n);
% plot3(yy(1),yy(2),yy(3),'r*');hold on;
