bivar2.all.brm.pois<-brm(bf_FFD+bf_fitness_shoot, 
                         family = c(gaussian, poisson), 
                         data = datadef,warmup = 1000,iter = 6000,chains=4,thin=2,
                         inits = "random",seed = 12345,cores = my.cores,
                         control = list(adapt_delta = 0.99, max_treedepth = 17))
save(bivar2.all.brm.pois,
     file="output/bivar2.all.brm.pois.RData")
# 3: There were 1642 transitions after warmup that exceeded the maximum treedepth. Increase max_treedepth above 15. See
# http://mc-stan.org/misc/warnings.html#maximum-treedepth-exceeded 
# 4: There were 1 chains where the estimated Bayesian Fraction of Missing Information was low. See
# http://mc-stan.org/misc/warnings.html#bfmi-low 
# 5: Examine the pairs() plot to diagnose sampling problems
# 
# 6: The largest R-hat is 1.6, indicating chains have not mixed.
# Running the chains for more iterations may help. See
# http://mc-stan.org/misc/warnings.html#r-hat 
# 7: Bulk Effective Samples Size (ESS) is too low, indicating posterior means and medians may be unreliable.
# Running the chains for more iterations may help. See
# http://mc-stan.org/misc/warnings.html#bulk-ess 
# 8: Tail Effective Samples Size (ESS) is too low, indicating posterior variances and tail quantiles may be unreliable.
# Running the chains for more iterations may help. See
# http://mc-stan.org/misc/warnings.html#tail-ess 

bivar3.all.brm.pois<-brm(bf_FFD+bf_fitness_study, 
                         family = c(gaussian,poisson), 
                         data = datadef,warmup = 1000,iter = 4000,chains=4,thin=2,
                         inits = "random",seed = 12345,cores = my.cores,
                         control = list(adapt_delta = 0.99))
save(bivar3.all.brm.pois,
     file="output/bivar3.all.brm.pois.RData")
# OK

bivar3.all.brm.nb<-brm(bf_FFD+bf_fitness_study, 
                       family = c(gaussian,negbinomial), 
                       data = datadef,warmup = 1000,iter = 6000,chains=4,thin=2,
                       inits = "random",seed = 12345,cores = my.cores,
                       control = list(adapt_delta = 0.99, max_treedepth = 15))
save(bivar3.all.brm.nb,
     file="output/bivar3.all.brm.nb.RData")
# OK

bivar4.all.brm.pois<-brm(bf_FFD+bf_fitness_study_shoot, 
                         family = c(gaussian,poisson), 
                         data = datadef,warmup = 1000,iter = 6000,chains=4,thin=2,
                         inits = "random",seed = 12345,cores = my.cores,
                         control = list(adapt_delta = 0.99, max_treedepth = 17))
save(bivar4.all.brm.pois,
     file="output/bivar4.all.brm.pois.RData")

# 3: There were 1973 transitions after warmup that exceeded the maximum treedepth. Increase max_treedepth above 17. See
# http://mc-stan.org/misc/warnings.html#maximum-treedepth-exceeded 
# 4: There were 1 chains where the estimated Bayesian Fraction of Missing Information was low. See
# http://mc-stan.org/misc/warnings.html#bfmi-low 
# 5: Examine the pairs() plot to diagnose sampling problems
# 
# 6: The largest R-hat is 1.6, indicating chains have not mixed.
# Running the chains for more iterations may help. See
# http://mc-stan.org/misc/warnings.html#r-hat 
# 7: Bulk Effective Samples Size (ESS) is too low, indicating posterior means and medians may be unreliable.
# Running the chains for more iterations may help. See
# http://mc-stan.org/misc/warnings.html#bulk-ess 
# 8: Tail Effective Samples Size (ESS) is too low, indicating posterior variances and tail quantiles may be unreliable.
# Running the chains for more iterations may help. See
# http://mc-stan.org/misc/warnings.html#tail-ess 

# Not sure I want to repeat this one!

