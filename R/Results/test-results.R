#' Test results 
#' Calls function from other subfolders depending on the name of the experiment
#' @param experiment_log
#' @param player_log
#' @param experiment_name
#' 

test_results <- function(expeirment_log, player_log, experiment_name = ""){
  if(experiment_name == "egoallobva") return(egoallobva_test_results())
  if(experiment_name == "cfnspointing") return(cfnspointing_test_results())
  print("There isn't an experiemnt analysis for passed experiment_name")
}