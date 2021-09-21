model1<-glmmTMB(formula=round(intactseed)~slope*cmean_4+intercept+
                  cn_shoot_vol_mean_sqrt+(1|id),
                data=datadef_BLUPs,family=nbinom2,ziformula=~.,verbose=T)
summary(model1)
performance::check_collinearity(model1)
performance::check_collinearity(glmmTMB(formula=round(intactseed)~slope*cmean_4+
                                          cn_shoot_vol_mean_sqrt+(1|id),
                                        data=datadef_BLUPs,family=nbinom2,ziformula=~.,verbose=T))
plot(ggpredict(model1,terms=c("slope","cmean_4"),type="zi_prob"))

plot(ggpredict(glmmTMB(formula=round(intactseed)~slope*cmean_4+
                         cn_shoot_vol_mean_sqrt+(1|id),
                       data=datadef_BLUPs,family=nbinom2,ziformula=~.,verbose=F),
               terms=c("slope","cmean_4"),type="zi_prob"))

model2<-glmmTMB(formula=round(intactseed)~slope*cmean_4+
                  cn_shoot_vol_mean_sqrt+(1|id),
                data=datadef_BLUPs,family=nbinom2,ziformula=~.,verbose=T)
summary(model2)
performance::check_collinearity(model2)

model3<-glmmTMB(formula=round(intactseed)~intercept*cmean_4+
                  cn_shoot_vol_mean_sqrt+(1|id),
                data=datadef_BLUPs,family=nbinom2,ziformula=~.,verbose=T)
summary(model3)

plot(ggpredict(model1,terms=c("slope","cmean_4"),type="zi_prob"))
plot(ggpredict(model2,terms=c("slope","cmean_4"),type="zi_prob"))
plot(ggpredict(model3,terms=c("intercept","cmean_4"),type="zi_prob"))

model4<-glmmTMB(formula=round(intactseed)~PC1*cmean_4+
                  cn_shoot_vol_mean_sqrt+(1|id),
                data=datadef_BLUPs,family=nbinom2,ziformula=~.,verbose=T)
summary(model4)

plot(ggpredict(model4,terms=c("PC1","cmean_4"),type="zi_prob"))

model5<-glmmTMB(formula=round(intactseed)~slope_residuals*cmean_4+
                  cn_shoot_vol_mean_sqrt+(1|id),
                data=datadef_BLUPs,family=nbinom2,ziformula=~.,verbose=T)
summary(model5)
performance::check_collinearity(model5)

plot(ggpredict(model5,terms=c("slope_residuals","cmean_4"),type="zi_prob"))
