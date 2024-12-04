t=0:0.01:1;
z1=sin(2*pi*t);
z2=cos(2*pi*t);
figure;
subplot(2,1,1);
x0=[0.5,0.25];
y0=[0.2,-0.8];
s1=["sin(2 \pi t)"]
s2=['cos(2 \pi t)']
plot(t,z1,'--b')
text(0.5,0.25,s1);
title ("Sin");
legend('sin');
xlabel('time');
ylabel('amplitude');
grid on;
subplot(2,1,2);
plot(t,z2,'r')
text(0.2,-0.8,s2);

title ("cos");
legend('cos');
xlabel('time');
ylabel('amplitude');
grid on;


