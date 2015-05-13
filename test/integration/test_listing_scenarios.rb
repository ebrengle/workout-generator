require_relative '../test_helper'

class TestListingScenarios < Minitest::Test

  def test_listing_no_scenarios
    shell_output = ""
    expected_output = ""
    IO.popen('./workout_generator manage', 'r+') do |pipe|
      expected_output << main_menu
      pipe.puts "2"
      expected_output << "\nNo exercises found. Add some exercise.\n"
      pipe.close_write
      shell_output = pipe.read
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
      expected_output << "\n1. Pullups\n"
      expected_output << "2. Pushups\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end
end