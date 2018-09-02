library(shiny)


shinyUI(navbarPage("START",
  tabPanel("1st", fluidPage(
      sidebarLayout(
      #side
        sidebarPanel(numericInput(inputId = "obss",
                                  label = h3("Observations"),
                                  value = 10),
        numericInput(inputId = "vars",
                     label = h3("Variables"),
                     value = 4)),
      #main
      mainPanel(
        h1("Air Traffic Passenger Statistics",align = "center"),
        h3("Head of the dataset"),
        tableOutput("view"),
        h3("Dataset summary"),
        verbatimTextOutput("summary"))))),
  
  tabPanel("2nd", fluidPage(
      sidebarLayout(
      #side
        sidebarPanel(h1("Sidebar title"),
                     sliderInput(inputId = "pas_min", 
                     label = h3("Minimum passegner"),
                     min = 0, max = 200000, value = 100)),
      #main
        mainPanel(h1("Passenger vs. Region"),
                  plotOutput("dep_plot"),
                  h3("Plot: number of passengers
                      which is larger than a given value for different Region.
                      At last we can find that only 
                      US airlines meet the requirment"))))),
                   
  tabPanel("3th",fluidPage(
    sidebarLayout(
    #side
      sidebarPanel(h1("Sidebar title"),
                   sliderInput(inputId = "obsss", 
                   label = h3("Observasions"),
                   min = 0, max = 17959, value = 100)),
    #main
      mainPanel(h1("Domestic VS. International"),
                plotOutput("di_plot"),
                h3("With more and more observasions we input, 
                  the y-aixs keep changing, but it is interesting to
                  find that the height of two group doesn't change too much
                  which means the proportion of domestic and international 
                  is almost the same"))))),
                   
  tabPanel("4th", fluidPage(
    sidebarLayout(
    #side
      sidebarPanel(numericInput(inputId = "bins",
                              label = h3("number of bins"),
                              value = 10)),
    #main
      mainPanel(h1("Distribution of passenger",align = "center"),
                plotOutput("hist_plot"),
                h3("This is a pure distribution of passenger, when we
                   increase the number of bins we can find that the histogram
                   keep move to left which means the distribution is left-skew"))))),
                   
  tabPanel("5th", fluidPage(
    sidebarLayout(
    #side
      sidebarPanel(sliderInput(inputId = "obs", 
                               label = h3("observation"),
                               min = 0, max = 70, value = 20)),
    #main
      mainPanel(h1("Passenger Vs. Occruence of Airline",align = "center"),
                plotOutput("point_plot"),
                h3("The more occurrence of airlines, the more average passengers.
                   From this point, we conclude that more larger airlines, fly more times"))))),
  
  tabPanel("6th", fluidPage(sidebarLayout(
    #side
      sidebarPanel(helpText(h1("Regression Model passenger and other variables"))),
    #main
      mainPanel(verbatimTextOutput("model")))))))
