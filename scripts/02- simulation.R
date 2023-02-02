# Create sample data 
simulated_data <-
  tibble(
    # Use 1 through to 500 to represent number of apprehensions
    "Number_of_apprehensions" = 1:500,
    # Randomly pick an options, with replacement, 500 times
    "MHAType" = sample(
      x = c(
        "section1",
        "section2",
        "section3",
        "section4",
        "section5"
      ),
      size = 500,
      replace = TRUE
    )
  )

simulated_data


