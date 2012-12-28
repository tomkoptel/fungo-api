module Fungo
  class API < Grape::API
    version 'v1', :using => :path
    format 'json'

    post :location do
      location = Location.new(params[:location])
      if location.valid?
        location.save
        { :success => true }
      else
        { :success => false }
      end
    end
  end
end