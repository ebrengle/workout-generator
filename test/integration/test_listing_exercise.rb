require_relative '../test_helper'

class TestListingScenarios < Minitest::Test

  def test_listing_no_scenarios
    shell_output = ""
    expected_output = ""
    IO.popen('./workout_generator manage', 'r+') do |pipe|
      expected_output << main_menu
      pipe.puts "2"
      expected_output << "\nNo exercises found. Add an exercise.\n"
      expected_output << main_menu
      pipe.puts "Exit"
      expected_output << "\nThanks for using our Workout App!\n"
      shell_output = pipe.read
      pipe.close_write
      pipe.close_read
    end
    assert_equal expected_output, shell_output
  end

  def test_listing_multiple_scenarios
    create_exercise("Pushups")
    create_exercise("Pullups")
    shell_output = ""
    expected_output = ""
    IO.popen('./workout_generator manage', 'r+') do |pipe|
      expected_output << main_menu
      pipe.puts "2" # List all scenarios
      expected_output << "\n1. Pushups\n"
      expected_output << "2. Pullups\n"
      expected_output << "3. Exit\n"
      expected_output << "Select an exercise by list number:\n"
      expected_output << exit_from(pipe)
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end
end