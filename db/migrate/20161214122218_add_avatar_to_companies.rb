class AddAvatarToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :avatar, :string
  end
end
