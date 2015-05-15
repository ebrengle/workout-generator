require "highline/import"

class ExerciseController
  def index
    if Exercise.count > 0
      exercises = Exercise.all #All of the exercises in an array
      exercises_string = ""
      exercises.each_with_index do |exercise, index|
        exercises_string << "#{index + 1}. #{exercise.name}\n" #=> 1. Push Ups
      end
      exercises_string
    else
      "No exercises found. Add an exercise.\n"
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