module SessionBasket
  extend ActiveSupport::Concern

  included do
    helper_method :current_basket
  end

  def current_basket
    @current_basket ||= session_basket
  end

  private

  def session_basket
    Basket.find_by(id: session_basket_id.presence) || setup_session_basket
  end

  def setup_session_basket
    Basket.create.tap do |basket|
      session[:basket_id] = basket.id
    end
  end

  def session_basket_id
    session[:basket_id]
  end

  def clear_basket!
    session_basket.destroy
    @current_basket = nil
    session[:basket]
  end
end
