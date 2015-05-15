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

  describe ".initialize" do
    it "sets the name attribute" do
      exercise = Exercise.new("foo")
      assert_equal "foo", exercise.name
    end
  end

  describe ".save" do
    describe "if the model is valid" do
      let(:exercise){ Exercise.new("lift a pig") }
      it "should return true" do
        assert exercise.save
      end
      it "should save the model to the database" do
        exercise.save
        assert_equal 1, Exercise.count
        last_row = Database.execute("SELECT * FROM exercises")[0]
        database_name = last_row['name']
        assert_equal "lift a pig", database_name
      end
      it "should populate the model with id from the database" do
        exercise.save
        last_row = Database.execute("SELECT * FROM exercises")[0]
        database_id = last_row['id']
        assert_equal database_id, exercise.id
      end
    end

    describe "if the model is invalid" do
      let(:exercise){ Exercise.new("") }
      it "should return false" do
        refute exercise.save
      end
      it "should not save the model to the database" do
        exercise.save
        assert_equal 0, Exercise.count
      end
      it "should populate the error messages" do # I have some qualms.
        exercise.save
        assert_equal "\"\" is not a valid exercise name.", exercise.errors
      end
    end
  end

  describe ".valid?" do
    describe "with valid data" do
      let(:exercise){ Exercise.new("shuck corn on the cob") }
      it "returns true" do
        assert exercise.valid?
      end
      it "should set errors to nil" do
        exercise.valid?
        assert exercise.errors.nil?
      end
    end
    describe "with no name" do
      let(:exercise){ Exercise.new(nil) }
      it "returns false" do
        refute exercise.valid?
      end
      it "sets the error message" do
        exercise.valid?
        assert_equal "\"\" is not a valid exercise name.", exercise.errors
      end
    end
    describe "with empty name" do
      let(:exercise){ Exercise.new("") }
      it "returns false" do
        refute exercise.valid?
      end
      it "sets the error message" do
        exercise.valid?
        assert_equal "\"\" is not a valid exercise name.", exercise.errors
      end
    end
    describe "with a name with no letter characters" do
      let(:exercise){ Exercise.new("777") }
      it "returns false" do
        refute exercise.valid?
      end
      it "sets the error message" do
        exercise.valid?
        assert_equal "\"777\" is not a valid exercise name.", exercise.errors
      end
    end
    describe "with a previously invalid name" do
      let(:exercise){ Exercise.new("666") }
      before do
        refute exercise.valid?
        exercise.name = "Eat a pop tart"
        assert_equal "Eat a pop tart", exercise.name
      end
      it "should return true" do
        assert exercise.valid?
      end
      it "should not have an error message" do
        exercise.valid?
        assert_nil exercise.errors
      end
    end
  end
end