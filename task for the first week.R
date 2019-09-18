#tasks

# set up ssh github connection with Rstudio.
# create a repo and push code from Rstudio 


# read the cars_2019-02-22.rds
# readRDS is a function to read datasets, which saved with the saveRDS command, it is good because it can compress the dataset very well
data <- readRDS('data/cars_2019-02-22.rds')
# after we had the dataset loaded, we saved it with the write.csv function
write.csv(data, 'test_cars.csv', row.names = FALSE)  # use row.names=F, to not write the rownames of the dataset


# after I realized that lots of you did not read csvs, we turned to the read.csv function, you will use lots of times. always use tab, and f1 for help
surnames <- read.csv('/home/mihaly/R_codes/R_mentoring/data/surnames.txt', sep = ',')

# geting the working directory,  if you are in '' between two apostrophe and press tab, it will alwasy list the files and folders from the working directory, if you pres '/' and than tab it will show the root folder of the hard drive. 
getwd()
# if you want to change the working directory
setwd("my_path")

#reading any text file, the separation symbol, is important to have it, if it is separated with tab than the sep='/t'
read.csv()# save any object to rds
#saveRDS(object that you want to save, 'file path where you want to save, and add .rds at the end')
# reading back to R you just have to pass the filepath, use tabreadRDS('filepath')

# save it to csv
# compare the size of the rds and csv file, what is the compression ratio of the rds# file.info(return a dataframe with the file infos)# str() will retun the structure of any object
str(file.info('data/cars_2019-02-22.rds'))
cars_rds_info <- file.info('data/cars_2019-02-22.rds')
cars_rds_info <- cars_rds_info$size[1]


cars_csv_info <- file.info('test_cars.csv')
cars_csv_info <- cars_csv_info$size[1]
cars_csv_info / cars_rds_info

# functions# read https://nicercode.github.io/guides/functions/write 'fun', the cursor has to be on 'snippets' than press tab

 #the base structure
 my_fun_name <- function(){

   }
my_fun_name <- function(input_variable1, input_variable2){
 #here you can do whatever you want to do with the imput variable# at the end you need to return with a variable use a return() function
}
# read about loops in the following link: https://www.datacamp.com/community/tutorials/tutorial-on-loops-in-r
# sow that many of you is beginner in the codding, so I really suggest to watch the following youtube videos:
#https://www.youtube.com/watch?v=SWxoJqTqo08&list=PLjgj6kdf_snYBkIsWQYcYtUZiDpam7ygg
# also a great video to git tutorial:# https://www.youtube.com/watch?v=qcjpHFwCugE



#
#work with the data
#muszaki_vizsga_ervenyes column is the last day before 'technical exam'(every two year the car have to pass an exam) 

#how many car has experi

# how many car has 'tolatókamera'(reverse camera) in the 'muszaki' column
# which car is the oldest(evjarat) which can run 0-100 km/h (gyorsulas_0_rol_100_km_h_ra column) below 5 seconds()

#on average which brand has the cheapest cars


# on the cars_pages you can find many files. 
# read all the file into one file with different methods.
#1. use for loop
#2. use lapply

#write a function which needs just the path, and paste all the files (in the path) into one file and return with the file. 


# task with names 
#create a data.table with 1000 rows which has the following columns:
#1. 'familyname'
#2. 'last name'
#3. 'gender'(male, female)
#4. 'birth_date' it should be from 1900.01.01 till today, a random day
#5. 'days_old' calculate how many days left from birth date.
# 6. 'height' 
# make a function of it, which need 3 variable: number of rows, familynames, lastnames 



my_welcome <- function(my_name) {
  print(paste('hello', my_name, sep = " # "))
}

paste(letters[1:10], collapse = '')

my_welcome(my_name = 'Misi')


#write a function
#2 number multilpy and after square
my_calc <- function(a,b) {
  return(a+b)
}

to_hundred  <- c(1:100)

for (my_element in c(1:100)) {
  print(paste('run:', my_element))
  print(my_calc(to_hundred[my_element], to_hundred[my_element+1]))
}


str(1:20)
my_vector <-c(letters, 1:20)

for (my_element in my_vector) {
  print(my_element)
}



my_result <- my_calc(3,3)