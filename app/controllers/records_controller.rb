class RecordsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @record_address = RecordAddress.new
  end

  def new
    @record_address = RecordAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @record_address = RecordAddress.new(record_params)
    if @record_address.valid?
      @record_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end
  end

 private
 def record_params
  # params.permit(item_id: current_item.id).merge(user_id: current_user.id)
  params.require(:record_address).permit(:postal_code, :region_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id)
end

# def address_params
  # params.permit(:postal_code, :region_id, :city, :house_number, :building_name, :phone_number).merge(record_id: @record.id)
# end


# end

