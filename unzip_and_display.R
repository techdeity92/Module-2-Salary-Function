# Load necessary libraries
if (!require("utils")) install.packages("utils", repos = "https://cloud.r-project.org/")
library(utils)

# Get the zip file path from the command line arguments
args <- commandArgs(trailingOnly = TRUE)

if (length(args) == 0) {
  cat("Error: No zip file path provided.\n")
  quit(status = 1)
}

zip_path <- args[1]

# Check if the zip file exists
if (!file.exists(zip_path)) {
  cat("Error: Zip file not found at", zip_path, "\n")
  quit(status = 1)
}

# Unzip the file
unzip(zip_path, exdir = tempdir())
csv_path <- file.path(tempdir(), "employee_data.csv")

# Check if the CSV file was successfully extracted
if (!file.exists(csv_path)) {
  cat("Error: CSV file not found in the zip archive.\n")
  quit(status = 1)
}

# Read and display the data
data <- read.csv(csv_path, stringsAsFactors = FALSE)
print(head(data))

