class SurveysController < ApplicationController
  def new
    @survey = Survey.new
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def index
    @surveys = Survey.all
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def create
    @survey = Survey.create(survey_params)
    if @survey.save
      flash[:success] = "Congrats! You have started a survey"
      redirect_to surveys_path
    else
      flash.now[:error] = "Failed to create survey"
      render :new
    end
  end

  def update
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    redirect_to surveys_path
  end


  private

  def survey_params
    params.require(:survey).permit(:title, :description)
  end

end
