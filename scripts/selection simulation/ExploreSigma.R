#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Find selection gradient"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            numericInput("sigma", label = h3("Sigma"), value = 1),
            numericInput("opt", label = h3("Optimum phenotype"), value = 5),
            numericInput("min", label = h3("Minimum phenotype"), value = 0),
            numericInput("max", label = h3("Maximum phenotype"), value = 10),
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
      obs <- seq(from=input$min, to=input$max, length.out=100)
      numer <- (obs - input$opt)^2
      denom <- (2 * input$sigma)^2
      w <- exp(-(numer / denom))
        # draw the histogram with the specified number of bins
plot(x=obs, y=w,
     ylim=c(0,1),
     xlab = 'phenotypes',
     ylab = "fitness",
     main = 'Distribution of fitnesses')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
