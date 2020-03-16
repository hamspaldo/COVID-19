# functions working for pie chart
pie_confirmed <-  confirmed %>% # "country"   "date"      "Confirmed"
  filter(date == max(date)) %>%
  group_by(country) %>%
  summarise(Confirmed_Total=sum(Confirmed)) %>% 
  mutate(ranking = dense_rank(desc(Confirmed_Total))) %>%
  filter(ranking <= 8) %>%
  mutate(per=Confirmed_Total/sum(Confirmed_Total)) %>%
  
  ggplot(aes(x="", y=Confirmed_Total, fill=fct_reorder(country, per, .desc = TRUE))) + # !!to unquote
  geom_bar(stat="identity", width=1, color="white") +
  geom_text(aes(label = paste(round(Confirmed_Total / sum(Confirmed_Total) * 100, 1), "%")),
            position = position_stack(vjust = 0.5)) +
  coord_polar("y", start=0) + theme_void() +
  #labs(title = title,subtitle = paste0(glue(dateforplot))) +
  scale_fill_brewer(palette="Oranges")


pie_chart2 <- function(df, group_var, title="") {
  group_var <- enquo(group_var)
  df %>% # "country"   "date"      "Confirmed"
    filter(date == max(date)) %>%
    group_by(!!group_var) %>%
    summarise(Confirmed_Total=sum(Confirmed)) %>% 
    mutate(ranking = dense_rank(desc(Confirmed_Total))) %>%
    filter(ranking <= 8) %>%
    mutate(per=Confirmed_Total/sum(Confirmed_Total)) %>%
    
    ggplot(aes(x="", y=Confirmed_Total, fill=fct_reorder(!!group_var, per, .desc = TRUE))) + # !!to unquote
    geom_bar(stat="identity", width=1, color="white") +
    geom_text(aes(label = paste(round(Confirmed_Total / sum(Confirmed_Total) * 100, 1), "%")),
              position = position_stack(vjust = 0.5)) +
    coord_polar("y", start=0) + theme_void() +
    #labs(title = title,subtitle = paste0(glue(dateforplot))) +
    scale_fill_brewer(palette="Oranges")

}


pie_chart2(df=confirmed, group_var=country, title="")

pie_chart2(df=recovered, group_var=country, title="")

pie_chart2(df=confirmed, group_var=country, title="")



