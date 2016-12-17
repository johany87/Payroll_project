class SearchesController < ApplicationController

  def index
    @employees = Employee.all
    @concepts = Concept.all
    search_payroll
  end

  def search_payroll
    @payroll = EmployeesConcept.where("employee_id = ?", params[:employee_id])
  end
end
