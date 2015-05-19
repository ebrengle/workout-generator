require_relative "../test_helper"

describe ExerciseController do

  describe ".index" do
    let(:controller) {ExerciseController.new}

    it "should say no exercises found when empty" do
      actual_output = controller.index
      expected_output = "No exercises found. Add an exercise.\n"
      assert_equal expected_output, actual_output
    end
  end

  describe ".add" do
    let(:controller) {ExerciseController.new}

    it "should add an exercise" do
      controller.add("Run")
      assert_equal 1, Exercise.count
    end

    it "should not add exercise all spaces" do
      exercise_name = "       "
      result = controller.add(exercise_name)
      assert_equal "\"\" is not a valid exercise name.", result
    end

    it "should only add exercises that make sense" do
      exercise_name = "77777777"
      controller.add(exercise_name)
      assert_equal 0, Exercise.count
    end

  end

end