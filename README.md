# GLIDARS:Group Lasso assisted Integrated Data Analysis for Risk Stratification

Risk stratifying patients using established risk factors is a perpetual health care research
theme. 
To provide appropriate and practical level of health care in terms of treatment, disease management, and follow up, it is critical to group patients into relatively few strata that have distinct prognosis based on well established risk factors and clinical outcomes such as survival. A well known example is the American Joint Committee on Cancer (AJCC) staging for cancer that uses tumor size, node involvement and metastasis status. We consider a statistical method for such grouping based on individual patient data from multiple studies. The method encourages common grouping structure as a basis for borrowing information, but acknowledges data heterogeneity including unbalanced data structure across multiple studies. We build on the ‘lasso-tree’ method (Lin et al., 2013) that is more versatile than the well known classification and regression tree method in generating possible patterns of groups. In addition, the parametrization of the lasso-tree method makes it very natural to incorporate the underlying order information in the risk factors. 

The 'glidars' method encourages common grouping structure as a basis for borrowing information, but acknowledges data heterogeneity including unbalanced data structure, across multiple studies, by using an adaptive group fused Lasso penalization with a Cox proportional hazard model.

The functionality of the penalty can be explained from two aspects: (1) The "adaptive fuse" part: an intrinsic L1 penalty is applied to the difference of neighboring coefficients. Due to the sparsity-enforcing feature of L1 penalty, the neighboring coefficients that are close will coalesce and therefore lead to cancer staging. (2) The "group" part: The same neighboring pairs of coefficients from different studies are grouped together. With such a setup, we utilize the group-wise-selecting property of group Lasso to ensure the same staging structures across all studies. In our modeling, the auxiliary heterogeneity of studies is naturally absorbed into the semi-parametric baseline function, while the only constant information across studies, the staging structure, is extracted by the grouping of the coefficients.  

## Installation

library(devtools)

install_github("WangTJ/glidars")

## Structure of Repositories

For your inference, the functions help documents can be found in <https://github.com/WangTJ/glidars/tree/master/man>, the example code can be found in <https://github.com/WangTJ/glidars/tree/master/analysis/main.R>

