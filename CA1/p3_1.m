
ts = 1e-9;      
T = 1e-5;       
tau = 1e-6;     
t = 0:ts:5*T;  
signal = zeros(size(t)); 
signal(mod(t, T) < tau) = 1; 
figure;
plot(t, signal, 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Signal Amplitude');
title('Generated Pulse Signal');
grid on;

