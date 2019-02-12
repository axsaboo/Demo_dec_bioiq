ui <- fluidPage(theme = shinytheme("cerulean"),
  
  
  
  tags$head(
    # Include our custom CSS
    includeCSS("styles.css"),
    includeScript("gomap.js")
  ),
  setBackgroundImage(src = "image/wp1848587.jpg"),
  # App title ----
  titlePanel("Hello, Health Plan Managers"),
  
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
                  label = "Select Dataset:",
                  choices = list("Prescription","Reimbersument")),
      
      actionButton("go","Submit")
    
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      textOutput("result"),
      hr(),
      textOutput("pp"),
      hr(),
      hr(),
      #hr(),
      #tableOutput("table"),
      dataTableOutput("table"),
      hr(),
      hr(),
      plotOutput("graph")
      
    )
  )
)