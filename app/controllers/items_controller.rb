class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def new
    @item = Item.new
  end

def create
  @item = current_user.items.build(item_params)
  if @item.save
    redirect_to root_path
  else
    p @item.errors.full_messages
    render :new
  end
end

private

private
def item_params
  params.require(:item).permit(:image, :title, :explanation, :category_id, :condition_id, :ship_fee_id, :region_id, :require_time_id, :price)
end
end
