class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def new
    @item = Item.new
  end

def create

end

private

def item_params
  params.require(:item).permit(:content, :item).merge(user_id: current_user.id)
end

end
