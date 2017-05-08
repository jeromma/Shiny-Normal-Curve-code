#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Normal Curve"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("mu",
                   "Distribution mean:",
                   min = -3,
                   max = 3,
                   value = 0),
       sliderInput("sd",
                   "Distribution standard deviation:",
                   min = .5,
                   max = 6,
                   value = 1)
    ),
  # Show a plot of the generated distribution
    mainPanel( tabsetPanel(
      tabPanel("tab 1", plotOutput("distPlot", brush=brushOpts(id="brush1"))),
      tabPanel("tab 2", h3("x"), textOutput("xValue"), h3("y"), textOutput("yValue")),
      tabPanel("tab 3", "contents"))
    )
  )
))
