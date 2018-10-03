class GiftsController < ApplicationController
  before_action :set_gift, only: [:show, :edit, :update, :destroy]

  def index
    @gifts = Gift.all
  end

  def show
    @wishlist = current_user.wishlist
  end

  def new
    @gift = Gift.new
  end

  def create
    @wishlist = Wishlist.find_or_create_by(user: current_user)
    @gift = Gift.new(name: params[:gift][:name], description: params[:gift][:description], wishlist_id: @wishlist.id)
    #info would come form the form
    # @user = User.find_by(id: session[:user_id])
    # @gift = @user.gifts.build(name: params[:gift][:name], description: params[:gift][:description])
    @gift.save
    redirect_to show_path
    # @gift = @user.gifts.build(name: params[:gift][:name], description: params[:gift][:description])
    # @gift.save
    # redirect_to show_path
  end

  def edit
  end

  def update
    @gift.update(gift_params)
    redirect_to @gift
  end

  def destroy
    @gift.destroy
    redirect_to gifts_path
  end

  private

  def set_gift
    @gift = Gift.find(params[:id])
  end

  def gift_params
    params.require(:gift).permit(:name, :description)
  end

end
