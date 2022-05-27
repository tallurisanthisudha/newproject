class Project < ApplicationRecord
   # has_many: employees
    #has_many :employee_projects
    #has_many :employees, :through=> :employee_projects
    has_and_belongs_to_many :employees
end
