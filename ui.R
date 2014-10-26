# The application must include the following:
#   
#   Some form of input (widget: textbox, radio button, checkbox, ...)
# Some operation on the ui input in sever.R
# Some reactive output displayed as a result of server calculations
# You must also include enough documentation so that a novice user could use your application.
# The documentation should be at the Shiny website itself. Do not post to an external link.
# The Shiny application in question is entirely up to you. However, if you're having trouble coming up with ideas, you could start from the simple prediction algorithm done in class and build a new algorithm on one of the R datasets packages. Please make the package simple for the end user, so that they don't need a lot of your prerequisite knowledge to evaluate your application. You should emphasize a simple project given the short time frame.  


library(shiny)

# User interface (UI) for shiny, dealing with miles per gallon in relation to different parameters
shinyUI(pageWithSidebar(
  headerPanel("Miles Per Gallon"),
  
  
  sidebarPanel(
    h3("Preferences"),
    selectInput("var", "Variable:",
                choices=c("Weight"="wt",
                     "Cylinders" = "cyl", 
                     "Horse Power"="hp",
                     "Transmission" = "am", 
                     "Gears" = "gear")),
    
    "linearfit"  
  ),
  
#   Main panel with plot and title
  mainPanel(
    h3(textOutput("title")),
    
    plotOutput("milesPlot"), 
    
    p("Linear Fit", textOutput("linearfit"))
  )
))