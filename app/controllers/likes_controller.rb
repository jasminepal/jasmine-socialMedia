
class LikesController < ApplicationController
    before_action :authenticate_user! # Ensure users are logged in
    before_action :find_socio
    before_action :find_like, only: [:destroy]
    # skip_before_action :verify_authenticity_token, only: [:update]
    def create
      binding.pry
      @socio = Socio.find(params[:socio_id])
      # like = current_user.likes.build(socio: @socio)
      if already_liked?
        flash[:notice] = 'You cannot like more than once'
      else
        @socio.likes.create(user_id: current_user.id)
      end
      redirect_to socio_path(@socio)
    end
  
    def destroy
      # @like = Like.find(params[:id])
      if !(already_liked?)
        flash[:notice] = 'Cannot unlike'
      else
        @like.destroy
      end
      redirect_to socio_path(@socio)
    end
    
    private
    
    def find_socio
      @socio = Socio.find_by(id: params[:id])
    end

    def already_liked?
      Like.where(user_id: current_user.id, socio_id: params[:socio_id]).exists?
    end

    def find_like
      @like = @socio.likes.find(params[:id])
    end
    
  end
  