class Exercise
  attr_reader :id, :errors
  attr_accessor :name

  def initialize(name = nil)
    self.name = name
    @id
  end

  def ==(other)
    other.is_a?(Exercise) && other.id == self.id
  end

  def self.delete(id)
    if find(id) == []
      return false
    else
      Database.execute("DELETE FROM exercises WHERE id = ?", id)
      return true
    end
  end

  def self.all
    Database.execute("SELECT * FROM exercises ORDER BY id").map do |row|
      populate_from_database(row)
    end
  end

  def self.populate_from_database(row)
    exercise = Exercise.new
    exercise.name = row['name']
    exercise.instance_variable_set(:@id, row['id'])
    exercise
  end

  def self.count
    Database.execute("SELECT COUNT(id) FROM exercises")[0][0]
  end

  def self.find(id)
    row = Database.execute("SELECT * FROM exercises WHERE id = ?", id).first
    if row.nil?
      nil
    else
      populate_from_database(row)
    end
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

  def save
    return false unless valid?
    if @id.nil?
      Database.execute("INSERT INTO exercises (name) VALUES (?)", name)
      @id = Database.execute("SELECT last_insert_rowid()")[0]['last_insert_rowid()']
      true
    else
      Database.execute("UPDATE exercises SET name=? WHERE id=?", name, id)
      true
    end
  end

end