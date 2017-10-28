cfnspointing.test_results = function(df_experiment, dt_player){
  ls = list()
  i_finished_trials = get_trial_event_indices(df_experiment, "Finished")
  n_finished_trials = length(i_finished_trials)
  column_names <- c("duration","distances.walkedDistance", "iTrial")
  column_types <- c(rep("numeric", 3))
  
  df <- create_results_df(column_names, column_types, n_finished_trials)
  
  for (n in i_finished_trials){
    ls = cfnspointing.trial_info(df_experiment, dt_player, n)
    ls$index = n
    df[n, ] = unlist(ls, recursive = F)
  }
  #transposes and converst the list - normally list unlists horizontaly, we need to transpose ti
  return(df)
}