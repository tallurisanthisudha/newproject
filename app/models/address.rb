class Address < ApplicationRecord
    belongs_to:employee 
    validates_presence_of :house_no, :street, :city, :state, :pincode, :country
end
