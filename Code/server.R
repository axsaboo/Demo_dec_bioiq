library(leaflet)
library(RColorBrewer)
library(scales)
library(lattice)
library(dplyr)
library(DT)
library(shinyWidgets)
library(shinythemes)


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
     geom_line() +
     # geom_area(fill = 'cyan') +
     labs(x = "2017 Quarter", y = input$pp, 
          title = paste0("Total Quartely ", input$pp))  +
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