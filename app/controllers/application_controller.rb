class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing do |e|
    render json: { error_message: I18n.t('.missing_param', param: e.param, scope: ['controller', 'error']) }, status: :bad_request
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    model = I18n.t(e.model.downcase, scope: [:activerecord, :models])
    render json: { error_message: I18n.t('.record_not_found', model: model, scope: ['controller', 'error']) }, status: :not_found
  end

  def translate(message)
    I18n.t('.' + message, scope: [controller_name, action_name])
  end

  def render_error_message(message)
    render json: { error_message: translate(message) }, status: :unprocessable_entity
  end
end
