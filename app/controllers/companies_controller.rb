class CompaniesController < ApplicationController

  def import
    Company.import(params[:file], current_user)
    flash[:success] = "Companies Imported"
    redirect_to companies_path
  end

  def index
    @companies = Company.all
    @usuarios = User.all
  end #index

  def new
    @company = Company.new
    @usuarios = User.all
  end # new

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "Company created Ok"
      redirect_to companies_path
    else
      render 'new'
    end #if
  end #create

  def destroy
    find_company
    if @company.destroy
        flash[:success] = "Company Destroyed Successfully"
    else
        flash[:error] = "Company couldn't delete"
    end #if
      redirect_to companies_path
  end #destroy

  def edit
    find_company
    @users = User.all
  end

  def update
    find_company
    if @company.update(company_params)
      flash[:success] = "Company updated"
      redirect_to companies_path
    else
      flash[:error] = "Company couldn't updated"
      render 'new'
    end #if
  end

  def show
    find_company
    @users = User.all
    @concepts = Concept.all
  end

  def find_company
    @company = Company.find_by(id: params[:id])
  end #find_company

  private

  def company_params
    params.require(:company).permit(:name, :nit, :address, :avatar, :user_id)
  end # company_params

end
