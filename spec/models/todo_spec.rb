require 'spec_helper'

describe Todo do
  it "does not allow a todo to be created without a title" do
      expect(Todo.new(title: nil).save).to be_false
    end

  it "does not allow a todo to be created with a blank title" do
    expect(Todo.new(title: "").save).to be_false
  end

  it "does not allow a todo to be created without a list" do
    expect(Todo.new(title: "ok").save).to be_false
  end

  it "works with a list as an association" do
    todo = FactoryGirl.create(:todo1)
    l = todo.list
    expect(todo.list.name).to eq("list1")
    expect(todo.title).to eq("todo1")
  end

  it "has a user" do
    todo = FactoryGirl.create(:todo1)
    l = todo.list
    expect(todo.user.name).to eq("John Doe")
    expect(todo.title).to eq("todo1")
  end
end
