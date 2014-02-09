require 'spec_helper'

describe Api::V1::ListsController do
  
  before(:each) do
    FactoryGirl.create(:list1)
  end
  
  describe "GET 'index'" do
    it "returns the list index" do
      get 'index'
      response.should be_success
      list = JSON.parse(response.body)
      expect(list).to be_a(Array)
      expect(list[0]["name"]).to eq("list1")
    end
  end

end
