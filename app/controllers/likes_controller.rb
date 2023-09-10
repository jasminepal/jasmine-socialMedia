
class LikesController < ApplicationController
    before_action :authenticate_user! # Ensure users are logged in
  
    def create
      @socio = Socio.find(params[:socio_id])
      like = current_user.likes.build(socio: @socio)
      if like.save
        flash[:success] = 'You liked this post.'
      else
        flash[:error] = 'Error liking the post.'
      end
      redirect_to @socio
    end
  
    def destroy
      @like = Like.find(params[:id])
      if @like.destroy
        flash[:success] = 'You unliked this post.'
      else
        flash[:error] = 'Error unliking the post.'
      end
      redirect_to @like.socio
    end

    def like_toggle
        @socio = Socio.find(params[:socio_id])
        @like = @socio.likes.find_or_initialize_by(user: current_user)
    
        if @like.new_record?
          @like.save
          flash[:success] = 'You liked this post.'
        else
          @like.destroy
          flash[:success] = 'You unliked this post.'
        end
    
        redirect_to @socio
    end
  end
  