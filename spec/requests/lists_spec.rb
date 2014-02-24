require 'spec_helper'
require 'shared/user_setup'

describe "Lists" do
  include_context "user_setup"

  describe "actions" do
  	it "shows index for a user" do
      email, token = login_user
      get "/api/v1/lists/", {}, {email: email, token: token}
      expect(response.status).to eq(200)
      resp = JSON.parse(response.body)
      resp.each do |list|
        list.each do |k, v|
          expect(v).to eq(user.id) if k == "user_id"
        end
      end
    end

    it "shows a list for a user" do
      email, token = login_user
      get "/api/v1/lists/#{user.lists.first.id}", {}, {email: email, token: token}
      expect(response.status).to eq(200)
      list = JSON.parse(response.body)
      expect(list["user_id"]).to eq(user.id)
    end

  	it "creates a list for a user" do
  	  email, token = login_user
  	  post "/api/v1/lists", {name: "list99"}, {email: email, token: token}
  	  expect(response.status).to eq(200)
  	  list = JSON.parse(response.body)
      expect(list["user_id"]).to eq(user.id)
      expect(List.find_by(name: "list99")).not_to be_nil
  	end

  	it "destoys a list for a user" do
  	  email, token = login_user
  	  delete "/api/v1/lists/#{user.lists.first.id}", {}, {email: email, token: token}
  	  expect(response.status).to eq(200)
	    expect(JSON.parse(response.body)["success"]).to be_true
  	end
  end

  describe "authorization" do
    it "returns 401 if user tries to delete lists belonging to another user" do
      email, token = login_user
      user = User.find_by(email: user2[:email])
      delete "/api/v1/lists/#{user.lists.first.id}", {}, {email: email, token: token}
      expect(response.status).to eq(401)
    end
  end
end