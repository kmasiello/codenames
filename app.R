library(shiny)
library(pins)
library(dplyr)

#bring in our codename table
board <- board_rsconnect()
codenames <- pin_read(board, "katie.masiello/codenames")

ui <- fluidPage(
  mainPanel(
    h1(textOutput("greeting")),
    h2("Today, you shall be known as..."),
    h2(textOutput("codename"))
  )
)

server <- function(input, output, session) {
  if(Sys.getenv("R_CONFIG_ACTIVE") == "rsconnect") {
    user_name <- session$user
  } else {
    user_name <- "katie.masiello"
  }


  user_codename <- codenames %>% filter(username == user_name) %>% pull(codname)

  output$greeting <- renderText(
    {paste("Hello, secret agent", user_name)}
    )

  output$codename <- renderText(user_codename)

}

shinyApp(ui, server)
