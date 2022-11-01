library(ISLR)
library(readr)

# Load list of datasets
datasets <- data(package = "ISLR")
# Pull out vector of dataset names
dataset_names <- datasets$results[,"Item"]

# Create directory to save the .csv files
dir_for_data <- "data"
dir.create(dir_for_data)

# Function to save a dataset to a csv given its name
save_dataset_to_csv <- function(dataset_name){
  data(list = dataset_name)
  dataset_to_save <- get(dataset_name)
  if(!is.data.frame(dataset_to_save)){
    return(paste0("Failed to save ", dataset_name))
  }
  write_csv(dataset_to_save, file = paste0(dir_for_data, "/", dataset_name, ".csv"))
  return(paste0("Saved ", dataset_name))
}

# save_dataset_to_csv("iris")

sapply(dataset_names, save_dataset_to_csv)
