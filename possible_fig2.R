ggplot(datadef_BLUPs,aes(x=FFD,y=mean_fitness_fl))+
  geom_point()+geom_smooth(method="lm")+
  my_theme()

ggplot(datadef_BLUPs,aes(x=slope_residuals,y=mean_fitness_fl))+
  geom_point()+geom_smooth(method="lm")+
  my_theme()

ggplot(datadef_BLUPs,aes(x=intercept,y=mean_fitness_fl))+
  geom_point()+geom_smooth(method="lm")+
  my_theme()

ggplot(as.data.frame(conditional_effects(modelBLUP_8_3_brms,
                                         effects="slope_residuals:cmean_4",
                                         int_conditions=
                                           list(cmean_4=quantile))$`slope_residuals:cmean_4`),
       aes(x=slope_residuals,y=estimate__, group=cmean_4))+
  geom_ribbon(aes(ymin=lower__,ymax=upper__,
                  fill=as.factor(round(cmean_4,2))),alpha=0.2)+
  geom_line(size=1,aes(color=as.factor(round(cmean_4,2))))+
  my_theme_legend()+
  xlab("Slope of the reaction norm\n(residuals of slope on intercept)")+
  ylab("Predicted fitness")+
  scale_color_manual(values=plasma(n=5,begin=0.4,end=0.9,direction=-1),
                     guide = guide_legend(title.position = "top",
                                          nrow=1))+
  scale_fill_manual(values=plasma(n=5,begin=0.4,end=0.9,direction=-1),
                    guide = guide_legend(title.position = "top",
                                         nrow=1))+
  labs(fill="April temperature (mean-centered)",
       colour="April temperature (mean-centered)")+
  #theme(legend.position=c(0.42,0.9),legend.box="horizontal")
  theme(legend.position="top",legend.box="horizontal",legend.title.align=0.5)
