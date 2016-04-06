module SessionsHelper
  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def paid_order
    session.delete(:order_id)
    current_order = nil
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if(user_id = session[:user_id])
      @current_user ||= Customer.find_by(id: session[:user_id]) || Designer.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user?(user)
    user == current_user
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end 

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end