library(shiny)

# Define UI for application that determines if you have diabetes based on input
shinyUI(fluidPage(

    # Application title
    titlePanel("Determine if you have Diabetes by inputting values below!"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            h3("Enter the data below and press submit"),
            numericInput("pregnant","Number of pregnancies",value=4,min=0,max=17,step=1),
            numericInput("glucose","Plasma glucose concentration",value=121,min=56,max=200,step=1),
            numericInput("pressure","Blood Pressure (mm Hg)",value=70,min=24,max=122,step=1),
            numericInput("triceps","Triceps Skin thickness (mm)",value=30,min=7,max=63,step=1),
            numericInput("insulin","serum Insulin (mu U/mL)",value=156,min=14,max=846,step=1),
            numericInput("mass","Body Mass Index",value=33,min=18,max=68,step=1),
            numericInput("pedigree","Diabetes Pedigree Function",value=0.5230,min=0.01,max=1.5,step=0.1),
            numericInput("age","Age",value=30,min=21,max=90,step=1),
            submitButton("submit")
        ),

        # Show the results of the algorithm
        mainPanel(
            h3("Result: "),
            h2(textOutput("result")),
            textOutput("probability")
        )
    )
))
