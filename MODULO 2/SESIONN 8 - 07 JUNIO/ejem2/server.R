library(shiny)

shinyServer(function(input, output) {
    
    output$output_text <- renderText(paste("Grafico de", input$y, " ~", input$x))     # input$x es la selección que se hizo en la UI
    
    output$output_plot <- renderPlot(plot(as.formula(paste(input$y, "~", input$x)),
                                          data = mtcars))
}
)