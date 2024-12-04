T = 1e-5;       
ts = 1e-9;  
tau = 1e-6;
R=450;
c = 299792458;
t_d=2*R/c;
t = 0:ts:5*T;
alpha=0.5;
signal = zeros(size(t));
for n = 0:floor(max(t)/T) 
    start_time = n * T + t_d;     
    end_time = start_time + tau;  
    signal(t >= start_time & t < end_time) = alpha;
end
figure;
plot(t, signal, 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Signal Amplitude');
title('recieved Pulse Signal');
grid on;
