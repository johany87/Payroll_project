class PayrollsController < ApplicationController

  def index
    @payrolls = Payroll.all
    @employees = Employee.all
  end #index

  def new
    @payroll = Payroll.new
    @employees = Employee.all
  end #new

  def create
    @payroll = Payroll.new(payroll_params)
    if @payroll.save
      flash[:success] = "PayRoll created Ok"
      redirect_to payrolls_path
    else
      render 'new'
    end #if
  end #create

  def destroy
    find_payroll
    if @payroll.destroy
        flash[:success] = "PayRoll Destroyed Successfully"
    else
        flash[:error] = "PayRoll couldn't delete"
    end #if
      redirect_to payrolls_path
  end #destroy

  def edit
    find_payroll
    @employees = Employee.all
  end #edit

  def update
    find_payroll
    if @payroll.update(payroll_params)
      flash[:success] = "PayRoll updated"
      redirect_to payrolls_path
    else
      flash[:error] = "PayRoll couldn't updated"
      render 'new'
    end #if
  end #update

  def show
    find_payroll
    @employees = Employee.all
  end #show

  def find_payroll
    @payroll = Payroll.find_by(id: params[:id])
  end #find_payroll

  private

  def payroll_params
    params.require(:payroll).permit(:month, :year, :employee_id, :total_payroll)
  end #payroll_params

end #PayrollsController
