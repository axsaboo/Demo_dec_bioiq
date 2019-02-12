library(shiny)
library(ggplot2)

datap <- ammp
datar <- ammr

# Define UI for app that draws a histogram ----
ui <- fluidPage(
 
  tags$head(
    # Include our custom CSS
    includeCSS("styles.css"),
    includeScript("gomap.js")
  ),
  # App title ----
  titlePanel("Hello Health Plan Managers"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Slider for the number of bins ----
      selectInput(inputId = "st",
                  label = "Select a State:",
                  choices = list("AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", 
                                 "GA", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", 
                                 "MD", "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE", 
                                 "NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "RI", 
                                 "SC", "SD", "TN", "TX", "UT", "VA", "VT", "WA", "WI", "WV",
                                 "WY")),
      selectInput(inputId = "pp",
                  label = "Select a State:",
                  choices = list("Prescription","Reimbersument")),
      
      actionButton("go", "Submit")
      ),
    
    # Main panel for displaying outputs ----
   mainPanel(
      
      # Output: Histogram ----
      textOutput("result"),
      
      textOutput("pp"),
      hr(),
      dataTableOutput("table"),
      
      plotOutput("graph")
      
    )
  )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
    
    output$result <- renderText({
      paste("You chose", input$st)
    
  })
    
    output$pp <- renderText({
      paste("You chose", input$pp)
      
    })
    g <- eventReactive(input$go, {
      
      if (input$pp == "Reimbersument") {
        
        filtered_data <- datar
        
        if (input$pp == "Prescription") filtered_data <- datap
        
        
        return(filtered_data)
        
      }
    })
    
    output$table <- renderDataTable(subset(g(),State %in% c(input$st)),
    options = list(dom = 't')
          )
      
    output$graph <- renderPlot({
      ggplot(subset(g(),State %in% c(input$st)), aes(Q, Presc, group = 4)) +
        geom_point() +
        geom_line() +
       # geom_area(fill = 'cyan') +
        labs(x = "2017 Quarter", y = input$pp, 
             title = paste0("Total Quartely", input@pp))  +
        theme(text = element_text(family = NULL, color = "#444444")
              ,panel.background = element_rect(fill = '#444B5A')
              ,panel.grid.minor = element_line(color = '#4d5566')
              ,panel.grid.major = element_line(color = '#586174')
              ,plot.title = element_text(size = 28)
              ,axis.title = element_text(size = 18, color = '#555555')
              ,axis.title.y = element_text(vjust = 1, angle = 0)
              ,axis.title.x = element_text(hjust = 0)
        )
      
    })
      
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)