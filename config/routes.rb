Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "admin/stories/all" => "stories#all"
  get "admin/speaker/all" => "speakers#all"
  get "admin/webinar/all" => "webinars#all"

  root "stories#home"
  resources :stories
  resources :speakers, path: :speaker
  resources :webinars, path: :webinar
end
