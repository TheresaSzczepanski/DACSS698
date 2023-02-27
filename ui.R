##UI for Dashboard
library(shinydashboard)


ui <- dashboardPage(
  skin = "blue",
  title = "Student Data Dashboard",
  dashboardHeader( 
    title = "StudentDataDashboard"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Widgets", tabName = "widgets", icon = icon("th"))
    )
    ),
  ##Body content
  dashboardBody(# Boxes need to be put in a row (or column)
    tabItems(
      #First tab content
      tabItem(tabName = "dashboard",
        fluidRow(
          box(plotOutput("plot1", height = 250)),
          box(
            title = "Controls",
            sliderInput("slider", "Number of observations:", 1, 100, 50)
          )
        )
      ),
      
      # Second tab content
      tabItem(tabName = "widgets",
              h2("Widgets tab content")
      )
    )
  )

)
  
  




