module Api
  module V1
    class ListsController < ApplicationController

      # Check if list belongs to user
      
      def index
        render :json => List.all.as_json
      end

      def create
        list = List.create({name: params["name"], user_id: User.last.id})
        render :json => list.to_json
      end

      def destroy
        List.find(params["id"]).destroy
        render :json => {success: true}.as_json
      end

      def show
        render :json => List.find(params["id"]).to_json
      end
    
    end
  end
end
