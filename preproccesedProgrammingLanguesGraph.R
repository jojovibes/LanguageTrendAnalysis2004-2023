library(readr)
library(ggplot2)

Popularity_of_Programming_Languages_from_2004_to_2023 <- read_csv("Downloads/Popularity of Programming Languages from 2004 to 2023.csv")
programming_languages_data <- Popularity_of_Programming_Languages_from_2004_to_2023

df <- data.frame( 
  C_Cpp <- Popularity_of_Programming_Languages_from_2004_to_2023$`C/C++`,
  CSharp <- Popularity_of_Programming_Languages_from_2004_to_2023$`C#`,
  Java <- Popularity_of_Programming_Languages_from_2004_to_2023$Java,
  JavaScript <- Popularity_of_Programming_Languages_from_2004_to_2023$JavaScript,
  Python <- Popularity_of_Programming_Languages_from_2004_to_2023$Python,
  R <- Popularity_of_Programming_Languages_from_2004_to_2023$R,
  TypeScript <- Popularity_of_Programming_Languages_from_2004_to_2023$TypeScript,
  VisualBasic <- Popularity_of_Programming_Languages_from_2004_to_2023$`Visual Basic`
)

colors <- c(
  `C/C++` = "#000075", `C#` = "#ffe119",
  Java = "#911eb4", JavaScript = "#00CC99", Python = "#f032e6", 
  R = "#42d4f4", TypeScript = "#f58231",`Visual Basic` = "#e6194B"
)

date_strings <- Popularity_of_Programming_Languages_from_2004_to_2023$`Date`
dates <- as.Date(paste0("01 ", date_strings), format = "%d %B %Y")
data <- data.frame(Date = dates, Value = df)

ggplot(data, aes( Date, Value)) +
  geom_line(aes(y = `C_Cpp`, color = "C/C++")) +
  geom_line(aes(y = `CSharp`, color = "C#")) +
  geom_line(aes(y = Java, color = "Java")) +
  geom_line(aes(y = JavaScript, color = "JavaScript")) +
  geom_line(aes(y = Python, color = "Python")) +
  geom_line(aes(y = R, color = "R")) +
  geom_line(aes(y = TypeScript, color = "TypeScript")) +
  geom_line(aes(y = VisualBasic, color = "Visual Basic")) +
  labs(title = "Programming Language Popularity from 2004 until 2023",
       x = "Date",
       y = "Popularity Index",
       color = "Language") +
  scale_color_manual(values = colors) +
  theme_minimal()

