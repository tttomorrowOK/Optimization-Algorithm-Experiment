function cgx=cg(x,s,accuracy)
sym=0;
Beta=0;d=0;k=0;
g1=gradp(x,s);%一个列向量
g1=g1'*g1;%一个数字
g2=g1;
if g1<=accuracy
    cgx=x;
else
    sym=1;
end
while sym==1
    d=-gradp(x,s)+Beta*d;%一个列向量
    alp=goldfind(x,d,s);%一个数 (0~1)
    %fprintf('alp is %f:\n',alp);
    x=x+alp*d;
    %fprintf('x is %f:\n',x);
    %fprintf('\n\n\n');
    g1=g2;
    g2=gradp(x,s);
    g2=g2'*g2;
    %fprintf('g1 is %f:\n',g1);
    %fprintf('g2 is %f:\n',g2);
    %pause();
    if g2<=accuracy
        sym=0;
        cgx=x;
    else
        %fprintf('Beta is %f:\n\n\n',Beta)
        %pause()
        Beta=g2*g2/(g1*g1);
        k=k+1;
    end
end
end
