require 'spec_helper'
require 'rails_helper'
RSpec.describe User, type: :model do
  
  describe 'Validations' do
    it 'should create a valid user' do
      user = User.create(
        name: "test",
        email: "test@test.com",
        password: "test",
        password_confirmation:"test"
        )
      expect(user).to be_valid
    end

    it 'should save a matching password and password confirmation' do
      user = User.create(
        name = "test",
        email = "test@test.com",
        password = "test",
        password_confirmation = "testt"
      )
      expect(user.password).to_not be_equal(user.password_confirmation)
    end 

    it 'should have a password and password confirmation' do
      user = User.create(
        name = "test",
        email = "test@test.com",
        password = "test",
        password_confirmation = nil
      )
      expect(user).to_not be_valid
    end

    it 'should not save without an email' do
      @user1 = User.create(
        name: "test",
        email: "TEST@TEST.com",
        password: "test",
        password_confirmation: "test"
      )
      @user2 = User.create(
        name: "test",
        email: "test@test.COM",
        password: "test",
        password_confirmation: "test"
      )
    expect(@user2).to_not be_valid
    end

    it 'should have a  name to be a valid user' do
      user = User.create(
        name: nil,
        email: "test@test.com",
        password: "test",
        password_confirmation: "test" 
      )
      expect(user).to_not be_valid
    end

    

    it 'should have an email to be a valid user' do
      user = User.create(
        name: "test",
        email: nil,
        password: "test",
        password_confirmation: "test" 
      )
      expect(user).to_not be_valid
    end

    it 'should have a password with a minimum length of 3' do
      user = User.create(
        name: "test", 
        email: "test@test.com",
        password: "t",
        password_confirmation: "t" 
      )
      expect(user).to_not be_valid
    end
  end



  describe '.authenticate_with_credentials' do
    it 'should authenticate that email and password are both valid' do
      user = User.create(
        name: "test",
        email: "test@test.com",
        password: "test",
        password_confirmation: "test"
      )
      authenticate = User.authenticate_with_credentials(user.email, user.password)
      expect(authenticate).to eq(user)
    end
  end
end
