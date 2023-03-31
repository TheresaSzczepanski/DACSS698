##UI for Dashboard
library(shinydashboard)


ui <- dashboardPage(
  skin = "blue",
  title = "Student Data Dashboard",
  dashboardHeader( 
  title = span(img(src="rtcps_seal_blue.png", width = 50, align = "left"), 
               "Rising Tide MCAS Curriculum Data Dashboard"),
               titleWidth = 650),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("home")),
      menuItem("Science", tabName = "science", icon = icon("microscope"),
               menuSubItem("Introductory Physics", tabName = "introPhysics"),
              menuSubItem("G9 Physics Performance", tabName = "physicsPerf"),
                  
               menuSubItem("Grade 6", tabName = "grade6"))
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
      tabItem(tabName = "science",
              h2("Introductory Physics tab content"),
              
      ),
      #Physics Content
      tabItem("introPhysics",
              span(h1("What were our students asked?", style = "color:navy")),
              h3("Content Reporting Category"),
              # fluidRow(
              #   box(
              #   title = "What was the content make-up of the exam?", background = "light-blue",
              #   "A box with a solid light-blue background"
              #   )
              #),
             
              fluidRow(
                # A static valueBox
                  valueBox( scales::percent(22/42), "Motions, Forces, \n and Interactions", icon = icon("rocket"), color = "blue"),
                  valueBox( 10 * 2,"Energy",icon = icon("atom"), color = "blue"),
                  valueBox(10 * 2, "Waves", icon = icon("wave-square"), color = "blue")
                
              
                ),
              
              
              h3("Science Practice Category", color = "navy"),
              fluidRow(
                # A static valueBox
                
                valueBox(1, "Investigating \n Questioning", icon = icon("question"), color = "light-blue"),
                
                valueBox(19, "Mathematics and \n Data", icon = icon("calculator"), color = "light-blue"),
                
                valueBox(17, "Evidence, Reasoning \n and Modeling", icon = icon("magnifying-glass-chart"), color = "light-blue") 
    
                
                #valueBox(4, "No Practice Reported", color = "aqua")
                
              ),
              h3("Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(37, "Selected Response", icon=icon("square-check")),
                
                valueBox(5, "Constructed Response",icon=icon("pencil") )
               
              )
            ),
      tabItem("physicsPerf", "Introductory Physics Performance tab content"),
      
      tabItem("grade6", "grade 6 tab content", 
              fluidRow(
                box(plotOutput("plot2", height = 250)),
                box(
                  title = "Controls",
                  sliderInput("slider", "Number of observations:", 1, 100, 50)
                )
              ),
              fluidRow(
                # A static valueBox
                valueBox(10 * 2, "Expressions and Equations", icon = icon("credit-card"), color = "red"),
                
                # Dynamic valueBoxes as Sample Code
                valueBoxOutput("progressBox"),
                
                valueBoxOutput("approvalBox")
              )
              
            )
    )
  )

)
  
  




