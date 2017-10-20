  # setwd("/Volumes/TarDisk-128/Game_Data/Game_Data/")
  
  # GET DATA
  game_data <- read.csv("morestuff.csv")
  game_data
  
  # SUMMARY STATISTICS
  summary(game_data)
  boxplot(game_data)
  
  # HISTOGRAM FOR EVERY COLUMN
  library(ggplot2)
  library(reshape2)
  ggplot(data = melt(game_data), mapping = aes(x = value)) + geom_histogram(bins = 10) + facet_wrap(~variable, scales = 'free_x')
  
  # ANOVAS ON IVS
  fit <- aov(Time.Spent ~ Clear.Rules + Clear.Progress + Clear.Completion,data = game_data)
  summary(fit)
  fit <- aov(Buttons.Pushed ~ Clear.Rules + Clear.Progress + Clear.Completion,data = game_data)
  summary(fit)
  fit <- aov(Distance.Traveled ~ Clear.Rules + Clear.Progress + Clear.Completion,data = game_data)
  summary(fit)
  fit <- aov(Paths.Based.Distance ~ Clear.Rules + Clear.Progress + Clear.Completion,data = game_data)
  summary(fit)
  fit <- aov(Average.Path.Length  ~ Clear.Rules + Clear.Progress + Clear.Completion,data = game_data)
  summary(fit)
  
  # LINEAR MODEL ON EVERYTHING
  # fit <- lm(Time.Spent ~ .,data = game_data)
  # summary(fit)
  
  # LINEAR MODELS ON IVS
  fit <- lm(Time.Spent ~ Clear.Rules + Clear.Progress + Clear.Completion,data = game_data)
  summary(fit)
  fit <- lm(Buttons.Pushed ~ Clear.Rules + Clear.Progress + Clear.Completion,data = game_data)
  summary(fit)
  fit <- lm(Distance.Traveled ~ Clear.Rules + Clear.Progress + Clear.Completion,data = game_data)
  summary(fit)
  fit <- lm(Paths.Based.Distance ~ Clear.Rules + Clear.Progress + Clear.Completion,data = game_data)
  summary(fit)
  fit <- lm(Average.Path.Length  ~ Clear.Rules + Clear.Progress + Clear.Completion,data = game_data)
  summary(fit)
  
  # LINEAR MODELS WITH INTERACTIONS
  fit <- lm(Time.Spent ~ Clear.Rules * Clear.Progress * Clear.Completion * Clear.Rules,data = game_data)
  summary(fit)
  fit <- lm(Buttons.Pushed ~ Clear.Rules * Clear.Progress * Clear.Completion,data = game_data)
  summary(fit)
  fit <- lm(Distance.Traveled ~ Clear.Rules * Clear.Progress * Clear.Completion,data = game_data)
  summary(fit)
  fit <- lm(Paths.Based.Distance ~ Clear.Rules * Clear.Progress * Clear.Completion,data = game_data)
  summary(fit)
  fit <- lm(Average.Path.Length  ~ Clear.Rules * Clear.Progress * Clear.Completion,data = game_data)
  summary(fit)
  
  # CONVENIENCE FUNCTION FOR T-TESTS / PLOTS
  my_ttest <- function(dv,iv) {
    result <- t.test(dv ~ iv)
    print(result)
    plot(iv, dv)
  }
  
  # T TESTS AND PLOTS ON EACH DV / IV PAIR
  my_ttest(game_data$Time.Spent, game_data$Clear.Rules)
  my_ttest(game_data$Time.Spent, game_data$Clear.Progress)
  my_ttest(game_data$Time.Spent, game_data$Clear.Completion)
  
  my_ttest(game_data$Distance.Traveled, game_data$Clear.Progress)
  my_ttest(game_data$Distance.Traveled, game_data$Clear.Rules)
  my_ttest(game_data$Distance.Traveled, game_data$Clear.Completion)
  
  my_ttest(game_data$Average.Path.Length, game_data$Clear.Progress)
  my_ttest(game_data$Average.Path.Length, game_data$Clear.Rules)
  my_ttest(game_data$Average.Path.Length , game_data$Clear.Completion)
  
  my_ttest(game_data$Steps.to.Completion, game_data$Clear.Progress)
  my_ttest(game_data$Steps.to.Completion, game_data$Clear.Rules)
  my_ttest(game_data$Steps.to.Completion, game_data$Clear.Completion)
  
  my_ttest(game_data$Average.Distance.Per.Step, game_data$Clear.Progress)
  my_ttest(game_data$Average.Distance.Per.Step, game_data$Clear.Rules)
  my_ttest(game_data$Average.Distance.Per.Step, game_data$Clear.Completion)
  
  my_ttest(game_data$Paths.Based.Distance, game_data$Clear.Progress)
  my_ttest(game_data$Paths.Based.Distance, game_data$Clear.Rules)
  my_ttest(game_data$Paths.Based.Distance, game_data$Clear.Completion)