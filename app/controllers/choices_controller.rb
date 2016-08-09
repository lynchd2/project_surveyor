class ChoicesController < ApplicationController
  def new
    parent = params[:choiceable]
    parent_id = (parent.underscore << "_id").to_sym
    @choice_parent = parent.classify.constantize.find(params[parent_id])
    @choice = @choice_parent.choices.build
  end


  def index
    parent = params[:choiceable]
    parent_id = (parent.downcase << "_id").to_sym
    @parent = parent.classify.constantize.find(params[parent_id])
  end

  def edit
    @choice = Choice.find(params[:id])
    @choice_parent = @choice.choiceable
  end

  def update
    @choice = Choice.find(params[:id])
    if @choice.update(choice_params)
      flash[:success] = "Your question has been updated!"
      redirect_to(:back)
    else
      render :edit
    end
  end

  def create
    parent = params[:choiceable]
    parent_id = (parent.underscore << "_id").to_sym
    @choice_parent = parent.classify.constantize.find(params[parent_id])
    @choice = @choice_parent.choices.build(choice_params)
    if @choice.save
      flash[:success] = "Congrats! The choice was created"
      redirect_to @choice_parent
    else
      flash[:error] = "Sorry, but your choice was not created"
      render :new
    end
  end

  def index
  end

  def show
  end


 def destroy
    @choice = Choice.find(params[:id])
    @choice_parent = @choice.choiceable
    if @choice.destroy
      flash[:success] = "Choice was deleted"
      redirect_to @choice_parent 
    else
      flash.now[:error] = "Choice was not deleted"
      redirect_to @choice_parent 
    end
  end


  private


  def choice_params
    params.require(:choice).permit(:value)
  end  

  def underscore
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end


end
