class Concept < ApplicationRecord
  has_many :employees_concepts, class_name: "EmployeesConcept"
end
