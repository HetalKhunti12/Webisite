class StaticPagesController < ApplicationController

  def  how_it_works
  end
  
  def blog
    @blogs = Blog.all
  end

  def leave_comment
    @blog = Blog.find(params[:id])
    @comment = Comment.new
  end
end
