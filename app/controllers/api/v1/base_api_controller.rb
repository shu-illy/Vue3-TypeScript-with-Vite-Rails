module Api
  module V1
    class BaseApiController < ActionController::Base
      include ActionController::Cookies
      include ActionController::RequestForgeryProtection
      
      # 検証のためCSRFを無効にしているが、実際はスキップしないこと
      skip_forgery_protection
    end
  end
end
