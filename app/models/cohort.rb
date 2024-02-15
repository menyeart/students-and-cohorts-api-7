class Cohort < ApplicationRecord 
   has_many :students

   validates :name, uniqueness: true, presence: true
   validates_presence_of :start_date, :graduation_date

   def number_of_students
      self.students.count
   end

   def status
      self.graduation_date < Date.today ? "graduated" : "current"
   end
end 