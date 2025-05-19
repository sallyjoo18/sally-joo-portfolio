library(shiny)
library(bslib)

# theme ------------------------------------------------------------------
my_theme <- bs_theme(
  version = 5, 
  bg = "white", # background color 
  fg = "#020202", # dark text color 
  primary = "#9097C0", # primary button color 
  secondary = "#705D56", # secondary button color 
  info =  "#503B31", # info color 
  base_font = font_google("Roboto")
)

# defining UI ------------------------------------------------------------
ui <- page_sidebar(
  theme = my_theme, 
  title = "Hyouji Joo's Portfolio",
  # Sidebar with tab selector
  sidebar = sidebar(
    helpText("A brief introduction to my coding projects."),
    selectInput(
      "section",
      label = "Choose a Section to View!",
      choices = c("Coding Projects"),
      selected = "Coding Projects"
    ),
    tags$a("Built with Shiny", href = "https://shiny.posit.co/")
  ),
  # Main panel
  card(uiOutput("main_content"))
)

# making server ------------------------------------------------------------
server <- function(input, output, session) {
  
  # making pages/tabs ----------------------------------------------
  output$main_content <- renderUI({
    switch(input$section,
           
           # Coding Projects Section -------------------------------
           "Coding Projects" = {
             card(
               card_header("Coding Projects"),
               p("Here are some of my coding projects showcasing various technologies and implementations."),
               fluidRow(
                 column(4, 
                        card(
                          card_header("Portfolio Website"),
                          p("An interactive portfolio built with RStudio and Shiny."),
                          img(src = "images/portfolio_screenshot.png", height = "200px")
                        )
                 ),
                 column(4, 
                        card(
                          card_header("Animal Crossing Dashboard"),
                          p("A data dashboard visualizing Animal Crossing data using RStudio."),
                          img(src = "images/animal_crossing_dashboard.png", height = "200px")
                        )
                 ),
                 column(4, 
                        card(
                          card_header("Data Science Project"),
                          p("A machine learning project to predict trends using a custom dataset."),
                          img(src = "images/data_science_project.png", height = "200px")
                        )
                 )
               ),
               br(),
               actionButton("back_to_projects", "← Back to Projects", class = "btn btn-outline-secondary")
             )
           }
    )
  })
}

shinyApp(ui, server)

