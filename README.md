`generate_codenames_pin.rmd` creates a table of usernames and codenames that is pinned to RStudio Connect.  The RMD is published to Connect and scheduled to run daily, providing a fresh pin of codenames for downstream use.

`app.r` is a bare-bones Shiny app that consumes the codenames pin and returns the codename of the logged in user viewing the app.
