# Load required libraries
library(dplyr)
library(caret)
library(randomForest)
library(e1071)
library(gbm)
library(Metrics)

# Load the dataset
data <- read.csv("C:/Users/Muhammad Abu Bakkar/Downloads/Filtered_France_Data.csv")

# Print the column names to confirm
colnames(data)
# Select the first 28,000 rows
train_data <- data[1:28000, ]
# Select the relevant columns for features and target
features <- c("TSK", "PSFC", "X.U10.", "X.V10.", "X.Q2.", "RAINC", "RAINNC", "SNOW", "TSLB", "Windspeed")
target <- "SMOIS"

# Split train_data into a training set and a testing set
set.seed(123)  # For reproducibility
train_index <- createDataPartition(train_data$SMOIS, p = 0.8, list = FALSE)
train_set <- train_data[train_index, ]
test_set <- train_data[-train_index, ]
# 1. Linear Regression Model
linear_model <- lm(SMOIS ~ ., data = train_set[, c(features, target)])

# Evaluate the linear regression model
linear_predictions <- predict(linear_model, newdata = test_set[, features])
linear_mae <- mae(test_set$SMOIS, linear_predictions)
linear_mse <- mse(test_set$SMOIS, linear_predictions)
linear_rmse <- rmse(test_set$SMOIS, linear_predictions)
linear_r2 <- R2(linear_predictions, test_set$SMOIS)

# Print the results for Linear Regression
cat("Linear Regression Results:\n")
cat("MAE:", linear_mae, "\n")
cat("MSE:", linear_mse, "\n")
cat("RMSE:", linear_rmse, "\n")
cat("R2:", linear_r2, "\n")


# 2. Random Forest Model
rf_model <- randomForest(SMOIS ~ ., data = train_set[, c(features, target)], ntree = 100)

# Evaluate the random forest model
rf_predictions <- predict(rf_model, newdata = test_set[, features])
rf_mae <- mae(test_set$SMOIS, rf_predictions)
rf_mse <- mse(test_set$SMOIS, rf_predictions)
rf_rmse <- rmse(test_set$SMOIS, rf_predictions)
rf_r2 <- R2(rf_predictions, test_set$SMOIS)

# Print the results for Random Forest 
cat("Random Forest Results:\n")
cat("MAE:", rf_mae, "\n")
cat("MSE:", rf_mse, "\n")
cat("RMSE:", rf_rmse, "\n")
cat("R2:", rf_r2, "\n")

# 3. Gradient Boosting Model (GBM)
gbm_model <- train(SMOIS ~ ., data = train_set[, c(features, target)], method = "gbm", verbose = FALSE)

# Evaluate the GBM model
gbm_predictions <- predict(gbm_model, newdata = test_set[, features])
gbm_mae <- mae(test_set$SMOIS, gbm_predictions)
gbm_mse <- mse(test_set$SMOIS, gbm_predictions)
gbm_rmse <- rmse(test_set$SMOIS, gbm_predictions)
gbm_r2 <- R2(gbm_predictions, test_set$SMOIS)

# Print the results for GBM
cat("GBM Results:\n")
cat("MAE:", gbm_mae, "\n")
cat("MSE:", gbm_mse, "\n")
cat("RMSE:", gbm_rmse, "\n")
cat("R2:", gbm_r2, "\n")