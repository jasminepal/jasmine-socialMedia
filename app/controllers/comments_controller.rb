class CommentsController < ApplicationController
    before_action :authenticate_user!

def create
    @socio = Socio.find(params[:socio_id])
    @comment = @socio.comments.build(comment_params)
    @comment.user = current_user
  
    if @comment.save
        redirect_to socio_path(@socio), notice: 'Comment was successfully created.'
    else
      # Handle validation errors or other errors here
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to socio_path(@comment.socio), notice: 'Comment was successfully deleted.'
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
