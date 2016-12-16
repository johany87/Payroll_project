class Concept < ApplicationRecord
  has_many :employees_concepts, class_name: "EmployeesConcept"

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      concept = find_by_id(row["id"]) || new
      concept.attributes = row.to_hash
      concept.save!
    end
  end #self.import

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path)
    when ".xls" then Roo::Excel.new(file.path)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end #self.open_spreadsheet

  def get_concept_type
    if concept_type
      "Devengado"
    else
      "Deducido"
    end #if
  end #concep

end
