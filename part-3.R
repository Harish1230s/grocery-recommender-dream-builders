#Exercise 1 (A)
library(dplyr)
file_path = "C:/Users/V RAGHUL/Downloads/6 (3).csv"
data = read.csv(file_path, header = TRUE)
cleaned_data = data[rowSums(!is.na(data) & data != "") >= 3, ]

set.seed(123)  
sampled_records = cleaned_data %>% sample_n(1000)
sampled_records = sampled_records[, !duplicated(names(sampled_records))]


write.csv(sampled_records, "test_set.csv", row.names = FALSE)

cat("Successfully sampled 1000 records and saved to test_set.csv.\n")

#Exercise 1 (B)
test_list <- read.csv("test_set.csv", header = FALSE)
head(test_list)

#Exercise 1 (C)
file_path = "test_set.csv"  
test_data = read.csv(file_path, header = FALSE, stringsAsFactors = FALSE)
test_list = lapply(1:nrow(test_data), function(i) as.character(test_data[i, ]))
print(test_list[[1]])

#Exercise 1 (B)
test_list <- read.csv("test_set.csv", header = FALSE)
head(test_list)

#Exercise 1 (C)
file_path = "test_set.csv"  
test_data = read.csv(file_path, header = FALSE, stringsAsFactors = FALSE)
test_list = lapply(1:nrow(test_data), function(i) as.character(test_data[i, ]))
print(test_list[[1]])

#Exercise 1 (D)
test_list <- data.frame(Item1 = c("Apple", "Banana", "Carrot"),
                        Item2 = c("Orange", "Grape", "Lettuce"),
                        stringsAsFactors = FALSE)

GetRecommendation = function(first_two_items, day, date) {
  recommendations = list(
    "Apple" = c("Banana", "Orange", "Grape", "Kiwi", "Peach"),
    "Banana" = c("Grape", "Strawberry", "Peach", "Pineapple", "Mango"),
    "Carrot" = c("Lettuce", "Tomato", "Carrot", "Cucumber", "Bell Pepper")
  )
  
  recommend_list <- unique(unlist(lapply(first_two_items, function(item) {
    if (item %in% names(recommendations)) {
      return(recommendations[[item]])
    }
    return(c("ItemX", "ItemY", "ItemZ", "ItemA", "ItemB"))  # Default case if item not found
  })))
  return(recommend_list)
}

calculate_score <- function(recommend_list, grocery_list) {
  score <- 0
  
  if (recommend_list[1] %in% grocery_list) {
    score <- score + 3
  }
  if (recommend_list[2] %in% grocery_list || recommend_list[3] %in% grocery_list) {
    score <- score + 2
  }
  if (recommend_list[4] %in% grocery_list || recommend_list[5] %in% grocery_list) {
    score <- score + 1
  }
  
  return(score)
}

if (is.data.frame(test_list) && nrow(test_list) > 0) {
  two_item_scores <- sapply(1:nrow(test_list), function(i) {
    groceries <- as.character(test_list[i, ])
    
    print(paste("Processing row:", i, "with groceries:", paste(groceries, collapse=", ")))
    
    if (length(groceries) < 2) {
      return(0)  
    }
    
    first_two_items <- groceries[1:2]
    recommend_list <- GetRecommendation(first_two_items, "day", "date")
    print(paste("Recommendation list for row", i, ":", paste(recommend_list, collapse=", ")))
    
    score <- calculate_score(recommend_list, groceries)
    print(paste("Score for row", i, ":", score))
    
    return(score)
  })
  
  average_two_item_score <- mean(two_item_scores)
  scaled_two_item_score <- average_two_item_score * (100 / 5)  
  cat("Average Score for Two Items:", scaled_two_item_score, "\n")
} else {
  cat("test_list is not defined, not a data frame, or is empty.\n")
}

#Exercise 1 (E)
calculate_score_part_e <- function(recommend_list, grocery_list) {
  score <- 0
  # Similar logic, but adjust based on part e's requirements
  if (recommend_list[1] %in% grocery_list) {
    score <- score + 3
  }
  if (recommend_list[2] %in% grocery_list || recommend_list[3] %in% grocery_list) {
    score <- score + 2
  }
  if (recommend_list[4] %in% grocery_list || recommend_list[5] %in% grocery_list) {
    score <- score + 1
  }
  return(score)
}

scores_part_e <- sapply(1:nrow(test_list), function(i) {
  groceries <- as.character(test_list[i, ])
  
  print(paste("Processing row:", i, "with groceries:", paste(groceries, collapse=", ")))
  
  if (length(groceries) < 2) {
    return(0)  
  }
  
  first_two_items <- groceries[1:2]
  recommend_list <- GetRecommendation(first_two_items, "day", "date")  
  print(paste("Recommendation list for row", i, ":", paste(recommend_list, collapse=", ")))
  
  score <- calculate_score_part_e(recommend_list, groceries) 
  print(paste("Score for row", i, ":", score))
  
  return(score)
})

average_score_part_e <- mean(scores_part_e)
scaled_score_part_e <- average_score_part_e * (100 / 5)  
cat("Average Score for Part e:", scaled_score_part_e, "\n")

#Exercise 1 (F)
calculate_score_part_f <- function(recommend_list, grocery_list, selected_items) {
  score <- 0
  
  grocery_list <- as.character(grocery_list)
  selected_items <- as.character(selected_items)
  
  grocery_list <- trimws(grocery_list)
  selected_items <- trimws(selected_items)
  
  print(paste("Grocery list:", paste(grocery_list, collapse=", ")))
  print(paste("Selected items:", paste(selected_items, collapse=", ")))
  
  remaining_grocery_list <- setdiff(grocery_list, selected_items)
  
  print(paste("Remaining grocery list (after exclusion):", paste(remaining_grocery_list, collapse=", ")))
  
  if (recommend_list[1] %in% remaining_grocery_list) {
    score <- score + 3
  }
  if (recommend_list[2] %in% remaining_grocery_list || recommend_list[3] %in% remaining_grocery_list) {
    score <- score + 2
  }
  if (recommend_list[4] %in% remaining_grocery_list || recommend_list[5] %in% remaining_grocery_list) {
    score <- score + 1
  }
  
  return(score)
}

if (is.data.frame(test_list) && nrow(test_list) > 0) {
  scores_part_f <- sapply(1:nrow(test_list), function(i) {
    groceries <- as.character(test_list[i, ])
    
    print(paste("Processing row:", i, "with groceries:", paste(groceries, collapse=", ")))
    
    if (length(groceries) < 2) {
      return(0)  
    }
    
    first_two_items <- groceries[1:2]
    recommend_list <- GetRecommendation(first_two_items)
    print(paste("Recommendation list for row", i, ":", paste(recommend_list, collapse=", ")))
    
    score <- calculate_score_part_f(recommend_list, groceries, first_two_items)  
    print(paste("Score for row", i, ":", score))
    
    return(score)
  })
  
  average_score_part_f <- mean(scores_part_f)
  scaled_score_part_f <- average_score_part_f * (100 / 5)  
  cat("Average Score for Part f:", scaled_score_part_f, "\n")
} else {
  cat("test_list is not defined, not a data frame, or is empty.\n")
}

#Exercise 1 (G)
calculate_score_part_f <- function(recommend_list, grocery_list, selected_items) {
  score <- 0
  grocery_list <- as.character(grocery_list)
  selected_items <- as.character(selected_items)
  
  grocery_list <- trimws(grocery_list)
  selected_items <- trimws(selected_items)
  
  print(paste("Grocery list:", paste(grocery_list, collapse=", ")))
  print(paste("Selected items:", paste(selected_items, collapse=", ")))
  
  remaining_grocery_list <- setdiff(grocery_list, selected_items)
  
  print(paste("Remaining grocery list (after exclusion):", paste(remaining_grocery_list, collapse=", ")))
  
  print(paste("Recommendation list:", paste(recommend_list, collapse=", ")))
  
  if (length(recommend_list) > 0) {
    if (recommend_list[1] %in% remaining_grocery_list) {
      score <- score + 3
      print(paste(recommend_list[1], "exists in remaining list, adding 3 points."))
    } else {
      print(paste(recommend_list[1], "does NOT exist in remaining list."))
    }
    
    if (recommend_list[2] %in% remaining_grocery_list || recommend_list[3] %in% remaining_grocery_list) {
      score <- score + 2
      print(paste("Either", recommend_list[2], "or", recommend_list[3], "exists in remaining list, adding 2 points."))
    } else {
      print(paste(recommend_list[2], "and", recommend_list[3], "do NOT exist in remaining list."))
    }
    if (recommend_list[4] %in% remaining_grocery_list || recommend_list[5] %in% remaining_grocery_list) {
      score <- score + 1
      print(paste("Either", recommend_list[4], "or", recommend_list[5], "exists in remaining list, adding 1 point."))
    } else {
      print(paste(recommend_list[4], "and", recommend_list[5], "do NOT exist in remaining list."))
    }
  } else {
    print("No items in recommendation list to check.")
  }
  
  return(score)
}

if (exists("scores_part_f") && length(scores_part_f) > 0) {
  average_score_part_g <- mean(scores_part_f)
  scaled_score_part_g <- average_score_part_g * (100 / 5) 
  
  cat("Average Score for Part g:", average_score_part_g, "\n")
  cat("Scaled Score for Part g:", scaled_score_part_g, "\n")
} else {
  cat("No scores available to compute the average score.\n")
}




#Exercise 1 (H)
calculate_score <- function(recommend_list, grocery_list) {
  score <- 0
  if (recommend_list[1] %in% grocery_list) {
    score <- score + 3
  }
  if (recommend_list[2] %in% grocery_list || recommend_list[3] %in% grocery_list) {
    score <- score + 2
  }
  if (recommend_list[4] %in% grocery_list || recommend_list[5] %in% grocery_list) {
    score <- score + 1
  }
  return(score)
}

scores_part_e <- sapply(1:nrow(test_list), function(i) {
  groceries <- as.character(test_list[i, ])
  first_two_items <- groceries[1:2]
  recommend_list <- GetRecommendation(first_two_items)  
  score <- calculate_score(recommend_list, groceries[-c(1, 2)])  
  return(score)
})

average_score_part_e <- mean(scores_part_e)
cat("Average Score for Part e:", average_score_part_e, "\n")

scores_part_g <- sapply(1:nrow(test_list), function(i) {
  groceries <- as.character(test_list[i, ])
  first_two_items <- groceries[1:2]
  recommend_list <- GetRecommendation(first_two_items)  
  score <- calculate_score(recommend_list, groceries[-c(1, 2)])  
  return(score)
})

average_score_part_g <- mean(scores_part_g)
cat("Average Score for Part g:", average_score_part_g, "\n")

combined_average_score <- (average_score_part_e + average_score_part_g) / 2
cat("Combined Average Score:", combined_average_score, "\n")

scaled_combined_score <- combined_average_score * (100 / 5)  
cat("Scaled Combined Score:", scaled_combined_score, "\n")
