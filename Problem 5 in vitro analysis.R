#Install
install.packages("ggplot2")
install.packages("grid")

#Initialize
library(ggplot2)
library(grid)

#Add Theme
my.theme <- theme(
  plot.margin = unit(c(0.1, 0.5, 0.1, 0.1), "cm"),
  axis.text = element_text(colour="black", size=12),
  axis.title.x = element_text(colour="black", size=12),
  axis.title.y = element_text(colour="black", size=12),
  panel.grid.major = element_blank(),
  panel.grid.minor = element_blank(),
  panel.background = element_blank(),
  axis.line = element_line(colour = "black"),
  axis.text = element_text(colour ="black"),
  axis.ticks = element_line(colour = "black")
)

#Enter Data points for mer and mer + shape R squared analysis
mer <- c(0.7752448, 0.7854421, 0.7780349)
mer_shape <- c(0.8627681, 0.8643763, 0.8546499)

#Run Plot functions
ggplot() +
  geom_point(aes(x = mer, y = mer_shape), color = "red", size=1) +
  geom_abline(slope=1) + geom_vline(xintercept=0) + geom_hline(yintercept=0) +
  coord_fixed(ratio = 1, xlim = c(0,1), ylim = c(0,1)) +
  scale_x_continuous(expand = c(0, 0)) + scale_y_continuous(expand = c(0, 0)) +
  my.theme  