class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]

  def index
    @items = Item.order(created_at: :desc)
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
    render :new, status: :unprocessable_entity
  end
end

def show
  @item = Item.find(params[:id])
end

def edit
  @item = Item.find(params[:id])
  if @item.user_id != current_user.id
    redirect_to root_path
  end
end

def update
  @item = Item.find(params[:id])
  if @item.update(item_params)
    redirect_to item_path(@item.id)
  else
    p @item.errors.full_messages
    render :edit, status: :unprocessable_entity
  end
end

private
def item_params
  params.require(:item).permit(:image, :title, :explanation, :category_id, :condition_id, :ship_fee_id, :region_id, :require_time_id, :price)
end
end
