class AddColumnValueToEmployeesConcepts < ActiveRecord::Migration[5.0]
  def change
    add_column :employees_concepts, :value, :integer
  end
end
