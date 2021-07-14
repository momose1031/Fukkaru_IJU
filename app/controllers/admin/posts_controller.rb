class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to admin_post_path(@post), notice: "投稿を更新しました"
    else
      render "edit", alert: "更新できませんでした"
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to admin_customer_path(@post.customer_id), notice: "投稿を削除しました"
    else
      render "edit", alert: "削除できませんでした"
    end
  end
  
  def recommend
    @posts = Post.all
  end
  
  def vacant_house
    @posts = Post.all
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :body, :image, :category, :location)
  end
  
end
