#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

source('server.R')
source('ui.R')


# Run the application 
shinyApp(ui = ui, server = server)
#runExample("02_text")
#runExample("03_reactivity")
#runExample("01_hello")
