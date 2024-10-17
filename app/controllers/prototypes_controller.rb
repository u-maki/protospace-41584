class PrototypesController < ApplicationController

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
     @prototype = Prototype.new(prototype_params)
       
    if @prototype.save
      redirect_to root_path
      
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comments = @prototype.comments.includes(:user)
    @comment = Comment.new 
  end

  def edit
    @prototype =Prototype.find(params[:id])
    unless current_user.id == @prototype.user_id
      redirect_to root_path
    end
    
  end

  def update
    @prototype = Prototype.new
    @prototype = Prototype.find(params[:id])
    
    if @prototype.update(prototype_params)
    redirect_to root_path

    else
      render :edit
    end
    
  end

  def destroy
    @prototype =Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
    
  end

  private

  def prototype_params
    params.require(:prototype).permit(:catch_copy, :title, :image, :concept).merge(user_id: current_user.id)
  end

  
end
