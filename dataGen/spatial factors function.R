create.plot=function(grid1,var1, col_low = "white", col_high = "darkgray", title = NULL){
  max1=max(grid1[,var1])
  grid1$zzz=grid1[,var1]
  rango=c(0,max(grid1$zzz));
  res=ggplot() + 
    geom_tile(data = grid1, alpha = 0.8,aes(x = x, y = y,fill = zzz)) +
    scale_fill_gradient(low = col_low, high=col_high,limits=rango,name = '') + 
    geom_point(data = hf, aes(x = x,y=y,size=3), shape=17,size = 2, show.legend=F) +    
    geom_point(data = pop, aes(x = x,y=y,size=3),shape=10,size = 2, show.legend=F) +
    # xlab('Longitude') + ylab("Latitude") +
    xlab('') + ylab("") +
    labs(title = stringr::str_wrap(title, 36)) +
    theme_minimal() +
    theme(panel.ontop=TRUE, 
          panel.background = element_rect(fill = NA), 
          panel.grid = element_line(linetype = 2, size = 0.1), 
          panel.grid.minor =  element_blank(), 
          text = element_text(size = 10), 
          plot.title = element_text(hjust = 0.5, size = 8))
  # annotate(geom="text", x=0.5, y=1, label=nome,size=20,color="black")
  # guide(colour='colorbar')
  #ggsave(file=paste('spatial factors graph ',var1,'.jpeg',sep=''), res,width=7,height=7)
  res
}
