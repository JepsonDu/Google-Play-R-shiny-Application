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
    titlePanel("Google Store App"),
    
    # Sidebar STARTS with a inputted file and a slider for active and retire BBall Players
    sidebarLayout(
        sidebarPanel(
            fileInput("csvInput", label = "Choose your file",
                      accept = c("text/csv",
                                 "text/comma-separated-values", 
                                 "text/plain",
                                 ".csv")),
           
            selectInput("type", label = "Free or Paid", 
                        choices = c("Free", "Paid") , selected =1),
           
             sliderInput("slider1", label = h3("The APP's rate"), 
                        min = 0, 
                        max = 5, 
                        value = c(0, 5))
            
        ),
        #Side bar code ENDS HERE
        
        # Show a plot of the generated distribution
        mainPanel(
            
            tabsetPanel(type = "tabs",
                        tabPanel("Overview of data", tableOutput("displot1")),
                        tabPanel("number of the APP in each category", plotOutput("displot2")),
                        tabPanel("reationship between size and rate", plotOutput("displot3"))
           
        )
    )
)))
