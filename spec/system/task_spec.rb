require 'rails_helper'

RSpec.feature "Tasks", type: :feature do

  context "Create new task" do
    before(:each) do
      visit root_path
      fill_in "Username", with: "szyar"
      fill_in "Password", with: "batman"
      within("form") do
        click_button "Log In"
        visit new_task_path
        fill_in "Name", with: "Test Name"
        fill_in "Detail", with: "Test detail"
      end
    end
    it "New task is registered" do
      click_button "Create Task"
      expect(page).to have_content("Task Created")
    end
    it "The registered task is displayed" do
      click_button "Create Task"
      expect(page).to have_content("Test Name")
    end
  end

  context "Check Task Lists" do
    before(:each) do
      visit root_path
      fill_in "Username", with: "szyar"
      fill_in "Password", with: "batman"
    end
    scenario "Task list page is displayed" do
      click_button "Log In"
      visit tasks_path
      expect(page).to have_content("Task List")
    end
  end

  context 'When tasks are arranged in descending order of creation date and time' do
    it 'New task is displayed at the top' do
        FactoryBot.create(:first_task)
        FactoryBot.create(:second_task)
        visit tasks_path
        task_list = Task.all.order(created_at: :desc)
        task = task_list.first
        expect(task.name).to eq("Name 2")
    end
  end

  context 'When tasks are arranged in descending order of expiration date and time' do
    it 'Task with later date is displayed at the top' do
        FactoryBot.create(:first_task)
        FactoryBot.create(:second_task)
        visit tasks_path
        task_list = Task.all.order(expired_at: :desc)
        task = task_list.first
        expect(task.name).to eq("Name 2")
    end
  end

end
