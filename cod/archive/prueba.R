library(caret)
library(pROC)
library(readr)
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

#install.packages("caret")

datos_woe <- read_csv("C:/Users/AMADOR/OneDrive - Universidad de Costa Rica/I-2025/Modelos lineales y de sobrevivencia/Proyecto Modelos/data/datos_woe.csv")
View(datos_woe)

