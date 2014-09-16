library(shiny)
load("distance_matrix")




shinyServer(
  function(input, output){
    datasetInput <- reactive({
      packges_distance <- distances[input$ipackage1,] + distances[input$ipackage2,] + distances[input$ipackage3,]
      packges_distance <- packges_distance[names(packges_distance) != input$ipackage1 & 
                                           names(packges_distance) != input$ipackage2 &
                                           names(packges_distance) != input$ipackage3 ]
      packges_distance <- packges_distance[order(packges_distance)]
      return(names(packges_distance[1:input$ilength]))
    })
       
    output$summary <- renderPrint({

    })
    output$view <- renderTable({
      head(data.frame(rank = 1:length(datasetInput()), name = datasetInput()), n = length(datasetInput()))
    })
  }
  
  
  )