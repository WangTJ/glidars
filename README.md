# GLIDARS:Group Lasso assisted Integrated Data Analysis for Risk Stratification

![alt text](https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Malt_en_grain.JPG/1920px-Malt_en_grain.JPG)

To provide appropriate and practical level of health care in terms of treatment, disease management, and follow up, it is critical to group patients into relatively few strata that have distinct prognosis based on well established risk factors and clinical outcomes such as survival. A well known example is the American Joint Committee on Cancer (AJCC) staging for cancer that uses patients tumor size, node involvement and metastasis status. We consider a statistical method for such grouping based on  individual patient data from multiple studies. 	The method encourages common grouping structure as a basis for borrowing information, but acknowledges data heterogeneity including unbalanced data structure, across multiple studies.  We build on  the `lasso-tree' method that is more versatile than the well known classification and regression tree (CART) method in generating possible patterns of groups. In addition, the parametrization of the lasso-tree method makes it very natural to incorporate the underlying order information in the risk factors.

The method encourages common grouping structure as a basis for borrowing information, but acknowledges data heterogeneity including unbalanced data structure, across multiple studies. 

We propose to improve cancer staging by Lasso Tree in meta-analysis by using an adaptive group fused Lasso penalization with a Cox proportional hazard model.

The functionality of the penalty can be explained from two aspects: (1) The "adaptive fuse" part: an intrinsic L1 penalty is applied to the difference of neighboring coefficients. Due to the sparsity-enforcing feature of L1 penalty, the neighboring coefficients that are close will coalesce and therefore lead to cancer staging. (2) The "group" part: The same neighboring pairs of coefficients from different trials are grouped together. With such a setup, we utilize the group-wise-selecting property of group Lasso to ensure the same staging structures across all trials. In our modeling, the auxiliary heterogeneity of trials is naturally absorbed into the semi-parametric baseline function, while the only constant information across trials, the staging structure, is extracted by the grouping of the coefficients.  

## Installation

library(devtools)

install_github("WangTJ/glidars")
