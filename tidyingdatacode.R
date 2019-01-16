#load tidyverse package after installing it
library(tidyverse)

#load dataset bookings
bookings<- read.csv("C:/Users/Bildad/Documents/Project/tidyingData/bookings.csv", header=TRUE)
View(bookings)
#load dataset properties
properties<- read.csv("C:/Users/Bildad/Documents/Project/tidyingData/properties.csv", header=TRUE)
properties

#dplyr package- fxns are verbs,1st arg is data frame
#returns data frame. subsequent args references colunm
#use select()

rbk <- select(bookings,review_score)
rbk

filter(bookings, status =="stayed" & is.na(review_score))
x<- filter(bookings, price_per_night < 80)
x <- select(x, room_nights, review_score)
x

#magrittr - use of pipe
x %>% head(
  select(room_nights, review_score),2)

#concatenated
x %>% head(filter(bookings, price_per_night < 80),
           select(room_nights, review_score),2)
