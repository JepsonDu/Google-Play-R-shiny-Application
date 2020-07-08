#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    
    output$displot1 <- renderTable({
        data = input$csvInput
        dataPath = data$datapath[1] # Asking for the Path; return 1 is stating .csv/ not otherwise
        if(!is.null(dataPath)){
            APP1 = read.csv(dataPath)
            APP = tbl_df(APP1)
            
            minval1 <- input$slider1[1]
            maxval1 <- input$slider1[2]
            
            APP_df<-APP %>% filter(Type == input$type)
            
            df_subset <- subset(APP_df, (Rating>=minval1) & (Rating<=maxval1) )
            show <- df_subset[,1:6]
            
            
        }else{}
        
        
    })
    

        output$displot2 <- renderPlot({
            data = input$csvInput
            dataPath = data$datapath[1] # Asking for the Path; return 1 is stating .csv/ not otherwise
            if(!is.null(dataPath)){
                APP1 = read.csv(dataPath)
                APP = tbl_df(APP1)
                
                minval1 <- input$slider1[1]
                maxval1 <- input$slider1[2]
                
                APP_df<-APP %>% filter(Type == input$type)
                
                df_subset <- subset(APP_df, (Rating>=minval1) & (Rating<=maxval1) )
                
                
              a<-  ggplot(data = df_subset,aes(x= Category)) + geom_bar() +
                    labs(x="Category", y="count", title = "#number of the APP in each category")+
                    theme(axis.text.x = element_text(angle = 90, hjust = 1))
        
                print(a)
              
        
            }else{}
        })
        
        output$displot3 <- renderPlot({
            data = input$csvInput
            dataPath = data$datapath[1] # Asking for the Path; return 1 is stating .csv/ not otherwise
            if(!is.null(dataPath)){
                APP1 = read.csv(dataPath)
                APP = tbl_df(APP1)
                
                minval1 <- input$slider1[1]
                maxval1 <- input$slider1[2]
                
                APP_df<-APP %>% filter(Type == input$type)
                
                df_subset <- subset(APP_df, (Rating>=minval1) & (Rating<=maxval1) )
                
                
               d<- ggplot(data = df_subset,aes(x= Reviews, y = Installs )) + geom_smooth(colour = "red") 
               labs(x="APP Size", y="Rating", title = "reationship between review and install")
                
             
          print(d)
               
            }else{}
            
            
        })
    })
    