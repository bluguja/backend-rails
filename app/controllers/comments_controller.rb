class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :destroy]

  # POST /comments
  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post = set_post

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    comment_id = @comment.id
    if @comment.destroy
      render json: {comment_id: comment_id}, status: :ok
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:description,:post_id)
    end
end
