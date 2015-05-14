class Exercise
  attr_accessor :name
  attr_reader :id, :errors


  def initialize(name = nil)
    self.name = name
  end

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

  def self.create(name)
    if name.empty?
      raise ArgumentError.new
    else
      Database.execute("INSERT INTO exercises (name) VALUES (?)", name)
    end
  end

  def save
    return false unless valid?
    Database.execute("INSERT INTO exercises (name) VALUES (?)", name)
    @id = Database.execute("SELECT last_insert_rowid()")[0]['last_insert_rowid()']
  end

  def valid?
    if name.nil? or name.empty? or /^\d+$/.match(name)
      @errors = "\"#{name}\" is not a valid exercise name."
      false
    else
      @errors = nil
      true
    end
  end
end