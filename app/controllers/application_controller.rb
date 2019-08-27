class ApplicationController < ActionController::Base
  skip_before_action :verfy_authenticity_token
end
