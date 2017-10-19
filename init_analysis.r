setwd("/Volumes/TarDisk-128/Game_Data/Game_Data/")

#cond_to_completion <- read.csv("data_for_r.csv")
cond_to_completion <- read.csv("morestuff.csv")
#Summary Statistics
summary(cond_to_completion)
boxplot(cond_to_completion$Completion_Time)

# Left of ~ is Dependent Variable, Right is Independent Variable(s)

#Analysis of Variance
#Dependent is Completion Time .= With respect to every independent variable
fit <-
  aov(Completion_Time ~ .,
      data = cond_to_completion)
summary(fit)

#Linear Model / Multiple Regression (multiple independent, one dependent)
fit <- lm(Completion_Time ~ .,
          data = cond_to_completion)
summary(fit)

#Linear Model of Clear Completion
fit_CC <-
  lm(cond_to_completion$Completion_Time ~ cond_to_completion$CC,
     data = cond_to_completion)
summary(fit_CC)

################################
# Clear Completion vs. Amount of time
plot(cond_to_completion$Clear.Completion, cond_to_completion$Time.Spent)
# Clear Completion vs. Number of buttons pushed
plot(cond_to_completion$Clear.Completion, cond_to_completion$Buttons.Pushed)

t.test(Buttons.Pushed ~ Clear.Completion, data = cond_to_completion)
t.test(Buttons.Pushed ~ Clear.Progress, data = cond_to_completion)
t.test(Buttons.Pushed ~ Clear.Rules, data = cond_to_completion)

fit <-
  aov(Buttons.Pushed ~ .,
      data = cond_to_completion)
summary(fit)

fit <-
  aov(Clear.Completion ~ .,
      data = cond_to_completion)
summary(fit)

fit <-
  aov(Clear.Progress ~ .,
      data = cond_to_completion)
summary(fit)

fit <-
  aov(Clear.Rules ~ .,
      data = cond_to_completion)
summary(fit)
################################

# T test of Clear Completion with respect to Number of Steps
t.test(Completion_Time ~ CC,data = cond_to_completion)
#summary(fit)

ct <- cond_to_completion$Completion_Time
ct
t.test(Completion_Time ~ ct, data = cond_to_completion)

plot(cond_to_completion$CC, cond_to_completion$Completion_Time,ylab="Steps to Completion",xlab="Unclear Vs. Clear Completion")

fit_CP <-
  lm(cond_to_completion$Completion_Time ~ cond_to_completion$CP,
     data = cond_to_completion)
t.test(cond_to_completion$Completion_Time ~ cond_to_completion$CP)
summary(fit_CP)
plot(cond_to_completion$CP, cond_to_completion$Completion_Time)


fit_CR <-
  lm(cond_to_completion$Completion_Time ~ cond_to_completion$CR,
     data = cond_to_completion)
summary(fit_CR)
t.test(cond_to_completion$Completion_Time ~ cond_to_completion$CR)
plot(cond_to_completion$CR, cond_to_completion$Completion_Time)
