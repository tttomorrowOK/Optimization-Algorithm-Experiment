clear;

sym=0;
%x=[0;0];
x=[1.5;1];
q=[x];
accuracy=0.0001;
Beta=0;d=0;k=0;alp=0.1;
g1=gradf(x);
g1=g1'*g1;
g2=g1;
if g1<=accuracy
    fprintf('I am if :');
    fprintf(x);
else
    sym=1;
end
while sym==1
    d=-gradf(x)+Beta*d;
    alp=goldfind(alp,x,d);
    x=x+alp*d;
    q=[q,x];
    g1=g2;
    g2=gradf(x);
    g2=g2'*g2;
    if g2<=accuracy
        sym=0;
        fprintf('step is :%d\n',k);
        fprintf('I am answer:\n');
        fprintf('%f\n',x);
        %fprintf('%f',funf2(x));
    else
        if mod(k,10)==0
            Beta=0;
        else
            Beta=g2*g2/(g1*g1);
        end
        k=k+1;
    end
    
end
t1=-1.5:0.01:1.5;
t2=-1.5:0.01:3;
[xx,yy] =meshgrid(t1,t2);
fx=xx.^4./4+yy.^2./2-xx.*yy+xx-yy;%ÐèÒªÓÐ.*   ./   .^    ,x,funf2(x),'r*'
xlabel('x');
ylabel('y')
contour(xx,yy,fx,50,'ShowText','on');
hold on;
[m,n]=size(q);
i=2;
%fprintf('%d',m);
%fprintf('%d,%d',q(1));
while n>=i
    xx=q(:,i);
    yy=q(:,i-1);
    %fprintf('%d,%d',xx(1),xx(2));
    plot(yy(1),yy(2),'r*');hold on;
    line([xx(1) yy(1)],[xx(2) yy(2)],'color','r');hold on;
    pause();
    i=i+1;
end
plot(xx(1),xx(2),'r*');hold on;
