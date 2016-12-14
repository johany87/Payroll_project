class CreatePayrolls < ActiveRecord::Migration[5.0]
  def change
    create_table :payrolls do |t|
      t.integer :month
      t.integer :year
      t.integer :employee_id
      t.decimal :total_payroll

      t.timestamps
    end
  end
end
