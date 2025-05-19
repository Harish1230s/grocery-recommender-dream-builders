
library(tidyr)


# Exercise 1(a): Read the data
data <- read.csv("C:\\Users\\Brighton\\Desktop\\6.csv", header = TRUE, sep = ",")
View(data)
str(data)


# Print column names to identify the correct names
print(colnames(data))

# Exercise 1(b): Clean the data
# Reshape the data to long format
clean_data <- data %>%
  pivot_longer(cols = starts_with("Item_"), 
               names_to = "item", 
               values_to = "item_name") %>%
  filter(!is.na(item_name)) %>%
  distinct()

# View the cleaned data
print(head(clean_data))

# Exercise 1(c): Top three items bought with milk
top_milk <- clean_data %>%
  filter(item_name %in% clean_data$item_name[grepl("milk", item_name, ignore.case = TRUE)]) %>%
  count(item_name) %>%
  top_n(3) %>%
  arrange(desc(n))
print("Top 3 items bought with milk:")
print(top_milk)

# Exercise 1(d): Top three items bought with candy
top_candy <- clean_data %>%
  filter(item_name %in% clean_data$item_name[grepl("candy", item_name, ignore.case = TRUE)]) %>%
  count(item_name) %>%
  top_n(3) %>%
  arrange(desc(n))
print("Top 3 items bought with candy:")
print(top_candy)

# Exercise 1(e): Top three items bought with onion
top_onion <- clean_data %>%
  filter(item_name %in% clean_data$item_name[grepl("onion", item_name, ignore.case = TRUE)]) %>%
  count(item_name) %>%
  top_n(3) %>%
  arrange(desc(n))
print("Top 3 items bought with onion:")
print(top_onion)

# Exercise 1(f): Top three items bought with turtle
top_turtle <- clean_data %>%
  filter(item_name %in% clean_data$item_name[grepl("turtle", item_name, ignore.case = TRUE)]) %>%
  count(item_name) %>%
  top_n(3) %>%
  arrange(desc(n))
print("Top 3 items bought with turtle:")
print(top_turtle)

# Exercise 1(g): Create the recommendation function
GetRecommendation <- function(cart_list, day, date) {
  # Placeholder logic for recommendations
  recommendations <- c("item1", "item2", "item3")  # Replace with actual logic
  return(recommendations)
}

# Exercise 1(h): Recommendation lists
recommendation1 <- GetRecommendation(c("tropical fruit", "sliced cheese", "rolls/buns"), "Friday", "7/21/2023")
recommendation2 <- GetRecommendation(c("whipped/sour cream", "brown bread"), "Tuesday", "5/30/2023")

print("Recommendation for first cart:")
print(recommendation1)
print("Recommendation for second cart:")
print(recommendation2)