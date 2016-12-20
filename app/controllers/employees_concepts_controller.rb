class EmployeesConceptsController < ApplicationController

  def index
    @employees_concepts = EmployeesConcept.all
  end

  def new
    @employees_concept = EmployeesConcept.new
    @companies = current_user.companies
    @concepts = Concept.all
  end

  def load_company_info
    @company_id = params[:company_id]
    load_employees
    load_concepts
  end

  def create
    @employees_concept = EmployeesConcept.new
    @employee = Employee.find(params[:employee_id])
    @concept = Concept.find(params[:concept_id])
    @employees_concept.employee = @employee
    @employees_concept.concept = @concept
    @employees_concept.value = params[:value]
    @employees_concept.payroll_date = Date.strptime(params[:payroll_date],"%m/%d/%Y")
    if @employees_concept.save
      redirect_to employees_concepts_path
    else
      render 'new'
    end #if
  end

  def destroy
    find_employees_concept
    if @employees_concept.destroy
        flash[:success] = "Employee Destroyed Successfully"
    else
        flash[:error] = "Employee couldn't delete"
    end #if
  end

  def edit
    @employees_concept = EmployeesConcept.all
    @concepts = Concept.all
  end

  def update
    find_employees_concept
    if @employees_concept.update(employees_concept_params)
      flash[:success] = "Employee updated"
      redirect_to employees_concepts_path
    else
      flash[:error] = "Concept couldn't updated"
      render 'new'
    end #if
  end

  def find_employees_concept
    @employees_concept = EmployeesConcept.find_by(id: params[:id])
  end

  def import
    EmployeesConcept.import(params[:file], current_user.companies.find(params[:import_company_id]))
    flash[:success] = "Concept Imported"
    redirect_to employees_concepts_path
  end

  private

  def employees_concept_params
    params.require(:employees_concept).permit(:employee_id, :concept_id, :value, :payroll_date)
  end

  def load_employees
    @employees = Employee.where(company_id: current_user.companies.find(params[:company_id]))
  end

  def load_concepts
    @concepts = Concept.where(company_id: current_user.companies.find(params[:company_id]))
  end
end
