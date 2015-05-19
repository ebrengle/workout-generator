require 'rubygems'
require 'bundler/setup'
require "minitest/reporters"
require 'sqlite3'
Dir["./app/**/*.rb"].each { |f| require f }
Dir["./lib/*.rb"].each { |f| require f }
ENV["TEST"] = "true"

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

require 'minitest/autorun'
class Minitest::Test
  def setup
    Database.load_structure
    Database.execute("DELETE FROM exercises;")
    Database.execute("DELETE FROM choices;")
  end
end

def create_exercise(name)
  Database.execute("INSERT INTO exercises (name) VALUES (?)", name)
end

def main_menu
  "1. Add an Exercise\n2. List All Exercises\n3. Create Workout\n4. View Workouts\n5. Exit"
end

def actions_menu
  "Would you like to?\n1. Edit Exercise\n2. Delete Exercise\n3. Exit\n"
end