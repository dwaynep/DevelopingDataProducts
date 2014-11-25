library(shiny)

nbadata <- read.csv("finaldata.csv")#load data
offensivedata <- nbadata[c(3,6,7,8,32,44,56)]
defensivedata <- nbadata[c(3,6,7,25,26)]
team <- nbadata[c(3,6,7,8,32,44,56)]
grap <- nbadata[c(3,6,44)]




# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
			output$inputValue <- renderPrint({input$player})
			output$offensiveview <- renderTable({offensivedata[offensivedata$PLAYER==input$player,]})
			output$defensiveview <- renderTable({defensivedata[defensivedata$PLAYER==input$player,]})
			output$teamstats <- renderPrint({team[team$TEAM_ABBREVIATION==input$var,]})
            output$teamplot <- renderPlot({ggplot(grap[grap$TEAM_ABBREVIATION==input$var,],aes(x=PLAYER, y=PPG))+ geom_bar(stat="identity")+ theme(axis.text.x = element_text(angle = 90, hjust = 1))})
			output$instructions <- renderPrint({"This App will calculate a number of NBA Statistics.
            
            "})
            #output$teamstats <- renderPrint({playerteam})
			#output$view <-renderTable({nbadata[nbadata$PLAYER==input$player,]})
            output$summary <- renderPrint({summary(nbadata)})
			 

			
			
})
