module Api
  module V1
    class TodosController < ApplicationController

      #Check list_id is a param in all and belongs to logged in user
      
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
    
    end
  end
end
