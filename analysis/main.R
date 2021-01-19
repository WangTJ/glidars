library(glidars)

# create simulated dataset

##p: number of A categories, q: number of B categories, m: number of studies
p=4 ;q=4;m=2
v1 = c(0,0.5,1.5,2.5)
v2 = c(0,0.75,2.25,3.75)
partition1 = c(1, 1, 3, 3, 1, 2, 3, 4, 1, 2, 3, 4, 2, 2, 3, 4)
partition2 = c(1, 1, 3, 3, 1, 2, 3, 4, 1, 2, 3, 4, 2, 2, 3, 4)
# coefficient grid
grid1 = matrix(v1[partition1], p , q)
grid2 = matrix(v2[partition2], p , q)
  
# patient distribution
p1 = outer(c(0.4, 0.3, 0.2,0.1), c(0.4, 0.3, 0.2,0.1))
p2 = outer(c(0.1, 0.2, 0.3,0.4), c(0.1, 0.2, 0.3,0.4))
    
beta.real = as.param(c(as.vector(grid1), as.vector(grid2)), p, q, m)
  
## sample sizes
n1 = 600; n2 = 600;
n = n1 + n2
  

## generate datasets
data1 = dataset.gen(grid1, p1 , n1, cen.prob = 0.2, setseed = TRUE)
data2 = dataset.gen(grid2, p2 , n2, cen.prob = 0.2, setseed = TRUE)
data1$"G" = rep("sim1", n1)
data2$"G" = rep("sim2", n2)
data = rbind(data1, data2)

# glidars
inibeta0 <- seq(0, 5, length.out=p*q)
inibeta <- rep(inibeta0, m)

## cox model without penalization
beta.cox <- lasso.tree(data$G, data$T, data$N, data$time, data$status, 0, inibeta, maxiter = 100, eps = 1e-4)

## glidars with lambda equal to 4.6
beta.out <- lasso.tree(data$G, data$T, data$N, data$time, data$status, 4.6, inibeta, maxiter = 100, eps = 1e-3)

## every coefficient is different
plot(beta.cox)

## grouping to two classes
plot(beta.out)

## search best lambda in a rangee
lambda <- n*exp(seq(-7.5, -3.3, length.out = 20))
beta.bic <- lasso.tree.bic(data$G, data$T, data$N, data$time, data$status, lambda, inibeta, maxiter = 100, eps = 1e-2)

## trace of bic
plot(lambda, beta.bic$bics)
## trace of similarity
plot(lambda, similarity(beta.real, beta.bic$beta.seq)$similarity)

plot(as.param(beta.bic$beta.seq[1, ], p, q, m))
plot(as.param(beta.bic$beta.seq[20, ], p, q, m))

## result with best bic
plot(beta.bic$beta.opt)

# Kaplan-Meier Cureve
PlotCurve(beta.bic$beta.opt, data$G, data$T, data$N, data$time, data$status, ncol = 2)

# calculate similairity to true grid
similarity(beta.bic$beta.opt , beta.real)

