class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_item, only: [:edit, :show, :update]

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
  # @item = Item.find(params[:id])
end

def edit
  # @item = Item.find(params[:id])
  if @item.user_id != current_user.id
    redirect_to root_path
  end
end

def update
  # @item = Item.find(params[:id])
  if @item.update(item_params)
    redirect_to item_path(@item.id)
  else
    p @item.errors.full_messages
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  item = Item.find(params[:id])
  if current_user.id == item.user_id
    # if 
    item.destroy
    redirect_to root_path
  else
      redirect_to root_path, flash: { error: "Item could not be deleted." }
  end
  # else
    # flash[:alert] = 'Not authorized to delete this item'
    # redirect_to item_path(item)
  # end
 end


private
def item_params
  params.require(:item).permit(:image, :title, :explanation, :category_id, :condition_id, :ship_fee_id, :region_id, :require_time_id, :price)
end

def set_item
@item = Item.find(params[:id])
end
end
