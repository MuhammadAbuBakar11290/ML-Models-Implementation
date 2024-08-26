# ML Models Implementation

This repository contains R code for implementing and evaluating various machine learning models. The primary models included are:

- **Linear Regression**
- **Random Forest**
- **Gradient Boosting Machine (GBM)**

## Files

- **`Models.R`**: This script includes R implementations for the following models:
  - Linear Regression
  - Random Forest
  - Gradient Boosting Machine (GBM)

## Description

The `Models.R` script performs the following tasks:

1. **Load Required Libraries**: The script loads necessary R libraries including `dplyr`, `caret`, `randomForest`, `e1071`, `gbm`, and `Metrics`.

2. **Load and Prepare Data**: 
   - The dataset is loaded from the specified file path.
   - The dataset is split into training and testing sets.

3. **Linear Regression Model**:
   - Fit a linear regression model.
   - Evaluate the model using Mean Absolute Error (MAE), Mean Squared Error (MSE), Root Mean Squared Error (RMSE), and R-squared.

4. **Random Forest Model**:
   - Fit a Random Forest model.
   - Evaluate the model using MAE, MSE, RMSE, and R-squared.

5. **Gradient Boosting Model (GBM)**:
   - Fit a Gradient Boosting Machine model using the `caret` package.
   - Evaluate the model using MAE, MSE, RMSE, and R-squared.

## Installation

To run the script, ensure you have R installed and the required libraries. Install the necessary R packages using the following command:

```r
install.packages(c("dplyr", "caret", "randomForest", "e1071", "gbm", "Metrics"))
