#give me folder
source("R/Loading.R")

dir <- "../data/NEO_23-10-2017"
obj <- UnityObject()
obj <- load_experiment(dir, obj)
changed <- preprocess_player_log(obj$data$player_log)
if(changed) save_preprocessed_player(dir, obj$data$player_log)
