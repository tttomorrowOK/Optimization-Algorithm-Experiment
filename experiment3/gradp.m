function gpx=gradp(x,s)
gfx=gradf(x);%一个列向量
cx=func(x);%一个数
gcx=gradc(x);%一个列向量
gpx=gfx+2*s.*gcx.*cx;%一个列向量
end
