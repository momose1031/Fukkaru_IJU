class Public::PostsController < ApplicationController
  before_action :authenticate_customer!, except: [:show, :recommend, :vacant_house]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
      redirect_to post_path(@post), notice: "投稿しました"
    else
      render "new", alert: "投稿できませんでした"
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @post = Post.find(params[:id])
    if @post.customer_id != current_customer.id
      redirect_to redirect_back(fallback_location: root_path), alert: "不正なアクセスです"
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "投稿を更新しました"
    else
      render "edit", alert: "更新できませんでした"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to root_path, notice: "投稿を削除しました"
    else
      render "edit", alert: "削除できませんでした"
    end
  end

  def recommend
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(12)
  end

  def vacant_house
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(12)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :category, :location)
  end

end
