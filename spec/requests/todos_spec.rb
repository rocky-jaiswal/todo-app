require 'spec_helper'

describe "Todos" do

  before(:each) do
  	FactoryGirl.create(:user1)
  	FactoryGirl.create(:user2)
    FactoryGirl.create_list(:todo1, 5)
    FactoryGirl.create_list(:todo2, 5)
  end

  def login_user
  	@user1 = FactoryGirl.attributes_for(:user1)
    post "/api/v1/login", user: {email: @user1[:email], password: @user1[:password]}
    resp = JSON.parse(response.body)
    [resp["email"], resp["token"]]
  end

  describe "actions" do

  	it "shows index for a list" do
      email, token = login_user
      user = User.find_by(email: @user1[:email])
      get "/api/v1/lists/#{user.lists.first.id}/todos", {}, {email: email, token: token}
      expect(response.status).to eq(200)
      resp = JSON.parse(response.body)
      resp.each do |todo|
        todo.each do |k, v|
          expect(v).to eq(user.lists.first.id) if k == "list_id"
        end
      end
    end

  	it "creates a todo for a list" do
  	  email, token = login_user
  	  user = User.find_by(email: @user1[:email])
  	  post "/api/v1/lists/#{user.lists.first.id}/todos", {title: "todo99"}, {email: email, token: token}
  	  expect(response.status).to eq(200)
  	  todo = JSON.parse(response.body)
      expect(todo["list_id"]).to eq(user.lists.first.id)
      expect(Todo.find_by(title: "todo99")).not_to be_nil
  	end

  	it "destoys a todo from a list" do
  	  email, token = login_user
  	  user = User.find_by(email: @user1[:email])
  	  delete "/api/v1/lists/#{user.lists.first.id}/todos/#{user.lists.first.todos.first.id}", {}, {email: email, token: token}
  	  expect(response.status).to eq(200)
	    expect(JSON.parse(response.body)["success"]).to be_true
  	end

  end

  describe "authorization" do
    it "returns 401 if user tries to delete a todo belonging to another user" do
      email, token = login_user
      #Change user
      user2 = FactoryGirl.attributes_for(:user2)
      user = User.find_by(email: user2[:email])
      delete "/api/v1/lists/#{user.lists.first.id}/todos/#{user.lists.first.todos.first.id}", {}, {email: email, token: token}
      expect(response.status).to eq(401)
    end

    it "returns 401 if user tries to create a todo for another user" do
      email, token = login_user
      #Change user
      user2 = FactoryGirl.attributes_for(:user2)
      user = User.find_by(email: user2[:email])
      post "/api/v1/lists/#{user.lists.first.id}/todos", {title: "todo99"}, {email: email, token: token}
      expect(response.status).to eq(401)
    end
  end
end