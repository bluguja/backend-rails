class LikesController < ApplicationController
  before_action :set_post, only: [ :create,:destroy]

  def create
    @like = current_user.likes.new
    @like.likable_id = params[:likable_id]
    @like.likable_type = params[:likable_type]
    if @like.save
      render json: {likes: @resource.likes.count}, status: :created
    else
      @destroy_like = current_user.likes.find_by({likable_id: @like.likable_id, likable_type: @like.likable_type})
      @destroy_like.destroy
      render json: {likes: @resource.likes.count}, status: :ok
    end
  end

  private
  def set_post
    if params[:likable_type] === "Post"
      @resource = Post.find params[:likable_id]
    else
      @resource = Comment.find params[:likable_id]
    end
  end

end
