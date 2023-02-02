#conducting tests

simulated_data$MHAType |>
  unique() 

simulated_data$Number_of_apprehensions |> min() == 37

simulated_data$Number_of_apprehensions |> max() == 483

simulated_data$Number_of_apprehensions |> class() == "numeric"
