class BagsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_bag, only: [:show, :edit, :update, :destroy]

  def index
    @bags = Bag.search(params[:query])
   end

  def show
  end

  def new
    @bag = Bag.new
  end

  def create
    @bag = Bag.new(bag_params)
    @bag.user = current_user
    if@bag.save
      redirect_to bag_path(@bag)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @bag.update(bag_params)
    redirect_to bag_path(@bag)
  end

  def destroy
    @bag.destroy
    redirect_to root_path
  end

  private

  def set_bag
    @bag = Bag.find(params[:id])
  end

  def bag_params
    params.require(:bag).permit(:category, :brand, :capacity, :price_per_day, :description)
  end
end
