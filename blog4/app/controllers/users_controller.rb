class UsersController < ApplicationController
  def profile
  end

  def follow
    @f = Followship.new

    @f.follow(params[:user],params[:blog])

    redirect_to blog_path(params[:blog])
  end

  def unfollow
    @f = Followship.find_by(user_id: params[:user], following_user_id: Blog.find(params[:blog]).user_id)

    if (@f.nil?) 
      redirect_to blog_path(params[:blog]), notice: "Unfound followship"
    else 
      @f.unfollow
    redirect_to blog_path(params[:blog])
    end

  end
end
