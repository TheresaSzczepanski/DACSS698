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
               menuSubItem("G11 Biology Content", tabName = "g11BiologyContent"),
               menuSubItem("G9 Physics Analysis", tabName = "g9PhysicsAnalysis"),
               menuSubItem("G9 Physics Content", tabName = "g9PhysicsContent"),
              menuSubItem("G9 Physics RT-State Diff", tabName = "g9PhysicsPerf"),
              menuSubItem("G9 Physics Top Performers", tabName = "g9PhysicsTop"),
              menuSubItem("G8 STE Content", tabName = "g8SteContent"),
              menuSubItem("G8 STE Performance", tabName = "g8StePerf"),
              menuSubItem("G5 STE Content", tabName = "g5SteContent"),
              menuSubItem("G5 STE Perfromance", tabName = "g5StePerf")
              
              ),
      menuItem("Mathematics", tabName = "math", icon = icon("infinity"),
               menuSubItem("G10 Math Content", tabName = "g10MathContent"),
               menuSubItem("G10 Math Performance", tabName = "g10MathPerf"),
               menuSubItem("G8 Math Content", tabName = "g8MathContent"),
               menuSubItem("G8 Math Performance", tabName = "g8MathPerf"),
               
               menuSubItem("G7 Math Content", tabName = "g7MathContent"),
               menuSubItem("G7 Math Performance", tabName = "g7MathPerf"),
               menuSubItem("G6 Math Content", tabName = "g6MathContent"),
               menuSubItem("G6 Math Performance", tabName = "g6MathPerf"),
               menuSubItem("G5 Math Content", tabName = "g5MathContent"),
               menuSubItem("G5 Math Performance", tabName = "g5MathPerf")
              ),
      menuItem("ELA", tabName = "ela", icon = icon("book-bookmark"),
               menuSubItem("G10 ELA Writing Analysis", tabName = "g10ELAWritingAnalysis"),
               menuSubItem("G10 ELA Reading Analysis", tabName = "g10ELAReadingAnalysis"),
               menuSubItem("G10 ELA Content", tabName = "g10ELAContent"),
               menuSubItem("G10 ELA RT-State Diff", tabName = "g10ELADiff")
      )
      
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
      
      # Science tab content
      tabItem(tabName = "science",
              h2("Science Trends Overview content")
              
      ),
      #Biology Content
      tabItem("g11BiologyContent",
              span(h1("How were students assessed?")), #style = "color:black")),
              HTML("<p>The 2022 HS Biology exam consisted of 42 questions
               worth in <b> total 60 points </b>.
               Explore the released materials:
                <ul>
                <li> Complete and Score released questions in the  
              <a href='https://mcas.digitalitemlibrary.com/home?subject=Science&grades=Biology&view=ALL'>digital item library. </a> 
                </li>
                <li> Download
              <a href = 'https://www.doe.mass.edu/mcas/2022/release/hs-bio.pdf'>
                2022 released paper based items PDF </a> 
                </li>
                <li> Download 
                  <a href = 'http://mcas.pearsonsupport.com/resources/student/practice-tests-science/MCAS_2022_HS_Biology_PT_ADA.pdf'>
                  HS Biology Paper sample test </a>
                or 
                <a href = 'http://mcas.pearsonsupport.com/student/practice-tests-science/'>
                complete Computer Based tests online </a> and grade with the
                scoring key/rubrics </a>
                </li>
                <li>Review student
              <a href = 'https://www.doe.mass.edu/mcas/student/2022/hs/biology.html'>
                released Constructed Response </a> and Scoring Guidelines
              </li>
                
                </ul>
                </p>"),
              h3("Available Points by Content Category"),
              
              
              fluidRow(
                # A static valueBox
                #valueBox( scales::percent(22/42), "Motions, Forces, \n and Interactions", icon = icon("rocket"), color = "blue"),
                
                valueBox(SG11_EC_PTS[1,2], HTML("<p> Ecology </p>"), icon = icon("leaf"), color = "blue"),
                valueBox( SG11_EV_PTS[1,2],"Evolution",icon = icon("dna"), color = "blue")
              ),
              
              fluidRow(
                valueBox(SG11_HE_PTS[1,2], "Hereditary", icon = icon("people-group"), color = "blue"),
                valueBox(SG11_MO_PTS[1,2], HTML("<p> Molecules to <br> Organisms </p>"), icon = icon("bacteria"), color = "blue")
                
              ),
              
              
              h3("Available Points by Practice Category"),
              HTML("<p>Explore all released questions by   
                   <a href='https://mcas.digitalitemlibrary.com/home?subject=Science&grades=Biology&view=PracticeCategory'>
                   science practice category</a>. \n Note that there are 10
                   items which do not have a listed science practice category. </p>"),
              fluidRow(
                # A static valueBox
                valueBox(SG11_ERM_PTS[1,2], HTML("<p> Evidence, Reasoning, <br> and Modeling</p>"), icon = icon("magnifying-glass-chart"), color = "light-blue"), 
                valueBox(SG11_MD_PTS[1,2], HTML("<p> Mathematics <br> and Data</p>"), icon = icon("calculator"), color = "light-blue"),
                valueBox(SG11_IQ_PTS[1,2], HTML("<p> Investigating <br> and Questioning</p>"), icon = icon("question"), color = "light-blue")
                
                # valueBox(4,  "no category reported ", color = "aqua")
                
              ),
              h3("Available Points by Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(SG11_SR_PTS[1,2], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),
                
                valueBox(SG11_CR_PTS[1,2], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )
                
              )
      ),
      #Physics Content
      tabItem("g9PhysicsContent",
              span(h1("How were students assessed?")), #style = "color:black")),
              HTML("<p>The 2022 Introductory Physics exam consisted of 42 questions
               worth in <b> total 60 points </b>. Students used this <a href = 'https://www.doe.mass.edu/mcas/tdd/phys_formula.pdf'>
                reference sheet </a>. 
                Students were assessed on the
                <a href = 'https://www.doe.mass.edu/stem/ste/hs-intro-phys.pdf'>
                <b> content and skills </b> from the STE curriculum framework.
                </a>
                </p>"),
              h3("Available Points by Content Category"),
              
             HTML("<p>Complete and Score released questions in the  
              <a href='https://mcas.digitalitemlibrary.com/home?subject=Science&grades=Physics&view=ALL'>digital item library. </a> 
                Download the <a href = 'https://www.doe.mass.edu/mcas/2022/release/hs-physics.pdf'>
                2022 released paper based items </a>, complete a 
              <a href = 'http://mcas.pearsonsupport.com/resources/student/practice-tests-science/MCAS_2022_HS_Introductory%20Physics_PT_ADA.pdf'>
                paper practice test </a>, or complete a
              <a href = 'http://mcas.pearsonsupport.com/student/practice-tests-science/'>
                computer based practice test </a>
                </p>"),
             
              fluidRow(
                # A static valueBox
                  #valueBox( scales::percent(22/42), "Motions, Forces, \n and Interactions", icon = icon("rocket"), color = "blue"),
                
                 valueBox(SG9_MF_PTS[1,2], HTML("<p> Motions, Forces, <br> and Interactions </p>"), icon = icon("rocket"), color = "blue"),
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
                valueBox(SG9_MD_PTS[1,2], HTML("<p> Mathematics <br> and Data</p>"), icon = icon("calculator"), color = "light-blue"),
                valueBox(SG9_ERM_PTS[1,2], HTML("<p> Evidence, Reasoning, <br> and Modeling</p>"), icon = icon("magnifying-glass-chart"), color = "light-blue"), 
                valueBox(SG9_IQ_PTS[1,2], HTML("<p> Investigating <br> and Questioning</p>"), icon = icon("question"), color = "light-blue")
                
                
                
    
                
               # valueBox(4,  "no category reported ", color = "aqua")
                
              ),
              h3("Available Points by Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(SG9_SR_PTS[1,2], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),
                
                valueBox(SG9_CR_PTS[1,2], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") ),
                
                box( width = 4, solidHeader = FALSE,
                     HTML("<p> 
                             Student
                              <a href = 'https://www.doe.mass.edu/mcas/student/2022/hs/physics.html'>
                              released Constructed Response </a> and Scoring Guidelines
                              
                            </p>"))
               
              )
            ),
      #G9 Physics Performance
      tabItem("g9PhysicsPerf", 
              
              span(h1("How do our students compare to their peers in the state?")), #style = "color:black")),
              
              h3("RT-State Diff by: Content Category"),
              
              
              fluidRow(
                # A static valueBox
                #valueBox( scales::percent(22/42), "Motions, Forces, \n and Interactions", icon = icon("rocket"), color = "blue"),
                
                valueBox(paste(SG9_MF_Diff[1,6], "%"), HTML("<p> Motions, Forces, <br> and Interactions </p>"), icon = icon("rocket"), color = "blue"),
                valueBox( paste(SG9_EN_Diff[1,6], "%"),"Energy",icon = icon("atom"), color = "blue"),
                valueBox(paste(SG9_WA_Diff[1,6], "%"), "Waves", icon = icon("wave-square"), color = "blue")
                
                
              ),
              
              
              h3("RT-State Diff by: Practice Category"),
              HTML("<p>Explore all released questions by   
                   <a href='https://mcas.digitalitemlibrary.com/home?subject=Science&grades=Physics&view=PracticeCategory'>
                   science practice category</a>. \n Note that there are 5 unreleased
                   items which do not have a listed science practice category. </p>"),
              fluidRow(
                # A static valueBox
                
                valueBox(paste(SG9_MD_Diff[1,6],  "%"), HTML("<p> Mathematics <br> and Data</p>"), icon = icon("calculator"), color = "light-blue"),
                valueBox(paste(SG9_ERM_Diff[1,6],  "%"), HTML("<p> Evidence, Reasoning, <br> and Modeling</p>"), icon = icon("magnifying-glass-chart"), color = "light-blue"),
                valueBox(paste(SG9_IQ_Diff[1,6],  "%"), HTML("<p> Investigating <br> and Questioning</p>"), icon = icon("question"), color = "light-blue")
                
                 
                 ),
              
              h3("RT-State Diff by: Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(SG9_SR_Diff[1,6], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),
                
                valueBox(SG9_CR_Diff[1,6], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )
                
              )
      ),
      
      
     #G9 Physics Analysis
     
     tabItem("g9PhysicsAnalysis", 
             
             span(h1("How do we improve?")), #style = "color:black")),
             span(h2("Mathematics and Data")),
             HTML("<p> Mathematics and Data accounts for 48% of available points 
                  on the MCAS and <b> 55% of points lost by Rising Tide </b> students. </p>"),
             #h3("% of Points Lost by Practice Category"),
             
             fluidRow(
               box(
                 status = "primary", solidHeader = TRUE,
                 collapsible = TRUE, width = 500,
                 plotOutput("SG9Top_Loss_Bar")
               )
               
             
               
             ),
            
             #fluidRow(
              # dataTableOutput("SG9_TopStudent_item_perf")
              #   ),
             
            
             h3("Top-Performing Students"),
             HTML("<p> The trend is <b> more pronounced </b> in students with scores <b> greater
                  than 515 </b> </p>"),
             
            
             
             fluidRow(
               # A static valueBox
               valueBox(paste(SG9Top_MD_Loss[1,5], "%"), HTML("<p> Mathematics <br> and Data</p>"), icon = icon("calculator"), color = "red", width = SG9practice_width),
               
               
               valueBox(paste(SG9Top_ERM_Loss[1,5], "%"), HTML("<p> Evidence, Reasoning, <br> and Modeling</p>"), icon = icon("magnifying-glass-chart"), color = "light-blue", width = SG9practice_width),
               
               valueBox(paste(SG9Top_IQ_Loss[1,5], "%"), HTML("<p> Investigating <br> and Questioning</p>"), icon = icon("question"), color = "light-blue", width = SG9practice_width),
               #100-SG9Top_IQ_Loss[1,6]-SG9Top_MD_Loss[1,6]-SG9Top_ERM_Loss[1,6]
               valueBox(paste(8, "%"),  HTML("<p> unreleased or <br> no category reported </p>"), color = "light-blue", width = SG9practice_width)
               
             ),
             
             h3("All students"),
             HTML("<p> Mathematics and Data accounts for 48% of available points 
                  on the MCAS and 55% of points lost by Rising Tide students. </p>"),
             
             
             
             fluidRow(
               # A static valueBox
               valueBox(paste(SG9_MD_Loss[1,5], "%"), HTML("<p> Mathematics <br> and Data</p>"), icon = icon("calculator"), color = "red", width = SG9practice_width),
               
               
               valueBox(paste(SG9_ERM_Loss[1,5], "%"), HTML("<p> Evidence, Reasoning, <br> and Modeling</p>"), icon = icon("magnifying-glass-chart"), color = "light-blue", width = SG9practice_width),
               
               valueBox(paste(SG9_IQ_Loss[1,5], "%"), HTML("<p> Investigating <br> and Questioning</p>"), icon = icon("question"), color = "light-blue", width = SG9practice_width),
               #100-SG9Top_IQ_Loss[1,6]-SG9Top_MD_Loss[1,6]-SG9Top_ERM_Loss[1,6]
               valueBox(paste(8, "%"),  HTML("<p> unreleased or <br> no category reported </p>"), color = "light-blue", width = SG9practice_width)
               
             ),
             
             h3("Lowest Performing students"),
             HTML("<p> The lowest performing students also exhibit this trend, 
                  although it is less pronounced. </p>"),
             
             
             
             fluidRow(
               # A static valueBox
               valueBox(paste(SG9Low_MD_Loss[1,5], "%"), HTML("<p> Mathematics <br> and Data</p>"), icon = icon("calculator"), color = "red", width = SG9practice_width),
               
               
               valueBox(paste(SG9Low_ERM_Loss[1,5], "%"), HTML("<p> Evidence, Reasoning, <br> and Modeling</p>"), icon = icon("magnifying-glass-chart"), color = "light-blue", width = SG9practice_width),
               
               valueBox(paste(SG9Low_IQ_Loss[1,5], "%"), HTML("<p> Investigating <br> and Questioning</p>"), icon = icon("question"), color = "light-blue", width = SG9practice_width),
               #100-SG9Top_IQ_Loss[1,6]-SG9LowTop_MD_Loss[1,6]-SG9LowTop_ERM_Loss[1,6]
               valueBox(paste(9, "%"),  HTML("<p> unreleased or <br> no category reported </p>"), color = "light-blue", width = SG9practice_width)
               
             ),
             
            
     ),
     
     #G9 Physics Top Perf
     tabItem("g9PhysicsTop", 
             
             span(h1("How did our top performing students compare to the state?")), #style = "color:black")),
             
             h3("Content Category"),
             
             
             fluidRow(
               # A static valueBox
               #valueBox( scales::percent(22/42), "Motions, Forces, \n and Interactions", icon = icon("rocket"), color = "blue"),
               
               valueBox(SG9Top_MF_Diff[1,6], HTML("<p> Motions, Forces, <br> and Interactions </p>"), icon = icon("rocket"), color = "blue"),
               valueBox( SG9Top_EN_Diff[1,6],"Energy",icon = icon("atom"), color = "blue"),
               valueBox(SG9Top_WA_Diff[1,6], "Waves", icon = icon("wave-square"), color = "blue")
               
               
             ),
             
             
             h3("RT-State Diff by: Practice Category"),
             HTML("<p>Explore all released questions by   
                   <a href='https://mcas.digitalitemlibrary.com/home?subject=Science&grades=Physics&view=PracticeCategory'>
                   science practice category</a>. \n Note that there are 5 unreleased
                   items which do not have a listed science practice category. </p>"),
             fluidRow(
               # A static valueBox
               
               valueBox(SG9Top_IQ_Diff[1,6], HTML("<p> Investigating <br> and Questioning</p>"), icon = icon("question"), color = "light-blue"),
               
               valueBox(SG9Top_MD_Diff[1,6], HTML("<p> Mathematics <br> and Data</p>"), icon = icon("calculator"), color = "light-blue"),
               
               valueBox(SG9Top_ERM_Diff[1,6], HTML("<p> Evidence, Reasoning, <br> and Modeling</p>"), icon = icon("magnifying-glass-chart"), color = "light-blue") 
               
               
               # valueBox(4,  "no category reported ", color = "aqua")
               
             ),
             h3("RT-State Diff by: Question Type"),
             fluidRow(
               # A static valueBox
               valueBox(SG9Top_SR_Diff[1,6], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),
               
               valueBox(SG9Top_CR_Diff[1,6], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )
               
             )
     ),
      #G8 Sci Content
      
      tabItem("g8SteContent",
              span(h1("How were students assessed?")), #style = "color:black")),
              HTML("<p>The 2022 G8 STE exam consisted of 41 questions worth in <b>total 54 points </b>.
               Explore the released materials:
                <ul>
                <li> Complete and Score released questions in the  
              <a href='https://mcas.digitalitemlibrary.com/home?subject=Science&grades=Grade%208&view=ALL'>digital item library. </a> 
                </li>
                <li> Download
                     <a href = 'https://www.doe.mass.edu/mcas/2022/release/gr8-ste.pdf'>
                        2022 released paper based items PDF </a> 
                </li>
                <li> Download
              <a href = 'http://mcas.pearsonsupport.com/resources/student/practice-tests-science/MCAS_2022_Gr8_SCI_PT_ADA.pdf'>
                Sample Paper Based Test PDF </a>or complete the 
                <a href = 'http://mcas.pearsonsupport.com/student/practice-tests-science/'> computer based practice test</a> with the
                scoring key/rubric
                </li>
                <li>Student
              <a href = 'https://www.doe.mass.edu/mcas/student/2022/grade8/ste.html'>
                Constructed Response </a> and Scoring Guidelines
              </li>
          
            </ul>
                </p>"),
              h3("Available Points by Content Category"),
             
              
              fluidRow(
                valueBox(SG8_ES_PTS[1,2], HTML("<p> Earth & <br> Space Science</p>"), icon = icon("earth"), color = "blue"),
                valueBox( SG8_LS_PTS[1,2],"Life Science",icon = icon("dna"), color = "blue")
              ),
              
              fluidRow(
                valueBox(SG8_PS_PTS[1,2], "Physical Science", icon = icon("atom"), color = "blue"),
                valueBox(SG8_TE_PTS[1,2], HTML("<p> Technology & <br> Engineering</p>"), icon = icon("bridge"), color = "blue")
              ),
              
              
              h3("Available Points by Practice Category"),
              HTML("<p>Explore all released questions by   
                   <a href='https://mcas.digitalitemlibrary.com/home?subject=Science&grades=Grade%208&view=PracticeCategory'>
                   science practice category</a>. \n Note that there are 15 released items and 26 unreleased
                   items which do not have a listed science practice category. </p>"),
              fluidRow(
                # A static valueBox
                valueBox(SG8_ERM_PTS[1,2], HTML("<p> Evidence, Reasoning, <br> and Modeling</p>"), icon = icon("magnifying-glass-chart"), color = "light-blue"), 
                valueBox(SG8_MD_PTS[1,2], HTML("<p> Mathematics <br> and Data</p>"), icon = icon("calculator"), color = "light-blue"),
                valueBox(SG8_IQ_PTS[1,2], HTML("<p> Investigating <br> and Questioning</p>"), icon = icon("question"), color = "light-blue")
                # valueBox(4,  "no category reported ", color = "aqua")
                
              ),
              
              
              h3("Available Points by Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(SG8_SR_PTS[1,2], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),
                
                valueBox(SG8_CR_PTS[1,2], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )
                
              )
      ),
      
      #G8 STE Performance
      
      tabItem("g8StePerf",
              span(h1("How do our students compare to their peers in the state?")), #style = "color:black")),
              h3("RT-State Diff by: Content Category"),
              
              
              fluidRow(
                valueBox(SG8_ES_Diff[1,6], HTML("<p> Earth & <br> Space Science</p>"), icon = icon("earth"), color = "blue"),
                valueBox( SG8_LS_Diff[1,6],"Life Science",icon = icon("dna"), color = "blue")
              ),
              
              fluidRow(
                valueBox(SG8_PS_Diff[1,6], "Physical Science", icon = icon("atom"), color = "blue"),
                valueBox(SG8_TE_Diff[1,6], HTML("<p> Technology & <br> Engineering</p>"), icon = icon("bridge"), color = "blue")
              ),
              
              
              h3("RT-State Diff by: Practice Category"),
              HTML("<p>Explore all released questions by   
                   <a href='https://mcas.digitalitemlibrary.com/home?subject=Science&grades=Grade%208&view=PracticeCategory'>
                   science practice category</a>. \n Note that there are 15 released items and 26 unreleased
                   items which do not have a listed science practice category. </p>"),
              fluidRow(
                # A static valueBox
                
                
                valueBox(SG8_ERM_Diff[1,6], HTML("<p> Evidence, Reasoning, <br> and Modeling</p>"), icon = icon("magnifying-glass-chart"), color = "light-blue"),
                valueBox(SG8_MD_Diff[1,6], HTML("<p> Mathematics <br> and Data</p>"), icon = icon("calculator"), color = "light-blue"),
                valueBox(SG8_IQ_Diff[1,6], HTML("<p> Investigating <br> and Questioning</p>"), icon = icon("question"), color = "light-blue") 
                 
                
                
                # valueBox(4,  "no category reported ", color = "aqua")
                
              ),
              
              
              h3("RT-State Diff by: Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(SG8_SR_Diff[1,6], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),
                
                valueBox(SG8_CR_Diff[1,6], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )
                
              )
      ),
      
      #G5 Sci Content
      tabItem("g5SteContent",
              span(h1("How were students assessed?")), #style = "color:black")),
              HTML("<p>The 2022 G5 STE exam consisted of 41 questions worth in <b>total 54 points </b>.
              
              Explore the released materials:
                <ul>
                <li> Complete and Score 2022 digital released questions in the  
              <a href='https://mcas.digitalitemlibrary.com/home?subject=Science&grades=Grade%205&view=ALL'>digital item library. </a> 
                </li>
                <li> Download the
                  <a href = 'https://www.doe.mass.edu/mcas/2022/release/gr5-ste.pdf'> 2022 paper based released questions </a>
                <li> Download
              <a href = 'http://mcas.pearsonsupport.com/resources/student/practice-tests-science/MCAS_2023_Gr5_SCI_PT_ADA.pdf'>
                Sample Paper Based Test PDF </a> or complete the 
                <a href = 'http://mcas.pearsonsupport.com/student/practice-tests-science/' computer based practice test</a> with the
                scoring key/rubric 
                </li>
                <li>Student
              <a href = 'https://www.doe.mass.edu/mcas/student/2022/grade5/ste.html'>
                Released Constructed Response </a> and Scoring Guidelines
              </li>
              
                </ul>
                </p>"),
              
              h3("Available Points by Content Category"),
              
              
              fluidRow(
                valueBox(SG5_ES_PTS[1,2], HTML("<p> Earth & <br> Space Science</p>"), icon = icon("earth"), color = "blue"),
                valueBox( SG5_LS_PTS[1,2],"Life Science",icon = icon("dna"), color = "blue")
              ),
              
              fluidRow(
                valueBox(SG5_PS_PTS[1,2], "Physical Science", icon = icon("atom"), color = "blue"),
                valueBox(SG5_TE_PTS[1,2], HTML("<p> Technology & <br> Engineering</p>"), icon = icon("bridge"), color = "blue")
              ),
              
              
              h3("Available Points by Practice Category"),
              HTML("<p>Explore all released questions by   
                   <a https://mcas.digitalitemlibrary.com/home?subject=Science&grades=Grade%205&view=PracticeCategory'>
                   science practice category</a>. \n Note that there are 17 released items and 24 unreleased
                   items which do not have a listed science practice category. </p>"),
              fluidRow(
                # A static valueBox
                valueBox(SG5_ERM_PTS[1,2], HTML("<p> Evidence, Reasoning, <br> and Modeling</p>"), icon = icon("magnifying-glass-chart"), color = "light-blue"), 
                valueBox(SG5_MD_PTS[1,2], HTML("<p> Mathematics <br> and Data</p>"), icon = icon("calculator"), color = "light-blue"),
                valueBox(SG5_IQ_PTS[1,2], HTML("<p> Investigating <br> and Questioning</p>"), icon = icon("question"), color = "light-blue")
                # valueBox(4,  "no category reported ", color = "aqua")
                
              ),
              h3("Available Points by Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(SG5_SR_PTS[1,2], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),
                
                valueBox(SG5_CR_PTS[1,2], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )
                
              )
      ),
      
      #G5 STE Student Performance
      
      tabItem("g5StePerf",
              span(h1("How do our students compare to their peers in the state?")), #style = "color:black")),
              h3("RT-State Diff by: Content Category"),
              
              
              fluidRow(
                valueBox(SG5_ES_Diff[1,6], HTML("<p> Earth & <br> Space Science</p>"), icon = icon("earth"), color = "blue"),
                valueBox( SG5_LS_Diff[1,6],"Life Science",icon = icon("dna"), color = "blue")
              ),
              
              fluidRow(
                valueBox(SG5_PS_Diff[1,6], "Physical Science", icon = icon("atom"), color = "blue"),
                valueBox(SG5_TE_Diff[1,6], HTML("<p> Technology & <br> Engineering</p>"), icon = icon("bridge"), color = "blue")
              ),
              
              
              h3("RT-State Diff by: Practice Category"),
              HTML("<p>Explore all released questions by   
                   <a href='https://mcas.digitalitemlibrary.com/home?subject=Science&grades=Grade%208&view=PracticeCategory'>
                   science practice category</a>. \n Note that there are 15 released items and 26 unreleased
                   items which do not have a listed science practice category. </p>"),
              fluidRow(
                # A static valueBox
                valueBox(SG5_ERM_Diff[1,6], HTML("<p> Evidence, Reasoning, <br> and Modeling</p>"), icon = icon("magnifying-glass-chart"), color = "light-blue"),
                valueBox(SG5_MD_Diff[1,6], HTML("<p> Mathematics <br> and Data</p>"), icon = icon("calculator"), color = "light-blue"),
                valueBox(SG5_IQ_Diff[1,6], HTML("<p> Investigating <br> and Questioning</p>"), icon = icon("question"), color = "light-blue")
                
                # valueBox(4,  "no category reported ", color = "aqua")
                
              ),
              
              
              h3("RT-State Diff by: Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(SG5_SR_Diff[1,6], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),
                
                valueBox(SG5_CR_Diff[1,6], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )
                
              )
      ),
      
      # Math tab content
      tabItem(tabName = "math",
              h2("Math Trends Overview content")
      
      ),
      # G10 Math Content
      tabItem("g10MathContent",
              span(h1("How were students assessed?")), #style = "color:black")),
              HTML("<p>The 2022 G10 Math exam consisted of 42 questions worth in <b>total 60 points </b>.
              Explore the released materials:
                      <ul>
                         <li> Complete and Score released questions in the  
                             <a href='https://mcas.digitalitemlibrary.com/home?subject=Math&grades=Grade%210&view=ALL'>digital item library. </a> 
                         </li>
                        <li> Download
                            <a href = 'https://www.doe.mass.edu/mcas/2022/release/gr10-math.pdf'>
                         2022 released items PDF </a> 
                        </li>
                        <li>Student
                            <a href = 'https://www.doe.mass.edu/mcas/student/2022/grade10/math.html'>
                           Constructed Response </a> and Scoring Guidelines
                        </li>
                        <li><a href = 'https://www.doe.mass.edu/mcas/tdd/resources/2019-g10-math-refsheet-cbt.pdf'>
                              Reference Sheet </a>
                        </li>
                    </ul>
                  </p>"),
              h3("Available Points by Content Category"),
              
              
              fluidRow(
                valueBox(MG10_AF_PTS[1,2], HTML("<p> Algebra and <br> Functions </p>"), icon = icon("square-root-variable"), color = "blue"),
                valueBox( MG10_GE_PTS[1,2],"Geometry",icon = icon("shapes"), color = "blue")
              ),
              
              fluidRow(
                valueBox(MG10_NQ_PTS[1,2], HTML(" <p> Numbers and <br> Quantity </p>"), icon = icon("plus-minus"), color = "blue"),
                valueBox(MG10_SP_PTS[1,2], HTML("<p> Statistics and <br> Probability </p>"), icon = icon("chart-line"), color = "blue")
              ),
              
              h3("Available Points by Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(MG10_SR_PTS[1,2], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),
                
                valueBox(MG10_SA_PTS[1,2], "Short Answer", icon=icon("pen-to-square")),
                
                valueBox(MG10_CR_PTS[1,2], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )
                
              )
      ),
      
      #G10 Math Perf
      
      tabItem("g10MathPerf",
              span(h1("How do our students compare to their peers in the state?")), #style = "color:black")),
              
              h3("RT-State Diff by: Content Category"),
              
              
              fluidRow(
                valueBox(MG10_AF_Diff[1,6], HTML("<p> Algebra and <br> Functions </p>"), icon = icon("square-root-variable"), color = "blue"),
                valueBox( MG10_GE_Diff[1,6],"Geometry",icon = icon("shapes"), color = "blue")
              ),
              
              fluidRow(
                valueBox(MG10_NQ_Diff[1,6], HTML(" <p> Numbers and <br> Quantity </p>"), icon = icon("plus-minus"), color = "blue"),
                valueBox(MG10_SP_Diff[1,6], HTML("<p> Statistics and <br> Probability </p>"), icon = icon("chart-line"), color = "blue")
              ),
              
              h3("RT-State Diff by: Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(MG10_SR_Diff[1,6], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),
                
                valueBox(MG10_SA_Diff[1,6], "Short Answer", icon=icon("pen-to-square")),
                
                valueBox(MG10_CR_Diff[1,6], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )
                
              )
      ),
      
      #G8 Math
      
      tabItem("g8MathContent",
              span(h1("How were students assessed?")), #style = "color:black")),
              HTML("<p>The 2022 G8 Math exam consisted of 40 questions worth 
                      in <b>total 54 points </b>. Explore the released materials:
                      <ul>
                         <li> Complete and Score released questions in the  
                             <a href='https://mcas.digitalitemlibrary.com/home?subject=Math&grades=Grade%208&view=ALL'>digital item library. </a> 
                         </li>
                        <li> Download
                            <a href = 'https://www.doe.mass.edu/mcas/2022/release/gr8-math.pdf'>
                         2022 released items PDF </a> 
                        </li>
                        <li>Student
                            <a href = 'https://www.doe.mass.edu/mcas/student/2022/grade8/math.html'>
                           Constructed Response </a> and Scoring Guidelines
                        </li>
                        <li><a href = 'https://www.doe.mass.edu/mcas/tdd/resources/2019-g8-math-refsheet.pdf'>
                              Reference Sheet </a>
                        </li>
                    </ul>
                  </p>"),
              
              h3("Available Points by Content Category"),
              
              
              fluidRow(
                valueBox(MG8_FN_PTS[1,2], "Functions", icon = icon("square-root-variable"), color = "blue"),
                valueBox( MG8_GE_PTS[1,2],"Geometry",icon = icon("shapes"), color = "blue")
                
              ),
              
              fluidRow(
                
                valueBox(MG8_NSEE_PTS[1,2], HTML("<p> Number System: <br> Expressions <br> and Equations </p>"), icon = icon("equals"), color = "blue"),
                valueBox(MG8_SP_PTS[1,2], HTML("<p> Statistics and <br> Probability </p>"), icon = icon("chart-line"), color = "blue")
              ),
              
              h3("Available Points by Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(MG8_SR_PTS[1,2], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),
                
                valueBox(MG8_SA_PTS[1,2], "Short Answer", icon=icon("pen-to-square")),
                
                valueBox(MG8_CR_PTS[1,2], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )
                
              )
      ),
      #G8 Math Perf:
      
      tabItem("g8MathPerf",
              span(h1("How do our students compare to their peers in the state?")), #style = "color:black")),
              
              h3("RT-State Diff by: Content Category"),
              
              
              fluidRow(
                valueBox(MG8_FN_Diff[1,6], "Functions", icon = icon("square-root-variable"), color = "blue"),
                valueBox( MG8_GE_Diff[1,6],"Geometry",icon = icon("shapes"), color = "blue")
                
              ),
              
              fluidRow(
                
                valueBox(MG8_NSEE_Diff[1,6], HTML("<p> Number System: <br> Expressions <br> and Equations </p>"), icon = icon("equals"), color = "blue"),
                valueBox(MG8_SP_Diff[1,6], HTML("<p> Statistics and <br> Probability </p>"), icon = icon("chart-line"), color = "blue")
              ),
              
              h3("RT-State Diff by: Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(MG8_SR_Diff[1,6], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),
                
                valueBox(MG8_SA_Diff[1,6], "Short Answer", icon=icon("pen-to-square")),
                
                valueBox(MG8_CR_Diff[1,6], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )
                
              )
      ),
      
      #G7 Math
      
      tabItem("g7MathContent",
              span(h1("How were students assessed?")), #style = "color:black")),
              HTML("<p>The 2022 G7 Math exam consisted of 40 questions worth 
              in <b>total 54 points </b>. Explore the released materials:
              <ul>
                <li> Complete and Score released questions in the  
                   <a href='https://mcas.digitalitemlibrary.com/home?subject=Math&grades=Grade%207&view=ALL'>digital item library. </a> 
                </li>
                <li> Download <a href = 'https://www.doe.mass.edu/mcas/2022/release/gr7-math.pdf'>
                    2022 released items PDF </a> 
                </li>
                <li>Student<a href = 'https://www.doe.mass.edu/mcas/student/2022/grade7/math.html'>
                     Constructed Response </a> and Scoring Guidelines
                </li>
                <li><a href = 'https://www.doe.mass.edu/mcas/tdd/resources/2019-g7-math-refsheet.pdf'>
                    Reference Sheet </a>
                </li>
              </ul>
                   </p>"),
              h3("Available Points by Content Category"),
              
              
              fluidRow(
                valueBox(MG7_EE_PTS[1,2], HTML("<p> Expressions <br> and Equations </p>"), icon = icon("equals"), color = "blue"),
                valueBox( MG7_GE_PTS[1,2],"Geometry",icon = icon("shapes"), color = "blue")
              ),
              
              fluidRow(
                valueBox(MG7_NS_PTS[1,2], "Number System", icon = icon("less-than-equal"), color = "blue"),
                valueBox(MG7_RP_PTS[1,2], HTML("<p> Ratios and <br> Proportions </p>"), icon = icon("chart-pie"), color = "blue"),
                valueBox(MG7_SP_PTS[1,2], HTML("<p> Statistics and <br> Probability </p>"), icon = icon("chart-line"), color = "blue")
              ),
              
              h3("Available Points by Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(MG7_SR_PTS[1,2], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),
                
                valueBox(MG7_SA_PTS[1,2], "Short Answer", icon=icon("pen-to-square")),
                
                valueBox(MG7_CR_PTS[1,2], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )
                
              )
      ),
      #G7 Math Performance
      tabItem("g7MathPerf",
              span(h1("How do our students compare to their peers in the state?")), #style = "color:black")),
              
              h3("RT-State Diff by: Content Category"),
              
              
              fluidRow(
                valueBox(MG7_EE_Diff[1,6], HTML("<p> Expressions <br> and Equations </p>"), icon = icon("equals"), color = "blue"),
                valueBox( MG7_GE_Diff[1,6],"Geometry",icon = icon("shapes"), color = "blue")
              ),
              
              fluidRow(
                valueBox(MG7_NS_Diff[1,6], "Number System", icon = icon("less-than-equal"), color = "blue"),
                valueBox(MG7_RP_Diff[1,6], HTML("<p> Ratios and <br> Proportions </p>"), icon = icon("chart-pie"), color = "blue"),
                valueBox(MG7_SP_Diff[1,6], HTML("<p> Statistics and <br> Probability </p>"), icon = icon("chart-line"), color = "blue")
              ),
              
              h3("RT-State Diff by: Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(MG7_SR_Diff[1,6], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),
                
                valueBox(MG7_SA_Diff[1,6], "Short Answer", icon=icon("pen-to-square")),
                
                valueBox(MG7_CR_Diff[1,6], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )
                
              )
      ),
      #G6 Math
      tabItem("g6MathContent",
              span(h1("How were students assessed?")), #style = "color:black")),
              HTML("<p>The 2022 G6 Math exam consisted of 40 questions worth 
              in <b>total 54 points </b>. Explore the released materials:
              <ul>
                <li> Complete and Score released questions in the  
                   <a href='https://mcas.digitalitemlibrary.com/home?subject=Math&grades=Grade%206&view=ALL'>digital item library. </a> 
                </li>
                <li> Download <a href = 'https://www.doe.mass.edu/mcas/2022/release/gr6-math.pdf'>
                    2022 released items PDF </a> 
                </li>
                <li>Student<a href = 'https://www.doe.mass.edu/mcas/student/2022/grade6/math.html'>
                     Constructed Response </a> and Scoring Guidelines
                </li>
                <li><a href = 'https://www.doe.mass.edu/mcas/tdd/resources/2019-g6-math-refsheet.pdf'>
                    Reference Sheet </a>
                </li>
              </ul>
                   </p>"),
              h3("Available Points by Content Category"),
              
              
              fluidRow(
                valueBox(MG6_EE_PTS[1,2], HTML("<p>Expressions <br> and Equations</p>"), icon = icon("equals"), color = "blue"),
                valueBox( MG6_GE_PTS[1,2],"Geometry",icon = icon("shapes"), color = "blue")
              ),
              
              fluidRow(
                valueBox(MG6_NS_PTS[1,2], "Number System", icon = icon("less-than-equal"), color = "blue"),
                valueBox(MG6_RP_PTS[1,2], HTML("<p> Ratios and <br> Proportions </p>"), icon = icon("chart-pie"), color = "blue"),
                valueBox(MG6_SP_PTS[1,2], HTML("<p> Statistics and <br> Probability </p>"), icon = icon("chart-line"), color = "blue")
              ),
              
              h3("Available Points by Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(MG6_SR_PTS[1,2], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),
                
                valueBox(MG6_SA_PTS[1,2], "Short Answer", icon=icon("pen-to-square")),
                
                valueBox(MG6_CR_PTS[1,2], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )
                
              )
      ),
      
      #G6 Math Performance
      tabItem("g6MathPerf",
              span(h1("How do our students compare to their peers in the state?")), #style = "color:black")),
              
              h3("RT-State Diff by: Content Category"),
              
              
              fluidRow(
                valueBox(MG6_EE_Diff[1,6], HTML("<p>Expressions <br> and Equations</p>"), icon = icon("equals"), color = "blue"),
                valueBox( MG6_GE_Diff[1,6],"Geometry",icon = icon("shapes"), color = "blue")
              ),
              
              fluidRow(
                valueBox(MG6_NS_Diff[1,6], "Number System", icon = icon("less-than-equal"), color = "blue"),
                valueBox(MG6_RP_Diff[1,6], HTML("<p> Ratios and <br> Proportions </p>"), icon = icon("chart-pie"), color = "blue"),
                valueBox(MG6_SP_Diff[1,6], HTML("<p> Statistics and <br> Probability </p>"), icon = icon("chart-line"), color = "blue")
              ),
              
              h3("RT-State Diff by: Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(MG6_SR_Diff[1,6], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),
                
                valueBox(MG6_SA_Diff[1,6], "Short Answer", icon=icon("pen-to-square")),
                
                valueBox(MG6_CR_Diff[1,6], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )
                
              )
      ),
      
      #G5 Math
      
      tabItem("g5MathContent",
              span(h1("How were students assessed?")), #style = "color:black")),
              HTML("<p>The 2022 G5 Math exam consisted of 40 questions worth 
              in <b>total 54 points </b>. Explore the released materials:
              <ul>
                <li> Complete and Score released questions in the  
                   <a href='https://mcas.digitalitemlibrary.com/home?subject=Math&grades=Grade%205&view=ALL'>digital item library. </a> 
                </li>
                <li> Download <a href = 'https://www.doe.mass.edu/mcas/2022/release/gr5-math.pdf'>
                    2022 released items PDF </a> 
                </li>
                <li>Student<a href = 'https://www.doe.mass.edu/mcas/student/2022/grade5/math.html'>
                     Constructed Response </a> and Scoring Guidelines
                </li>
                <li><a href = 'https://www.doe.mass.edu/mcas/tdd/resources/2019-g5-math-refsheet.pdf'>
                    Reference Sheet </a>
                </li>
              </ul>
            </p>"),
              
              h3("Available Points by Content Category"),
              
              
              fluidRow(
                valueBox(MG5_GE_PTS[1,2], "Geometry", icon = icon("shapes"), color = "blue"),
                valueBox( MG5_MD_PTS[1,2],HTML("<p> Measurement <br> and Data </p>"),icon = icon("ruler"), color = "blue")
              ),
              
              fluidRow(
                valueBox(MG5_NF_PTS[1,2], HTML("<p>Numbers and <br> Operations: Fractions</p>"), icon = icon("divide"), color = "blue"),
                valueBox(MG5_NT_PTS[1,2], HTML("<p>Numbers and <br> Operations: Base 10</p>"), icon = icon("plus-minus"), color = "blue"),
                valueBox(MG5_OA_PTS[1,2], HTML("<p> Operations and <br> Aglebraic Thinking</p>"), icon = icon("subscript"), color = "blue")
              ),
              
              h3("Available Points by Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(MG5_SR_PTS[1,2], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),
                
                valueBox(MG5_SA_PTS[1,2], "Short Answer", icon=icon("pen-to-square")),
                
                valueBox(MG5_CR_PTS[1,2], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )
                
              )
              
      ),
      # MG5 Performance
      tabItem("g5MathPerf",
              span(h1("How do our students compare to their peers in the state?")), #style = "color:black")),
              
              h3("RT-State Diff by: Content Category"),
              
              
              fluidRow(
                valueBox(MG5_GE_Diff[1,6], "Geometry", icon = icon("shapes"), color = "blue"),
                valueBox( MG5_MD_Diff[1,6],HTML("<p> Measurement <br> and Data </p>"),icon = icon("ruler"), color = "blue")
              ),
              
              fluidRow(
                valueBox(MG5_NF_Diff[1,6], HTML("<p>Numbers and <br> Operations: Fractions</p>"), icon = icon("divide"), color = "blue"),
                valueBox(MG5_NT_Diff[1,6], HTML("<p>Numbers and <br> Operations: Base 10</p>"), icon = icon("plus-minus"), color = "blue"),
                valueBox(MG5_OA_Diff[1,6], HTML("<p> Operations and <br> Aglebraic Thinking</p>"), icon = icon("subscript"), color = "blue")
              ),
              
              h3("RT-State Diff by: Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(MG5_SR_Diff[1,6], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),
                
                valueBox(MG5_SA_Diff[1,6], "Short Answer", icon=icon("pen-to-square")),
                
                valueBox(MG5_CR_Diff[1,6], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )
                
              )
              
      ),
      # ELA tab content
      tabItem(tabName = "ela",
              h2("ELA Trends Overview content")
              ),
      
      #G10 ELA Content
      
      tabItem("g10ELAContent",
              span(h1("How were students assessed?")), #style = "color:black")),
              HTML("<p>The 2022 G10 ELA exam consisted of 28 selected response 
              questions and two essays worth in <b>total 51 points </b>.
                  </p>"),
              h2("Available Points by Content Category"),
              
              h3("Reading"),
              fluidRow(
                valueBox( EG10_RE_PTS[1,2],HTML("<p> Reading: <br>Comprehension</p>"),icon = icon("book-open-reader"), color = "blue"),
                valueBox(EG10_RELA_PTS[1,2], HTML("<p>Reading: <br>Language Conv. <br> & Vocabulary </p>"), icon = icon("quote-left"), color = "blue"),
                box( title = "Released Materials", width = 4, solidHeader = FALSE,
                     HTML("<p> <ul>
                            <li> 
                          <a href='https://mcas.digitalitemlibrary.com/home?subject=ELA&grades=Grade%2010&view=ALL'>Digital item library. </a> 
                            </li>
                            <li>
                          <a href = 'https://www.doe.mass.edu/mcas/2022/release/gr10-ela.pdf'>
                            2022 released paper based items </a> 
                            </li>
                            </ul>
                            </p>"))
                
              ),
              
              h3("Writing"),
              fluidRow(
                valueBox( EG10_WR_PTS[1,2],HTML("<p>Essay: <br> Idea Development <p>"),icon = icon("lightbulb"), color = "light-blue"),
                valueBox( EG10_ESLA_pts[1,2],HTML("<p>Essay: <br> Language Conv. <p>"),icon = icon("indent"), color = "light-blue"),
                box(width = 4, solidHeader = FALSE,
                     HTML("<p> <ul>
                            <li> Sample
                          <a href = 'http://mcas.pearsonsupport.com/resources/student/practice-tests-ela/MCAS_2022_Gr10_ELA_PT_ADA.pdf'>
                             Paper Based Practice Test PDF </a>
                            </li>
                            <li> Sample 
                          <a href = 'http://mcas.pearsonsupport.com/student/practice-tests-ela/'> computer based practice test</a> with
                          scoring key/rubric
                          </li>
                            
                            
                            </ul>
                            </p>"))
                
              ),
            
              h2("Available Points by Text Type"),
              h3("Reading"),
              fluidRow(
                valueBox(EG10_NFRead_PTS[1,2], HTML("<p> Non-Fiction </p>"),icon=icon("newspaper"), color = "blue" ),
                valueBox(EG10_FRead_PTS[1,2], HTML("<p> Fiction </p>"), icon=icon("book"), color = "blue"),
                
                
                
                box( title = "Notes", width = 4, solidHeader = FALSE,
                     
                     HTML("<p> Text title and types in the <a href = 
                      'https://docs.google.com/spreadsheets/d/1TLJTY_twbuuSqCZx_9h_g4ZO4_pLuCWGgpCwklRebdE/edit?usp=sharing'> 
                       G10 ELA xWalk.</a> </p>"))
                
                
              ),
              h3("Writing"),
              fluidRow(
                valueBox(EG10_NFWrite_PTS[1,2], HTML("<p> Non-Fiction </p>"),icon=icon("newspaper"), color = "light-blue" ),
                valueBox(EG10_FWrite_PTS[1,2], HTML("<p> Fiction </p>"), icon=icon("book"), color = "light-blue"),
                
                
                
                box( title = "Notes", width = 4, solidHeader = FALSE,
                     
                     HTML("<p> Text title and types in the <a href = 
                      'https://docs.google.com/spreadsheets/d/1TLJTY_twbuuSqCZx_9h_g4ZO4_pLuCWGgpCwklRebdE/edit?usp=sharing'> 
                       G10 ELA xWalk.</a> </p>"))
                
                
              ),
              h2("Available Points by Text Quantity"),
              h3("Reading"),
              fluidRow(
                # A static valueBox
                valueBox(EG10_2TextRead_PTS[1,2], HTML("<p> Multiple Texts </p>"),icon=icon("right-left"), color = "blue" ),
                
                valueBox(EG10_1TextRead_PTS[1,2], HTML("<p> Single Text </p>"), icon=icon("1"), color = "blue"),
                
                
                box( title = "Notes", width = 4, solidHeader = FALSE,
                     
                     HTML("<p> Links to questions in the <a href = 
                      'https://docs.google.com/spreadsheets/d/1TLJTY_twbuuSqCZx_9h_g4ZO4_pLuCWGgpCwklRebdE/edit?usp=sharing'> 
                       G10 ELA xWalk.</a> </p>"))
              ),
              h3("Writing"),
              fluidRow(
                # A static valueBox
                valueBox(EG10_2TextWrite_PTS[1,2], HTML("<p> Multiple Texts </p>"),icon=icon("right-left"), color = "light-blue" ),
                
                valueBox(EG10_1TextWrite_PTS[1,2], HTML("<p> Single Text </p>"), icon=icon("1"), color = "light-blue"),
                
                
                box( title = "Notes", width = 4, solidHeader = FALSE,
                     
                     HTML("<p> Links to questions in the <a href = 
                      'https://docs.google.com/spreadsheets/d/1TLJTY_twbuuSqCZx_9h_g4ZO4_pLuCWGgpCwklRebdE/edit?usp=sharing'> 
                       G10 ELA xWalk.</a> </p>"))
              ),
              
              h2("Available Selected Response Points by Domain Cluster"),
              HTML("<p>The 2022 G10 ELA exam consisted of 28 selected response 
              questions worth in <b>total 35 points </b>.</p>"),
              
              
              fluidRow(
                # A static valueBox
                valueBox(EG10_KD_PTS[1,2], HTML("<p> Key Ideas <br> and Details</p>"), icon = icon("circle-info"), color = "blue"), 
                valueBox(EG10_CS_PTS[1,2], HTML("<p> Craft and Structure </p>"), icon = icon("paragraph"), color = "blue"),
                valueBox(EG10_IK_PTS[1,2], HTML("<p> Integration of <br> Knowledge and Ideas</p>"), icon = icon("magnifying-glass-chart"), color = "blue"),
                
                
                
               # valueBox(EG10_KL_PTS[1,2], HTML("<p> Knowledge of <br>Language </p>"), icon = icon("message"), color = "blue"),
                
                valueBox(EG10_VA_PTS[1,2], HTML("<p> Vocabulary <br> Acquisition & Use</p>"), icon = icon("spell-check"), color = "blue"), 
               valueBox(EG10_CV_PTS[1,2], HTML("<p> Conventions </p>"), icon = icon("quote-right"), color = "blue"),
               box( title = "Notes", width = 4, solidHeader = FALSE,
                    HTML("<p> Read more about the <a href = 
                      'https://www.doe.mass.edu/frameworks/ela/2017-06.pdf'> 
                       anchor standards.</a> in the frameworks</p>"))
              )
             
                
              
              # h3("Available Points by Question Type"),
              # fluidRow(
              #   # A static valueBox
              #   valueBox(EG10_SR_PTS[1,2], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check"), color = "teal"),
              #   
              #   valueBox(EG10_ES_PTS[1,2], HTML("<p> Essay: Lang. <br>& Idea Dev.</p>"),icon=icon("file-pen"), color = "teal" ),
              #   
              #   box(  width = 4, solidHeader = FALSE,
              #        HTML("<p> 2022 student released
              #             <a href = 'https://www.doe.mass.edu/mcas/student/2022/grade10/ela.html'>
              #               essays </a> and Scoring Guidelines </p>")
              # )
              #   
              # )
      ),
      
      #G10 ELA Performance
      
      tabItem("g10ELADiff",
              span(h1("How do our students compare to their peers in the state?")), #style = "color:black")),
              
              h2("RT-State Diff by Content Category"),
              h3("Reading"),
              fluidRow(
                valueBox( EG10_RE_Diff[1,6],HTML("<p> Reading: <br>Comprehension</p>"),icon = icon("book-open-reader"), color = "blue"),
                valueBox(EG10_RELA_PTS[1,2], HTML("<p>Reading: <br>Language Conv. <br> & Vocabulary </p>"), icon = icon("quote-left"), color = "blue")
                
                
              ),
              h3("Writing"),
              fluidRow(
                valueBox( EG10_ESidea_Diff[1,5],HTML("<p>Essay: <br> Idea Development <p>"),icon = icon("lightbulb"), color = "red"),
                valueBox( EG10_ESconv_Diff[1,5],HTML("<p> Essay:<br> Language Conv. <p>"),icon = icon("indent"), color = "red")
              ),
              
              
              
              
              h2("RT-State Diff by Text Type"),
              h3("Reading"),
              fluidRow(
                
                valueBox(EG10_NFRead_Diff[1,6], HTML("<p> Non-Fiction </p>"),icon=icon("newspaper"), color = "blue" ),
                valueBox(EG10_FRead_Diff[1,6], HTML("<p> Fiction </p>"), icon=icon("book"), color = "red")
                
                
                
              ),
              h3("Writing"),
              fluidRow(
                # A static valueBox
                valueBox(EG10_NFWrite_Diff[1,6], HTML("<p> Non-Fiction </p>"),icon=icon("newspaper"), color = "red" ),
                valueBox(EG10_FWrite_Diff[1,6], HTML("<p> Fiction </p>"), icon=icon("book"), color = "red")
                
                
                
              ),
              h2("RT-State Diff by Text Quantity"),
              h3("Reading"),
              fluidRow(
                # A static valueBox
                valueBox(EG10_2TextRead_Diff[1,6], HTML("<p> Multiple Texts </p>"),icon=icon("right-left"), color = "blue" ),
                valueBox(EG10_1TextRead_Diff[1,6], HTML("<p> Single Text </p>"), icon=icon("1"), color = "blue")
                
                
                
              ),
              
              h3("Writing"),
              fluidRow(
               
                valueBox(EG10_2TextWrite_Diff[1,6], HTML("<p> Multiple Texts </p>"),icon=icon("right-left"), color = "red" ),
                valueBox(EG10_1TextWrite_Diff[1,6], HTML("<p> Single Text </p>"), icon=icon("1"), color = "light-blue")
                
                
                
              ),
              h2("Selected Response RT-State Diff by Domain Cluster"),
              
              
              fluidRow(
                # A static valueBox
                
                valueBox(EG10_KD_Diff[1,6], HTML("<p> Key Ideas <br> and Details</p>"), icon = icon("circle-info"), color = "blue"), 
                valueBox(EG10_CS_Diff[1,6], HTML("<p> Craft and Structure </p>"), icon = icon("paragraph"), color = "red"),
                
                
                
                valueBox(EG10_IK_Diff[1,6], HTML("<p> Integration of <br> Knowledge and Ideas</p>"), icon = icon("magnifying-glass-chart"), color = "blue"),
                
                
                
                # valueBox(EG10_KL_Diff[1,2], HTML("<p> Knowledge of <br>Language </p>"), icon = icon("message"), color = "blue"),
                
                valueBox(EG10_VA_Diff[1,6], HTML("<p> Vocabulary <br> Acquisition & Use</p>"), icon = icon("spell-check"), color = "blue"), 
                valueBox(EG10_CV_Diff[1,6], HTML("<p> Conventions </p>"), icon = icon("quote-right"), color = "blue")
                
                
                
              )
              
      ),
     
     #G10 ELA Analysis
     
     tabItem("g10ELAWritingAnalysis",
             span(h1("How do we improve?")), #style = "color:black")),
             
             h2("Writing with Text Synthesis"),
             h3("Reading"),
             fluidRow(
               valueBox( paste(EG10_RE_Loss[1,5], "%"),HTML("<p> Reading: <br>Comprehension</p>"),icon = icon("book-open-reader"), color = "blue"),
               valueBox(paste(EG10_LA_Loss[1,5], "%"), HTML("<p>Reading: <br>Language Conv. <br> & Vocabulary </p>"), icon = icon("quote-left"), color = "blue")
               
               
             ),
             h3("Writing"),
             fluidRow(
               valueBox( paste(EG10_ESidea_Loss[1,4], "%"),HTML("<p>Essay: <br> Idea Development <p>"),icon = icon("lightbulb"), color = "light-blue"),
               valueBox( paste(EG10_ESconv_Loss[1,4], "%"),HTML("<p> Essay:<br> Language Conv. <p>"),icon = icon("indent"), color = "light-blue")
             ),
             
             
             
             
             h2("% Points Lost by Text Type"),
             h3("Reading"),
             fluidRow(
               
               valueBox(paste(EG10_NFRead_Loss[1,5], "%"), HTML("<p> Non-Fiction </p>"),icon=icon("newspaper"), color = "blue" ),
               valueBox(paste(EG10_FRead_Loss[1,5], "%"), HTML("<p> Fiction </p>"), icon=icon("book"), color = "blue")
               
               
               
             ),
             h3("Writing"),
             fluidRow(
               # A static valueBox
               valueBox(paste(EG10_NFWrite_Loss[1,5], "%"), HTML("<p> Non-Fiction </p>"),icon=icon("newspaper"), color = "light-blue" ),
               valueBox(paste(EG10_FWrite_Loss[1,5], "%"), HTML("<p> Fiction </p>"), icon=icon("book"), color = "light-blue")
               
               
               
             ),
             h2("% Points Lost by Text Quantity"),
             h3("Reading"),
             fluidRow(
               # A static valueBox
               valueBox(paste(EG10_2TextRead_Loss[1,5], "%"), HTML("<p> Multiple Texts </p>"),icon=icon("right-left"), color = "blue" ),
               valueBox(paste(EG10_1TextRead_Loss[1,5], "%"), HTML("<p> Single Text </p>"), icon=icon("1"), color = "blue")
               
               
               
             ),
             
             h3("Writing"),
             fluidRow(
               
               valueBox(paste(EG10_2TextWrite_Loss[1,5], "%"), HTML("<p> Multiple Texts </p>"),icon=icon("right-left"), color = "light-blue" ),
               valueBox(EG10_1TextWrite_Loss[1,5], HTML("<p> Single Text </p>"), icon=icon("1"), color = "light-blue")
               
               
               
             ),
             h2("Selected Response % Points Lost by Domain Cluster"),
             h3("Reading Only"),
             
             
             fluidRow(
               # A static valueBox
               
               valueBox(paste(EG10_KD_Loss[1,5], "%"), HTML("<p> Key Ideas <br> and Details</p>"), icon = icon("circle-info"), color = "blue"), 
               valueBox(paste(EG10_CS_Loss[1,5], "%"), HTML("<p> Craft and Structure </p>"), icon = icon("paragraph"), color = "blue"),
               
               
               
               valueBox(paste(EG10_IK_Loss[1,5], "%"), HTML("<p> Integration of <br> Knowledge and Ideas</p>"), icon = icon("magnifying-glass-chart"), color = "blue"),
               
               
               
               # valueBox(EG10_KL_Loss[1,2], HTML("<p> Knowledge of <br>Language </p>"), icon = icon("message"), color = "blue"),
               
               valueBox(paste(EG10_VA_Loss[1,5], "%"), HTML("<p> Vocabulary <br> Acquisition & Use</p>"), icon = icon("spell-check"), color = "blue"), 
               valueBox(paste(EG10_CV_Loss[1,5], "%"), HTML("<p> Conventions </p>"), icon = icon("quote-right"), color = "blue")
               
               
               
             )
             
     ),
     
     tabItem("g10ELAReadingAnalysis",
             span(h1("How do we improve our reading?")), #style = "color:black")),
             
             h2("Fiction and Poetry Analysis using Multiple Texts"),
             
             
            
             
             
             
             
             h2("% Points Lost by Text Type"),
             
             h3("All Students"),
            
             fluidRow(
               
               valueBox(paste(EG10_NFRead_Loss[1,5], "%"), HTML("<p> Non-Fiction </p>"),icon=icon("newspaper"), color = "blue" ),
               valueBox(paste(EG10_FRead_Loss[1,5], "%"), HTML("<p> Fiction </p>"), icon=icon("book"), color = "red"),
               box(  width = 4, solidHeader = FALSE,
                     HTML("<p>  <b> Rising Tide</b> students lost 
                  <b> significantly more points </b> in the comprehension and analysis of <b>fictional </b> 
                  texts. </p>"))
               
               
               
             ),
             
             
             h3("Top Scoring Students"),
             
             fluidRow(
               
               valueBox(paste(EG10Top_NFRead_Loss[1,5], "%"), HTML("<p> Non-Fiction </p>"),icon=icon("newspaper"), color = "blue" ),
               valueBox(paste(EG10Top_FRead_Loss[1,5], "%"), HTML("<p> Fiction </p>"), icon=icon("book"), color = "red"),
               box(  width = 4, solidHeader = FALSE,
                     HTML("<p> This trend is <b> more pronounced</b> in Rising Tide's <b> top performing students</b>.
             This suggests, that students need an adjustment at the <b>curricular level </b> in fiction reading comprehension
             and text analysis. </p>"))
               
               
             ),
            
             h2("% Reading Points Lost by Text Quantity"),
             
             h3("All Students"),
             
             
             fluidRow(
               # A static valueBox
               valueBox(paste(EG10_2TextRead_Loss[1,5], "%"), HTML("<p> Multiple Texts </p>"),icon=icon("right-left"), color = "red" ),
               valueBox(paste(EG10_1TextRead_Loss[1,5], "%"), HTML("<p> Single Text </p>"), icon=icon("1"), color = "blue"),
               box(  width = 4, solidHeader = FALSE,
                     HTML("<p><b> 57% </b> of reading points are from items asking 
                  students to sythesize between two texts, yet these items account for
                  <b> 65%</b> of reading points lost by <b>Rising Tide students </b>. </p>"))
             ),
            
            
             h3("Top Performing Students"),
          
             fluidRow(
               # A static valueBox
               valueBox(paste(EG10Top_2TextRead_Loss[1,5], "%"), HTML("<p> Multiple Texts </p>"),icon=icon("right-left"), color = "red" ),
               valueBox(paste(EG10Top_1TextRead_Loss[1,5], "%"), HTML("<p> Single Text </p>"), icon=icon("1"), color = "blue"),
               box(  width = 4, solidHeader = FALSE,
                     HTML("<p> This trend is <b> more pronounced</b> in Rising Tide's <b> top performing students</b>.
             This suggests, that students are practicing synthesizing multiple <b> non-fiction</b>
             texts and need to review how this skill is taught and practiced with <b> fiction </b> in 
                  <b> ELA class </b> at the <b>curricular level </b>. </p>"))
               
               
               
             ),
             
             h2("% of Reading Points Lost by Reporting Category"),
             h3("All Students"),
        
             fluidRow(
               valueBox( paste(EG10_RE_Loss[1,5], "%"),HTML("<p> Reading: <br>Comprehension</p>"),icon = icon("book-open-reader"), color = "red"),
               valueBox(paste(EG10_LA_Loss[1,5], "%"), HTML("<p>Reading: <br>Language Conv. <br> & Vocabulary </p>"), icon = icon("quote-left"), color = "blue"),
               box(  width = 4, solidHeader = FALSE,
                     HTML("<p><b> 86% </b> of slected response points are from items assessing 
                  student's reading comprehension, and these items account for
                  <b> 91%</b> of selected response points lost by <b>Rising Tide students </b>. </p>")),
             ),
             h3("Top Performing Students"),
             fluidRow(
               valueBox( paste(EG10Top_RE_Loss[1,5], "%"),HTML("<p> Reading: <br>Comprehension</p>"),icon = icon("book-open-reader"), color = "red"),
               valueBox(paste(EG10Top_LA_Loss[1,5], "%"), HTML("<p>Reading: <br>Language Conv. <br> & Vocabulary </p>"), icon = icon("quote-left"), color = "blue"),
               box(  width = 4, solidHeader = FALSE,
                     HTML("<p> Rising Tide's <b> top performing students</b> also lost a 
              disproportionate amount of points in reading comprehension.
             This suggests that all students would benefit from more curricular attention
             to <b> targeted reading comprehension </b>. </p>"))
               
               
             ),
              
             h1("What reading domain cluster should we review?"),
             h2("Craft and Structure"),
             
             HTML("<p> The <b> Craft and Structure </b> cluster comprises three <b> abstract </b>  standards.
                <ul>
                <li>  
                    <b>Interpreting </b> words and phrases as they are used in a text,
                </li>
                <li> 
                  <b> Analyzing</b> the <b>structure </b> of texts
                  
                </li>
                    
                <li> 
                  Assessing how <b> point of view </b> or purpose <b> shapes </b> the content and style of a text.
                </li>
                </ul>
                Read about all of the literacy standards 
                <a href='https://www.doe.mass.edu/frameworks/ela/2017-06.pdf'>here. </a>
                </p>"),
             h3("% Points Lost by Domain Cluster: All Students"),
              
             
             fluidRow(
               # A static valueBox
               
               valueBox(paste(EG10_KD_Loss[1,5], "%"), HTML("<p> Key Ideas <br> and Details</p>"), icon = icon("circle-info"), color = "blue"), 
               valueBox(paste(EG10_CS_Loss[1,5], "%"), HTML("<p> Craft and Structure </p>"), icon = icon("paragraph"), color = "red"),
               
               
               
               valueBox(paste(EG10_IK_Loss[1,5], "%"), HTML("<p> Integration of <br> Knowledge and Ideas</p>"), icon = icon("magnifying-glass-chart"), color = "blue"),
               
               
               
               # valueBox(EG10_KL_Loss[1,2], HTML("<p> Knowledge of <br>Language </p>"), icon = icon("message"), color = "blue"),
               
               valueBox(paste(EG10_VA_Loss[1,5], "%"), HTML("<p> Vocabulary <br> Acquisition & Use</p>"), icon = icon("spell-check"), color = "blue"),
               box(  width = 4, solidHeader = FALSE,
                    HTML("<p> Craft and Structure items account for <b> 29%</b> of available selected response points
                    and <b> 39% </b> of points lost by <b> Rising Tide students </b> </p>")),
                    
                valueBox(paste(EG10_CV_Loss[1,5], "%"), HTML("<p> Conventions </p>"), icon = icon("quote-right"), color = "blue")
             
               ),
               
               
               
             h3("% Points Lost by Domain Cluster: Top Performing Students"),
             
             
             fluidRow(
               # A static valueBox
               
               valueBox(paste(EG10Top_KD_Loss[1,5], "%"), HTML("<p> Key Ideas <br> and Details</p>"), icon = icon("circle-info"), color = "blue"), 
               valueBox(paste(EG10Top_CS_Loss[1,5], "%"), HTML("<p> Craft and Structure </p>"), icon = icon("paragraph"), color = "red"),
               
               
               
               valueBox(paste(EG10Top_IK_Loss[1,5], "%"), HTML("<p> Integration of <br> Knowledge and Ideas</p>"), icon = icon("magnifying-glass-chart"), color = "blue"),
               
               
               
               # valueBox(EG10_KL_Loss[1,2], HTML("<p> Knowledge of <br>Language </p>"), icon = icon("message"), color = "blue"),
               
               valueBox(paste(EG10Top_VA_Loss[1,5], "%"), HTML("<p> Vocabulary <br> Acquisition & Use</p>"), icon = icon("spell-check"), color = "blue"),
               box(  width = 4, solidHeader = FALSE,
                     HTML("<p> Top Performing students lost <b>disproportionately more </b> craft and structure points. </p>")),
               valueBox(paste(EG10Top_CV_Loss[1,5], "%"), HTML("<p> Conventions </p>"), icon = icon("quote-right"), color = "blue")
               
               
               
             )
            
             
     )
     
      
      
    )
  )

)
  
  




