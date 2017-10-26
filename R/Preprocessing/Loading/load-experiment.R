#' Loads files form a folder into UnityObject
#' @param folder path to the folder respective to the working directory
#' @returns UnityObject object
#' @example 
#' 
#' 
load_experiment <- function(folder, obj = NULL){
  if (is.null(folder)) stop("no folder set")
  #open experiment_logs to see how many do we have
  experiment_info = open_experiment_info(folder)
  
  if(is.null(experiment_info)) stop("Experiment info not found")
  #if multiple logs or no logs, quit
  
  ## TODO separate preprocess adn opening
  player_log <- open_player_log(folder, override = FALSE)
  if(is.null(player_log)) stop("Player log not found")
  #preprocesses player log
  #checks if there is everything we need and if not, recomputes the stuff
  
  testLogs = open_test_logs(folder)
  for (i in length(testLogs)){
    self$tests[[i]] = testLogs[[i]]
  }
  if(is.null(obj)) obj = UnityObject()
  obj$data$experiment_info <- experiment_info
  obj$data$player_log <- player_log
  obj$data$experiment_log <- test_log
  obj$data$results_log <- results_log
}