class CommentsController < ApplicationController
	def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.create(comment_params)
    redirect_to leave_comment_static_pages_path(@blog)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
