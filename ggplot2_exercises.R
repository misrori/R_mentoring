# You can find ggplot cheatsheet here:
https://www.rstudio.com/resources/cheatsheets/#ggplot2
    or
RStudio >> Help >> Cheatsheets >> Data Visualization with ggplot2

# You can find detailed ggplot examples here:
https://ggplot2.tidyverse.org/reference/



# Let us check built-in datasets of ggplot2 package
data(package = 'ggplot2')

# Let us load the built-in presidential dataframe
data(package = 'ggplot2', presidential)

# Let us check how it looks like
class(presidential)
str(presidential)
print(presidential)
View(presidential)

# Let us count duration of presidency
presidential          <- presidential %>% mutate(duration_in_days = as.integer(end - start))

# Let us distinguish the two Bush
presidential$name[10] <- paste0('G_W_', presidential$name[10])

# Let us try to plot each duration
plot_base             <- ggplot(data = presidential)
plot_base

# Add a geom layer
plot_base + geom_point(mapping = aes(x = name, y = duration_in_days))

# You may save it into an object
plot1                 <- plot_base + geom_point(mapping = aes(x = name, y = duration_in_days))

# Let us check the structure of that object
str(plot1)

# It is better to explicitly use print() with ggplot2 otherwise sometimes you will not get plot back
print(plot1)

# Let us distinguish between the two party
plot2                 <- plot_base + 
                           geom_point(mapping = aes(x = name, y = duration_in_days, colour = party))
print(plot2)
plot3                 <- plot_base + 
                           geom_point(mapping = aes(x = name, y = duration_in_days, colour = party, shape = party))
print(plot3)

# Let us rotate names alongside the x axis
plot4                 <- plot_base + 
                           geom_point(mapping = aes(x = name, y = duration_in_days, colour = party, shape = party)) + 
                           theme(axis.text.x = element_text(angle = 45, hjust = 1))
print(plot4)

# Let us change theme /beware of order of components/
plot5                 <- plot_base + 
                           geom_point(mapping = aes(x = name, y = duration_in_days, colour = party, shape = party)) + 
                           theme_minimal() + 
                           theme(axis.text.x = element_text(angle = 45, hjust = 1))
print(plot5)

# We do not want the presdidents to be alphabetically ordered so we have to mitigate on the name column
class(presidential$name)
presidential$name     <- ordered(presidential$name, levels = presidential$name)
class(presidential$name)
plot_base             <- ggplot(data = presidential)

plot6                 <- plot_base + 
                           geom_point(mapping = aes(x = name, y = duration_in_days, colour = party, shape = party)) + 
                           theme_minimal() + 
                           theme(axis.text.x = element_text(angle = 45, hjust = 1))
print(plot6)

# Let us exchange axes 
plot7                 <- plot6 + coord_flip()
print(plot7)




################################################### EXTRA ################################################################

# The concepts of long and wide tables frequently helps in aggregating and plotting as well
# There are several possibilities to pivot and unpivot tables
# Let us create a wide sample table
stockswide <- tibble(
  time = as.Date('2009-01-01') + 0:9,
  X = rnorm(10, 0, 1),
  Y = rnorm(10, 0, 2),
  Z = rnorm(10, 0, 4)
)
# Let us convert it to long table
stockslong <- tidyr::gather(stockswide, key = stock, value = price, -time)

# There are several possibilities to pivot and unpivot tables
# from wide to long
stockslong <- tidyr::pivot_longer(stockswide, cols = c('X', 'Y', 'Z'), names_to = 'stock', values_to = 'price')
stockslong <- tidyr::gather(stockswide, key = stock, value = price, -time)
stockslong <- data.table::melt(stockswide, id.vars = 'time', measure.vars = c('X', 'Y', 'Z'), variable.name = 'stock', value.name = 'price')
stockslong <- reshape2::melt(stockswide, id.vars = 'time', measure.vars = c('X', 'Y', 'Z'), variable.name = 'stock', value.name = 'price')

# from long to wide
tidyr::pivot_wider(stockslong, names_from = stock, values_from = price)
tidyr::spread(stockslong, key = stock, value = price)
data.table::dcast(stockslong, time ~ stock, value.var = 'price')
reshape2::dcast(stockslong,   time ~ stock, value.var = 'price')


