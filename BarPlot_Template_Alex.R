## ggplot(data = <DATA>,mapping=aes(X=variable, y=variable))+     
  ## <GEOM_FUNCTION>(MODIFIERS,aes(MODIFIERS))
  ## <GEOM_FUNCTION2> repeated
## facet_wrap(~VARIABLE) for single variable
## facet_grid(~Yvariable~Xvariable) for more than 1 variable
##  can also do (.~XVARIABLE) which places the variable on the top
##  or (YVARIABLE~.) which places it on the side; no rows/columns

## the data=filter(DATA, variable=="item") can be used to map specific data

library("ggplot2")
library("mapproj")

Data1 <- read.csv("Skin Microbiome/Skin Archaea/Analysis/EMBPrimerComparison/2020_02_11_EMBPrimer_341-806_comparison_Diff_zeros.csv")

ggplot(data=Data1, aes(x=SampleLabel, y=Diff, width = 0.9)) +
  
  geom_bar(aes(fill=Change),
           colour="Black",
           size = 0.8,
           alpha=0.7,
           stat="identity",
           #this position_dodge preserves the size of the bar, so you dont have two differently sized ones
           position=position_dodge(preserve = "single")
           #position = "dodge",
           ) +

  # This section was just me playing arond with some stuff. 
  #geom_text(aes(label = Archaea.Reads),)+ 
  #coord_polar("y", start=0) +
  #coord_cartesian() +
  #coord_quickmap() +
  #coord_polar("y", start=0,clip="off") +
  
  # This section adds an error bar based on two additional columns in your datafile (labelled Ymin and Ymax
  #geom_errorbar(data=Data1, aes(ymin=Ymin,ymax=Ymax), position = "dodge") + 
  
  scale_fill_brewer(palette="Set1") +
  
  theme_bw() +
  
  #facet_wrap(vars(Primers),ncol=2, scales = "free") +
  #facet_grid(cols= vars(Primer),scales = "free") +
  
  
  # colour, size, shape, and general formatting of the graph/figure
  theme(panel.grid = element_blank(),
      text = element_text(colour = "black"),
      axis.line = element_line(colour = "black"),
      axis.text = element_text(colour = "black",size=12),
      axis.text.x = element_text(angle = 90, hjust =1, vjust=0.5,size=12),
      legend.text = element_text(face = "italic",size = 16),
      legend.title = element_text(size=16),
      #legend.position = "none",
      axis.title = element_text(size=16,face=NULL),
      axis.text.y = element_text(size=10),
      strip.text.x = element_text(size=10,face="bold"),
      panel.spacing = unit(0, "lines"),
      ) + 
  
  # setting the graph so that it begins at the x-axis and there is no gap. Also sets the limits of the y-axis. This will have to be
  # changed depending on your dataset, or you can comment out the commands and it will just ignore it. 
  scale_y_continuous(expand = c(0.005,0),
                     limit=c(-50,150)) + 
  
  # adds some spacing between the left and right borders. breaks=NULL will remove x-axis labels.
  scale_x_discrete(expand = expand_scale(0,1),
                   breaks=NULL)+
  
  #cuts out the legend title or adds a custom title; " " leaves a blank. 
  labs(fill = "") +
  
  xlab("") +
  ylab("Change in archaeal reads (# of reads)")


