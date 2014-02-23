module Api
  module V1
    class TodosController < ApplicationController

      before_filter :authorize_user
      
      def index
        render :json => Todo.where(:list_id => params["list_id"]).as_json
      end

      def destroy
        Todo.find(params["id"]).destroy
        render :json => {success: true}.as_json
      end

      def create
        todo = Todo.create({title: params["title"], list_id: params["list_id"]})
        render :json => todo.to_json
      end

      private

      def authorize_user
        render :nothing => true, :status => :unauthorized if params["list_id"].nil?
        list = List.find(params["list_id"])
        render :nothing => true, :status => :unauthorized if list.user != current_user
      end
    
    end
  end
end
