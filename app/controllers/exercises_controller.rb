require "highline/import"

class ExerciseController
  def index
    if Exercise.count > 0
      exercises = Exercise.all #All of the exercises in an array
      exercises.each_with_index do |exercise, index|
        say("#{index + 1}. #{exercise.name}") #=> 1. Push Ups
      end
    else
      say("No exercises found. Add some exercise.")
    end
  end

  def add(name)
    name_cleaned = name.strip
    exercise = Exercise.new(name_cleaned)
    if exercise.save
      "\"#{name}\" has been added\n"
    else
      exercise.errors
    end
  end

end
