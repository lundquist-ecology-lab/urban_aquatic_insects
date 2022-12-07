# Read in data
data <- read.csv("data/stream_insects.csv", header = TRUE,
                stringsAsFactors = TRUE, na.strings = " ")

# na.strings = " " corrects issue with some taxa
# not having been identified to genus (mostly in 2014)

# Order-level total richness
length(unique(data$order))

# Family-level total richness
length(unique(data$family))

# Genus-level total richness
length(unique(data$genus))

# Working only with 2015 data

data_2015 <- subset(data, data$year == "2015")
levels(data_2015$family)

# Three taxa were only identified to family, adding them to genus
levels(data_2015$genus) <- c(levels(data_2015$genus),
                            "Chironomidae",
                            "Dolichopodidae",
                            "Ceratopogonidae")
data_2015$genus[data_2015$family == "Chironomidae"] <- "Chironomidae"
data_2015$genus[data_2015$family == "Dolichopodidae"] <- "Dolichopodidae"
data_2015$genus[data_2015$family == "Ceratopogonidae"] <- "Ceratopogonidae"

# Lowest taxonomic richness per stream site per sampling month
richness <- NULL
month <- NULL
stream <- NULL
type <- NULL

count <- 1

for (i in levels(data_2015$site)) {
    for (j in levels(data_2015$month)) {
        x <- subset(data_2015, data_2015$site == i & data_2015$month == j)
        richness[count] <- length(unique(x$genus))
        month[count] <- j
        type[count] <- paste(x$type)[1] # Paste only the first
        stream[count] <- paste(x$stream)[1] # Paste only the first
        count <- count + 1
    }
}

# New data frame
stream_rich <- data.frame(richness, stream, type, month)
names(stream_rich) <- c("richness", "stream", "type", "month")