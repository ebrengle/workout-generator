require_relative '../test_helper'

class BasicUsageTest < Minitest::Test

  def test_manage_wrong_argument_given
    shell_output = ""
    expected_output = ""
    IO.popen('./workout_generator blah') do |pipe|
      expected_output = "[Help] Run as: ./workout_generator manage\n"
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

  def test_manage_argument_given_then_exit
    shell_output = ""
    expected_output = ""
    IO.popen('./workout_generator manage') do |pipe|
      expected_output = "[Help] Run as: ./workout_generator manage\n"
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

  def test_manage_argument_given_then_exit
    shell_output = ""
    expected_output = ""
    IO.popen('./workout_generator manage', 'r+') do |pipe|
      expected_output = <<EOS
1. Add an Exercise
2. List All Exercises
3. Exit
EOS
      pipe.puts "3"
      expected_output << "Thanks for using our Workout App!\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

end