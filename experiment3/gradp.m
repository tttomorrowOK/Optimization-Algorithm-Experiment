function gpx=gradp(x,s)
gfx=gradf(x);%һ��������
cx=func(x);%һ����
gcx=gradc(x);%һ��������
gpx=gfx+2*s.*gcx.*cx;%һ��������
end
