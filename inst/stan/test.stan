data{
	int<lower=1> N;
	real x [N];
	real y [N];
}
parameters{
	real alpha;
	real beta;
	real<lower=0> sigma;
}
model{

	target += normal_lpdf(y | alpha + beta * x, sigma);
}
