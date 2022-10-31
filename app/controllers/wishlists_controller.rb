class WishlistsController < ApplicationController
  before_action :set_wishlist, only: [:show, :edit, :update, :destroy]

  def index
    @wishlists = Wishlist.all
  end

  def show; end

  def new
    @wishlist = Wishlist.new
  end

  def edit; end

  def create 
    @wishlist = Wishlist.new(wishlist_params )

    if @wishlist.save
      redirect_to wishlists_path, notice: "Wishlist was successfully created."
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @wishlist.update(wishlist_params)
      redirect_to wishlists_path, notice: "Wishlist was successfully updated."
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @wishlist.destroy
    redirect_to wishlists_path, notice: "Wishlist was successfully destroyed."
  end

  private

  def set_wishlist
    @wishlist = Wishlist.find(params[:id])
  end

  def wishlist_params
    params.require(:wishlist).permit(:name)
  end
end
