class EmployeesConceptsController < ApplicationController
  def index
    @emplyee = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:success] = "Employee created Ok"
      redirect_to employee_path
    else
      render 'new'
    end #if
  end

  def destroy
    find_employee
    if @employee.destroy
        flash[:success] = "Employee Destroyed Successfully"
    else
        flash[:error] = "Employee couldn't delete"
    end #if
      redirect_to employee_path
  end

  def edit
    @employee = Employee.all
  end

  def update
    find_employee
    if @employee.update(employee_params)
      flash[:success] = "Employee updated"
      redirect_to employe_path
    else
      flash[:error] = "Concept couldn't updated"
      render 'new'
    end #if
  end

  def show
  end

  def find_employees_concepts
  end

  def employee_concept_params
  end
end
