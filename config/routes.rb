Rails.application.routes.draw do
  resources :tests do
    resources :questions
  end
  resources :questions, only: :destroy
end
