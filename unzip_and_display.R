# Load necessary library
library(utils)

# Define the zip file path
zip_path <- "Employee_Profile.zip"

# Check if the zip file exists
if (!file.exists(zip_path)) {
  cat("Error: Zip file not found. Ensure the file is named 'Employee_Profile.zip' and is in the same directory as this script.\n")
  quit(status = 1)
}

# Unzip the file to a temporary directory
unzip_dir <- tempdir()
unzip(zip_path, exdir = unzip_dir)

# Define the expected CSV path
csv_path <- file.path(unzip_dir, "employee_data.csv")

# Check if the CSV file was successfully extracted
if (!file.exists(csv_path)) {
  cat("Error: 'employee_data.csv' not found in the zip archive.\n")
  quit(status = 1)
}

# Read the CSV file
data <- read.csv(csv_path, stringsAsFactors = FALSE)

# Display the data or a message if the file is empty
if (nrow(data) > 0) {
  print(data)
} else {
  cat("No data available to display in 'employee_data.csv'.\n")
}
