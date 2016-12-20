class SearchesController < ApplicationController

  def index
    @employees = Employee.all
    @concepts = Concept.all
    @employees_concepts = EmployeesConcept.all
    search_payroll
  end

  def search_payroll
    @payroll = EmployeesConcept.where("employee_id = ?", params[:employee_id])
    @total_payroll = 0
    @payroll.each do |pr|
      if pr.concept.concept_type
        @total_payroll += pr.value
      else
        @total_payroll -= pr.value
      end
    end
  end #search_payroll



end
