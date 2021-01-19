# GLIDARS:Group Lasso assisted Integrated Data Analysis for Risk Stratification

Risk stratifying patients using established risk factors is a perpetual health care research
theme. 
To provide appropriate and practical level of health care in terms of treatment, disease management, and follow up, it is critical to group patients into relatively few strata that have distinct prognosis based on well established risk factors and clinical outcomes such as survival. A well known example is the American Joint Committee on Cancer (AJCC) staging for cancer that uses tumor size, node involvement and metastasis status. We consider a statistical method for such grouping based on individual patient data from multiple studies. The method encourages common grouping structure as a basis for borrowing information, but acknowledges data heterogeneity including unbalanced data structure across multiple studies. We build on the ‘lasso-tree’ method (Lin et al., 2013) that is more versatile than the well known classification and regression tree method in generating possible patterns of groups. In addition, the parametrization of the lasso-tree method makes it very natural to incorporate the underlying order information in the risk factors. 

The 'glidars' method encourages common grouping structure as a basis for borrowing information, but acknowledges data heterogeneity including unbalanced data structure, across multiple studies, by using an adaptive group fused Lasso penalization with a Cox proportional hazard model.

The functionality of the penalty can be explained from two aspects: (1) The "adaptive fuse" part: an intrinsic L1 penalty is applied to the difference of neighboring coefficients. Due to the sparsity-enforcing feature of L1 penalty, the neighboring coefficients that are close will coalesce and therefore lead to cancer staging. (2) The "group" part: The same neighboring pairs of coefficients from different studies are grouped together. With such a setup, we utilize the group-wise-selecting property of group Lasso to ensure the same staging structures across all studies. In our modeling, the auxiliary heterogeneity of studies is naturally absorbed into the semi-parametric baseline function, while the only constant information across studies, the staging structure, is extracted by the grouping of the coefficients.  

## Installation

```
library(devtools)
install_github("WangTJ/glidars")
```

## Structure of Repositories

Source codes of functions in R can be found in <https://github.com/WangTJ/glidars/tree/master/R>.

Source code of internal functinos in C++ can be forund in <https://github.com/WangTJ/glidars/tree/master/src>. 

The functions help documents can be found in <https://github.com/WangTJ/glidars/tree/master/man>. 

The example analysis code can be found in <https://github.com/WangTJ/glidars/tree/master/analysis/main.R>.

A simulated data is put in <https://github.com/WangTJ/glidars/tree/master/analysis/simu_data.csv>

## Example code

```
# load package
library(glidars)

# load simulated data
data = read.csv('simu_data.csv')

# initial beta 
inibeta0 <- seq(0, 3, length.out=p*q)
inibeta <- rep(inibeta0, m)

# glidars with lambda equal to 6.25
beta.out <- lasso.tree(data$G, data$T, data$N, data$time, data$status, lambda=6.25, inibeta, maxiter = 100, eps = 1e-2)

# plot staging structure
plot(beta.out)

# plot Kaplan-Meier curve startified by groups
PlotCurve(beta.out, data$G, data$T, data$N, data$time, data$status, ncol = 2)

# search best lambda in a rangee
lambda <- n*exp(seq(-9.5, -3.3, length.out = 20))
beta.bic <- lasso.tree.bic(data$G, data$T, data$N, data$time, data$status, lambda, inibeta, maxiter = 100, eps = 1e-2)

# plot trace of bic
plot(lambda, beta.bic$bics)

# calculate similairity to true grid
similarity(beta.bic$beta.opt , beta.real)

# plot trace of similarity to the true parameter
plot(lambda, similarity(beta.real, beta.bic$beta.seq)$similarity)

# result with best bic
plot(beta.bic$beta.opt)
# Kaplan-Meier curve
PlotCurve(beta.bic$beta.opt, data$G, data$T, data$N, data$time, data$status, ncol = 2)

# Plot for specific lambda, like lambda[14]
plot(as.param(beta.bic$beta.seq[14, ], p, q, m))
plotCurve(as.param(beta.bic$beta.seq[14, ], p, q, m), data$G, data$T, data$N, data$time, data$status, ncol = 2)
```
