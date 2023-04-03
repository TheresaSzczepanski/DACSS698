

source('dependencies.R')


## Function Read-in Item

#Item analysis Read in Function: Input: sheet_name, subject, grade; return: student item report for a given grade level and subject.

#subject must be: "math", "ela", or "science"

read_item<-function(sheet_name, subject, grade){
  subject_item<-case_when(
    subject == "science"~"sitem",
    subject == "math"~"mitem",
    subject == "ela"~"eitem"
  )
  if(subject == "science"){
    read_excel("data/2022MCASItemAnalysis.xlsx", sheet = sheet_name,
              skip = 1, col_names= c(subject_item, "Type", "Reporting Category", "Standard", "item Desc", "delete", "item Possible Points","RT Percent Points", "State Percent Points", "RT-State Diff", "Science Practice Category")) %>%
      select(!contains("delete"))%>%
      filter(!str_detect(sitem,"Legend|legend"))%>%
      mutate(sitem= as.character(sitem))%>%
      separate(c(1), c("sitem", "delete"))%>%
      select(!contains("delete"))%>%
      mutate(sitem =
              str_c(subject_item, sitem))
  }
  else if(subject == "math" && grade < 10){
    read_excel("data/2022MCASItemAnalysis.xlsx", sheet = sheet_name,
              skip = 1, col_names= c(subject_item, "Type", "Reporting Category", "Standard", "item Desc", "delete", "item Possible Points","delete","RT Percent Points", "State Percent Points", "RT-State Diff"))%>%
      select(!contains("delete"))%>%
      filter(!str_detect(mitem,"Legend|legend"))%>%
      mutate(mitem = as.character(mitem))%>%
      separate(c(1), c("mitem", "delete"))%>%
      select(!contains("delete"))%>%
      mutate(mitem =
              str_c(subject_item, mitem))

  }
  else if(subject == "math" && grade == 10){
    read_excel("data/2022MCASItemAnalysis.xlsx", sheet = sheet_name,
              skip = 1, col_names= c(subject_item, "Type", "Reporting Category", "Standard", "item Desc", "delete", "item Possible Points","RT Percent Points", "State Percent Points", "RT-State Diff"))%>%
      select(!contains("delete"))%>%
      filter(!str_detect(mitem,"Legend|legend"))%>%
      mutate(mitem = as.character(mitem))%>%
      separate(c(1), c("mitem", "delete"))%>%
      select(!contains("delete"))%>%
      mutate(mitem =
              str_c(subject_item, mitem))

  }

}
SG9_item <-read_item("SG9Physics", "science", 9)
SG9_item