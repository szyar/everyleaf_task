require 'rails_helper'

RSpec.feature "Labels", type: :feature do

  context "Create new label" do
    before(:each) do
      visit root_path
      fill_in "Username", with: "szyar"
      fill_in "Password", with: "batman"
      within("form") do
        click_button "Log In"
        visit new_label_path
        fill_in "Name", with: "Test Name"
        click_button "Create Label"
      end
    end
    it "New label is registered" do
      expect(page).to have_content("Label Created")
    end
    it "The registered label is displayed" do
      expect(page).to have_content("Test Name")
    end
  end

  context "Check Label Lists" do
    before(:each) do
      visit root_path
      fill_in "Username", with: "szyar"
      fill_in "Password", with: "batman"
    end
    scenario "Label list page is displayed" do
      click_button "Log In"
      click_link "Labels"
      expect(page).to have_content("Labels List")
    end
  end

  context "Label details page test" do
    before(:each) do
      visit root_path
      fill_in "Username", with: "szyar"
      fill_in "Password", with: "batman"
    end
    it "Label details page displayed" do
      click_button "Log In"
      click_link "Labels"
      click_link "Show", match: :first
      expect(page).to have_content("Showing Label Details")
    end
  end

  context "Edit label test" do
    before(:each) do
      visit root_path
      fill_in "Username", with: "szyar"
      fill_in "Password", with: "batman"
    end
    it "Label edited successfully" do
      click_button "Log In"
      click_link "Labels"
      click_link "Edit", match: :first
      fill_in "Name", with: "Edited Name"
      click_button "Update Label"
      expect(page).to have_content("Edited Successfully")
    end
  end

  context "Search label" do
    before(:each) do
      visit root_path
      fill_in "Username", with: "szyar"
      fill_in "Password", with: "batman"
      within("form") do
        click_button "Log In"
        FactoryBot.create(:first_label)
        FactoryBot.create(:second_label)
        visit labels_path
      end
    end
    it "Show associated tasks by searching label" do
      FactoryBot.create(:first_task)
      FactoryBot.create(:second_task)
      label = Label.first
      result = Label.find(label.id)
      tasks = result.tasks
      task = tasks.first
      expect(task.name).to eq('Name 1')
    end
  end

  context "Delete label test" do
    before(:each) do
      visit root_path
      fill_in "Username", with: "szyar"
      fill_in "Password", with: "batman"
    end
    it "Label deleted successfully" do
      click_button "Log In"
      click_link "Labels"
      click_link "Delete", match: :first
      expect(page).to have_content("Deleted Successfully")
    end
  end
end
