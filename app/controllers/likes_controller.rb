class LikesController < ApplicationController
  before_action :set_resource

  def create
    @like = @resource.likes.find_by(user_id: current_user.id)
    if @like.present?
      @like.destroy
      render json: {likes: @resource.likes.count}, status: :ok
    else
      @like = current_user.likes.new
      @like.likable_id = params[:likable_id]
      @like.likable_type = params[:likable_type]
      render json: {likes: @resource.likes.count}, status: :created if @like.save
    end
  end

  private

  def set_resource
    if params[:likable_type] === "Post"
      @resource = Post.find params[:likable_id]
    else
      @resource = Comment.find params[:likable_id]
    end
  end

end
