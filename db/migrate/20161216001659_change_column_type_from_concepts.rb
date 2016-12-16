class ChangeColumnTypeFromConcepts < ActiveRecord::Migration[5.0]

  def change
    rename_column :concepts, :type, :concept_type
  end

end
