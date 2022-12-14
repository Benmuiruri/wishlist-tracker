class WishlistsController < ApplicationController
  before_action :set_wishlist, only: %i[show edit update destroy]

  def index
    @wishlists = Wishlist.ordered
  end

  def show; end

  def new
    @wishlist = Wishlist.new
  end

  def edit; end

  def create
    @wishlist = Wishlist.new(wishlist_params)

    if @wishlist.save
      respond_to do |format|
        format.html { redirect_to @wishlist, notice: 'Wishlist was successfully created.' }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @wishlist.update(wishlist_params)
      redirect_to wishlists_path, notice: 'Wishlist was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @wishlist.destroy
    respond_to do |format|
      format.html { redirect_to wishlists_path, notice: 'Wishlist was successfully destroyed.' }
      format.turbo_stream
    end
  end

  private

  def set_wishlist
    @wishlist = Wishlist.find(params[:id])
  end

  def wishlist_params
    params.require(:wishlist).permit(:name)
  end
end
