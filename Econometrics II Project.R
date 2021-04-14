# Econometrics II Project

library(dplyr)
library(ggplot2)
library(ggthemes)

updated_project_data = read.csv('updated_project_data.csv')
df = data.frame(updated_project_data)

summary(df)
mean_value = mean(df$fdi)
variance = var(df$fdi)

hist(df$FDI_MILLIONS, breaks = 100, main = "Histogram of Foreign Direct Investment")

# Model Estimation using only taxes

fit_tax = glm(df$FDI_MILLIONS ~ df$tax, family = poisson(link = "identity"))
summary(fit_tax)

plot(x = df$tax, y = df$FDI_MILLIONS, main = "Plot of FDI on Tax Rate", xlab = "Tax Rate", 
     ylab = "Foreign Direct Investment")
abline(fit_tax)


# Model Estimation

fit = glm(df$FDI_MILLIONS ~ df$tax + df$GDP_BILLIONS, family = poisson(link = "identity"))
summary(fit)

plot(x = df$tax, y = df$FDI_MILLIONS, main = "Plot of FDI on Tax Rate", xlab = "Tax Rate", 
     ylab = "Foreign Direct Investment")
abline(fit)

# Model Estimation using log of Tax Information

fit_inverse = glm(df$FDI_MILLIONS ~ df$GDP_BILLIONS + df$tax, family = poisson(link = "inverse"))
summary(fit_inverse)


plt_inverse <- plot(x = df$tax, y = df$FDI_MILLIONS,
     main = "Plot of FDI on Tax Rate using Inverse Function ", xlab = "Tax Rate", 
     ylab = "Foreign Direct Investment in Millions")
abline(fit_inverse)

# Model Estimation using Population Adjustment

fit_economic_freedom = glm(df$FDI_MILLIONS ~ df$GDP_BILLIONS + df$tax + df$pop, family = poisson(link = "identity"))
summary(fit_economic_freedom)
plot(x = df$tax, y = df$FDI_MILLIONS, main = "Plot of FDI on Tax Rate", xlab = "Tax Rate", 
     ylab = "Foreign Direct Investment")
abline(a = fit_economic_freedom$coefficients[1], b = df$tax * fit_economic_freedom$coefficients[2])

# Estimating Confidence Intervals

confidence_upper = numeric(64)
confidence_lower = numeric(64)

for(i in 1:64){
  cofidence_upper[i] = fit_economic_freedom$coefficients[2,3] * 1.96 +
    fit_economic_freedom$fitted.values[i]
  cofidence_lower[i] = fit_economic_freedom$coefficients[2,3] * 1.96 -
    fit_economic_freedom$fitted.values[i]
}

plot(x = df$tax, y = df$FDI_MILLIONS, main = "Plot of FDI on Tax Rate", xlab = "Tax Rate", 
     ylab = "Foreign Direct Investment")
abline(a = fit_economic_freedom$coefficients[1], b = df$tax * fit_economic_freedom$coefficients[2])
abline(cofidence_upper)

# Testing Variable Relationship
correlation_fdi_tax = cor(df$fdi, df$tax)
summary(correlation_fdi_tax)


correlation_gdp <- cor(df$fdi, df$gdp)
summary(correlation_gdp)

mean2 = mean(df$FDI_MILLIONS)
var2 = var(df$FDI_MILLIONS)
summary(mean2)
cat('Mean: ', mean2)

# Normality Test
norm_test = shapiro.test(df$FDI_MILLIONS)


# Plotting Confidence Intervals













