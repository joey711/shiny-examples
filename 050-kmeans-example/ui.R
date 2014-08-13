# http://stackoverflow.com/questions/20637248/shiny-4-small-textinput-boxes-side-by-side
# http://getbootstrap.com/2.3.2/base-css.html#forms
numericInputRow <- function(inputId, label, value, min = NA, max = NA, step = NA, class="input-small", ...){
  inputTag <- tags$input(id = inputId, type = "number", value = value, class=class, ...)
  if (!is.na(min)) 
    inputTag$attribs$min = min
  if (!is.na(max)) 
    inputTag$attribs$max = max
  if (!is.na(step)) 
    inputTag$attribs$step = step
  div(style="display:inline-block",
      #class="controls controls-row",
      tags$label(label, `for` = inputId), 
      inputTag)
}

ui = navbarPage(
  title = "K-means example",
  tabPanel(
    title = "K-Means", 
    fluidPage(
      headerPanel(title = 'Iris k-means clustering [headerPanel]', windowTitle = "windowTitle"),
      sidebarPanel(
        fluidRow(
          column(width = 12,
                 div(class='span6', selectInput('xcol', 'X', names(iris))),
                 div(class='span6', selectInput('ycol', 'Y', names(iris), selected=names(iris)[[2]])),
                 numericInputRow("clusters2a", "mini", value = 5, class = "input-mini"),
                 numericInputRow("clusters3a", "small", value = 5, min = 0, max = 10, step = 2),
                 numericInputRow("clusters4a", "small", value = 5, class = "input-small"),
                 numericInputRow("clustersSp1", "Span12", value = 5, class = "span12"),
                 numericInputRow("clustersSp2", "Span6", value = 5, class = "span6", placeholder=".span6"),
                 numericInputRow("clustersSp3", "Span6", value = 5, class = "span6", placeholder=".span6"),
                 numericInputRow("clusters4b", "medium", value = 5, class = "input-medium"),
                 numericInputRow("clusters4c", "medium", value = 5, class = "input-medium")
          )
        )
      ),
      column(width = 8, plotOutput('plot1')),
      fluidRow(
        column(width = 4, numericInput('clusters', 'k', 3, min = 1, max = 9, step = 1)),
        column(width = 4, 
               numericInputRow("clusters2", "K2", value = 5, class = "input-mini"),
               numericInputRow("clusters3", "K3", value = 5, min = 0, max = 10, step = 2)),
        column(width = 4, "Fluid 8")
      )
    )
  )
)
shinyUI(ui)

