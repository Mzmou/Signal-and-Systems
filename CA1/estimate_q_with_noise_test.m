
x_2 = [1 2 3 4 5];  
alpha=2;
beta=3;
dimension = [1, 5];
random_matrix = randn(dimension);
y_2=alpha*x_2+beta+random_matrix; 
[aprim,bprim]=estimateCoefficients(x_2, y_2);
