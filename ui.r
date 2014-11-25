library(shiny)
library(ggplot2)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
  # Application title
  headerPanel("2014-2015 NBA Statistics Generator"),

  sidebarPanel(
    textInput("player", "Player Name", "LeBron James"),
	helpText("Note: All stats related to players will be displayed in the 'Player Offensive Stats' or 'Player Defensive Stats' tab"),
	
    selectInput("var",
        label = "Please Choose Team Stats to Display",
        choices = list("ATL","CLE", "LAL","ORL"),
            selected = "CLE"),
	helpText("Note: All stats related to teams will be displayed in the 'Team Stats' or 'Team Stats Graph' tab"),

    submitButton("Update View")
  ),

  
  
  mainPanel(
  h3("Main Panel Text"),
  tabsetPanel(
    tabPanel("Instructions",p("This application is designed to find statistics of current NBA players"),
    p("Statistic can be queryed in the following ways: Individual Player Offensive Stats,Individual Player Defensive Stats, 
    Team Stats,Player Points Per Game(Team View), League Averages"),
    p("In order to search for Individual players stats, please enter an NBA player name (i.e. Kobe Bryant, LeBron James, Chris Paul), select either the 'Player Offensive Stats' or 'Player Defensive Stats' tab and click the 'Update View' button."),
    p("In order to search for Team player stats, select a team from the dropdown and select either the 'Team Stats' or 'Team Stats Graph' tab and click the 'Update View' button."),
    p("In order to search for Summarized Statistics, click the 'League Averages' tab"),
    p("Statistics were compiled making use of the NBA's new player Tracking system. Using six cameras installed in the catwalks of every NBA arena,
    SportVU software tracks the movements of every player on the court and the basketball 25 times per second.
    More information can be found at the following link:http://stats.nba.com/tracking/#!/player/")),
    #tabPanel("Instructions",verbatimTextOutput("instructions")),
    tabPanel("Player Offensive Stats",tableOutput("offensiveview")),
	tabPanel("Player Defensive Stats",tableOutput("defensiveview")),
	tabPanel("Team Stats",verbatimTextOutput("teamstats")),
    tabPanel("Team Stats Graph",plotOutput("teamplot")),
	#tabPanel("Team Stats Heatmap",
	#tabPanel("Player",verbatimTextOutput("inputValue")),
  
    #verbatimTextOutput("summary"),
  tableOutput("view"),
  
    tabPanel("League Averages",verbatimTextOutput("summary"))
  )
)))