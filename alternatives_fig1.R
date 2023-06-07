# Highest-lowest slope

ggplot()+
  geom_line(data=data.frame(subset(predict_id_2,
                                   group=="new_46"|group=="new_131")),
            aes(x=x,y=predicted,group=group,color=group),
            size=1,linetype=2)+
  geom_line(data=data.frame(predict_mean_2),aes(x=x,y=predicted),
            color="red",size=1)+
  geom_point(data=subset(datadef,id=="new_46"|id=="new_131"),
              aes(x=cmean_4,y=FFD,color=id),size=3,alpha=0.5)+
  my_theme()+
  xlab("April temperature (mean-centered)")+
  ylab("Predicted FFD")
ggsave(filename="output/figures/alternative_fig1A.tiff",
       device="tiff",width=14,height=12,units="cm",dpi=300,compression="lzw")


# 
data_fig1<-full_join(data.frame(predict_id_2),
          datadef%>%dplyr::select(id,slope)%>%group_by(id)%>%
            summarise(slope=mean(slope))%>%rename(group=id))

ggplot()+
  geom_point(data=subset(datadef,id=="new_46"|id=="new_131"),
             aes(x=cmean_4,y=FFD,color=slope),size=3,alpha=1)+
  geom_line(data=subset(data_fig1,group!="new_46"|group!="new_131"),
            aes(x=x,y=predicted,group=group,color=slope),
            size=0.01,alpha=0.1)+
  scale_color_viridis(end=0.9,option = "C")+
  geom_line(data=subset(data_fig1,group=="new_46"|group=="new_131"),
            aes(x=x,y=predicted,group=group,color=slope),
            size=1,linetype=2)+
  geom_line(data=data.frame(predict_mean_2),aes(x=x,y=predicted),
            color="black",size=1)+
  my_theme()+
  xlab("April temperature (mean-centered)")+
  ylab("Predicted FFD")

ggsave(filename="output/figures/alternative_fig1A_.tiff",
       device="tiff",width=14,height=12,units="cm",dpi=300,compression="lzw")
