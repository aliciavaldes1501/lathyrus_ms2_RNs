datadef$mean_fitness_fl_round<-round(datadef$mean_fitness_fl)
bf_fitness <- bf(mean_fitness_fl_round ~  (1|ID1|id)) # Set up model formula

bivar1.all.brm.pois<-brm(bf_FFD + bf_fitness, family = c(gaussian, poisson), 
                         data = datadef,
                         warmup = 1000,iter = 2000,chains=4,thin=2,
                         inits = "random",seed = 12345,cores = my.cores,
                         save_all_pars=TRUE)

predict_id_2<-ggpredict(bivar1.all.brm.pois,
                      terms=c("cmean_4","id"),type="random")
predict_mean_2<-ggpredict(bivar1.all.brm.pois,terms=c("cmean_4"),type="random")

ggplot()+
  geom_line(data=subset(data.frame(predict_id_2),response.level=="FFD"),aes(x=x,y=predicted,group=group),
            color="grey",size=0.01,alpha=0.3)+
  xlab("April temperature")+ylab("FFD")
ggplot()+
  geom_line(data=subset(data.frame(predict_id_2),response.level=="meanfitnessflround"),aes(x=x,y=predicted,group=group),
            color="grey",size=0.01,alpha=0.3)+
  xlab("April temperature")+ylab("Fitness")


ggplot()+
  geom_line(data=data.frame(predict_id_2),aes(x=x,y=predicted,group=group),
            color="grey",size=0.01,alpha=0.3)+
  geom_line(data=data.frame(predict_mean_2),aes(x=x,y=predicted),
            color="black",size=1)+
  my_theme()+
  xlab("April temperature (mean-centered)")+
  ylab("Predicted FFD")

head(data.frame(ranef(bivar1.all.brm.pois)$id))

ggplot(data=data.frame(ranef(bivar1.all.brm.pois)$id),
                       aes(x=Estimate.FFD_cmean_4,y=Estimate.meanfitnessflround_Intercept))+
         geom_point()+geom_smooth(method="lm")+
  my_theme()

ggplot(data=data.frame(ranef(bivar1.all.brm.pois)$id),
       aes(x=Estimate.FFD_Intercept,y=Estimate.meanfitnessflround_Intercept))+
  geom_point()+geom_smooth(method="lm")+
  my_theme()

ggplot(data=data.frame(ranef(bivar1.all.brm.pois)$id),
       aes(x=Estimate.FFD_Intercept,
           y=Estimate.meanfitnessflround_Intercept,
           z=Estimate.FFD_cmean_4))+
  axes_3D() +
  stat_3D()
  my_theme()

library(plotly)
plot_ly(data=data.frame(ranef(bivar1.all.brm.pois)$id),
        x=~Estimate.FFD_Intercept, 
        y=~Estimate.meanfitnessflround_Intercept, 
        z=~Estimate.FFD_cmean_4)


