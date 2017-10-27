cfnspointing_trial_info = function(test, dt_player, trialID){
  ls <- list()
  times <- get_trial_timewindow(test, trialID)
  ls$duration <- times$finish - times$start
  ls$distances <- get_walked_distnace_timewindow(dt_player, times)
  return(ls)
}