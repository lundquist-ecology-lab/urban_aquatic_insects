# Plot the richness data from richness.r

source("r_examples/richness.r")

# Only urban and rural sites
stream_rich <- subset(stream_rich, stream_rich$stream != "LS" & 
                    stream_rich$stream != "TB")

# Means and standard errors
library(Rmisc)

summary_stats <- summarySE(data = stream_rich, measurevar = "richness",
                           groupvars = c("month", "type"), na.rm = TRUE)

# Plot with error bars
library(ggplot2)

# Get proper heights and placements for error bars
ht <- summary_stats$richness

# Error bar dodge
pd <- position_dodge(.1)

# Order sites numerically, not alphabetically
summary_stats$stream <- factor(summary_stats$month,
                            levels = c("April",
                                      "May",
                                      "June",
                                      "July",
                                      "August",
                                      "September"))

## Barplot with ggplot2
x <- ggplot(summary_stats, aes(x = month, y = richness, group = type)) +
    geom_line(aes(col = type, linetype = type)) +
    geom_point() +
    scale_color_manual(values = c("#69b3a2", "#b37d69", "#a269b3", "#b3697a"),
        name = "Land use") +
    scale_linetype_manual(name = "Land use", values = c("solid", "dashed")) +
    geom_errorbar(aes(ymin = richness - se, ymax = richness + se),
         colour = "black", width = .1, position = pd) +
    xlab("Month") +
    ylab("Taxonomic richness") +
    scale_y_continuous(limits = c(0, 16),
                     expand = c(0, 0), # Set y range
                     breaks = 0:100 * 2) +
    theme_bw(base_size = 25) +
    theme(panel.grid = element_blank()) +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))

png("time_series.png")
x
dev.off()



