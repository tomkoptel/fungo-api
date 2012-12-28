require 'api'
Trans::Application.routes.draw do
  mount Fungo::API => '/api'
  root :to => 'index#index'
end
