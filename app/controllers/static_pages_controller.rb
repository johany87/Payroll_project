class StaticPagesController < ApplicationController

  def index
    @companies = Company.all
    @concepts = Concept.all
    @employees_concepts = EmployeesConcept.all
    @employees = Employee.all
  end
end
