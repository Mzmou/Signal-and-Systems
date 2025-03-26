
fs = 100;               
t_start = 0;          
t_end = 1;              
f = 15;                
phi = pi / 4;           


ts = 1 / fs;          
t = t_start:ts:t_end-ts;   


x2 = cos(30 * pi * t + phi);

figure;
plot(t, (x2), 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Amplitude');
title('Time-Domain Signal: x_2(t) = cos(30\pi t + \pi/4)');
grid on;

N = length(x2);                    
X2 = fft(x2);                        
f_axis = 0:(fs/N):((N-1)*fs/N);      
X2_shifted =X2;           
X2_magnitude = abs(X2_shifted) / max(abs(X2_shifted));  
X2_phase = angle(X2_shifted);      

figure;
plot(f_axis, X2_magnitude, 'LineWidth', 1.5);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Fourier Transform Magnitude of x_2(t)');
grid on;

tol = 1e-6;                          
X2_phase(X2_magnitude < tol) = 0;    
theta = X2_phase / pi;              


figure;
plot(f_axis, theta, 'LineWidth', 1.5); 
xlabel('Frequency (Hz)');
ylabel('Phase / \pi');
title('Fourier Transform Phase of x_2(t)');
grid on;
