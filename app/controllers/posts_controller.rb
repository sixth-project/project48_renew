class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :destroy, :edit, :update]
  before_action :authenticate_user! #ログインユーザーのみcreate & Destroy出来る
  before_action :correct_user, only: [:create, :edit, :update, :destroy]

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to current_user, notice: "投稿が作成されました。"
    else
      redirect_to current_user, notice: "投稿に失敗しました。"
    end
  end

  def destroy
    @post.destroy
    redirect_to current_user
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to current_user, notice: "投稿を編集しました。"
    else
      render "posts/edit", notice: "投稿の編集に失敗しました。"
    end
  end

  private

  def set_post
    @post = Post.find_by(id: params[:id])
  end

  def correct_user
    @user = User.find_by(params[:id])
    redirect_to(root_path) unless current_user == @user
  end

  def post_params
    params.require(:post).permit(:title, :content, :photo)
  end

end
