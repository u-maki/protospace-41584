class PrototypesController < ApplicationController

  def index
  
  end

  def new
    @prototype = prototype.new
    
  end

  def create
    
  end

  private

  def prototype_params
    params.require(:prototype).permit(:catch_copy, :title).merge(user_id: current_user.id)
  end
end
