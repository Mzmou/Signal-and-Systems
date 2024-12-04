ts = 1e-9;      
T = 1e-5;       
tau = 1e-6;  
t = 0:ts:T;  
t_len=length(t);

c = 300000000;
R=450;

t_d=2*R/c;
alpha=0.5;
signal2 = zeros(t_len);

for n = 0:floor(max(t)/T) 
    start_time = n * T + t_d;     
    end_time = start_time + tau;  
    signal2(t >= start_time & t < end_time) = alpha;
end
N = 0:ts:tau;
correlationBox= ones(1,length(N));
ro= zeros(1,length(t)-length(N));
for i=1:t_len-length(N)
    h=signal2(i:i+length(N)-1);
    ro(i)=sum(correlationBox .* h);
    
end
plot(t(1:t_len-length(N)),ro);
[val,index]=max(ro);
t_d=index*ts;
r=t_d*c/2;
disp(r);