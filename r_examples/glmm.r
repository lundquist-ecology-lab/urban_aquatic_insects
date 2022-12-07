# Generalized linear model from data in richness.r
source("r_examples/richness.r")

# Generalized Linear Mixed Model assuming Poisson distribution for count data
# and stream type and month nested in stream.
library(lme4)
model <- glmer(richness ~ type * month + (1 | stream), family = poisson,
            data = stream_rich, na.action = na.exclude)

# Analysis of Deviance
anova(model)

# Likelihood analysis

# Reduced models
r_1 <- glmer(richness ~ type + month + (1 | stream), family = poisson,
                data = stream_rich, na.action = na.exclude)
r_2 <- glmer(richness ~ type + (1 | stream), family = poisson,
                data = stream_rich, na.action = na.exclude)
r_3 <- glmer(richness ~ 1 + (1 | stream), family = poisson,
                data = stream_rich, na.action = na.exclude)

anova(model, r_1, r_2, r_3)

# Calculate R^2
library(piecewiseSEM)
rsquared(model)
