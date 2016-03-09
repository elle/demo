Rails.application.routes.draw do
  resource :confirmation, only: [:show]
end
