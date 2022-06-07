class EmployeeDetail < ApplicationRecord
    belongs_to :employee
    belongs_to :designation
    validates_presence_of :contact_no, :emergency_contact_no, :designation_id, :employee_id, :manager_id
end
