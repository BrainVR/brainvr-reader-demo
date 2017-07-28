#give me folder
source("R/Loading.R")

data_dir = "Examples/Data"

Analysis = UnityAnalysis$new(data_dir, "NEO-18-23-27-27-07-2017")
Analysis$TestResults()
Analysis$TrialInfo(10)

make_trial_images(Analysis$playerLog, Analysis$tests[[1]], indices = c(2:3))

Analysis$playerLog$timeDiff = c(0, diff(Analysis$playerLog$Time))
ggplot(Analysis$playerLog, aes(x = Time, y = distance/timeDiff)) + geom_line()

hist(Analysis$playerLog$timeDiff)
summary(Analysis$playerLog$timeDiff)
