class AddColumnToEmployeeLeave < ActiveRecord::Migration[7.0]
  def change
    add_column :employee_leaves, :status, :string
  end
end
