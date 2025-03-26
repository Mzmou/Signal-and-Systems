
fs = 50;               
t_start = -1;         
t_end = 1;           
f = 5;                 


ts = 1 / fs;           
t = t_start:ts:t_end;  


x1 = cos(10 * pi * t);

figure;
plot(t,abs(x1) , 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Amplitude');
title('Time-Domain Signal: x_1(t) = cos(10\pi t)');
grid on;


N = length(x1);              
X1 = fft(x1);               
f_axis = (-N/2:N/2-1) * (fs/N);
X1_magnitude = (abs(X1));


figure;
plot(f_axis, X1_magnitude, 'LineWidth', 1.5);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Fourier Transform Magnitude of x_1(t)');
grid on;
