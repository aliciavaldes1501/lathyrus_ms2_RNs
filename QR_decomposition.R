modelBLUP_5_3_brms_QR<-brm(bf(round(intactseed)~slope*cmean_4+intercept+
                             cn_shoot_vol_mean_sqrt+(1|id),
                           zi~slope*cmean_4+intercept+
                             cn_shoot_vol_mean_sqrt+(1|id),decomp="QR"),
                        family="zero_inflated_negbinomial",data=datadef_BLUPs,
                        warmup = 1000,iter = 4000,thin=2,chains=4,
                        inits = "random",seed = 12345,cores = my.cores,
                        control = list(adapt_delta = 0.85))

# Warning message:
# There were 1 divergent transitions after warmup. 
# Increasing adapt_delta above 0.8 may help.
# See http://mc-stan.org/misc/warnings.html#divergent-transitions-after-warmup 

# QR decomposition is often used to solve linear least squares problems and helps models to
# perform better, often both in terms of wall time and in terms of effective sample size. In this
# case it was used to increase numerical stability as a way for the NUTS to be able to compute
# the posterior. Because of its benefits the Stan User Guide [63] generally recommends its application for linear and generalized linear models in Stan whenever the number of covariates
# K ą 1 and an informative prior on the location of the regression coefficients is unavailable.

# To increase sampling efficiency
# and numerical stability the QR decomposition of Stan was used, which utilizes the Householder algorithm

# https://mc-stan.org/users/documentation/case-studies/qr_regression.html

# Fortunately we can reduce the correlations between the covariates,
# and ameliorate the challenging geometry of the Bayesian posterior, 
# by applying a QR decomposition. Perhaps unsurprisingly 
# this is the same QR decomposition that arises in the 
# analytic maximum likelihood and conjugate Bayesian treatment 
# of linear regression, although here it will be applicable regardless of 
# the choice of priors and for any general linear model.

# The QR decomposition improves our effective sample size, 
# increases the precision of posterior estimates, and reduces computational time

