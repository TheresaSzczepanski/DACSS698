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
               menuSubItem("G9 Physics Content", tabName = "g9PhysicsContent"),
              menuSubItem("G9 Physics Performance", tabName = "g9PhysicsPerf"),
                  
               menuSubItem("G9 Physics Analysis", tabName = "g9PhysicsAnalysis"))
    )
  ),
  ##Body content
  dashboardBody(# Boxes need to be put in a row (or column)
    tabItems(
      #First tab content
      tabItem(tabName = "home",
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
      tabItem("g9PhysicsContent",
              span(h1("What were our students asked?")), #style = "color:black")),
              HTML("<p>The 2022 Introductory Physics exam consisted of 42 questions
              (5 Constructed Response and 37 Selected Response) worth in total 60 points.
              Explore all released questions in the  
                   <a href='https://mcas.digitalitemlibrary.com/home?subject=Science&grades=Physics&view=ALL'>
                   digital item library</a>.</p>"),
              h3("Available Points by Content Category"),
              # fluidRow(
              #   box(
              #   title = "What was the content make-up of the exam?", background = "light-blue",
              #   "A box with a solid light-blue background"
              #   )
              #),
             
              fluidRow(
                # A static valueBox
                  #valueBox( scales::percent(22/42), "Motions, Forces, \n and Interactions", icon = icon("rocket"), color = "blue"),
                
                 valueBox(SG9_MF_PTS[1,2], "Motions, Forces, and Interactions", icon = icon("rocket"), color = "blue"),
                 valueBox( SG9_EN_PTS[1,2],"Energy",icon = icon("atom"), color = "blue"),
                  valueBox(SG9_WA_PTS[1,2], "Waves", icon = icon("wave-square"), color = "blue")
                
              
                ),
              
              
              h3("Available Points by Practice Category"),
              HTML("<p>Explore all released questions by   
                   <a href='https://mcas.digitalitemlibrary.com/home?subject=Science&grades=Physics&view=PracticeCategory'>
                   science practice category</a>. \n Note that there are 5 unreleased
                   items which do not have a listed science practice category. </p>"),
              fluidRow(
                # A static valueBox
                
                valueBox(SG9_IQ_PTS[1,2], "Investigating and Questioning", icon = icon("question"), color = "light-blue"),
                
                valueBox(SG9_MD_PTS[1,2], "Mathematics and Data", icon = icon("calculator"), color = "light-blue"),
                
                valueBox(SG9_ERM_PTS[1,2], "Evidence, Reasoning, and Modeling", icon = icon("magnifying-glass-chart"), color = "light-blue") 
    
                
               # valueBox(4,  "no category reported ", color = "aqua")
                
              ),
              h3("Available Points by Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(SG9_SR_PTS[1,2], "Selected Response", icon=icon("square-check")),
                
                valueBox(SG9_CR_PTS[1,2], "Constructed Response",icon=icon("pencil") )
               
              )
            ),
      tabItem("g9PhysicsPerf", "Introductory Physics Performance tab content",
      fluidRow(
        # A static valueBox Extracting value from dataframe
        valueBox(SG9_item[16,6], "Expressions and Equations", 
                 icon = icon("credit-card"), color = "red")
        
        # box(width = NULL, solidHeader = TRUE,
        #     dataTableOutput("SG9Item")),
        )
      ),
      
      tabItem("g9PhysicsAnalysis", "G9 Introductory Physics Analysis Content", 
              fluidRow(
                box(plotOutput("plot2", height = 250)),
                box(
                  title = "Controls",
                  sliderInput("slider", "Number of observations:", 1, 100, 50)
                )
              ),
              fluidRow(
                # A static valueBox
                valueBox("20%", "Expressions and Equations", 
                         icon = icon("credit-card"), color = "red"),
                
                # Test Data Table output
               # box(width = NULL, solidHeader = TRUE,
                #    dataTableOutput("SG9Item")),
                
                valueBoxOutput("approvalBox")
              )
              
            )
    )
  )

)
  
  




