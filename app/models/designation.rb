class Designation < ApplicationRecord
    #has_many :employees, :through => :employee_details
    validates_presence_of :last_name, :description
end
