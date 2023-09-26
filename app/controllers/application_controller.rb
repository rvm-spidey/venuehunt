class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_render_cart
  before_action :initialize_cart

  # before_action :initialize_chatroom!

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :avatar, :admin, :company_name, :company_address])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :avatar, :admin, :company_name, :company_address])
  end

  def set_render_cart
    @render_cart = true
  end

  def initialize_cart
    if current_user.nil?
      session[:cart_id] = nil
      @cart = nil
    else
      if session[:cart_id].nil?
        @cart = Cart.create(user_id: current_user.id)
        session[:cart_id] = @cart.id
      else
        @cart = Cart.find_by(id: session[:cart_id])
      end
    end
  end

  # def initialize_chatroom!
  #   @chatrooms = []
  #   @latest_messages = []

  #   if !current_user.nil?
  #    @chatrooms = Chatroom.where(admin_id: current_user.id)
  #    @latest_messages = Message.where(user_id: current_user.id)
  #                               .group(:chatroom_id)
  #                               .select('chatroom_id, MAX(id) AS latest_message_id')
  #                               .order('latest_message_id DESC')
  #   end
  # end
end
