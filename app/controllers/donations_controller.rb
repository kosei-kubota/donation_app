class DonationsController < ApplicationController
  before_action :find_donation, only: :order

  def index
    @donations = Donation.includes(:user).order("created_at DESC")
  end

  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donation_params)
    if @donation.save
      redirect_to root_path
    else
      render :new
    end
  end

  def order
    redirect_to new_card_path and return unless current_user.card.present?

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer_token = current_user.card.customer_token
    Payjp::Charge.create(
      amount: @donation.price,
      customer: customer_token,
      currency: 'jpy'
      )
      
    Order.create(donation_id: params[:id], user_id: current_user.id)

    redirect_to root_path
  end

  private
  def donation_params
    params.require(:donation).permit(:name, :price, :description).merge(user_id: current_user.id)
  end

  def find_donation
    @donation = Donation.find(params[:id])
  end

end
