## Regular Expressions Examples

## Uses default regex function as well as some stringr functions
## browseVignettes(package = "stringr")

## Tools for understanding and getting started with Regular Expressions
# Reference sheet:  http://www.regular-expressions.info/reference.html
# Interactively test regular expressions:  http://gskinner.com/RegExr/
# Tool to build regular expressions for you:  http://www.txt2re.com/

##############################
##
## LOAD PACKAGES
##
##############################

## Packages

packages <- c(
  "stringr"
  ,"dplyr"
)

.loadPackages <- function(p) {require(p, character.only=TRUE, lib.loc = .libPaths())}

lapply(packages, .loadPackages)


# Sample Data
teams <- data.frame(Team = c("Denver3-0","CIN1-2","BUF1-2","ARI1-2"), stringsAsFactors = F)

# Regular Expression for Use in Text Extraction
# Locate and extract team name
regex = "[:alpha:]+"

# Take just team names using stringr function extract_all
# Replace existing teams with records with just the team name
teams$Team <- unlist(str_extract_all(teams$Team, regex))

# Sample Data
teams <- data.frame(Team = c("Denver3-0","CIN1-2","BUF1-2","ARI1-2"), stringsAsFactors = F)

# Regular Expression for Use in Text Extraction
# Locate team record and take all characters other than
# Record
regex = "[0-9]+[-.][0-9]+"

# Take just team names using default function str_split
# Move Records to separate column
teams$Record <- unlist(str_extract_all(teams$Team, regex))

# Replace existing teams with records with just the team name
teams$Team <- unlist(strsplit(teams$Team, regex))

# Conversion table of city name to abbreviation
cityNames <- data.frame(City = c("Denver"), Abb = c("DEN"),stringsAsFactors = F)

# Join to Teams Table
teams <- full_join(teams,cityNames, by = c("Team" = "City"))

# To Do
# Replace team with Abbreviation

# To Do
# Remove Abbreviation Column


# Example of using mutate function to drop team record column
teams <- select(teams, -Record)
