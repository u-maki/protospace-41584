class CommentsController < ApplicationController
  class CommentsController < ApplicationController
    def create
      @prototype = Prototype.find(params[:prototype_id])  # 追加
      @comment = @prototype.comments.new(comment_params)
      if @comment.save
        redirect_to prototype_path(@comment.prototype)
      else
        @comments = @prototype.comments
        render "prototypes/show"
      end
    end

    class PrototypesController < ApplicationController
      def show
        @prototype = Prototype.find(params[:id])
        @comments = @prototype.comments.includes(:user)
        @comment = Comment.new  # ここで新しいコメントオブジェクトを初期化
      end
    end
    
    private
  
    def comment_params
      params.require(:comment).permit(:comment).merge(user_id: current_user.id, prototype_id: @prototype.id)  # 修正
    end
  end
end