class Public::HomesController < ApplicationController
  
  def top
    @posts = Post.all.order(created_at: :desc).limit(8)
  end

  def about
  end
  
  
end
