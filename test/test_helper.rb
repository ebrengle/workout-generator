require 'rubygems'
require 'bundler/setup'
require "minitest/reporters"
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
  end
end

def create_exercise(name)
  Database.execute("INSERT INTO exercises (name) VALUES (?)", name)
end

def main_menu
  "1. Add a Workout\n2. List all Exercises\n3. Create Workout\n4. Exit"
end