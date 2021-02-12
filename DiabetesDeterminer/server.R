#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(caret)
library(shinythemes)
library(MASS)
library(mlbench)

#Creating the model using logistic regression
data(PimaIndiansDiabetes2,package="mlbench")
newDiabetesData<- na.omit(PimaIndiansDiabetes2)
model<- glm(diabetes~.,family=binomial,data=newDiabetesData)
bestmodel<- stepAIC(model,direction="both",trace=0)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    predictmodel<- reactive({
        inputDiabetes<- data.frame(pregnant=input$pregnant,glucose=input$glucose,pressure=input$pressure, triceps=input$triceps,insulin=input$insulin,mass=input$mass,pedigree=input$pedigree,age=input$age)
        predict(bestmodel,newdata=inputDiabetes,type="response")
    })
    
    output$result <- renderText({
        if (predictmodel()>0.5){
            return("You most likely have diabetes")
        } else {
            return("You most likely don't have diabetes")
        }
    })
    
    output$probability <- renderText({
        return(paste0("You have a ",round((predictmodel())*100,digits=3),"% chance of having diabetes"))
    })
    
    output

})
