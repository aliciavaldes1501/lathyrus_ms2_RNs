library(pamm)

nrow(subset(datadef,!is.na(FFD)))
length(unique(subset(datadef,!is.na(FFD))$id))

PAMM1<-PAMM(numsim=10,group=837,repl=c(1,2,3,4,5,6,7,8,9,10),
           randompart=c(0.2, 0.1, 0.8, 0),fixed = c(0, 1, 0),n.X=22)
PAMM2<-PAMM(numsim=10,group=837,repl=c(1,2,3,4,5,6,7,8,9,10),
            randompart=c(0.2, 0.1, 0.8, 0.5),fixed = c(0, 1, 0),n.X=22)
PAMM3<-PAMM(numsim=10,group=837,repl=c(1,2,3,4,5,6,7,8,9,10),
            randompart=c(0.2, 0.1, 0.8, 1),fixed = c(0, 1, 0),n.X=22)
PAMM4<-PAMM(numsim=10,group=837,repl=c(1,2,3,4,5,6,7,8,9,10),
            randompart=c(0.4, 0.1, 0.6, 0),fixed = c(0, 1, 0),n.X=22)
PAMM5<-PAMM(numsim=10,group=837,repl=c(1,2,3,4,5,6,7,8,9,10),
            randompart=c(0.4, 0.1, 0.6, 0.5),fixed = c(0, 1, 0),n.X=22)
PAMM6<-PAMM(numsim=10,group=837,repl=c(1,2,3,4,5,6,7,8,9,10),
            randompart=c(0.4, 0.1, 0.6, 1),fixed = c(0, 1, 0),n.X=22)
PAMM7<-PAMM(numsim=10,group=837,repl=c(1,2,3,4,5,6,7,8,9,10),
            randompart=c(0.6, 0.1, 0.4, 0),fixed = c(0, 1, 0),n.X=22)
PAMM8<-PAMM(numsim=10,group=837,repl=c(1,2,3,4,5,6,7,8,9,10),
            randompart=c(0.6, 0.1, 0.4, 0.5),fixed = c(0, 1, 0),n.X=22)
PAMM9<-PAMM(numsim=10,group=837,repl=c(1,2,3,4,5,6,7,8,9,10),
            randompart=c(0.6, 0.1, 0.4, 1),fixed = c(0, 1, 0),n.X=22)
PAMM10<-PAMM(numsim=10,group=c(seq(100,1000,100)),repl=3,
            randompart=c(0.2, 0.1, 0.8, 0),fixed = c(0, 1, 0),n.X=22)
PAMM11<-PAMM(numsim=10,group=c(seq(100,1000,100)),repl=3,
            randompart=c(0.2, 0.1, 0.8, 0.5),fixed = c(0, 1, 0),n.X=22)
PAMM12<-PAMM(numsim=10,group=c(seq(100,1000,100)),repl=3,
            randompart=c(0.2, 0.1, 0.8, 1),fixed = c(0, 1, 0),n.X=22)
PAMM13<-PAMM(numsim=10,group=c(seq(100,1000,100)),repl=3,
            randompart=c(0.4, 0.1, 0.6, 0),fixed = c(0, 1, 0),n.X=22)
PAMM14<-PAMM(numsim=10,group=c(seq(100,1000,100)),repl=3,
            randompart=c(0.4, 0.1, 0.6, 0.5),fixed = c(0, 1, 0),n.X=22)
PAMM15<-PAMM(numsim=10,group=c(seq(100,1000,100)),repl=3,
            randompart=c(0.4, 0.1, 0.6, 1),fixed = c(0, 1, 0),n.X=22)
PAMM16<-PAMM(numsim=10,group=c(seq(100,1000,100)),repl=3,
             randompart=c(0.6, 0.1, 0.4, 0),fixed = c(0, 1, 0),n.X=22)
PAMM17<-PAMM(numsim=10,group=c(seq(100,1000,100)),repl=3,
             randompart=c(0.6, 0.1, 0.4, 0.5),fixed = c(0, 1, 0),n.X=22)
PAMM18<-PAMM(numsim=50,group=c(seq(100,1000,100)),repl=3,
             randompart=c(0.6, 0.1, 0.4, 1),fixed = c(0, 1, 0),n.X=22)

# Repeat with larger numsim, e.g. 50

PAMM1<-PAMM1%>%dplyr::select(nb.ID,nb.repl,int.power,sl.power)%>%
  mutate(var="repl",VI=0.2,VS=0.1,VR=0.8,rIS=0)
PAMM2<-PAMM2%>%dplyr::select(nb.ID,nb.repl,int.power,sl.power)%>%
  mutate(var="repl",VI=0.2,VS=0.1,VR=0.8,rIS=0.5)
PAMM3<-PAMM3%>%dplyr::select(nb.ID,nb.repl,int.power,sl.power)%>%
  mutate(var="repl",VI=0.2,VS=0.1,VR=0.8,rIS=1)
PAMM4<-PAMM4%>%dplyr::select(nb.ID,nb.repl,int.power,sl.power)%>%
  mutate(var="repl",VI=0.4,VS=0.1,VR=0.6,rIS=0)
PAMM5<-PAMM5%>%dplyr::select(nb.ID,nb.repl,int.power,sl.power)%>%
  mutate(var="repl",VI=0.4,VS=0.1,VR=0.6,rIS=0.5)
PAMM6<-PAMM6%>%dplyr::select(nb.ID,nb.repl,int.power,sl.power)%>%
  mutate(var="repl",VI=0.4,VS=0.1,VR=0.6,rIS=1)
PAMM7<-PAMM7%>%dplyr::select(nb.ID,nb.repl,int.power,sl.power)%>%
  mutate(var="repl",VI=0.6,VS=0.1,VR=0.4,rIS=0)
PAMM8<-PAMM8%>%dplyr::select(nb.ID,nb.repl,int.power,sl.power)%>%
  mutate(var="repl",VI=0.6,VS=0.1,VR=0.4,rIS=0.5)
PAMM9<-PAMM9%>%dplyr::select(nb.ID,nb.repl,int.power,sl.power)%>%
  mutate(var="repl",VI=0.6,VS=0.1,VR=0.4,rIS=1)
PAMM10<-PAMM10%>%dplyr::select(nb.ID,nb.repl,int.power,sl.power)%>%
  mutate(var="group",VI=0.2,VS=0.1,VR=0.8,rIS=0)
PAMM11<-PAMM11%>%dplyr::select(nb.ID,nb.repl,int.power,sl.power)%>%
  mutate(var="group",VI=0.2,VS=0.1,VR=0.8,rIS=0.5)
PAMM12<-PAMM12%>%dplyr::select(nb.ID,nb.repl,int.power,sl.power)%>%
  mutate(var="group",VI=0.2,VS=0.1,VR=0.8,rIS=1)
PAMM13<-PAMM13%>%dplyr::select(nb.ID,nb.repl,int.power,sl.power)%>%
  mutate(var="group",VI=0.4,VS=0.1,VR=0.6,rIS=0)
PAMM14<-PAMM14%>%dplyr::select(nb.ID,nb.repl,int.power,sl.power)%>%
  mutate(var="group",VI=0.4,VS=0.1,VR=0.6,rIS=0.5)
PAMM15<-PAMM15%>%dplyr::select(nb.ID,nb.repl,int.power,sl.power)%>%
  mutate(var="group",VI=0.4,VS=0.1,VR=0.6,rIS=1)
PAMM16<-PAMM16%>%dplyr::select(nb.ID,nb.repl,int.power,sl.power)%>%
  mutate(var="group",VI=0.6,VS=0.1,VR=0.4,rIS=0)
PAMM17<-PAMM17%>%dplyr::select(nb.ID,nb.repl,int.power,sl.power)%>%
  mutate(var="group",VI=0.6,VS=0.1,VR=0.4,rIS=0.5)
PAMM18<-PAMM18%>%dplyr::select(nb.ID,nb.repl,int.power,sl.power)%>%
  mutate(var="group",VI=0.6,VS=0.1,VR=0.4,rIS=1)

PAMM_all<-tibble(rbind(PAMM1,PAMM2,PAMM3,PAMM4,PAMM5,PAMM6,
                       PAMM7,PAMM8,PAMM9,PAMM10,PAMM11,PAMM12,
                       PAMM13,PAMM14,PAMM15,PAMM16,PAMM17,PAMM18))%>%
  mutate(var=as.factor(var),VI=as.factor(VI),VS=as.factor(VS),
         VR=as.factor(VR),rIS=as.factor(rIS))%>%
  pivot_longer(cols=int.power:sl.power,names_to="type",values_to="power")

ggplot(PAMM_all%>%filter(var=="repl"&!is.na(power)),
       aes(x=nb.repl,y=power,color=rIS))+
  facet_grid(rows=vars(type),cols=vars(VI))+
  geom_line()+scale_x_continuous(breaks=seq(0,10,2))+my_theme_legend()+
  theme(legend.position="top")

ggplot(PAMM_all%>%filter(var=="group"&!is.na(power)),
       aes(x=nb.ID,y=power,color=rIS))+
  facet_grid(rows=vars(type),cols=vars(VI))+
  geom_line()+scale_x_continuous(breaks=seq(100,1000,250))+my_theme_legend()+
  theme(legend.position="top")

################################################################################

EAMM1<-EAMM(numsim=10, group=837, repl=3, fixed = c(0, 1, 0),
            VI = 0.25, VS = seq(0.05, 0.5, 0.05),CoIS = 0, 
            relIS = "cor", n.X=22,intercept = 0, heteroscedasticity = c("null"))
EAMM2<-EAMM(numsim=10, group=837, repl=3, fixed = c(0, 1, 0),
            VI = 0.25, VS = seq(0.05, 0.5, 0.05),CoIS = 0.5, 
            relIS = "cor", n.X=22,intercept = 0, heteroscedasticity = c("null"))
EAMM3<-EAMM(numsim=10, group=837, repl=3, fixed = c(0, 1, 0),
            VI = 0.25, VS = seq(0.05, 0.5, 0.05),CoIS = 0.9, 
            relIS = "cor", n.X=22,intercept = 0, heteroscedasticity = c("null"))

EAMM1<-EAMM1%>%dplyr::select(VI,VS,int.power,sl.power)%>%
  mutate(CoIS=0)
EAMM2<-EAMM2%>%dplyr::select(VI,VS,int.power,sl.power)%>%
  mutate(CoIS=0.5)
EAMM3<-EAMM3%>%dplyr::select(VI,VS,int.power,sl.power)%>%
  mutate(CoIS=0.5)

EAMM_all<-tibble(rbind(EAMM1,EAMM2,EAMM3))%>%
  mutate(VI=as.factor(VI),VS=as.factor(VS),CoIS=as.factor(CoIS))%>%
  pivot_longer(cols=int.power:sl.power,names_to="type",values_to="power")

ggplot(EAMM_all,aes(x=VS,y=power))+
  facet_wrap(~CoIS)+
  geom_point()+my_theme_legend()+
  theme(legend.position="top")


################################################################################

SSF1<-SSF(numsim=10, tss=2478, nbstep = 100, randompart=c(0.4,0.1,0.6,0),n.X=22,
          fixed = c(0, 1, 0),intercept = 0,heteroscedasticity = c("null") )
plot(SSF1)
plot(SSF1%>%filter(nb.ID>700&nb.ID<1000))
