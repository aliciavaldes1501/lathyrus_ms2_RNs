ggplot(data=as.data.frame(
  conditional_effects(modelBLUP_8_3_brms,
                      effects="slope_residuals:cmean_4",
                      dpar="zi",
                      int_conditions=list(
                        cmean_4=c(-1.451023,-0.5470505,
                                  0.1058983,
                                  1.873892)))$`slope_residuals:cmean_4`)%>%
    mutate(prob_fitness=1-estimate__,lower=1-lower__,upper=1-upper__)%>%
    mutate(cmean_4_cat=as.factor(
      ifelse(cmean_4<=-0.8998744,1,
             ifelse(cmean_4>-0.8998744&cmean_4<=-0.2282078,2,
                    ifelse(cmean_4>-0.2282078&cmean_4<=0.9534589,3,
                           ifelse(cmean_4>0.9534589,4,NA)))))))+
  geom_jitter(data=datadef_BLUPs,aes(x=slope_residuals,y=fitness_01,
                                     color=slope_residuals),
              size=3,alpha=0.05,width=0,height=0.03)+
  facet_grid(~cmean_4_cat,labeller=labeller(cmean_4_cat=labeller_function1))+
  my_theme_legend()+
  xlab("Slope of the reaction norm\n(residuals of slope on intercept)")+
  ylab("Predicted probability of having any fitness")+
  scale_color_viridis(end=0.9,option = "C")+
  labs(colour="Thermal plasticity")+theme(legend.position="top")

library(PupillometryR)
ggplot(data=as.data.frame(
  conditional_effects(modelBLUP_8_3_brms,
                      effects="slope_residuals:cmean_4",
                      dpar="zi",
                      int_conditions=list(
                        cmean_4=c(-1.451023,-0.5470505,
                                  0.1058983,
                                  1.873892)))$`slope_residuals:cmean_4`)%>%
    mutate(prob_fitness=1-estimate__,lower=1-lower__,upper=1-upper__)%>%
    mutate(cmean_4_cat=as.factor(
      ifelse(cmean_4<=-0.8998744,1,
             ifelse(cmean_4>-0.8998744&cmean_4<=-0.2282078,2,
                    ifelse(cmean_4>-0.2282078&cmean_4<=0.9534589,3,
                           ifelse(cmean_4>0.9534589,4,NA)))))))+
  geom_flat_violin(data=datadef_BLUPs%>%filter(!is.na(fitness_01)),
                   aes(x=as.factor(fitness_01),y=slope_residuals),
                   position = position_nudge(x = 0.2, y = 0), alpha = 0.8)+
  geom_boxplot(data=datadef_BLUPs%>%filter(!is.na(fitness_01)),
               aes(x=as.factor(fitness_01),y=slope_residuals),
               width = 0.2, outlier.shape = NA, alpha = 0.8)+
  scale_fill_viridis(end=0.9,option = "C")+
 facet_grid(~cmean_4_cat,labeller=labeller(cmean_4_cat=labeller_function1))+
  coord_flip()

