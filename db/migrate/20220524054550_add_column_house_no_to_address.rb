class AddColumnHouseNoToAddress < ActiveRecord::Migration[7.0]
  def change
    add_column :addresses, :house_no, :string
  end
end
