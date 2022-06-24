graph_imc <- function(T_cm,P_kg){

Taille <- seq(140,200,by=.4)
Poids <- seq(50,130,by=.4)

tab <- expand.grid(Taille,Poids)
colnames(tab)<- c("Taille","Poids")
tab$IMC <- tab$Poids/(tab$Taille/100)^2

tab$group[tab$IMC<21]<- 1
tab$group[tab$IMC>=21&tab$IMC<25]<- 2
tab$group[tab$IMC>=25&tab$IMC<30]<- 3
tab$group[tab$IMC>=30&tab$IMC<35]<- 4
tab$group[tab$IMC>=35&tab$IMC<40]<- 5
tab$group[tab$IMC>=40]<- 6

tab$group <- ordered(tab$group, levels = c(1:6))

library(ggplot2)
ggplot2::ggplot(data=tab,aes(x=Poids,y=Taille,fill=group))+
  geom_tile()+
  geom_point(x=P_kg,y=T_cm,col="white",size=5)+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))

}

graph_imc(160,100)






# ggplot(dt2,aes(x=Long, y=Lat,col=median_y_class,fill=median_y_class))+
#   geom_tile()+
#   theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
#         panel.background = element_blank(), axis.line = element_line(colour = "black"))+
#   facet_grid(year+RCP~cultivar)+
#   labs(fill="Médiane du rendement en coton graine (kg/ha)",x="Longitude",y="Latitude")+
#   guides(col="none")+
#   scale_fill_manual(values = cols,guide = guide_legend(title.position = "top", nrow = 1),limits=force)+
#   scale_colour_manual(values = cols)+
#   theme(legend.direction = "horizontal",
#         legend.position = "bottom")
