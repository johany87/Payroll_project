class ConceptsController < ApplicationController

  def import
    Concept.import(params[:file], current_user.companies.find(params[:company_id]))
    flash[:success] = "Concept Imported"
    redirect_to concepts_path
  end #import

  def index
    @concepts = Concept.all
  end #index

  def new
    @concept = Concept.new
    @companies = current_user.companies
  end #new

  def create
    @concept = Concept.new(concept_params)
    if @concept.save
      flash[:success] = "Concept created Ok"
      redirect_to concepts_path
    else
      render 'new'
    end #if
  end #create

  def destroy
    find_concept
    if @concept.destroy
        flash[:success] = "Concept y Destroyed Successfully"
    else
        flash[:error] = "Concept couldn't delete"
    end #if
      redirect_to concepts_path
  end #destroy

  def edit
    @concept = Concept.all
  end #edit

  def update
    find_concept
    if @concept.update(concept_params)
      flash[:success] = "Concept updated"
      redirect_to concepts_path
    else
      flash[:error] = "Concept couldn't updated"
      render 'new'
    end #if
  end #update

  def show
    find_concept
  end #show

  def find_concept
    @concept = Concept.find_by(id: params[:id])
  end #find_concept

  private

  def concept_params
    params.require(:concept).permit(:name, :concept_type, :value, :company_id)
  end #concept_params

end
