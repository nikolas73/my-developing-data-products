library(shiny)
library(datasets)

# factor transmission, gear and cylinders for better plotting 
mtCars<-mtcars
# mtCars$am<-factor(mtCars$am)
# mtCars$cyl<-factor(mtCars$cyl)
# mtCars$gear<-factor(mtCars$gear)

# Assemble server
shinyServer(function(input, output) {
  
  #  print a title
  output$title <- renderText({
    paste("miles per gallon plotted against", input$var)
  })
  
  y <- reactive({
    as.formula(paste("mpg ~", input$var))
  })
  
  # Generate a plot of the requested variable against mpg 
  output$milesPlot <- renderPlot({
    plot(y(), data=mtCars)
  })
    
  
  output$linearfit<-renderText({
    z<-lm(y(), data=mtCars)
    print ((rbind(c("Intercept:", "Slope:"), round(z$coefficients, 2))))
  })
})

