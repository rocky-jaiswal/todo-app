module Api
  module V1
    class ListsController < ApplicationController
      
      def index
        render :json => List.all.as_json
      end
    
    end
  end
end
