## This shiny application predicts the MPG (Mile per gallon) of cars from wt 
## (weight of cars). The source of the dataset is from mtcars.
## Select the weight and push the submit button at the sidebar pannel. 
## Then, the MPG will be shown in the main pannel.

library(shiny)
shinyServer(function(input, output) {
  model1 <- lm(mpg ~ wt, data = mtcars)
                           
  model1pred <- reactive({
    wtInput <- input$sliderWT
    predict(model1, newdata = data.frame(wt = wtInput))
  })
                           
   output$plot1 <- renderPlot({
    wtInput <- input$sliderWT
    
    plot(mtcars$wt, mtcars$mpg, xlab = "weight",
         ylab = "Miles Per Gallon", bty = "n", pch = 16,
         xlim = c(1, 6), ylim = c(10, 35))
    if(input$showModel1){
       abline(model1, col = "green", lwd = 2)
    }
   legend(4, 30, c("Model 1 Prediction"), pch = 16,
           col = c("green"), bty = "n", cex = 1.2)
    points(wtInput, model1pred(), col = "green", pch = 16, cex = 2)
  })
                                              
  output$pred1 <- renderText({
    model1pred()
  })
})