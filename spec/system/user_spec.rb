require 'rails_helper'

RSpec.feature "Users", type: :feature do

  # describe "User registration test" do
  #   context "Register new user" do
  #     before(:each) do
  #       visit root_path
  #       click_link "Normal user signup"
  #       within("form") do
  #         fill_in('Username', with: 'John')
  #         fill_in('Email', with: 'john@test.com')
  #         fill_in('Password', with: 'hellojohn')
  #         fill_in('Password confirmation', with: 'hellojohn')
  #       end
  #     end
  #     it "New user is registered" do
  #       click_button "Create User"
  #       expect(page).to have_content("Welcome John, you have successfully signed up")
  #     end
  #   end
  #   context "Check task list without login" do
  #     before(:each) do
  #       visit tasks_path
  #     end
  #     it "Redirect to login with message" do
  #       expect(page).to have_content("You must be logged in to perform that action")
  #     end
  #   end
  # end

  # describe "Testing session functionality" do
  #   context "Be able to login" do
  #     before(:each) do
  #       visit root_path
  #       within("form") do
  #         fill_in('Username', with: 'szyar')
  #         fill_in('Password', with: 'batman')
  #       end
  #     end
  #     it "Login test pass" do
  #       click_button "Log In"
  #       expect(page).to have_content("Logged in successfully")
  #     end
  #   end
  #   context "Check detail screen" do
  #     before(:each) do
  #       visit root_path
  #       within("form") do
  #         fill_in('Username', with: 'szyar')
  #         fill_in('Password', with: 'batman')
  #       end
  #     end
  #     it "Detail screen test pass" do
  #       click_button "Log In"
  #       click_link "My Profile"
  #       expect(page).to have_content("Showing User Details")
  #     end
  #   end
  #   context "Check other user detail screen" do
  #     before(:each) do
  #       visit root_path
  #       within("form") do
  #         fill_in('Username', with: 'szyar')
  #         fill_in('Password', with: 'batman')
  #       end
  #     end
  #     it "Transition to task list screen" do
  #       click_button "Log In"
  #       user = User.find_by(username: "test")
  #       visit user_path(user.id)
  #       expect(page).to have_content("Task List")
  #     end
  #   end
  #   context "Test log out functionality" do
  #     before(:each) do
  #       visit root_path
  #       within("form") do
  #         fill_in('Username', with: 'szyar')
  #         fill_in('Password', with: 'batman')
  #         click_button "Log In"
  #       end
  #     end
  #     it "Log out test pass" do
  #       click_link "LogOut"
  #       expect(page).to have_content("Logged out")
  #     end
  #   end
  # end

  describe "Admin screen test" do
    # context "Be able to access admin screen" do
    #   before(:each) do
    #     visit root_path
    #     within("form") do
    #       fill_in('Username', with: 'szyar')
    #       fill_in('Password', with: 'batman')
    #       click_button "Log In"
    #     end
    #   end
    #   it "Show Admin Dashboard" do
    #     click_link "Dashboard"
    #     expect(page).to have_content("Admin Dashboard")
    #   end
    # end
    # context "General user unable to access admin screen" do
    #   before(:each) do
    #     visit root_path
    #     within("form") do
    #       fill_in('Username', with: 'test')
    #       fill_in('Password', with: 'hellotest')
    #       click_button "Log In"
    #     end
    #   end
    #   it "Redirect to tasks path with message" do
    #     visit admin_dashboard_path
    #     expect(page).to have_content("Admin dashboard can be accessed only by admins")
    #   end
    # end
    # context "Admin users can register new users" do
    #   before(:each) do
    #     visit root_path
    #     within("form") do
    #       fill_in('Username', with: 'szyar')
    #       fill_in('Password', with: 'batman')
    #       click_button "Log In"
    #     end
    #   end
    #   it "New user is created by admin" do
    #     visit admin_dashboard_path
    #     within("form") do
    #       fill_in('Username', with: 'testuser')
    #       fill_in('Email', with: 'testuser@test.com')
    #       fill_in('Password', with: 'hellotestuser')
    #       fill_in('Password confirmation', with: 'hellotestuser')
    #       click_button "Create User"
    #     end
    #     expect(page).to have_content("New user created")
    #   end
    # end
    context "Admin user can access the user details screen" do
      before(:each) do
        visit root_path
        within("form") do
          fill_in('Username', with: 'szyar')
          fill_in('Password', with: 'batman')
        end
      end
      it "Show user details screen" do
        click_button "Log In"
        user = User.find_by(username: "test")
        visit user_path(user.id)
        expect(page).to have_content("Showing User Details")
      end
    end

  end

end
