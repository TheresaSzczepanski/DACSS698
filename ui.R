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
               menuSubItem("G9 Physics Content", tabName = "g9PhysicsContent"),
              menuSubItem("G9 Physics Performance", tabName = "g9PhysicsPerf"),
                  
               menuSubItem("G9 Physics Analysis", tabName = "g9PhysicsAnalysis"),
              menuSubItem("G8 STE Content", tabName = "g8SteContent"),
              menuSubItem("G5 STE Content", tabName = "g5SteContent")
              ),
      menuItem("Mathematics", tabName = "math", icon = icon("infinity"),
               menuSubItem("G10 Math Content", tabName = "g10MathContent"),
               menuSubItem("G8 Math Content", tabName = "g8MathContent"),
               
               menuSubItem("G7 Math Content", tabName = "g7MathContent"),
               menuSubItem("G6 Math Content", tabName = "g6MathContent"),
               menuSubItem("G5 Math Content", tabName = "g5MathContent")
              ),
      menuItem("ELA", tabName = "ela", icon = icon("book-bookmark"),
               menuSubItem("G10 ELA Content", tabName = "g10ELAContent")
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
                  <a href = 'http://mcas.pearsonsupport.com/resources/student/practice-tests-science/MCAS_2022_HS_Introductory%20Physics_PT_ADA.pdf'>
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
                
                valueBox(SG11_IQ_PTS[1,2], HTML("<p> Investigating <br> and Questioning</p>"), icon = icon("question"), color = "light-blue"),
                
                valueBox(SG11_MD_PTS[1,2], HTML("<p> Mathematics <br> and Data</p>"), icon = icon("calculator"), color = "light-blue"),
                
                valueBox(SG11_ERM_PTS[1,2], HTML("<p> Evidence, Reasoning, <br> and Modeling</p>"), icon = icon("magnifying-glass-chart"), color = "light-blue") 
                
                
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
               worth in <b> total 60 points </b>.
               Explore the released materials:
                <ul>
                <li> Complete and Score released questions in the  
              <a href='https://mcas.digitalitemlibrary.com/home?subject=Science&grades=Physics&view=ALL'>digital item library. </a> 
                </li>
                <li> Download
              <a href = 'https://www.doe.mass.edu/mcas/2022/release/hs-physics.pdf'>
                2022 released paper based items PDF </a> 
                </li>
                <li> Download 
                  <a href = 'http://mcas.pearsonsupport.com/resources/student/practice-tests-science/MCAS_2022_HS_Introductory%20Physics_PT_ADA.pdf'>
                  HS Introductory Physics Paper sample test </a>
                or 
                <a href = 'http://mcas.pearsonsupport.com/student/practice-tests-science/'>
                complete Computer Based tests online </a> and grade with the
                scoring key/rubrics </a>
                </li>
                <li>Review student
              <a href = 'https://www.doe.mass.edu/mcas/student/2022/hs/physics.html'>
                released Constructed Response </a> and Scoring Guidelines
              </li>
                <li><a href = 'https://www.doe.mass.edu/mcas/tdd/phys_formula.pdf'>
                Reference Sheet </a>
                </li>
                </ul>
                </p>"),
              h3("Available Points by Content Category"),
             
             
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
                
                valueBox(SG9_IQ_PTS[1,2], HTML("<p> Investigating <br> and Questioning</p>"), icon = icon("question"), color = "light-blue"),
                
                valueBox(SG9_MD_PTS[1,2], HTML("<p> Mathematics <br> and Data</p>"), icon = icon("calculator"), color = "light-blue"),
                
                valueBox(SG9_ERM_PTS[1,2], HTML("<p> Evidence, Reasoning, <br> and Modeling</p>"), icon = icon("magnifying-glass-chart"), color = "light-blue") 
    
                
               # valueBox(4,  "no category reported ", color = "aqua")
                
              ),
              h3("Available Points by Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(SG9_SR_PTS[1,2], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),
                
                valueBox(SG9_CR_PTS[1,2], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )
               
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
                
                valueBox(SG8_IQ_PTS[1,2], HTML("<p> Investigating <br> and Questioning</p>"), icon = icon("question"), color = "light-blue"),
                
                valueBox(SG8_MD_PTS[1,2], HTML("<p> Mathematics <br> and Data</p>"), icon = icon("calculator"), color = "light-blue"),
                
                valueBox(SG8_ERM_PTS[1,2], HTML("<p> Evidence, Reasoning, <br> and Modeling</p>"), icon = icon("magnifying-glass-chart"), color = "light-blue") 
                
                
                # valueBox(4,  "no category reported ", color = "aqua")
                
              ),
              
              
              h3("Available Points by Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(SG8_SR_PTS[1,2], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),
                
                valueBox(SG8_CR_PTS[1,2], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )
                
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
                
                valueBox(SG5_IQ_PTS[1,2], HTML("<p> Investigating <br> and Questioning</p>"), icon = icon("question"), color = "light-blue"),
                
                valueBox(SG5_MD_PTS[1,2], HTML("<p> Mathematics <br> and Data</p>"), icon = icon("calculator"), color = "light-blue"),
                
                valueBox(SG5_ERM_PTS[1,2], HTML("<p> Evidence, Reasoning, <br> and Modeling</p>"), icon = icon("magnifying-glass-chart"), color = "light-blue") 
                
                
                # valueBox(4,  "no category reported ", color = "aqua")
                
              ),
              h3("Available Points by Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(SG5_SR_PTS[1,2], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check")),
                
                valueBox(SG5_CR_PTS[1,2], HTML("<p> Constructed <br> Response </p>"),icon=icon("pencil") )
                
              )
      ),
      
      # Math tab content
      tabItem(tabName = "math",
              h2("Math Trends Overview content")
      
      ),
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
      
      #G8 Math
      # To-Do: Update for G8 content
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
      
      #G7 Math
      # To-Do: Update for G7 content
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
      
      #G5 Math
      # To-Do: Update for G5 content
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
      # ELA tab content
      tabItem(tabName = "ela",
              h2("ELA Trends Overview content")
              ),
      
      #G10 ELA Content
      
      tabItem("g10ELAContent",
              span(h1("How were students assessed?")), #style = "color:black")),
              HTML("<p>The 2022 G10 ELA exam consisted of 28 selected response 
              questions and two essays worth in <b>total 51 points </b>.
               Explore the released materials:
                <ul>
                <li> Complete and Score released questions in the  
              <a href='https://mcas.digitalitemlibrary.com/home?subject=ELA&grades=Grade%2010&view=ALL'>digital item library. </a> 
                </li>
                <li> Download
                     <a href = 'https://www.doe.mass.edu/mcas/2022/release/gr10-ela.pdf'>
                        2022 released paper based items PDF </a> 
                </li>
                <li> Download
              <a href = 'http://mcas.pearsonsupport.com/resources/student/practice-tests-ela/MCAS_2022_Gr10_ELA_PT_ADA.pdf'>
                Sample Paper Based Test PDF </a>or complete the 
                <a href = 'http://mcas.pearsonsupport.com/student/practice-tests-ela/'> computer based practice test</a> with the
                scoring key/rubric
                </li>
                <li>Student
              <a href = 'https://www.doe.mass.edu/mcas/student/2022/grade10/ela.html'>
                essays </a> and Scoring Guidelines
              </li>
          
            </ul>
                </p>"),
              h3("Available Points by Content Category"),
              
              fluidRow(
                valueBox( ELA10_RE_PTS[1,2],HTML("<p> Reading: <br>Comprehension</p>"),icon = icon("book-open-reader"), color = "blue"),
                valueBox(ELA10_RELA_PTS[1,2], HTML("<p>Reading: <br>Language Conv. <br> & Vocabulary </p>"), icon = icon("quote-left"), color = "blue")
                
                
              ),
              fluidRow(
                valueBox( ELA10_WR_PTS[1,2],HTML("<p>Writing: <br> Idea Development <p>"),icon = icon("file-pen"), color = "blue"),
                valueBox( ELA10_ESLA_pts[1,2],HTML("<p>Writing: <br> Language Conv. <p>"),icon = icon("indent"), color = "blue")
              ),
            
              
              
              h3("Available Points by Domain Cluster"),
              
              
              fluidRow(
                # A static valueBox
                
                valueBox(ELA10_CS_PTS[1,2], HTML("<p> Craft and Structure </p>"), icon = icon("paragraph"), color = "light-blue"),
                valueBox(ELA10_CV_PTS[1,2], HTML("<p> Conventions </p>"), icon = icon("quote-right"), color = "light-blue"),
                valueBox(ELA10_ID_PTS[1,2], HTML("<p> Idea Development </p>"), icon = icon("lightbulb"), color = "light-blue"),
                
                valueBox(ELA10_IK_PTS[1,2], HTML("<p> Integration of <br> Knowledge and Ideas</p>"), icon = icon("magnifying-glass-chart"), color = "light-blue"),
                
                valueBox(ELA10_KD_PTS[1,2], HTML("<p> Key Ideas <br> and Details</p>"), icon = icon("circle-info"), color = "light-blue"), 
                
               # valueBox(ELA10_KL_PTS[1,2], HTML("<p> Knowledge of <br>Language </p>"), icon = icon("message"), color = "light-blue"),
                
                valueBox(ELA10_VA_PTS[1,2], HTML("<p> Vocabulary <br> Acquisition & Use</p>"), icon = icon("spell-check"), color = "light-blue") 
                
                
               
                
              ),
              h3("Available Points by Text Type and Quantity"),
              fluidRow(
                # A static valueBox
                valueBox(ELA10_SR_PTS[1,2], HTML("<p> Fiction </p>"), icon=icon("book")),
                
                valueBox(ELA10_ES_PTS[1,2], HTML("<p> Non-Fiction </p>"),icon=icon("newspaper") )
                
              ),
              fluidRow(
                # A static valueBox
                valueBox(ELA10_SR_PTS[1,2], HTML("<p> Single Text </p>"), icon=icon("1")),
                
                valueBox(ELA10_ES_PTS[1,2], HTML("<p> Multiple Texts </p>"),icon=icon("right-left") )
                
              ),
              h3("Available Points by Question Type"),
              fluidRow(
                # A static valueBox
                valueBox(ELA10_SR_PTS[1,2], HTML("<p> Selected <br> Response </p>"), icon=icon("square-check"), color = "teal"),
                
                valueBox(ELA10_ES_PTS[1,2], HTML("<p> Essay: Lang. <br>& Idea Dev.</p>"),icon=icon("file-pen"), color = "teal" )
                
              )
      )
      
      
    )
  )

)
  
  




