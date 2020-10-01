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

  describe "Testing session functionality" do
    context "Be able to login" do
      before(:each) do
        visit root_path
        within("form") do
          fill_in('Username', with: 'szyar')
          fill_in('Password', with: 'batman')
        end
      end
      it "Login test pass" do
        click_button "Log In"
        expect(page).to have_content("Logged in successfully")
      end
    end
    context "Check detail screen" do
      before(:each) do
        visit root_path
        within("form") do
          fill_in('Username', with: 'szyar')
          fill_in('Password', with: 'batman')
        end
      end
      it "Detail screen test pass" do
        click_button "Log In"
        user = User.find_by(username: 'szyar')
        visit user_path(user.id)
        expect(page).to have_content("Showing User Details")
      end
    end
  end

end
