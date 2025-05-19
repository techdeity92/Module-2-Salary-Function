# Load necessary library
library(utils)

# Set working directory to the script location or current working directory
# This approach avoids unnecessary complexity and works consistently
script_dir <- getwd()

# Define the zip file path relative to the working directory
zip_path <- file.path(script_dir, "Employee_Profile.zip")

# Check if the zip file exists
if (!file.exists(zip_path)) {
  cat("Error: Zip file not found. Ensure 'Employee_Profile.zip' is in the same directory as this script.\n")
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

# Read and display the data
data <- tryCatch({
  read.csv(csv_path, stringsAsFactors = FALSE)
}, error = function(e) {
  cat("Error reading CSV file: ", e$message, "\n")
  quit(status = 1)
})

# Display the data
if (nrow(data) > 0) {
  print(data)
} else {
  cat("No data available to display in 'employee_data.csv'.\n")
}

