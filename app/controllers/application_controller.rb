class ApplicationController < ActionController::API
  def translate(message)
    I18n.t('.' + message, scope: [controller_name, action_name])
  end
end
