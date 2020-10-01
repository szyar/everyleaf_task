require 'rails_helper'

RSpec.feature "Users", type: :feature do

  context "create new users" do
    before(:each) do
      FactoryBot.create(:normal_user)
      FactoryBot.create(:admin_user)
    end
    it "New user is registered" do
      user = User.last
      expect(user.admin).to eq( true )
    end
  end
end
