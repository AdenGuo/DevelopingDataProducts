library(shiny)

load("package_list")

shinyUI(
  pageWithSidebar(
    headerPanel("R Package Recommendation"),
    sidebarPanel(
      p(em("Documentation:",a("User Guide",href="index.html"))),
      selectizeInput("ipackage1", "Choose the 1st R package you have used frequently:", 
                  choices = package_name, options = list(maxOptions = 3000)),
      selectizeInput("ipackage2", "Choose the 2nd R package you have used frequently:", 
                  choices = package_name, options = list(maxOptions = 3000)),
      selectizeInput("ipackage3", "Choose the 3rd R package you have used frequently:", 
                  choices = package_name, options = list(maxOptions = 3000)),
      sliderInput('ilength', 'The number of recommendations you want: ', min = 5, max  = 30, value = 10, step = 5)
      ),
    mainPanel("Recommended Packages for you:",
              
              tableOutput("view")
              )
    ) 
  )