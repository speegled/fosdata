Readme - Format and Coding of dataset of Germar, Sultan, Kaminski & Mojzisch (2017)

Data in "data_osm.csv" is in long format, i.e. each rows represents one trial (not one subject).

Variables

obs_number = ID of each subject
date = date of experimental session
obs_pref = preference of observer in german ("links" = bypass wall on the left side; "rechts" = bypass wall on the right side
obs_position = observing position of observer in german ("links" = left ; "rechts" = right)
demo_pref = preference of demonstrator(s)in german ("links" = bypass wall on the left side; "rechts" = bypass wall on the right side
condition = "0" = no demonstrator (control condition); "1" = one demonstrator, "3" = three demonstrator
time_train = time that the training took in minutes
time_soc = time that the meeting bewteen observer and demonstrator(s) took in minutes
time_exp = time that the experimental task took in minutes
dropout = "0" = remains in final sample, "1" = excluded from final sample
dog_age = age of observer in months
dog_sex = observer's sex ("1" = male, "2" = female)
breed = breed of observer in german (see SOM for an overview in english)
dropout_category = reason for exclusion ("0" = not excluded, "1" = Stress and Anxiety, "2" = training not sucessful, "3" = other reasons)
trial = number of trial (1,2,3)
value = behavior of observer ("0" = stay response, "1" = stay, "2" = miss i.e. other behavior not bypassing the wall)
start_direction = direction the observer was led from oberving position to start position (see article for details; "0" = directed towards a stay response, "1" irected towards a switch response) 
conform = behavior of observer ("0" = stay response, "1" = switch reponse), as variable value but without misses (which were code NA for analyses)


"main_analysis_1.jasp" and "main_analysis_2_only_start_direction_switch.jasp" represent the files for the main analyses repoted in the article.