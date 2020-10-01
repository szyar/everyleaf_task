require 'rails_helper'

RSpec.feature "Users", type: :feature do

  context "Register new user" do
    before(:each) do
      visit root_path
      click_link "Normal user signup"
      within("form") do
        fill_in('Username', with: 'John')
        fill_in('Email', with: 'john@test.com')
        fill_in('Password', with: 'hellojohn')
        fill_in('Password confirmation', with: 'hellojohn')
      end
    end
    it "New user is registered" do
      click_button "Create User"
      expect(page).to have_content("Welcome John, you have successfully signed up")
    end
  end

  # context "Check task list without login" do
  #   before(:each) do
  #     visit tasks_path
  #   end
  #   it "Redirect to login with message" do
  #     expect(page).to have_content("You must be logged in to perform that action")
  #   end
  # end

  # context "register new users" do
  #   before(:each) do
  #     FactoryBot.create(:normal_user)
  #     FactoryBot.create(:admin_user)
  #   end
  #   it "New users are registered" do
  #     user = User.last
  #     expect(user.admin).to eq( true )
  #   end
  # end

end
