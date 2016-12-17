class AddColumnDateToEmployeesconcept < ActiveRecord::Migration[5.0]
  def change
    add_column :employees_concepts, :payroll_date, :date
  end
end
