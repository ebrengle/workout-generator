class Exercise
  attr_accessor :name

  def self.all
    Database.execute("select name from exercises order by name ASC").map do |row|
      exercise = Exercise.new
      exercise.name = row[0]
      exercise
    end
  end

  def self.count
    Database.execute("select count(id) from exercises")[0][0]
  end
end