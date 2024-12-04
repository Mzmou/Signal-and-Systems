foo = load('p2.mat');
t=foo.t;
x=foo.x;
y=foo.y;
figure;
subplot(3,1,1);
plot(t,x,'b')
title ("x-t");

subplot(3,1,2);

plot(t,y,'r')
title ("y-t");
subplot(3,1,3);

plot(x,y,'.')
title ("y-x");



[aprim,bprim]=estimateCoefficients(x, y);
