library(pacman)
p_load(dplyr,readr, glue, lubridate, gridExtra, kableExtra)
confirmed <- read_csv("csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Confirmed.csv") %>%
  mutate(
    key = paste(`Province/State`, `Country/Region`, sep = "_")
  )
  

deaths <- read_csv("csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Deaths.csv") %>%
  mutate(
    key = paste(`Province/State`, `Country/Region`, sep = "_")
  )

recovered <- read_csv("csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Recovered.csv")%>%
  mutate(
    key = paste(`Province/State`, `Country/Region`, sep = "_")
  )

confirmed[, 1:10] %>% sample_n(10) %>% kable("latex", booktabs=T, caption="Raw Data (Confirmed, First 10 Columns only)") %>% kable_styling(font_size=6, latex_options = c("striped", "hold_position", "repeat_header")) 






unique(confirmed$key)
confirmed$key

?glue()
mutate(confirmed,key=glue("{Province/State}{Country/Region}"))

glue({confirmed$`Province/State`},{confirmed$`Country/Region`})

names(confirmed)
