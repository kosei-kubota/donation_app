class DonationsController < ApplicationController
  before_action :find_donation, only: :order

  def index
    @donations = Donation.all
  end

  def order
    redirect_to new_card_path and return unless current_user.card.present?
  end

  private
  def find_donation
    @donation = Donation.find(params[:id])
  end

end
