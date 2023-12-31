class SociosController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    # before_action :set_socio, only: [:edit, :update, :destroy]
    


    def index
        @socios = Socio.all
        # render :index
    end

    def show
        @socio = Socio.find(params[:id])
        @user = @socio.user
        @like = current_user&.likes&.find_by(socio: @socio)
        # The @blog_post instance variable is already set by set_blog_post method
    end
    
    def new
        @socio = Socio.new
    end
    
    def create
        @socio = current_user.socios.new(socio_params)
        if @socio.save
          redirect_to @socio, notice: 'Socio was successfully created.'
        else
          render :new
        end
    end
    
    def edit
        @socio = Socio.find(params[:id])
        if current_user == @socio.author
            # render :edit
            # Allow the author to edit the post
        else
            redirect_to socios_path, alert: 'You are not authorized to edit this post.'
        end
    end
    
    def update
        @socio = Socio.find(params[:id])
        if @socio.update(socio_params)
          redirect_to @socio, notice: 'Socio was successfully updated.'
        else
          render :edit
        end
    end
    
    def destroy
        @socio = Socio.find(params[:id])
        if current_user == @socio.user
            @socio.destroy
            redirect_to socios_url, notice: 'Socio was successfully destroyed.'
        else
            redirect_to socios_url, alert: 'You are not authorized to delete this post.'
        end
    end
    
    private
    
    def set_socio
        @socio = current_user.socios.find(params[:id])
    end
    
    def socio_params
        params.require(:socio).permit(:title, :description, :image, :video)
    end

    def like
        @socios = Socio.includes(:likes).all
        @socio = Socio.find(params[:id])
        current_user.likes.create(socio: @socio)
        redirect_to socios_path, notice: 'You liked this socio.'
    end
    
    def unlike
        @socio = Socio.find(params[:id])
        current_user.likes.find_by(socio: @socio).destroy
        redirect_to socios_path, notice: 'You unliked this socio.'
    end
end
