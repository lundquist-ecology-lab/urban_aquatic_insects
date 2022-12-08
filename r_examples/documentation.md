
[glmm.r](https://github.com/lundquist-ecology-lab/urban_aquatic_insects/blob/main/r_examples/glmm.r)

This R code performs a generalized linear mixed model analysis using data from the richness.r script. The code first loads the `lme4` library, which is used to fit the generalized linear mixed model (GLMM).

The code then defines the GLMM using the `glmer()` function, with the `richness` variable as the response and the `type` and `month` variables as fixed effects. The GLMM assumes a Poisson distribution for the count data, and includes a random intercept for the `stream` variable.

The code then uses the `anova()` function to perform an analysis of deviance for the GLMM. This calculates various statistical measures for the model, such as the F-value and p-value.

The code then defines a series of reduced models, which are simpler versions of the original GLMM with fewer fixed effects or random effects. These models are used in the next step, which is a likelihood analysis using the `anova()` function. This compares the goodness of fit of the original GLMM to the reduced models and calculates the likelihood ratio for each model.

Finally, the code loads the `piecewiseSEM` library and uses the `rsquared()` function to calculate the R-squared value for the GLMM. This is a measure of the amount of variation in the response variable that is explained by the fixed effects in the model.


[richness.r](https://github.com/lundquist-ecology-lab/urban_aquatic_insects/blob/main/r_examples/richness.r)

This R code reads in data from a CSV file and performs various transformations and calculations on the data. The code first uses the `read.csv()` function to read in the data from the CSV file and store it in a data frame called data.

Next, the code calculates the order-level, family-level, and genus-level total richness for the data. This is done by using the `unique()` function to find the unique values for the `order`, `family`, and `genus` variables, respectively, and then using the `length()` function to calculate the number of unique values.

The code then creates a new data frame called `data_2015` that only includes rows from the `data` data frame where the `year` variable is equal to `"2015"`. It then modifies the levels of the `genus` variable to include three taxa that were only identified to family level, and updates the values of the `genus` variable for these taxa in the `data_2015` data frame.

Finally, the code loops through the levels of the `site` and `month` variables in the `data_2015` data frame and calculates the lowest taxonomic richness per stream site per sampling `month`. This is done by subsetting the data for each `site` and `month` and then using the `unique()` function to find the unique values for the `genus` variable. The calculated richness values are stored in a `richness` vector, along with the corresponding `month` and `stream` values, and the type of each stream site. These vectors are then used to create a new data frame called `stream_rich`, which contains the calculated richness values and other metadata for each stream `site` and `month`.

[plot_richness.r](https://github.com/lundquist-ecology-lab/urban_aquatic_insects/blob/main/r_examples/plot_richness.r)

This R code is a script that generates a plot showing the taxonomic richness of various stream sites. The script first uses the `summarySE()` function from the `Rmisc` package to calculate summary statistics for the `richness` variable in the `stream_rich` data frame, grouped by the `stream` and `type` variables. It then uses the `na.omit()` function to remove any rows containing missing values.

Next, the script loads the `ggplot2` package and creates a `ggplot` object using the summary statistics data frame. The plot shows the `richness` variable on the y-axis, the stream variable on the x-axis, and the `type` variable as a fill color. The plot also includes error bars and custom colors for the fill.

Finally, the script saves the plot as a PNG image file using the `png()` and `dev.off()` functions.

Overall, this code provides a simple example of how to generate a plot using the `ggplot2` package in R. It can be modified and extended in various ways to meet different requirements.

[time_series.r](https://github.com/lundquist-ecology-lab/urban_aquatic_insects/blob/main/r_examples/time_series.r)

This R code plots the taxonomic richness data from the `richness.r` script. The code first loads the `ggplot2` and `Rmisc` libraries, which are used to create the plot and calculate summary statistics for the data, respectively.

The code then subsets the `stream_rich` data frame to only include `urban` and `rural` stream sites, and excludes the `"LS"` and `"TB"` sites. This is done using the `subset()` function and logical indexing.

Next, the code uses the `summarySE()` function from the `Rmisc` library to calculate means and standard errors for the richness variable, grouped by the month and type variables. The resulting summary statistics are stored in a `summary_stats` data frame.

The code then creates a `ggplot2` plot using the `ggplot()` function, with the `month` variable on the x-axis and the `richness` variable on the y-axis. The plot uses `type` to group the data and color the lines and points, and adds error bars using the standard errors calculated earlier. The plot is then customized using various `ggplot2` functions, such as `scale_color_manual()` and `theme_bw()`, to change the colors, line styles, and other visual properties of the plot.

Finally, the code uses the `png()` function to save the plot to a PNG file called `"time_series.png"`, and then closes the plotting device using the `dev.off()` function. This code provides a simple example of how to plot taxonomic richness data using ggplot2 in R. It can be modified and extended in various ways to create different types of plots or to meet different requirements.

This documentation written from prompts given to [ChatGPT](https://chat.openai.com/) 

