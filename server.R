#
# This is the server logic of a Shiny web app for playing with normal curves.
#

options(warn=-1)
library(shiny)
library(ggplot2)
options(warn=0)

redraw <- function(minx, maxx, mu, sd) {
  errorText <- "Minimum x-axis value must be smaller than maximum x-axis value."
  if (maxx - minx > .1) {
    xvalues <- seq(minx, maxx, .1)
    yvalues <- dnorm(xvalues, mu, sd)
    g <- ggplot(data=data.frame(xvalues, yvalues), aes(x=xvalues, y=yvalues))
    g + geom_line() + labs(x="X", y="f(X)")
  } else {
    ggplot() + annotate("text", x=4, y=25, size=6, label=errorText)
  }
}

shinyServer(function(input, output) {
  doc <- readLines("Data/documentation.txt")
  doc2 <- paste(doc, collapse="\n")
  output$distPlot <- renderPlot({
    if (is.null(input$brush1)) {
      redraw(input$range[1], input$range[2], input$mu, input$sd)
    } else {
      redraw(input$brush1$xmin, input$brush1$xmax, input$mu, input$sd)
    }
  })
  output$xValue <- renderText(doc2)
})
