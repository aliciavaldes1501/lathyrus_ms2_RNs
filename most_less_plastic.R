grid.arrange(ggdraw(plot_grid(modelBLUP_2_3_brms_plot2,
                 plot_grid(legend1,NULL,ncol=1),rel_widths=c(1, 0.4))),
ggplot(as.data.frame(conditional_effects(modelBLUP_8_3_brms, 
                                         effects = "slope_residuals:cmean_4",dpar="zi",
                                         int_conditions=
                                           list(cmean_4=quantile))$`slope_residuals:cmean_4`)%>%
         mutate(prob_fitness=1-estimate__,lower=1-lower__,upper=1-upper__),
       aes(x=slope_residuals,y=prob_fitness, group=cmean_4))+
  geom_ribbon(aes(ymin=lower,ymax=upper,
                  fill=as.factor(round(cmean_4,2))),alpha=0.2)+
  geom_line(size=1,aes(color=as.factor(round(cmean_4,2))))+
  my_theme_legend()+
  xlab("Slope of the reaction norm (residuals of slope on intercept)")+
  ylab("Predicted probability of having any fitness")+
  scale_color_manual(values=plasma(n=5,begin=0.4,end=0.9,direction=-1))+
  scale_fill_manual(values=plasma(n=5,begin=0.4,end=0.9,direction=-1))+
  labs(fill="April temperature\n(mean-centered)",
       colour="April temperature\n(mean-centered)"),
ncol=2)

# Fig. 1

ggplot()+
  geom_line(data=data.frame(predict_id_2),
            aes(x=x,y=predicted,group=group),
            color="grey",size=0.01,alpha=0.3)+
  geom_line(data=data.frame(predict_mean_2),aes(x=x,y=predicted),
            color="black",size=1)+
  my_theme()+
  xlab("April temperature (mean-centered)")+
  ylab("Predicted FFD")

head(data.frame(predict_id_2))

range(datadef_BLUPs$slope)
subset(datadef_BLUPs,slope<=-1.3) # id == new_46 (most plastic)
subset(datadef_BLUPs,slope>1.4) # id == new_131 (less plastic)

range(datadef_BLUPs$slope_residuals)
subset(datadef_BLUPs,slope_residuals<=-0.37) # id == old_430 (most plastic, adjusting for differences in average flowering time)
subset(datadef_BLUPs,slope_residuals>0.38) # id == new_112 (less plastic, adjusting for differences in average flowering time)

predict_most_less<-subset(predict_id_2,
                          group=="new_46"|group=="new_131"|group=="old_430"|group=="new_112")

ggplot()+
  geom_line(data=data.frame(predict_most_less),
            aes(x=x,y=predicted,group=group,color=group),size=0.5)+
  my_theme_legend()+
  xlab("April temperature (mean-centered)")+
  ylab("Predicted FFD")

predict_most_less1<-subset(predict_id_2,
                           group=="new_46"|group=="new_131")

ggplot()+
  geom_line(data=data.frame(predict_most_less1),
            aes(x=x,y=predicted,group=group,color=group),size=1)+
  my_theme_legend()+
  scale_color_discrete(name=NULL, breaks=c("new_46", "new_131"),
                      labels=c("new_46, slope = -1.395", "new_131, slope =  1.474"))+
  scale_y_continuous(limits=c(45,65))+
  theme(legend.position="top")+
  xlab("April temperature (mean-centered)")+
  ylab("Predicted FFD")

predict_most_less2<-subset(predict_id_2,
                          group=="old_430"|group=="new_112")

ggplot()+
  geom_line(data=data.frame(predict_most_less2),
            aes(x=x,y=predicted,group=group,color=group),size=1)+
  my_theme_legend()+
  scale_color_discrete(name=NULL, breaks=c("old_430", "new_112"),
                       labels=c("old_430, slope_residuals = -0.375", "new_112, slope_residuals =  0.384"))+
  scale_y_continuous(limits=c(45,65))+
  theme(legend.position="top")+
xlab("April temperature (mean-centered)")+
  ylab("Predicted FFD")

grid.arrange(ggplot()+
               geom_line(data=data.frame(predict_most_less1),
                         aes(x=x,y=predicted,group=group,color=group),size=1)+
               theme_bw()+
               scale_color_discrete(name=NULL, breaks=c("new_46", "new_131"),
                                    labels=c("new_46, slope = -1.395", "new_131, slope =  1.474"))+
               scale_y_continuous(limits=c(45,65))+
               theme(legend.position="top")+
               xlab("April temperature (mean-centered)")+
               ylab("Predicted FFD"),
             ggplot()+
               geom_line(data=data.frame(predict_most_less2),
                         aes(x=x,y=predicted,group=group,color=group),size=1)+
               theme_bw()+
               scale_color_discrete(name=NULL, breaks=c("old_430", "new_112"),
                                    labels=c("old_430, slope_residuals = -0.375", "new_112, slope_residuals =  0.384"))+
               scale_y_continuous(limits=c(45,65))+
               theme(legend.position="top")+
               xlab("April temperature (mean-centered)")+
               ylab("Predicted FFD"),
             ncol=2)


