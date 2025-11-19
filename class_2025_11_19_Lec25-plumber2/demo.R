library(tidyverse)
library(tidymodels)

penguins = palmerpenguins::penguins |>
  select(species, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g, sex) |>
  drop_na()
  
set.seed(123)
penguin_split = initial_split(penguins, prop = 0.8, strata = species)
penguin_train = training(penguin_split)
penguin_test = testing(penguin_split)

penguin_recipe = recipe(species ~ ., data = penguin_train) |>
  step_normalize(all_numeric_predictors()) |>
  step_dummy(all_nominal_predictors())

penguin_model = multinom_reg() |>
  set_engine("nnet") |>
  set_mode("classification")

penguin_wf = workflow() |>
  add_recipe(penguin_recipe) |>
  add_model(penguin_model)

penguin_fit = fit(penguin_wf, data = penguin_train)

