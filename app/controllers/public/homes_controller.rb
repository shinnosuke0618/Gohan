class Public::HomesController < ApplicationController
  def top
    @posts = Post.limit(4).order(Arel.sql(" created_at DESC "))
  end

  def about
  end
end
