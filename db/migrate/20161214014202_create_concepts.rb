class CreateConcepts < ActiveRecord::Migration[5.0]
  def change
    create_table :concepts do |t|
      t.string :name
      t.boolean :concept_type
      t.decimal :value

      t.timestamps
    end
  end
end
