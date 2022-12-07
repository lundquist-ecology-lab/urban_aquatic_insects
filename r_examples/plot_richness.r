# Plot the richness data from richness.r

source("r_examples/richness.r")

# Means and standard errors
library(Rmisc)
summary_stats <- summarySE(data = stream_rich, measurevar = "richness",
                           groupvars = c("stream", "type"), na.rm = TRUE)
summary_stats <- na.omit(summary_stats)

# Plot with error bars
library(ggplot2)

# Get proper heights and placements for error bars
ht <- summary_stats$richness

# Error bar dodge
pd <- position_dodge(.9)

# Order sites numerically, not alphabetically
summary_stats$stream <- factor(summary_stats$stream,
                            levels = c("CC",
                                      "FH",
                                      "LC",
                                      "PC",
                                      "PT",
                                      "LS",
                                      "TB"))
summary_stats$type <- factor(summary_stats$type,
                                levels = c("rural",
                                          "urban",
                                          "ref_up",
                                          "ref_down"))


## Barplot with ggplot2
x <- ggplot(summary_stats, aes(x = stream, y = richness, fill = type)) +
    geom_bar(stat = "identity", colour = "black", size = 0.3,
            position = "dodge") +
    scale_fill_manual(values = c("#69b3a2", "#b37d69", "#a269b3", "#b3697a")) +
    geom_errorbar(aes(ymin = richness - se, ymax = richness + se),
        colour = "black", width = .1, position = pd) +
    xlab("Stream site") +
    ylab("Taxonomic richness") +
    scale_y_continuous(limits = c(0, 16),
                     expand = c(0, 0), # Set y range
                     breaks = 0:100 * 2) +
    theme_bw(base_size = 25) + theme(panel.grid = element_blank()) +
    theme(legend.position = "none")

png("richness.png")
x
dev.off()
