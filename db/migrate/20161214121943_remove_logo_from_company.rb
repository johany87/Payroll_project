class RemoveLogoFromCompany < ActiveRecord::Migration[5.0]
  def change
    remove_column :companies, :logo, :string
  end
end
