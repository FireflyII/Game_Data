setwd("/Users/jyoshimi/ipython/students/holman/holman_game_data")

cond_to_completion <- read.csv("data_for_r.csv")
summary(cond_to_completion)
boxplot(cond_to_completion$Completion_Time)

fit <-
  aov(cond_to_completion$Completion_Time ~ .,
      data = cond_to_completion)
summary(fit)

fit <- lm(cond_to_completion$Completion_Time ~ .,
          data = cond_to_completion)
summary(fit)

fit_CC <-
  lm(cond_to_completion$Completion_Time ~ cond_to_completion$CC,
     data = cond_to_completion)
summary(fit_CC)
t.test(cond_to_completion$Completion_Time ~ cond_to_completion$CC)
plot(cond_to_completion$CC, cond_to_completion$Completion_Time)

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
