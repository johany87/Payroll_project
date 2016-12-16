class EmployeesConceptsController < ApplicationController

  def index
    @employees_concepts = EmployeesConcept.all
  end

  def new
    @employee_concept = EmployeesConcept.new
    @employees = Employee.all
    @concepts = Concept.all
  end

  def create
    @employee_concept = EmployeesConcept.new(employee_concept_params)
    if @employee_concept.save
      flash[:success] = "Employee concept created Ok"
      redirect_to employees_concepts_path
    else
      render 'new'
    end #if
  end

  def destroy
    find_employee_concept
    if @employee_concept.destroy
        flash[:success] = "Employee Destroyed Successfully"
    else
        flash[:error] = "Employee couldn't delete"
    end #if
      redirect_to employees_concepts_path
  end

  def edit
    @employee_concept = EmployeesConcept.all
    @concepts = Concept.all
  end

  def update
    find_employee_concept
    if @employee_concept.update(employee_params)
      flash[:success] = "Employee updated"
      redirect_to employees_concepts_path
    else
      flash[:error] = "Concept couldn't updated"
      render 'new'
    end #if
  end

  def find_employee_concept
    @emplyee_concept = EmployeesConcept.find_by(id: params[:id])
  end

  def import
    EmployeesConcept.import(params[:file])
    flash[:success] = "Concept Imported"
    redirect_to employees_concepts_path
  end

  private

  def employee_concept_params
    params.require(:employee_concept).permit(:employee_id, :concept_id)
  end
end
