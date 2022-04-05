class ApplicationController < ActionController::Base

  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'Tomoya' && password == '0116'
    end
  end
end