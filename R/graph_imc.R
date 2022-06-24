source(enc2native(paste(getwd(),"/R/imc.R",sep="/")))




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

library(ggplot2)

ggplot(data=tab,aes(x=Poids,y=Taille,fill=-group))+
  geom_tile()+
  geom_point(x=120,y=168,col="white",size=5)+
  geom_point(x=54,y=157,col="purple",size=5)+
  geom_point(x=65,y=160,col="white",size=5)
