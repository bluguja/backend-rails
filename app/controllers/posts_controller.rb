class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    postArray = []
    @posts = Post.includes(:comments,:likes)
    @posts.each do |post|
      postLikeArray = []
      @likes = post.likes
      @likes.each do |like|
        postLikeArray << {user_id: like.user_id, name: like.user.name}
      end
      commentArray = []
      @comments = post.comments.includes(:likes)
      @comments.each do |comment|
        commentLikeArray = []
        @likes = comment.likes
        @likes.each do |like|
          commentLikeArray << {user_id: like.user_id, name: like.user.name}
        end
        commentArray << {comment: comment, name: comment.user.name ,  likes: commentLikeArray}
      end
      postArray << {post: post, name: post.user.name ,likes: postLikeArray, comments: commentArray}
    end

    render json: {posts: postArray}
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      render json: {post: @post}, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.includes(:comments,:likes).find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:description)
    end
end
