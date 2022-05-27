class CreateDesignations < ActiveRecord::Migration[7.0]
  def change
    create_table :designations do |t|
      t.string :last_name
      t.string :description
      
      t.timestamps
    end
  end
end
