class Leave < ApplicationRecord
  has_many :employee_leaves
  validates_presence_of :name, :description, :no_of_days
end

