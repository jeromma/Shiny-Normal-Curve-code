#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  minx <- -6
  maxx <- 6
  x <- seq(minx, maxx, .1)
  y <- reactive({dnorm(x, input$mu, input$sd)})
  brushed_data <- reactive({brushedPoints(data.frame(a=x, b=y()), input$brush1)})
  output$distPlot <- renderPlot({
    g <- ggplot(data=data.frame(a=x, b=y()), aes(x=a, y=b))
    g + geom_line()
  })
  
  output$xValue <- renderText({brushed_data()[[1]][1]})
  output$yValue <- renderText({brushed_data()[[2]][1]})
})
