class CommentsController < ApplicationController
  # It is an action to save and post comments.
  def create
    # It searches Blog from the values of parameter and build it as comments related to Blog.
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    # Change format according to client request
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to post_path(@post), notice: 'Post failed...' }
      end
    end
  end

  private
  # Strong Parameter
  def comment_params
    params.require(:comment).permit(:post_id, :content)
  end
end
