function px=funp(x,s)
fx=funf(x);%一个数
cx=func(x);%一个数
px=fx+s*(cx'*cx);%一个数
end
