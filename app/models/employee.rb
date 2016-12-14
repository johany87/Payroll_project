class Employee < ApplicationRecord
  has_many :payrolls, class_name: "Payroll"
  has_many :employees_concepts, class_name: "EmployeesConcept"
  belongs_to :company, class_name: "Company", foreign_key: "company_id"
end
