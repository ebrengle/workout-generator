require_relative '../test_helper'

describe Exercise do
  describe "#all" do
    describe "if there are no exercises in the database" do
      it "should return an empty array" do
        assert_equal [], Exercise.all
      end
    end
    describe "if there are exercises" do
      before do
        create_exercise("Pushups")
        create_exercise("Pullups")
        create_exercise("Situps")
      end
      it "should return an array" do
        # You don't need to be pedantic like this.
        # This is just an example to remind you that you can use multiple "its"
        assert_equal Array, Exercise.all.class
      end
      it "should return the exercises in alphabetical order" do
        expected = ["Pullups", "Pushups", "Situps"]
        actual = Exercise.all.map{ |exercise| exercise.name }
        assert_equal expected, actual
      end
    end
  end

  describe "#count" do
    describe "if there are no exercises in the database" do
      it "should return 0" do
        assert_equal 0, Exercise.count
      end
    end
    describe "if there are exercises" do
      before do
        create_exercise("Pushups")
        create_exercise("Pullups")
        create_exercise("Situps")
      end
      it "should return the correct count" do
        assert_equal 3, Exercise.count
      end
    end
  end

  describe "#create" do
    describe "if we need to add exercises" do
      it "should add a exercise" do
        Exercise.create("Run")
        assert_equal 1, Exercise.count
      end

      it "should reject empty strings" do
       assert_raises(ArgumentError) { Exercise.create("")}
      end
    end
  end
end