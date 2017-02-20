class BagsController < ApplicationController

  def index
    @bags = Bag.all
  end

  def show
    @bag = Bag.find(params[:id])
  end

  def new
    @bag = Bag.new
  end

  def create
    @bag = Bag.new(bag_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def bag_params
    params.require(:bag).permit(:)
  end
end
