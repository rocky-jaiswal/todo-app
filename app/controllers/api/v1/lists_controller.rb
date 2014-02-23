module Api
  module V1
    class ListsController < ApplicationController

      def index
        render :json => List.where(user_id: current_user.id).as_json
      end

      def show
        list = List.find(params["id"])
        if list.user == current_user
          render :json => List.find(params["id"]).to_json
        else
          render :nothing => true, :status => :unauthorized
        end
      end

      def create
        list = List.create({name: params["name"], user_id: current_user.id})
        render :json => list.to_json
      end

      def destroy
        list = List.find(params["id"])
        if list.user == current_user
          list.destroy
          render :json => {success: true}.as_json
        else
          render :nothing => true, :status => :unauthorized
        end
      end
    
    end
  end
end
