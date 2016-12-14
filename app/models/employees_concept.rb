class EmployeesConcept < ApplicationRecord
  belongs_to :employee, class_name: "Employee", foreign_key: "employee_id"
  belongs_to :concept, class_name: "Concept", foreign_key: "concept_id"
end