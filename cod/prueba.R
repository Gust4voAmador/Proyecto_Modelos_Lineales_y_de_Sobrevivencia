library(caret)
library(pROC)

# Dummy test para validar entorno
x <- data.frame(
  y = factor(sample(c("Sí", "No"), 100, replace = TRUE)),
  x1 = rnorm(100),
  x2 = rnorm(100)
)

ctrl <- trainControl(method = "cv", number = 5, classProbs = TRUE,
                     summaryFunction = twoClassSummary)

modelo <- train(
  y ~ x1 + x2,
  data = x,
  method = "glm",
  metric = "ROC",
  trControl = ctrl
)

print(modelo)

