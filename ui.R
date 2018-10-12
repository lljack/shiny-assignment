## This shiny application predicts the MPG (Mile per gallon) of cars from wt 
## (weight of cars). The source of the dataset is from mtcars.
## Select the weight and push the submit button at the sidebar pannel. 
## Then, the MPG will be shown in the main pannel.

library(shiny)

shinyUI(fluidPage(
    titlePanel("Predict MPG from weight"),
    sidebarLayout(
      sidebarPanel(
        sliderInput("sliderWT", "What is the WT of the car?", 1, 6, value =3.5), 
        checkboxInput("showModel1", "Show/Hide Model 1", value = TRUE), 
        submitButton("Sbutmit")
      ),
      mainPanel(
        plotOutput("plot1"),
        h3("Predicted MPG from Model 1:"),
        textOutput("pred1")
      )
  )
))