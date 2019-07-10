library(ggplot2)
ggplot(iris, aes(x=Species, y=Sepal.Length)) +
  geom_boxplot()
ggplot(data = iris, aes(x = Sepal.Length, y=Sepal.Width)) +
  geom_point()