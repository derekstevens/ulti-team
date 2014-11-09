require 'rails_helper'

RSpec.describe User, :type => :model do
  it "is valid with an email and a password" do 
  	user = User.new(email: "test@dgs.com", password: "fooman123")
  	expect(user).to be_valid
  end

  it "is invalid without an email" do
  	user = User.new(email: nil, password: "fooman123") 
  	expect(user).to_not be_valid
  end

  it "is invalid without a password" do
  	user = User.new(email: "test@dgs.com", password: nil)
  	expect(user).to_not be_valid
  end

  it "is invalid without a proper email address" do 
  	user = User.new(email: "test", password: "fooman123")
  	expect(user).to_not be_valid
	end

	it "is invalid without a proper password" do 
		user = User.new(email: "test@dgs.com", password: "foo")
		expect(user).to_not be_valid
	end
end
