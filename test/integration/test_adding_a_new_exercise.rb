require_relative '../test_helper'

##Add an exercise:
#In order to keep all my workouts straight I want to create a workout and add it to my list.


# Usage Example:
# > ./workout-generator
# 1. Add a workout
# 2. List all exercises
# 3. Create Workout
# 4. Exit

# > 1
# Please Enter the Name of Your First Exercise:
# > Push Ups
# Please Enter the number of reps:
# > 15
# Would you like to Add another exercise? (y/n)
# > n
# Exit

class AddingANewExerciseTest < Minitest::Test
  def test_happy_path_adding_an_exercise
    shell_output = ""
    expected_output = main_menu
    test_exercise = "run"
    IO.popen('./workout_generator manage', 'r+') do |pipe|
      pipe.puts "1"
      expected_output << "\nWhat exercise would you like to add?\n"
      pipe.puts test_exercise
      expected_output << "\"#{test_exercise}\" has been added\n"
      expected_output << main_menu
      pipe.puts "2"
      expected_output << "\n1. #{test_exercise}\n"
      expected_output << "2. Exit\n"
      expected_output << "Select an exercise by list number:\n"
      expected_output << exit_from(pipe)
      shell_output = pipe.read
      pipe.close_write
      pipe.close_read
    end
    assert_equal expected_output, shell_output
  end

  def test_sad_path_adding_a_scenario
    shell_output = ""
    happy_exercise = "throwing a knife"
    expected_output = main_menu
    IO.popen('./workout_generator manage', 'r+') do |pipe|
      pipe.puts "1"
      expected_output << "\nWhat exercise would you like to add?\n"
      pipe.puts ""
      expected_output << "\"\" is not a valid exercise name.\n"
      expected_output << "What exercise would you like to add?\n"
      pipe.puts happy_exercise
      expected_output << "\"#{happy_exercise}\" has been added\n"
      expected_output << main_menu
      pipe.puts "2"
      expected_output << "\n1. #{happy_exercise}\n"
      expected_output << "2. Exit\n"
      expected_output << "Select an exercise by list number:\n"
      expected_output << exit_from(pipe)
      shell_output = pipe.read
      pipe.close_write
      pipe.close_read
    end
    assert_equal expected_output, shell_output
  end
end