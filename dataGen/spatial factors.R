rm(list=ls(all=TRUE))
library(ggplot2)

#get data
source('dataGen/spatial factors function.R')
grid1=read.csv('dataGen/fake data gridded.csv',as.is=T)
hf=read.csv('dataGen/fake data hf coord.csv',as.is=T)
pop=read.csv('dataGen/fake data popcenter.csv',as.is=T)

#show spatial distribution of pop
pop_plot <- create.plot(grid1,'pop', 'lightyellow', 'red', "Population Density")

#show spatial distribution of distance to hf
dist_hf_plot <- create.plot(grid1,'dist_hf', 'lightgray', 'black', "Distance to existing health facility")

#show spatial distribution of distance to pop center
dist_uc_plot <- create.plot(grid1,'dist_uc', 'lightgray', 'black', "Distance to urban center")

fig1 <- ggpubr::ggarrange(pop_plot, dist_hf_plot, dist_uc_plot,
                  ncol = 3, legend = "none") %>% 
  ggpubr::annotate_figure(left = "Longitude", bottom = "Latitude")
ggsave("img/Fig1.png", fig1, height = 3.5)
