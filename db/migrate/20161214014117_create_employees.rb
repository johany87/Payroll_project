class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.float :id_card
      t.string :email
      t.string :address
      t.integer :phone
      t.integer :company_id

      t.timestamps
    end
  end
end
