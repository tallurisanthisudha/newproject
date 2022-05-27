class AddColumnToLeaves < ActiveRecord::Migration[7.0]
  def change
    add_column :leaves, :no_of_days, :string
  end
end
