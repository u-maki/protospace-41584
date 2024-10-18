class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = @prototype.comments.new(comment_params)
    
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
    else
      @comments = @prototype.comments.includes(:user)
      @comment = Comment.new  # 新しいコメントオブジェクトを初期化
      render "prototypes/show"
    end
  end
  
  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end


