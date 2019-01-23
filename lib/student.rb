class Student

 attr_accessor :grade, :name 
 attr_reader :id 
 
 def initialize(id=nil, name, grade)
   @name = name
   @grade = grade 
   @id = id 
 end 
 
 
  
end
