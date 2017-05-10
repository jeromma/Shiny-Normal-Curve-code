#
# This is the user-interface definition of a Shiny app for playing with normal curves.
#

library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Normal Curve"),
  
  sidebarLayout(
    sidebarPanel(
       sliderInput("mu",
                   "Mean:",
                   min = -3,
                   max = 3,
                   value = 0),
       sliderInput("sd",
                   "Standard deviation:",
                   min = .5,
                   max = 6,
                   value = 1),
       sliderInput("range",
                   "Input range:",
                   min = -20,
                   max = 20,
                   value = c(-6, 6))
    ),

    mainPanel( tabsetPanel(
      tabPanel("Plot", plotOutput("distPlot", brush=brushOpts(id="brush1"))),
      tabPanel("Documentation", verbatimTextOutput("xValue")))
    )
  )
))
