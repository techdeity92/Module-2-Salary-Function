# Module-2-Salary-Function

# Employee Data Processing and Export

This project processes employee data from a CSV file, extracts specific employee information, and exports it to a new CSV file inside a zipped folder named "Employee\_Profile.zip". The R script is then used to unzip the folder and display the data.

## How It Works

1. **Run the Python Script:**

   * Open the command prompt or terminal.
   * Navigate to the folder where the Python script is located.
   * Run the Python script using:

     ```
     python salary_processor.ipynb
     ```
   * Enter the full path to the CSV file when prompted or press Enter to use the current directory.
   * Enter the name of the employee to extract their data.
   * The script will generate a zip file named `Employee_Profile.zip` containing the extracted CSV data.

2. **Run the R Script:**

   * Before running the R script, set the working directory to the location of the R script and zip file:

     ```r
     setwd("C:/path/to/your/directory")
     ```
   * Verify the working directory:

     ```r
     getwd()
     ```
   * Ensure that `Employee_Profile.zip` is in the same directory as the R script.
   * Run the R script using:

     ```
     Rscript unzip_and_display.R
     ```
   * The R script will unzip `Employee_Profile.zip`, read the extracted CSV file, and display its contents in the console.

## Requirements

* Python 3.x
* R with utils library installed

## Important Notes

* The Python script only handles data extraction and zipping. The R script must be run separately to display the data.
* Ensure both scripts and the zip file are in the same working directory before running the R script.
