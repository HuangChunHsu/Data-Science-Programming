#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("PM2.5 in TW"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Month:",
                        min = 1,
                        max = 12,
                        value = 3)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        library(ggmap)
        library(mapproj)
        library(data.table)
        library(dplyr)
        library(ggplot2)
        
        key <-"AIzaSyAs0bekp6w-GMQbZUtnvCaRMPOaFYlS7R0"
        register_google(key = key)
        
        data87<-read.csv("喔氣氣氣氣氣.csv")
        data87<-data87%>%filter(data87$Month==input$bins)
        
        map <- get_map(location = 'Taiwan', zoom = 8)
        TWice <- ggmap(map) + geom_point(aes(x = data87$lon, y = data87$lat, size = data87$PM2.5), data = data87)
        TWice
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
