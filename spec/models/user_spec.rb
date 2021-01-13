require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Creating a new user" do

    it "should save a new user with all parameters" do
      @user = User.create(
        first_name: "Bob",

        email: "bob@ross.com",
        password: "password",
        password_confirmation: "password"
      )
      @user.errors.full_messages.each do |message|
        puts message
      end

      expect(@user.first_name).to be_present
      expect(@user.errors.full_messages).to include("Last name can't be blank")
      expect(@user.email).to be_present
      expect(@user.password).to be_present
      expect(@user.password_confirmation).to be_present
    end

    it "should validate that password and password_confirmation be the same" do
      @user = User.create(
        first_name: "Bob",
        last_name: "Ross",
        email: "bob@ross.com",
        password: "password",
        password_confirmation: "pass"
      )

      @user.errors.full_messages.each do |message|
        puts message
      end
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "should show error if password length is too short" do
      @user = User.create(
        first_name: "Bob",
        last_name: "Ross",
        email: "bob@ross.com",
        password: "pass",
        password_confirmation: "pass"
      )
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end

    describe "email uniqueness" do
      before do
      @user = User.create(
        first_name: "Bob",
        last_name: "Ross",
        email: "bob@ross.com",
        password: "password",
        password_confirmation: "password"
      )
      end
      it "should check for email uniqueness" do
        @user_new = User.create(
          first_name: "Bob",
          last_name: "Ross",
          email: "bob@ross.com",
          password: "password",
          password_confirmation: "password"
        )
        @user_new.errors.full_messages.each do |message|
          puts message
        end
  
        expect(@user_new.errors.full_messages).to include("Email has already been taken")
        # expect(@user_new.id).to be_nil
      end
    end
  end

  describe '.authenticate_with_credentials' do
    before do
      @user = User.create(
        first_name: "Bob",
        last_name: "Ross",
        email: "bob@ross.com",
        password: "password",
        password_confirmation: "password"
      )

    end
    it "should return a user if credentials are correct" do

      expect(User.authenticate_with_credentials(@user.email, @user.password)).to eq(@user)
      expect(User.authenticate_with_credentials(@user.email, "gibberish")).to be_nil
    end
    
    it "should return a user if white space around email" do
      expect(User.authenticate_with_credentials("   boB@ross.com", @user.password)).to eq(@user)
    end
    it "should return a user if wrong case typed for email" do
      expect(User.authenticate_with_credentials("BoB@roSs.com", @user.password)).to eq(@user)
    end
  end
end
