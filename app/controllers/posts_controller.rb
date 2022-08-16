class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if params[:back]
      render :new
    else
      if @post.save
        PostMailer.post_mail(@post).deliver
          redirect_to posts_path, notice: "ポストを作成しました！"
      else
        render :new
      end
    end
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
  end

  def edit
  end

  def update
    if @post.user != current_user
      redirect_to new_post_path
    else
      if @post.update(post_params)
        redirect_to posts_path, notice: "ポストを編集しました！"
      else
        render :edit
      end
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice:"ブログを削除しました！"
  end

  def confirm
    @post = current_user.posts.build(post_params)
    render :new if @post.invalid?
  end

  private

  def post_params
    params.require(:post).permit(:post,:picture, :picture_cache )
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
