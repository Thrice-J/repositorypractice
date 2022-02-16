#DATA 613 Classwork Dates and Times

library(tidyverse)
library(lubridate)  
library(dplyr)

#Instructions: Produce and submit an Rmarkdown file and a Word file
#the shows all required code and output.

#1) Use and show R code to extract the month from the following 
#   datetime designation:

datetime2 <- ymd_hms("2021-11-13 10:05:31")
datetime2

month(datetime2)

#2) Use and show R code to extract the day of the week from the following
#   datetime designation:

wday(datetime2, label = TRUE)

#3) Use and show R code to change the month to 8, and the hour to 5 for 
#   the following datetime designation:


8-> month(datetime2)
5-> hour(datetime2)
datetime2

#or using update

update(datetime2, month = 8, hour = 5)


#4) Use and show R code to change 6 hours to seconds. 

dhours(6)

#5) Use and show R code to change 4 days to seconds.

ddays(4)

#6) Use and show R code to add 7years to 30 days.

years(7) + days(30)

#7 Use and show R code to determine how many weeks there are 
#  from today's date to a year from now.

next_year <- today() + years(1)

(today() %--% next_year)%/%weeks(1)
#note %/% indicates integer division

(today() %--% next_year)/weeks(1)


#8) Use and show R code to determine how many days there are between 
#   today's date and June 28, 2022.

(today() %--% ("2022-06-28"))/days(1)
