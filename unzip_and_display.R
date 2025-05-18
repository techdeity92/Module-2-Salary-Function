# Load necessary library
if (!require("utils")) install.packages("utils", repos = "https://cloud.r-project.org/")
library(utils)

# Define the zip file path
zip_path <- "Employee_Profile.zip"

# Check if the zip file exists
if (!file.exists(zip_path)) {
  cat("Error: Zip file not found at", zip_path, "\n")
  quit(status = 1)
}

# Unzip the file to a temporary directory
unzip_dir <- tempdir()
unzip(zip_path, exdir = unzip_dir)

# Define the expected CSV path
csv_path <- file.path(unzip_dir, "employee_data.csv")

# Check if the CSV file was successfully extracted
if (!file.exists(csv_path)) {
  cat("Error: CSV file not found in the zip archive.\n")
  quit(status = 1)
}

# Read and display the data
data <- tryCatch({
  read.csv(csv_path, stringsAsFactors = FALSE)
}, error = function(e) {
  cat("Error reading CSV file: ", e$message, "\n")
  quit(status = 1)
})

# Display the data
if (nrow(data) > 0) {
  print(head(data))
} else {
  cat("No data available to display.\n")
}
