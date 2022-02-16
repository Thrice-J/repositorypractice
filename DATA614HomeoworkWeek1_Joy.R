#DATA 613 HOMEWORK Dates and Time

library(tidyverse)
library(nycflights13)
library(lubridate)  
library(dplyr)

#1) Use and show R coding to find the number of days from June 
#   6th 2020 to July 14th 2021

(("2020-06-06") %--% ("2021-07-14"))%/%days(1)

#2) Use and show R coding to confirm that the year 1988 was a leap year.

(("1988-01-01") %--% ("1989-01-01"))%/%days(1)
  #Shows there was 366 days in 1988 meaning leap year

#or 

leap_year(1988)

#3) Use and show R coding to confirm that the year 1989 was not a leap year.

(("1989-01-01") %--% ("1990-01-01"))%/%days(1)
  #Shows there was 365 days in 1989 meaning no leap year

#or

leap_year(1989)

#4) Why is there months() but no dmonths ? (Answer in 3 to four sentences)


    #months() gets or sets the month component of a date/time while dmonths()
    #would be used to find the duration in seconds of a certain number of
    #months. This typically works for units such as minutes and days because
    #there is a set number of seconds in each of those. However, months do 
    #not have a set number of days as some months have 30 days while others
    #may have 31 or even 28/29. So the number of seconds in a month depends on 
    #the number of days in a month which varies and therefore dmonths() cannot
    #provide an accurate answer.

#5) John was born April 11th, 1962. Use and show R coding to determine 
#   how old John is in years.

JohnsBDay <- ymd("1962-04-11")

(JohnsBDay %--% today())%/%years(1)
    #John is 59 years old. 

#6) Modify the flights_dt coding in the notes or the book to obtain the 
#   following partial data table shown below.  Show all required coding. 
#   (Most of the coding needed is provided in the notes)

make_datetime_100 <- function(year, month, day, time) {
  make_datetime(year, month, day, time %/% 100, time %% 100)
}

flights_dt <- flights %>% 
  filter(!is.na(dep_time), !is.na(arr_time)) %>% 
  mutate(
    dep_time = make_datetime_100(year, month, day, dep_time),
    arr_time = make_datetime_100(year, month, day, arr_time),
    sched_dep_time = make_datetime_100(year, month, day, sched_dep_time),
    sched_arr_time = make_datetime_100(year, month, day, sched_arr_time)
  ) %>% 
  select(origin, dest, carrier, arr_time, dep_time)
flights_dt
    #Note: the example says the tibble is 328,063x5 but only shows 4 columns.
    #I am assuming the missing column not depicted is dep_time due to Q7. 

#7) Now, using your table from #6, produce the frequency plot shown which 
#   conveys frequency counts for the months of April, July, and October 
#   for the year 2013.

    #Note in order to produce the table for question 6 I am assuming
    #the missing depicted column (variable) is dep_time.

flights_dt2 <- flights_dt %>%
  filter(month(dep_time) == 4 | month(dep_time) == 7 | month(dep_time) == 10)
flights_dt2

ggplot(data = flights_dt2) +
  geom_freqpoly(aes(x = dep_time), bins = 92)
  #Not sure how to make this continuous. 
  #Note 92 equals total number of days in the three months

flights_dt3 <- flights_dt %>%
  filter(month(dep_time) >= 4, month(dep_time) <= 10)
flights_dt3

ggplot(data = flights_dt3) +
  geom_freqpoly(mapping = aes(x = dep_time), bins = 92)
  #This is continuous but includes all dates from Apr through Oct.


#8) Now use dplyr functions to produce a data table that shows arrival 
#   times for American Airlines at the Dallas Fort Worth Airport from the 
#   LaGuardia airport in New York. Your output should show rows 115 to 125.

flights_dt4 <- flights_dt %>%
  filter(origin == "LGA", dest == "DFW", carrier == "AA")%>%
  select(origin, dest, carrier, arr_time) %>%
  slice(115:125)
flights_dt4

#9) Using the first two observational date time designations from your #8 table,
#   Use and show R code to confirm that there are 181 minutes time intervals 
#   between them.

("2013-01-09 16:16:00" %--% "2013-01-09 19:17:00")/minutes(1)


