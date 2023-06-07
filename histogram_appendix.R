datadef%>%group_by(id)%>%summarise(mean_years_fl=mean(n_years_fl_fitness))%>%
  ggplot(aes(mean_years_fl))+
  geom_histogram(bins=12,color="black",fill="lightgrey")+my_theme()+
  xlab("Number of flowering events per individual")+ylab("Count")
ggsave(filename="output/figures/histogram_appendix.tiff",
       device="tiff",width=14,height=12,units="cm",dpi=300,compression="lzw")
