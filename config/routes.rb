Rails.application.routes.draw do
  resources :books

  # topページに[root_path]というパスを設定した。
  root to:'homes#top'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
