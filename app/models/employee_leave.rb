class EmployeeLeave < ApplicationRecord
    belongs_to: employee
    has_one: leave
end
