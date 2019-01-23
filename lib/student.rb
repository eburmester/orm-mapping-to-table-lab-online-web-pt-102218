class Student

 attr_accessor :grade, :name 
 attr_reader :id 
 
 def initialize(id=nil, name, grade)
   @name = name
   @grade = grade 
   @id = id 
 end 
 
 def self.create_table
   sql =  <<-SQL 
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY, 
        name TEXT, 
        grade TEXT
        )
        SQL
    DB[:conn].execute(sql)
  end 
  
  def self.drop_table
    sql =  <<-SQL 
      DROP TABLE IF EXISTS students
        SQL
    DB[:conn].execute(sql)
  end 
  
  def save 
    sql =  <<-SQL 
      INSERT INTO students (name, grade) VALUES (?,?)
        SQL
    DB[:conn].execute(sql, self.name, self.album)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
  end
  
end
