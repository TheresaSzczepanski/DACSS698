##Student Performance Functions

## Median RT % points earned vs. State % points earned:
# To-Do: Create Private Raw Item report and read in function, join to student
# item and calculate strict percent points earned and points available to get,
# authentic RT-State diff

ELA_NumText_RTState<-function(value, subjectItemDF){
  subjectItemDF%>%
    select(contains("item"), `Num Texts`, `RT-State Diff`, `State Percent Points`,
           `RT Percent Points`)%>%
    group_by(`Num Texts`)%>%
    summarise(median_RTSTateDiff = median(`RT-State Diff`, na.rm = TRUE))%>%
    filter(`Num Texts`==value)
}
ELA_Fiction_RTState<-function(value, subjectItemDF){
  subjectItemDF%>%
    select(contains("item"), `Fiction-Non`, `RT-State Diff`, `State Percent Points`,
           `RT Percent Points`)%>%
    group_by(`Fiction-Non`)%>%
    summarise(median_RTSTateDiff = median(`RT-State Diff`, na.rm = TRUE))%>%
    filter(`Fiction-Non`==value)
}

