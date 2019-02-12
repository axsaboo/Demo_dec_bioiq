library(shinythemes)
library(RColorBrewer)
library(scales)
library(lattice)
library(dplyr)
library(DT)
library(shinyWidgets)
library(ggplot2)



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
      
       filtered_data <- datar} else {filtered_data <- datap
         
       }
      
       return(filtered_data)
   })
  
   # output$table<-renderTable(g())
  
 output$table <- renderDataTable(subset(g(),State %in% c(input$st)),
                                 options = list(dom = 't')
 )
 
 output$graph <- renderPlot({
   ggplot(subset(g(),State %in% c(input$st)), aes(Q, Sum, group = 4)) +
     geom_point() +
     geom_line(size = 1.5,color = "#ddb397") +
     # geom_area(fill = 'cyan') +
     labs(x = "2017 Quarters", y = input$pp, 
          title = paste0("Total Quartely ", input$pp))  +
     theme(text = element_text(family = NULL, color = "#6aa7ec")
           ,panel.background = element_rect(fill = '#e1f1f2')
           ,panel.grid.minor = element_line(color = '#6aa7ec')
           ,panel.grid.major = element_line(color = '#6aa7ec')
           ,plot.title = element_text(hjust = .5, size = 18)
           ,axis.title = element_text(size = 18, color = '#6aa7ec')
           ,axis.title.y = element_text(vjust = 1.5, angle = 90)
           ,axis.title.x = element_text(hjust = .5)
     )
  
 })
  
}