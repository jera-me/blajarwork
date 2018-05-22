class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :pundit_error
  #rescue_from NoMethodError, with: :pundit_error

  BRAND_NAME = 'Zynau'.freeze

  def meta_title(title)
    [title, BRAND_NAME].reject(&:empty?).join(' | ')
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def pundit_error
    redirect_to root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
