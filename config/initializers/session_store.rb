if Rails.env == "production"
  Rails.application.config.session_store :cookie_store, key: "_instafake_app", domain: "instafake-back.herokuapp.com"
else
  Rails.application.config.session_store :cookie_store, key: "_instafake_app"
end
