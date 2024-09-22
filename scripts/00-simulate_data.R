#### Preamble ####
# Purpose: Simulates data
# Author: JINGYI ZHU
# Date: 22 September, 2024
# Contact: lengle.zhu@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None



#### Workspace setup ####
library(tidyverse)


#### Simulate data ####

# For reproducibility

set.seed(123)  

# Define simulation parameters

# Number of days to simulate (3 months)
days <- 90  
# Mean temperature (°C)
mean_temp <- 25  
# Standard deviation of temperature (°C)
sd_temp <- 5    
# Probability of rain on any given day
rain_prob <- 0.2 
# Mean rainfall amount (mm) when it rains
mean_rain <- 5   
# Standard deviation of rainfall (mm)
sd_rain <- 2    
# Simulate daily temperatures (Normal distribution)
temperatures <- rnorm(days, mean = mean_temp, sd = sd_temp)

# Simulate daily rainfall occurrence (Binomial distribution)
rain_occur <- rbinom(days, size = 1, prob = rain_prob)

# Simulate daily rainfall amount (if it rains)
rain_amount <- ifelse(rain_occur == 1, 
                      rnorm(days, mean = mean_rain, sd = sd_rain), 0)

# Combine results into a data frame
weather_data <- data.frame(
  Day = 1:days,
  # Round temperature to 1 decimal place
  Temperature = round(temperatures, 1), 
  Rain = rain_occur,
  # Round rainfall to 1 decimal place
  Rainfall_mm = round(rain_amount, 1)  
)

# Print the first few rows of the simulated weather data
head(weather_data)

# Plot the results
par(mfrow = c(2, 1))  # Set up for 2 plots

# Plot temperature
plot(weather_data$Day, weather_data$Temperature, type = "l", col = "blue",
     main = "Simulated Daily Temperature at Toronto Beaches", 
     xlab = "Day", ylab = "Temperature (°C)")

# Plot rainfall
plot(weather_data$Day, weather_data$Rainfall_mm, type = "h", col = "darkgreen",
     main = "Simulated Daily Rainfall at Toronto Beaches", 
     xlab = "Day", ylab = "Rainfall (mm)")


