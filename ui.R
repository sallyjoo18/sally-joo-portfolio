

library(shiny)

ui <- fluidPage(
  titlePanel("Interactive Page"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("n", "Choose a number:", 1, 100, 50)
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

