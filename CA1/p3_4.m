ts = 1e-9;      
T = 1e-5;       
tau = 1e-6;  
t_len=((1e-5)/(1e-9))+1;
t = 0:ts:T;  
c = 3e8;
R=450;
t_d=2*R/c;
alpha=0.5;
signal2 = zeros(size(t));
for n = 0:floor(max(t)/T) 
    start_time = n * T + t_d;     
    end_time = start_time + tau;  
    signal2(t >= start_time & t < end_time) = alpha;
end
num_sample=100;
noise_power=20;
for j=1:0.5:noise_power
    sum_r=0;
    for i=1:num_sample
        noise=j*rand(1,t_len);
        
       noisy_signal=signal2+noise;
        N = 0:ts:tau;
       correlationBox= ones(1,length(N));
       out_core= zeros(1,t_len-length(N));
    for k=1:t_len-length(N)
    h=noisy_signal(k:k+length(N)-1);
   
    out_core(k)=sum(correlationBox .* h);
    
    end
  [val,index]=max(out_core);
  t_d=index*ts;
  r=t_d*c/2;
  sum_r=sum_r+r;
    end
 
  mean_r=(sum_r/num_sample);
  disp("the distance is");
  disp(mean_r);
  if (mean_r>440 && mean_r<460)
      
      disp("The distance estimated correctly");
      disp(" ");
  else
      disp("The distance didn't estemated correctly");
      disp(" ");


  end   
end




   