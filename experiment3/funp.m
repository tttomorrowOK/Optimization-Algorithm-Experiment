function px=funp(x,s)
fx=funf(x);%һ����
cx=func(x);%һ����
px=fx+s*(cx'*cx);%һ����
end
