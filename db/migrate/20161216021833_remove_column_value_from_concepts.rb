class RemoveColumnValueFromConcepts < ActiveRecord::Migration[5.0]
  def change
    remove_column :concepts, :value, :string
  end
end
