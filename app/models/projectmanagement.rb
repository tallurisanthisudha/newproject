class Projectmanagement < ApplicationRecord
    validates_presence_of :project_name, :client, :manager_id, :description, :client_time_zone, :shift_information, :project_type
end
