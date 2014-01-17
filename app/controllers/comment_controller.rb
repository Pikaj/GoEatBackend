class CommentController < ApplicationController

  protect_from_forgery :except => :create 
  skip_before_filter :verify_authenticity_token

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    render :json => restaurant.comments.all
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = Comment.new(params[:comment].permit(:commenter, :body))
    @comment.restaurant =@restaurant
    render :json => @comment
  end 

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = @restaurant.comments.find(params[:id])
    @comment.destroy
    render :json => @restaurant.comments
  end

end
