module Api
  module V1
    class TodosController < ApplicationController
      
      def index
        render :json => Todo.where(:list_id => params["list_id"]).as_json
      end
    
    end
  end
end
