class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:type] == 'designer'
      # This is a designer trying to log in
      designer = Designer.find_by(email_address: params[:session][:email_address].downcase)
      if designer && designer.authenticate(params[:session][:password])
        if designer.activated?
          #log in and redirect
          # flash.now[:notice] = "Sign in and activation okay"
          log_in designer
          redirect_back_or designer
        else
          message = "Account not activated"
          message += "Please check your email for the activation link"
          # flash[:warning] = message
          redirect_to root_url
        end
      else
        # flash.now[:danger] = "Wrong Email or Password Provided"
        # render 'new'
        render json: @session.errors, status: :unprocessable_entity
      end  
    end
      customer = Customer.find_by(email_address: params[:session][:email_address].downcase)
      if customer && customer.authenticate(params[:session][:password])
        if customer.activated?
          #log in and redirect
          # flash.now[:notice] = "Sign in and activation okay"
          log_in customer
          redirect_back_or customer
        else
          message = "Account not activated\n"
          message += "Please check your email for the activation link"
          # flash[:warning] = message
          redirect_to root_url
        end
      else
        # flash.now[:danger] = "Wrong Email or Password Provided"
        # render 'new'
        render json: @session.errors, status: :unprocessable_entity
      end
    
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end