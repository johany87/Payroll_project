class ConceptsController < ApplicationController

  def import
    Concept.import(params[:file])
    flash[:success] = "Concept Imported"
    redirect_to comcepts_path
  end #import

  def index
    @concepts = Concept.all
  end #index

  def new
    @concept = Concept.new
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
    @concepts = Concept.all
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
    params.require(:concept).permit(:name, :type, :value)
  end #concept_params

end
