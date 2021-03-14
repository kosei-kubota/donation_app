class DonationsController < ApplicationController
  before_action :find_donation, only: :order

  def index
    @donations = Donation.all
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

    DonationOrder.create(donation_id: params[:id])

    redirect_to root_path
  end

  private
  def find_donation
    @donation = Donation.find(params[:id])
  end

end
