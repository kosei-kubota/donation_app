class DonationsController < ApplicationController
  before_action :find_donation, only: :order

  def index
    @donations = Donation.all
  end

  def order
  end

  private
  def find_donation
    @donation = Donation.find(params[:id])
  end
  
end
