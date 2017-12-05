egoallobva.get_trial_pointing <- function(dt_player, test, trialID){
  target_pos <- get_goal_position(i_goal = egoallobva.get_goal_index(test, trialID), test = test, onlyXY = T)
  return(get_trial_pointing(dt_player, test, trialID, target_pos))
}
