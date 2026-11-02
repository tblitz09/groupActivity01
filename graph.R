# Replace mydata, x and y with your own data frame and column names

# Clean up workspace
rm(list = ls()) # clear variables from previous work.
graphics.off() # clear out all old plots
cat("\014") # clear the console

if(!require('tidyverse')) {
  install.packages('tidyverse')
  library('tidyverse')
}

library(tidyverse)
mydata <- read_csv("data/group2_advertising_sales.csv")   # or paste the tibble from your group's slide
head(mydata)       # what do the first rows look like?
summary(mydata)    # what is the range of each variable?

# Step 1: look before you model
# Note: edit the code to match your variable names and units

plot(mydata$x, mydata$y,
     xlab = "x (units)", ylab = "y (units)",
     main = "y versus x", pch = 19, col = "steelblue")

# Step 2: fit a straight line
model <- lm(y ~ x, data = mydata) # edit x and y to match your variable names
model # the two numbers printed are the intercept and the slope

# Step 3: draw the line on top of the points
abline(model, col = "red", lwd = 2)

# Step 4: use the line to predict y for new x values
new_points <- tibble(x = c(10, 20)) # the column name must match your x variable's name
predict(model, newdata = new_points)
predict(model, newdata = new_points, interval = "prediction")  # a range, not just one number

# Step 5: how far is each point from the line?
residuals(model)
plot(mydata$x, residuals(model), pch = 19,
     xlab = "x", ylab = "Residual (observed - predicted)")
abline(h = 0, lty = 2)                         # a good line leaves residuals scattered around 0

# Step 6: the full report
summary(model)     # find the slope's p-value, and "Multiple R-squared"