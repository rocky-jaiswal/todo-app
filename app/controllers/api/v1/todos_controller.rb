module Api
  module V1
    class TodosController < ApplicationController
      
      def index
        render :json => Todo.where(:list_id => params["list_id"]).as_json
      end

      def destroy
        puts params.inspect
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
