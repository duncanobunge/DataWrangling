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
library(dplyr)
library(magrittr)
x %>% head(
  select(room_nights, review_score),2)

head(
     select(
       filter(
         bookings,price_per_night < 80
         ),
         room_nights,review_score
         ),
       2
     )
#find all bookings done on wednesday and return 
#property id and booking status
bookings %>% 
        filter(checkin_day =="wed") %>% 
        select(property_id,status)

#load ggplot
library(ggplot2)
#plot an histogram
 ggplot(bookings, aes(x=review_score)) + geom_histogram()
 
#scatter plot
 bookings %>% 
    ggplot(aes(x = price_per_night,y=review_score)) + geom_point()

 bookings %>% filter(room_nights >= 7 & status=="stayed") %>%  
        select(price_per_night,review_score) %>% 
       ggplot(aes(x =review_score, y=price_per_night))+geom_point()
 
 #dplyr mutate fxn-add a new column
 bookings %>% mutate(mean_centered =price_per_night - mean(price_per_night))
#summarise many rows to one row
 bookings %>% 
         summarise(
           n = n(),
           n_miss = sum(is.na(review_score)),
           review_score = mean(review_score,na.rm = TRUE))

 bookings %>% 
         summarise(
           n = n(),
           n_stayedbooking = sum(status == "stayed"),
           mean_tt_price  = mean(price_per_night, na.rm=TRUE)
         )
 
 bookings %>% 
       group_by(for_business) %>% 
     summarise(
       n = n(),
       review_mean = mean(review_score, na.rm = TRUE)
       )
 
 bookings %>% 
   count(for_business,status)
 
 #tidyr
 library(tidyverse)
 #joining dataframes based on a common column
xdata<- bookings %>%  full_join(properties)
 
 #handling missing values
#xdata %>% drop.na() on any column or specified column

#data reshaping  usisng gather or spread fxn

 
 