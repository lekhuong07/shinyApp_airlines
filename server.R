library(shiny)

#Each shiny part in this R.sciprt is a function that needs to do in the user interface (ui).
#Mainly we have different types of plots.

shinyServer(function(input,output){

  #shiny1
  output$view = renderTable({
    dataset = select(air_passenger,1:min(input$vars,length(air_passenger)))
    head(dataset,n = input$obss)
  })
  
  output$summary = renderPrint({
    summary(air_passenger)
  })
  
  #shiny2
  output$dep_plot = renderPlot({
    
    dataset = filter(air_passenger,air_passenger$Passenger.Count >= input$pas_min)
    
    ggplot(dataset)+
      geom_jitter(aes(x = GEO.Region,y = Passenger.Count))
    
  })
  
  
  output$di_plot = renderPlot({
    dataset = air_passenger[1:input$obsss,]
    
    di = dataset %>%
      group_by(GEO.Summary) %>%
      summarise(passenger = sum(Passenger.Count),
                count = n())
    
    ggplot(di)+
      geom_bar(aes(x = GEO.Summary,y = passenger,fill = count),stat = "identity")
    
  })
  
 #shiny3
  output$hist_plot = renderPlot({
    ggplot(air_passenger)+
      geom_histogram(aes(Passenger.Count),bins = input$bins)
  })
  
  
  output$point_plot = renderPlot({
    dataset = passenger_count[1:input$obs,]
    ggplot(dataset,aes(x = count,y = passenger))+
      geom_point()+
      geom_smooth()
  })
  
  
  #added
  output$model = renderPrint({
    lm(Passenger.Count~
         Operating.Airline.IATA.Code + GEO.Summary + GEO.Region + Price.Category.Code,data = air_passenger)
  })})

