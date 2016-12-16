class EmployeesConcept < ApplicationRecord
  belongs_to :employee, class_name: "Employee", foreign_key: "employee_id"
  belongs_to :concept, class_name: "Concept", foreign_key: "concept_id"

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      ec = EmployeesConcept.new 
      #fixed_row = row.to_hash
      row_employee = Employee.find_by(id_card: row.to_hash["id_card"])
      row_concept = Concept.find_by(name: row.to_hash["concept"])
      ec.employee = row_employee
      ec.concept = row_concept
      ec.value = row.to_hash["value"]
      ec.save!
    end
  end #self.import

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path)
    when ".xls" then Roo::Excel.new(file.path)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end #self.open



end
