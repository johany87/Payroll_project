class AddColumnCompanyIdToConcepts < ActiveRecord::Migration[5.0]
  def change
    add_column :concepts, :company_id, :integer
  end
end
