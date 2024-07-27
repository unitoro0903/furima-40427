class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_if_owner_or_sold_out, only: :index
  before_action :set_item, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    set_item
    @record_address = RecordAddress.new
  end

  

  def create
    set_item
    @record_address = RecordAddress.new(record_params)
    if @record_address.valid?
      pay_item
      @record_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  def current_item
    @current_item ||= Item.find(params[:item_id])
  end
  

 private
 def record_params
  # params.permit(item_id: current_item.id).merge(user_id: current_user.id)
  params.require(:record_address).permit(:postal_code, :region_id, :city, :house_number, :building_name, :phone_number,).merge(user_id: current_user.id, item_id: current_item.id,token: params[:token])
end

def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: current_item.price,  # 商品の値段
    card: record_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
end

def redirect_if_owner_or_sold_out
  @item = Item.find(params[:item_id])
  if @item.sold_out? || current_user.id == @item.user_id
    redirect_to root_path
  end
end
# def address_params
  # params.permit(:postal_code, :region_id, :city, :house_number, :building_name, :phone_number).merge(record_id: @record.id)
# end
def set_item
  @item = Item.find(params[:item_id])
end



