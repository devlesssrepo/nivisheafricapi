class PasswordResetsController < ApplicationController
  before_action :get_customer, only: [:edit , :update]
  before_action :valid_customer, only: [:edit , :update]
  before_action :check_expiration, only: [:edit , :update]

  def create
    @customer = Customer.find_by(email_address: params[:password_reset][:email].downcase)
      if @customer 
        @customer.create_reset_digest
        @customer.send_password_reset_email
        # redirect_to root_url
      else
        render json: @password_reset.errors, status: :unprocessable_entity
      end
  end

  def update
    if params[:customer][:password].empty?
      @customer.errors.add(:password, "cannot be empty")
      render json: @password_reset.errors, status: :unprocessable_entity

    elsif @customer.update_attributes(customer_params)
      log_in @customer
      render :index, status: :ok, location: @customer
    else
      render json: @password_reset.errors, status: :unprocessable_entity
    end
  end

  private
  def get_customer
    @customer = Customer.find_by(email_address: params[:email_address])
  end

  def valid_customer
    unless (@customer && @customer.activated? && @customer.authenticated?(:reset, params[:id]))
      redirect_to root_url
    end
  end

  def customer_params
    params.require(:customer).permit(:password, :password_confirmation)
  end
  
end