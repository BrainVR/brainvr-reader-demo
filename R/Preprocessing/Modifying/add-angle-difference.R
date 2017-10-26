#' Adds new colum angle_diff_axis where it calculates angle difference between rows
#' @param player_log data.table log that gets modified by reference
#' @param axis axis X, Y or Z. the player log shoudl have Rotation.Axis colum 
#' @example 
#' add_angle_difference(player_log, "Y")
#' 
add_angle_difference = function(player_log, axis = "x"){
  rotation_col_name <- paste("Rotation.", toupper(axis), sep = "")
  new_col_name <- paste("angle_diff_", axis, sep = "")
  
  axis_angles <- player_log[[rotation_col_name]]
  if(axis_angles) {
    smart_print(c("There isn't a rotation column of name", rotation_col_name))
    return()
  }
  axis_angle_diffs <- c(0, diff(axis_angles))
  axis_angle_diffs <- convert_angle(axis_angle_diffs)
  
  player_log[, (new_col_name):= axis_angle_diffs]
  return(player_log)
}
convert_angle = function(difference){
  return(((difference + 180) %% 360) - 180)
} 