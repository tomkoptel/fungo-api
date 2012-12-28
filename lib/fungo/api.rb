module Fungo
  class API < Grape::API
    version 'v1', :using => :path
    format 'json'

    helpers do
      def logger
        API.logger
      end
    end

    get :test do
      {success: true}
    end

    post :location do
      location = Location.new(params[:location])
      logger.info params

      if location.valid?
        location.save
        { :success => true }
      else
        status 400
        { :success => false }
      end
    end
  end
end