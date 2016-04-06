class AccountActivationsController < ApplicationController
  def edit
    if params[:type] == 'designer'
      # This is a designer trying to activate 
      designer = Designer.find_by(email_address: params[:email].downcase)
      if designer &&  !designer.activated? && designer.authenticated?(:activation, params[:id])
        designer.activate
        log_in designer
        # flash[:success] = "Account successfully activated"
        # redirect_to designer
        render :index, status: :ok, location: designer
      else
        # flash[:danger] = "Invalid activation link"
        # redirect_to root_url
        render json: designer.errors, status: :unprocessable_entity
      end
    else
      customer = Customer.find_by(email_address: params[:email])
      if customer &&  !customer.activated? && customer.authenticated?(:activation, params[:id])
        customer.activate
        log_in customer
        # flash[:success] = "Account successfully activated"
        # redirect_to customer
        render :index, status: :ok, location: customer
      else
        # flash[:danger] = "Invalid activation link"
        # redirect_to root_url
        render json: customer.errors, status: :unprocessable_entity
      end
    end
  end
end