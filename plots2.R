# plots 2

library(ggplot2)
library(ggthemes)

# Plot 1
qplot(x = df2$tax, y = logfdi, geom = 'point',
      main = 'Log of Foreign Direct Investment vs Tax Rate', xlab = 'Tax Rate in Percentage',
      ylab = 'Foreign Direct Investment in Billions')+
  theme(
    plot.title = element_text(face = "bold", size = 12, family= 'mono', hjust = 0.5, colour = 'grey20'),
    axis.title = element_text(family = 'mono'),
    axis.ticks = element_line(colour = "grey70", size = 0.2),
    panel.grid.major = element_line(colour = "grey70", size = 0.2),
    panel.grid.minor = element_blank()
  )

# Plot 2

qplot(x = loggdp, y = logfdi, geom = 'point',
      main = 'Log of Foreign Direct Investment vs Log of GDP', xlab = 'Log Gross Domestic Product in Billions',
      ylab = 'Foreign Direct Investment in Billions')+
  theme(
    plot.title = element_text(face = "bold", size = 12, family= 'mono', hjust = 0.5, colour = 'grey20'),
    axis.title = element_text(family = 'mono'),
    axis.ticks = element_line(colour = "grey70", size = 0.2),
    panel.grid.major = element_line(colour = "grey70", size = 0.2),
    panel.grid.minor = element_blank()
  ) 

# Plot 3

qplot(x = df2$ff, y = logfdi, geom = 'point',
      main = 'Log of Foreign Direct Investment vs Financial Freedom', xlab = 'Financial Freedom',
      ylab = 'Foreign Direct Investment in Billions')+
  theme(
    plot.title = element_text(face = "bold", size = 12, family= 'mono', hjust = 0.5, colour = 'grey20'),
    axis.title = element_text(family = 'mono'),
    axis.ticks = element_line(colour = "grey70", size = 0.2),
    panel.grid.major = element_line(colour = "grey70", size = 0.2),
    panel.grid.minor = element_blank()
  )

# Plot 4

qplot(x = df2$rating, y = logfdi, geom = 'point',
      main = 'Log of Foreign Direct Investment vs Innovation Rating', xlab = 'Innovation Rating',
      ylab = 'Foreign Direct Investment in Billions')+
  theme(
    plot.title = element_text(face = "bold", size = 12, family= 'mono', hjust = 0.5, colour = 'grey20'),
    axis.title = element_text(family = 'mono'),
    axis.ticks = element_line(colour = "grey70", size = 0.2),
    panel.grid.major = element_line(colour = "grey70", size = 0.2),
    panel.grid.minor = element_blank()
  )











