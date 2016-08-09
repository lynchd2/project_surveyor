class MultipleChoicesController < ApplicationController
  def new
    @survey = Survey.find(params[:survey_id])
    @multiple_choice = @survey.multiple_choices.build
  end

  def show
    @multiple_choice = MultipleChoice.find(params[:id])
  end

  def create
    @survey = Survey.find(params[:survey_id])
    @multiple_choice = @survey.multiple_choices.build(multiple_choice_params)
    if @multiple_choice.save
      flash[:success] = "Your question has been created!"
      create_choices(@multiple_choice)
      redirect_to @multiple_choice
    else
      render :new
    end
  end

  def edit
    @multiple_choice = MultipleChoice.find(params[:id])
  end

  def update
    @multiple_choice = MultipleChoice.find(params[:id])
    if @multiple_choice.update(multiple_choice_params)
      flash[:success] = "Your question has been updated!"
      redirect_to multiple_choice_path(@multiple_choice)
    else
      render :edit
    end 
  end

  def destroy
  end


  private


  def multiple_choice_params
    params.require(:multiple_choice).permit(:survey_id, :question, :number_of_choices, :answers, :required )
  end

  def create_choices(question)
    question.number_of_choices.times do |i|
      Choice.create(choiceable_type: "MultipleChoice", choiceable_id: question.id, value: "default")
    end
  end
end
