  class Company < ApplicationRecord
  has_many :employees, class_name: "Employee"
    has_many :concepts, class_name: "Concept"
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  mount_uploader :avatar, AvatarUploader

  def self.import(file, current_user)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      company = find_by_id(row["id"]) || new
      company.user = current_user
      company.attributes = row.to_hash
      company.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path)
    when ".xls" then Roo::Excel.new(file.path)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

end
