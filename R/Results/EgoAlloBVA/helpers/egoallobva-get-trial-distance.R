egoallobbva.get_trial_distance <- function(dt_position, timeWindow = NULL, test = NULL, trialID = NULL){
  ls <- list()
  if(is.null(timeWindow)){
    timeWindow <- get_trial_timewindow(test, trialID)
  }
  if (!is.null(timeWindow)){
    ls$walkedDistance <- get_walked_distnace_timewindow(dt_position, timeWindow)
  }
  if(!(is.null(test) || is.null(trialID))){
    goalIndex <- egoallobva.get_goal_index(test, trialID)
    goalPosition <- GoalPosition(test, goalIndex)
    startIndex <- StartIndex(test, trialID)
    startPosition <- StartPosition(test, startIndex)
    ls$goalStart <- dist(rbind(startPosition, goalPosition))[[1]] - test$experimentSettings$GoalSize
  }
  return(ls)
}