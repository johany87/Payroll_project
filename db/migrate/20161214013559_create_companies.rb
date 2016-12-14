class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :nit
      t.string :address
      t.string :logo
      t.string :user_id

      t.timestamps
    end
  end
end
