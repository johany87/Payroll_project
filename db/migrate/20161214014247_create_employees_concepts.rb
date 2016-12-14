class CreateEmployeesConcepts < ActiveRecord::Migration[5.0]
  def change
    create_table :employees_concepts do |t|
      t.integer :employee_id
      t.integer :concept_id

      t.timestamps
    end
  end
end
