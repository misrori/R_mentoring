#tasks

# Set up ssh github connection with Rstudio.
# Create a repo and push code from Rstudio 


# Read the cars_2019-02-22.rds
# readRDS is a function to read dataset from an .rds file, which was saved with the saveRDS command beforehand.
# It is good way of saving datasets because it can compress the file size very well.
data <- readRDS('data/cars_2019-02-22.rds')
# or equal sign works as well
data = readRDS('data/cars_2019-02-22.rds')
# or double quites works as well
data <- readRDS("data/cars_2019-02-22.rds")
# or you may denote the current directory with a dot like this
data <- readRDS('./data/cars_2019-02-22.rds')

# After we have the dataset loaded into our computer's memory, we should save it using the write.csv function.
# Using row.names = FALSE argument does not save into the file the rownames of the dataset.
write.csv(data, 'data/cars_2019-02-22.csv', row.names = FALSE)  

# Now we are turning to the read.csv function. You will use it lots of time. 
# It is suggested to use tab key for typing completion, and F1 key for help.
# The file extension does not realy matter, it tries to process every kind of text file.
surnames <- read.csv('./data/surnames.txt', sep = ',')

# Getting the current working directory on your machine.
# When you are in between the two apostrophe press tab key.
# It will list the files and folders of your current working directory.
# If you type '/' and then the tab key, it will show the root folder of the hard drive. 
getwd()
# In case you want to change the working directory you can do it like this
setwd('/path/to/the/folder')

# It may be useful to specify the separation symbol to read.csv function
# tab separated csv-s can be specified this way: sep = '\t'
table <- read.csv('/path/to/the/folder/table.csv', sep = '\t') 

# Save an object into rds file format.
saveRDS(surnames, 'surnames.rds')
# .RDS also works but then it will be a different file in your computers folder
saveRDS(surnames, 'surnames.RDS')
# You may check it like this, '.' means current directory
list.files('.', pattern = 'rds', ignore.case = TRUE, full.names = TRUE)

# Reading a file into R (more precisely into memory) you should just pass the filepath and then hit tab key
data <- readRDS('./data/cars_2019-02-22.rds')

# Save it to csv
write.csv(data, './data/cars_2019-02-22.csv', sep = ',')

# file.info returns a dataframe with the file meta data
cars_rds_info  <- file.info('./data/cars_2019-02-22.rds')
# str() shows the structure of an object.
str(cars_rds_info)
# We would like to examine only the info in the size column.
cars_rds_info$size
# We would like to examine only the first info in the size column.
# As it is a one row dataframe technically it is the same as the previous
cars_rds_info$size[1]
# We would like to keep only the size info hence we send that info in itself.
cars_rds_info <- cars_rds_info$size[1]

# We do the same with the csv counterpart.
cars_csv_info <- file.info('./data/cars_2019-02-22.csv')
cars_csv_info <- cars_csv_info$size[1]

# compare the size of the rds and csv file, what is the compression ratio of the rds
ratio <- cars_csv_info / cars_rds_info
print(ratio)

# functions
# read https://nicercode.github.io/guides/functions/write 'fun'
# the cursor has to be on 'snippets' and then press tab

# the base schema of an R function
my_fun_name <- function(input_variable1, input_variable2) {
  output_variable <- process(input_variable1, input_variable2) # here you can do whatever you want
  return(output_variable)                                      # at the end you need to return with an object
}

# Define a function which prints Hello and the given name.
my_welcome <- function(my_name) {
  print(paste('hello', my_name, sep = " # "))
}
# Call a function.
my_welcome(my_name = 'Misi')
# or
my_welcome('Misi')

# Collapse the first 10 letter into one string.
# The letters is built in vector in R. 
paste(letters[1:10], collapse = '')

# Define a function which multiplies 2 given number by each other and then square them
my_calc <- function(a, b) {
  outcome <- (a * b) ^ 2
  return(outcome)
}
# or
my_calc <- function(a, b) {
  return((a * b) ^ 2)
}

# Call the my_calc function
my_result <- my_calc(3,3)
print(my_result)

# Create a vector which contains integers from 1 to 100
to_hundred <- c(1:100)

# Iterate thru each element of your vector and make a calculus 
# on each element and a the following integer using my_calc function
for (my_element in to_hundred) {
  print(paste('run:', my_element))
  print(my_calc(my_element, my_element + 1))
}


# Combining character and an integer vector results in a character vector
my_vector <- c(letters, 1:20)

# printing each element of the combined vector using a for loop
for (my_element in my_vector) {
  print(my_element)
}

# BE AWARE! The previous way of printing a vector is a barbarism in R.
# We do it only for the sake of for loop usage!
# The correct way of printing (or doing anything with) vectors in R is simple: function(vector)
print(my_vector)





# read about loops in the following link: https://www.datacamp.com/community/tutorials/tutorial-on-loops-in-r
# I really suggest to watch the following youtube videos: https://www.youtube.com/watch?v=SWxoJqTqo08&list=PLjgj6kdf_snYBkIsWQYcYtUZiDpam7ygg
# A great video to git tutorial: https://www.youtube.com/watch?v=qcjpHFwCugE


# Let us work with the data

# 1.
# The 'muszaki_vizsga_ervenyes' column is the last day before cars 'technical exam'.
# Every two year the car have to pass an exam.
# How many cars have expired licence?

# 2.
# How many cars have 'tolatókamera'(rear view camera) in the 'muszaki' column?

# 3.
# Which car is the oldest (based on 'evjarat' column) among which can run 0-100 km/h?
# ('gyorsulas_0_rol_100_km_h_ra' column) below 5 seconds()

# 4.
# on average which brand has the cheapest cars

# 5.
# In the .data/cars_pages folder you can find many files. 
# Read all the file into one file with different methods.
# 1. use for loop
# 2. use lapply
# Write a function which needs just the path of the folder, 
# and paste all the files from the folder into one file and return with the file. 


# 6. 
# Create a data.table manually with 1000 rows which has the following columns:
# 1. 'familyname'
# 2. 'last name'
# 3. 'gender'(male, female)
# 4. 'birth_date' it should be from 1900.01.01 till today, a random day
# 5. 'days_old' calculate how many days left from birth date.
# 6. 'height' 
# Make a function which needs 3 input variable (number of rows, familynames, lastnames) and builds a data.table
