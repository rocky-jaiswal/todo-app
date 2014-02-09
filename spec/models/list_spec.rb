require 'spec_helper'

describe List do
  it "does not allow a list to be created without a name" do
    expect(List.new(name: nil).save).to be_false
  end

  it "does not allow a list to be created with a blank name" do
    expect(List.new(name: "").save).to be_false
  end

  it "does not allow a list to be created without a user" do
    expect(List.new(name: "ok").save).to be_false
  end
end
