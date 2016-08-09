class NumberRangesController < ApplicationController
  def new
    @survey = Survey.find(params[:survey_id])
    @number_range = @survey.number_ranges.build
  end

  def show
    @number_range = NumberRange.find(params[:id])
  end

  def create
    @survey = Survey.find(params[:survey_id])
    @number_range = @survey.number_ranges.build(number_range_params)
    if @number_range.save
      flash[:success] = "Your question has been created!"
      create_choices(@number_range)
      redirect_to @number_range
    else
      render :new
    end
  end

  def edit
    @number_range = NumberRange.find(params[:id])
  end

  def update
    @number_range = NumberRange.find(params[:id])
    if @number_range.update(number_range_params)
      flash[:success] = "Your question has been updated!"
      redirect_to number_range_path(@number_range)
    else
      render :edit
    end
  end

  def destroy
  end


  private

  def number_range_params
    params.require(:number_range).permit(:survey_id, :question, :low, :high, :required )
  end

  def create_choices(question)
    question.low.upto(question.high) do |i|
      Choice.create(choiceable_type: "NumberRange" , choiceable_id: question.id, value: i)
    end
  end
end
