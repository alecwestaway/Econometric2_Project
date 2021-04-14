# Final Project Code

library(dplyr)
library(ggplot2)
library(ggthemes)
library(e1071)

# Importing Data
new_data = read.csv('csvfinalfinal.csv')
df2 = data.frame(new_data)

# Density plots
plot(density(df2$fdi.billion), main = "Density of FDI")
plot(density(df2$gdp.billion))
plot(density(df2$tax))
plot(density(df2$ff))
plot(density(df2$rating))

# Transformed data
loggdp = log10(df2$gdp.billion)
logfdi = log10(df2$fdi.billion)

# Testing for Skewness of logged Data
skewness(df2$fdi.billion)
skewness(logfdi)

# Density of Transformed Data
plot(density(logfdi))
plot(density(loggdp), main = "Density of log FDI")

# Estimating Regressions
model1 = glm(logfdi ~ df2$tax, family = gaussian(link = 'identity'))
model2 = glm(logfdi ~ df2$tax + df2$gdp.billion, family = gaussian(link = 'identity'))
model3 = glm(logfdi ~ df2$tax + df2$gdp.billion + df2$ff, family = gaussian(link = 'identity'))
model4 = glm(logfdi ~ df2$tax + loggdp + df2$ff, family = gaussian(link = 'identity'))
model5 = glm(logfdi ~ df2$tax + loggdp + df2$ff + df2$rating, family = gaussian(link = 'identity'))

model_final = glm(logfdi ~ loggdp + df2$ff + df2$rating, family = gaussian(link = 'identity'))
# Plotting Relationships
plot(x = df2$tax, y = logfdi)
plot(x = loggdp, y = logfdi)
plot(x = df2$ff, y= logfdi)
plot(x = df2$rating, y = logfdi)
# Plotting Residuals
model5_resid = residuals(model5)
plot(model5_resid, main = "Scatter Plot of Residuals")
hist(model5_resid, n = 10)
plot(model5)



