library(tidyverse)
library(rvest)

## Using this website for the data:
website <- "https://evadoption.com/ev-sales/evs-percent-of-vehicle-sales-by-brand/"

## Reading its html
website_data<-read_html(website)

## Finding the table on the website, essentially parsing through the html to do so
table <- website_data %>% 
  html_nodes(css = "table") %>%
  html_table(fill = TRUE)

## Filtering the data to only what is necessary, i.e.
## market shares of firms and the firms themselves.
## Only keeping firms that produced EVs.
filtered_table <- table[[1]] %>%
  mutate(perc = as.numeric(sub("%","",`US % EV Sales`))) %>%
  filter(perc > 0.00) %>%
  arrange(desc(perc)) %>%
  select(Brand, perc)

## Starting a variable to calculate to the Herfindahl-Hirschman Index of
## the ev market
hhi <- 0

## Herfindahl-Hirschman Index formula: "squaring the market share of each firm
## competing in the market and then summing the resulting numbers"
## https://www.justice.gov/atr/herfindahl-hirschman-index#:~:text=The%20term%20%E2%80%9CHHI%E2%80%9D%20means%20the,then%20summing%20the%20resulting%20numbers.

## Going through each firm, squaring the market share and adding it to hhi variable
for(i in 1:length(filtered_table$perc)) {
  hhi <- hhi + (filtered_table$perc[i]*filtered_table$perc[i])
}

## Finally printing the hhi variable
print(paste0("Herfindahl-Hirschman Index of EV Market: ", hhi))
