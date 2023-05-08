##Student Performance Functions

##RT-State Diff by Item Type
Item_Type_Diff<-function(subject, item_type, studentItemPerfDF){
  if(subject == "math"){
    studentItemPerfDF%>%
      group_by(`Type`)%>%
      summarise(available_points = sum(`item Possible Points`, na.rm=TRUE),
                RT_points = sum(`mitem_score`, na.rm = TRUE),
                RT_Percent_Points = 100*round(RT_points/available_points,2),
                State_Percent_Points = 100*round(sum(`State Percent Points`*`item Possible Points`/available_points, na.rm = TRUE),2))%>%
      mutate(`RT-State Diff` = round(RT_Percent_Points - State_Percent_Points, 2))%>%
      filter(`Type` == item_type)
  }
 
  else if(subject == "science"){
    studentItemPerfDF%>%
      group_by(`Type`)%>%
      summarise(available_points = sum(`item Possible Points`, na.rm=TRUE),
                RT_points = sum(`sitem_score`, na.rm = TRUE),
                RT_Percent_Points = 100*round(RT_points/available_points,2),
                State_Percent_Points = 100*round(sum(`State Percent Points`*`item Possible Points`/available_points, na.rm = TRUE),2))%>%
      mutate(`RT-State Diff` = round(RT_Percent_Points - State_Percent_Points, 2))%>%
      filter(`Type` == item_type)
  }
  else if(subject == "ela"){
    studentItemPerfDF%>%
      group_by(`Type`)%>%
      summarise(available_points = sum(`item Possible Points`, na.rm=TRUE),
                RT_points = sum(`eitem_score`, na.rm = TRUE),
                RT_Percent_Points = 100*round(RT_points/available_points,2),
                State_Percent_Points = 100*round(sum(`State Percent Points`*`item Possible Points`/available_points, na.rm = TRUE),2))%>%
      mutate(`RT-State Diff` = round(RT_Percent_Points - State_Percent_Points, 2))%>%
      filter(`Type` == item_type)
  }
}

##RT-Stat Diff by reporting category

Reporting_Cat_Diff<-function(subject, category, studentItemPerfDF){
  if(subject == "math"){
    studentItemPerfDF%>%
    group_by(`Reporting Category`)%>%
    summarise(available_points = sum(`item Possible Points`, na.rm=TRUE),
              RT_points = sum(`mitem_score`, na.rm = TRUE),
              RT_Percent_Points = 100*round(RT_points/available_points,2),
              State_Percent_Points = 100*round(sum(`State Percent Points`*`item Possible Points`/available_points, na.rm = TRUE),2))%>%
    mutate(`RT-State Diff` = round(RT_Percent_Points - State_Percent_Points, 2))%>%
      filter(`Reporting Category` == category)
  }
  else if(subject == "science"){
    studentItemPerfDF%>%
      group_by(`Reporting Category`)%>%
      summarise(available_points = sum(`item Possible Points`, na.rm=TRUE),
                RT_points = sum(`sitem_score`, na.rm = TRUE),
                RT_Percent_Points = 100*round(RT_points/available_points,2),
                State_Percent_Points = 100*round(sum(`State Percent Points`*`item Possible Points`/available_points, na.rm = TRUE),2))%>%
      mutate(`RT-State Diff` = round(RT_Percent_Points - State_Percent_Points, 2))%>%
      filter(`Reporting Category` == category)
  }
  else if(subject == "ela"){
    studentItemPerfDF%>%
      group_by(`Reporting Category`)%>%
      summarise(available_points = sum(`item Possible Points`, na.rm=TRUE),
                RT_points = sum(`eitem_score`, na.rm = TRUE),
                RT_Percent_Points = 100*round(RT_points/available_points,2),
                State_Percent_Points = 100*round(sum(`State Percent Points`*`item Possible Points`/available_points, na.rm = TRUE),2))%>%
      mutate(`RT-State Diff` = round(RT_Percent_Points - State_Percent_Points, 2))%>%
      filter(`Reporting Category` == category)
  }
}

##RT-Stat Diff by ELA cluster or Science Practice category

Practice_Cat_Diff <-function(subject, practiceCategory, studentItemPerfDF){
  if(subject == "science"){
    studentItemPerfDF%>%
      group_by(`Practice Category`)%>%
      summarize(available_points = sum(`item Possible Points`, na.rm=TRUE),
      RT_points = sum(`sitem_score`, na.rm = TRUE),
      RT_Percent_Points = 100*round(RT_points/available_points,2),
      State_Percent_Points = 
        100*round(sum(`State Percent Points`*`item Possible Points`/available_points, 
                      na.rm = TRUE),2))%>%
      mutate(`RT-State Diff` = round(RT_Percent_Points - State_Percent_Points, 2))%>%
      filter(`Practice Category` == practiceCategory)
  }
  ##To-Do Need to Identify Equivalent to Practice category in math (perhaps representation type?)
  # else if (subject == "math"){
  #   subjectItemDF%>%
  #     select(`mitem`, `item Possible Points`, `Reporting Category`)%>%
  #     group_by(`Reporting Category`)%>%
  #     summarise(available_points = sum(`item Possible Points`, na.rm=TRUE))
  
  #} 
  else if(subject == "ela"){
   # if (practiceCategory == ""){
    studentItemPerfDF%>%
      filter(!str_detect(`Type`,"ES"))%>%
      group_by(`Cluster`)%>%
      summarise(available_points = sum(`item Possible Points`, na.rm=TRUE),
                RT_points = sum(`eitem_score`, na.rm = TRUE),
                RT_Percent_Points = 100*round(RT_points/available_points,2),
                State_Percent_Points = 100*round(sum(`State Percent Points`*`item Possible Points`/available_points, na.rm = TRUE),2))%>%
      mutate(`RT-State Diff` =RT_Percent_Points-State_Percent_Points)%>%
      filter(`Cluster` == practiceCategory)
     }
}    

Practice_Cat_Loss <-function(subject, practiceCategory, studentItemPerfDF){
  if(subject == "science"){
    Total_Lost_Points<-studentItemPerfDF%>%
      summarize(Total_Lost_Points = sum(`item Possible Points`, na.rm=TRUE)-sum(`sitem_score`, na.rm=TRUE))
    #view(Total_Lost_Points)
    studentItemPerfDF%>%
      group_by(`Practice Category`)%>%
      summarize(available_points = sum(`item Possible Points`, na.rm=TRUE),
                RT_points = sum(`sitem_score`, na.rm = TRUE),
                RT_lost_points = available_points-RT_points,
                RT_percent_lost_points = 
                  100*round(sum(`RT_lost_points`/Total_Lost_Points[1,1],
                                na.rm = TRUE),2))%>%
      filter(`Practice Category` == practiceCategory)
  }
  ##To-Do Need to Identify Equivalent to Practice category in math (perhaps representation type?)
  # else if (subject == "math"){
  #   subjectItemDF%>%
  #     select(`mitem`, `item Possible Points`, `Reporting Category`)%>%
  #     group_by(`Reporting Category`)%>%
  #     summarise(available_points = sum(`item Possible Points`, na.rm=TRUE))
  
  #} 
  #To-Do adjust for ELA
  else if(subject == "ela"){
      Total_Lost_Points<-studentItemPerfDF%>%
        filter(!str_detect(`Type`,"ES"))%>%
        summarize(Total_Lost_Points = sum(`item Possible Points`, na.rm=TRUE)-sum(`eitem_score`, na.rm=TRUE))
      view(Total_Lost_Points)
      studentItemPerfDF%>%
        filter(!str_detect(`Type`,"ES"))%>%
      group_by(`Cluster`)%>%
      summarise(available_points = sum(`item Possible Points`, na.rm=TRUE),
                RT_points = sum(`eitem_score`, na.rm = TRUE),
                RT_lost_points = available_points-RT_points,
                RT_percent_lost_points = 
                  100*round(sum(`RT_lost_points`/Total_Lost_Points[1,1],
                                na.rm = TRUE),2))%>%
                filter(`Cluster` == practiceCategory)
  }
} 

###Practice Category Loss Visual
Practice_Cat_Loss_Bar <-function(subject, studentItemPerfDF){
  if(subject == "science"){
    Total_Lost_Points<-studentItemPerfDF%>%
      summarize(Total_Lost_Points = sum(`item Possible Points`, na.rm=TRUE)-sum(`sitem_score`))
    #view(Total_Lost_Points)
    studentItemPerfDF%>%
      group_by(`Practice Category`)%>%
      summarize(available_points = sum(`item Possible Points`, na.rm=TRUE),
                RT_points = sum(`sitem_score`, na.rm = TRUE),
                RT_lost_points = available_points-RT_points,
                RT_percent_lost_points = 
                  100*round(sum(`RT_lost_points`/Total_Lost_Points[1,1],
                                na.rm = TRUE),2))%>%
      mutate(`Practice Category` = fct_reorder(`Practice Category`, 
                                  `RT_percent_lost_points`, .desc =TRUE))%>%
      ggplot( aes(fill = `Practice Category`, y=`RT_percent_lost_points`, 
                  x=`Practice Category`)) +
       geom_bar(position="dodge", stat="identity") +
        #coord_flip()+
      scale_fill_manual(values = c("Mathematics and Data" = "red"))+
     # scale_fill_brewer(palette = "Blues", na.value = "blue")+
      theme(#axis.title.x=element_blank(),
        legend.position = "none")
            #axis.text.x=element_blank())
   # na.value="blue"
       #     axis.ticks.x=element_blank()
            # axis.text.y=element_blank(),  #remove y axis labels
            # axis.ticks.y=element_blank()  #remove y axis ticks
      #)
  }
}

### ELA specific performance functions
## RT STate-Diff for ELA Essay sub scores

ELA_Subitem_Diff<-function(subitem, studentSubItemPerfDF){
  studentSubItemPerfDF%>%
    filter(str_detect(esubitem, subitem))%>%
    summarise(available_points = sum(`item Possible Points`, na.rm=TRUE),
              RT_points = sum(`esubitem_score`, na.rm = TRUE),
              RT_Percent_Points = 100*round(RT_points/available_points,2),
              State_Percent_Points = 100*round(sum(`State Percent Points`*`item Possible Points`/available_points, na.rm = TRUE),2))%>%
    mutate(`RT-State Diff` = round(RT_Percent_Points - State_Percent_Points, 2))
    
}
## RT State-Diff for ELA xWalk Items and %PtsLost by xWalk items


ELA_NumText_Diff<-function(value, studentItemPerfDF){
  studentItemPerfDF%>%
    group_by(`Num Texts`)%>%
    summarise(available_points = sum(`item Possible Points`, na.rm=TRUE),
              RT_points = sum(`eitem_score`, na.rm = TRUE),
              RT_Percent_Points = 100*round(RT_points/available_points,2),
              State_Percent_Points = 100*round(
                sum(`State Percent Points`*`item Possible Points`/available_points, na.rm = TRUE),2))%>%
    mutate(`RT-State Diff` = round(RT_Percent_Points - State_Percent_Points, 2))%>%
    filter(`Num Texts`==value)
}

ELA_NumText_Loss<-function(value, studentItemPerfDF){
  Total_Lost_Points<-studentItemPerfDF%>%
    summarize(Total_Lost_Points = sum(`item Possible Points`, na.rm=TRUE)-sum(`eitem_score`, na.rm=TRUE))
  view(Total_Lost_Points)
  studentItemPerfDF%>%
  group_by(`Num Texts`)%>%
  summarise(available_points = sum(`item Possible Points`, na.rm=TRUE),
            RT_points = sum(`eitem_score`, na.rm = TRUE),
            RT_lost_points = available_points-RT_points,
            RT_percent_lost_points = 
              100*round(sum(`RT_lost_points`/Total_Lost_Points[1,1],
                            na.rm = TRUE),2))%>%
    filter(`Num Texts` == value)
}

ELA_Fiction_Diff<-function(value, studentItemPerfDF){
  studentItemPerfDF%>%
    group_by(`Fiction-Non`)%>% 
    summarise(available_points = 
                sum(`item Possible Points`, na.rm=TRUE),
                RT_points = sum(`eitem_score`, na.rm = TRUE),
                RT_Percent_Points = 100*round(RT_points/available_points,2),
                State_Percent_Points = 100*round(sum(`State Percent Points`*`item Possible Points`/available_points, na.rm = TRUE),2))%>%
    mutate(`RT-State Diff` = round(RT_Percent_Points - State_Percent_Points, 2))%>%
    filter(`Fiction-Non`==value)
}

ELA_Fiction_Loss<-function(value, studentItemPerfDF){
  Total_Lost_Points<-studentItemPerfDF%>%
    summarize(Total_Lost_Points = sum(`item Possible Points`, na.rm=TRUE)-sum(`eitem_score`, na.rm=TRUE))
  view(Total_Lost_Points)
  studentItemPerfDF%>%
  group_by(`Fiction-Non`)%>%
    summarise(available_points = sum(`item Possible Points`, na.rm=TRUE),
              RT_points = sum(`eitem_score`, na.rm = TRUE),
              RT_lost_points = available_points-RT_points,
              RT_percent_lost_points = 
                100*round(sum(`RT_lost_points`/Total_Lost_Points[1,1],
                              na.rm = TRUE),2))%>%
    filter(`Fiction-Non` == value)
}

