class EmployeesController < ApplicationController

  def import
    @company = Company.find(params[:company_id])
    puts @company
    Employee.import(params[:file], @company)
    flash[:success] = "Employee Imported"
    redirect_to employees_path
  end

  def index
    @employees = Employee.includes(:company).where(company_id: current_user.companies.select(:id))
  end #index

  def new
    @employee = Employee.new
    @companies = current_user.companies
  end #new

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:success] = "Employee created Ok"
      redirect_to employees_path
    else
      render 'new'
    end #if
  end #create

  def destroy
    find_employee
    if @employee.destroy
        flash[:success] = "Employee Destroyed Successfully"
    else
        flash[:error] = "Employee couldn't delete"
    end #if
      redirect_to employees_path
  end #destroy

  def edit
    find_employee
    @companies = Company.all
  end #edit

  def update
    find_employee
    if @employee.update(employee_params)
      flash[:success] = "Employee updated"
      redirect_to employees_path
    else
      flash[:error] = "Employee couldn't updated"
      render 'new'
    end #if
  end #update

  def show
    find_employee
    @companies = Company.all
  end #show

  def find_employee
    @employee = Employee.find_by(id: params[:id])
  end #find_employee

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :id_card, :email, :address, :phone, :company_id)
  end #employee_params

end #EmployeesController
