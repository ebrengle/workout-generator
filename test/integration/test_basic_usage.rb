require_relative '../test_helper'

class BasicUsageTest < Minitest::Test
  def test_minimum_arguments_required
    shell_output = ""
    expected_output = ""
    IO.popen('./workout_generator') do |pipe|
      expected_output = "[Help] Run as: ./workout_generator manage\n"
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

  def test_manage_argument_not_given
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
    IO.popen('./workout_generator manage', 'r+') do |pipe|
      expected_output = <<EOS
1. Add a Workout
2. List all Exercises
3. Create Workout
4. Exit
EOS
      pipe.puts "4"
      expected_output << "Peace Out!\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

  def test_manage_multiple_arguments_given
    shell_output = ""
    expected_output = ""
    IO.popen('./workout_generator manage blah') do |pipe|
      expected_output = "[Help] Run as: ./workout_generator manage\n"
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

end