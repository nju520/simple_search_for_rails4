class AddressesController < ApplicationController

  before_action :set_address, only: [:show, :edit, :update, :destroy]
  def index
    @addresses = Address.all
  end

  def show
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to @address
      flash[:success] = 'Address was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @address.update_attributes(address_params)
      flash[:success] = 'Update successfully'
      redirect_to @address
    else
      flash[:danger] = "sth is wrong"
    end
  end

  def destroy
    @address.destroy
    redirect_to addresses_url
  end
  private
  def address_params
    params.require(:address).permit(:address1, :address2, :city, :state, :zip)
  end
  def set_address
    @address = Address.find(params[:id])
  end
end
