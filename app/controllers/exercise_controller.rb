require "highline/import"

class ExerciseController
  def index
    if Exercise.count > 0
      exercises = Exercise.all #All of the exercises in an array
      choose do |menu|
        menu.prompt = "Select an exercise by list number:"
        exercises.each do |exercise|
          menu.choice(exercise.name){ action_menu(exercise) }
        end
        menu.choice("Exit")
      end
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

  def edit(exercise)
    loop do
      user_input = ask("Enter a new exercise:")
      exercise.name = user_input.strip
      if exercise.save
        say("Exercise has been updated to: \"#{exercise.name}\"")
        return
      else
        say(exercise.errors)
      end
    end
  end

  def destroy(exercise)
    exercise.delete
  end

  def action_menu(exercise)
    say("Would you like to?")
    choose do |menu|
      menu.prompt = ""
      menu.choice("Edit") do
        edit(exercise)
      end
      menu.choice("Delete") do
        destroy(exercise)
      end
      menu.choice("Exit") do
        exit
      end
    end
  end

end