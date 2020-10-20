require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    before(:each) do
      @user = User.create(first_name: "Testy", last_name: "Testez", email: "test@gmail.com", password: "testtest", password_confirmation: "testtest")
    end

    it "creates a new user" do
      @user.save
      expect(@user).to be_valid
    end

    it "shouldn't be valid if passwords don't match" do
      @user.password_confirmation = "not same password"
      expect(@user).to_not be_valid
      puts @user.inspect
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "shouldn't be valid if emails are not unique" do
      @user_two = User.create(first_name: "Testa", last_name: "Testez", email: "test@gmail.com", password: "testtest", password_confirmation: "testtest")
      expect(@user_two).to_not be_valid
      expect(@user_two.errors.full_messages).to include("Email has already been taken")
    end

    it "shouldn't be valid if emails are not unique (not case sensitive)" do
      @user_three = User.create(first_name: "Testa", last_name: "Testez", email: "TEST@GMAIL.com", password: "testtest", password_confirmation: "testtest")
      expect(@user_three).to_not be_valid
      expect(@user_three.errors.full_messages).to include("Email has already been taken")
    end

    it "shouldn't validate without a first name" do
      @user.first_name = nil
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "shouldn't validate without a last name" do
      @user.last_name = nil
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "shouldn't validate without an email" do
      @user.email = nil
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "shouldn't validate if password is less than 8 characters" do
      @user.password = "test"
      @user.password_confirmation = "test"
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end
  end


  describe '.authenticate_with_credentials' do
    before :each do
      @user = User.create(first_name: "Testy", last_name: "Testez", email: "test@gmail.com", password: "testtest", password_confirmation: "testtest")
    end

    it "should authenticate user" do
      validation = User.authenticate_with_credentials("test@gmail.com", "testtest")
      expect(validation).to eq(@user).and have_attributes(:first_name => "Testy")
    end

    it "should return nil if the user cannot be authenticated" do
      validation = User.authenticate_with_credentials("test@gmail.com", "wrong password")
      expect(validation).to be_nil
    end

    it "should be authenticated even with whitespace typed before or after" do
      validation = User.authenticate_with_credentials("   test@gmail.com   ", "testtest")
      expect(validation).to eq(@user).and have_attributes(:email => "test@gmail.com")
    end

    it "should be authenticated even with wrong case email" do
      validation = User.authenticate_with_credentials("   Test@gMAIl.COM   ", "testtest")
      expect(validation).to eq(@user).and have_attributes(:email => "test@gmail.com")
    end
  end
    
end
