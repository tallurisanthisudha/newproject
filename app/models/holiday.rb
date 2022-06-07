class Holiday < ApplicationRecord
    validates_presence_of :name, :date, :year
end
