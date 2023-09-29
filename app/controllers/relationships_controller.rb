class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    user_to_follow = User.find(params[:user_id])
    current_user.follow(user_to_follow)
    redirect_to socio_path(params[:socio_id])
  end

  def destroy
    relationship = current_user.active_relationships.find_by(id: params[:id])
    # relationship = Relationship.find(params[:id])
    user_to_unfollow = relationship.followed
    relationship.destroy
    # current_user.unfollow(user_to_unfollow)
    redirect_to socio_path(params[:socio_id]), notice: 'You have unfollowed this user.'
  end
end
