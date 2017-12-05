#give me folder
source("lib/brainvr-reader/Loading.R")
load_brainvr_reader("lib/brainvr-reader")

source_folder("CFNSPointing/")

dir <- "Data/NEO_23-08-2017"
obj <- UnityObject()
obj <- load_experiment(dir, obj)
changed <- preprocess_player_log(obj$data$player_log)
if(changed) save_preprocessed_player(dir, obj$data$player_log)

cfnspointing.test_results(obj$data$experiment_log, obj$data$player_log)
