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
        fill_in "Detail", with: "Test Name Detail"
        select '2020', from: :task_expired_at_1i
        select '9月', from: :task_expired_at_2i
        select '29', from: :task_expired_at_3i
        select 'Unstarted', from: :task_status
        select 'High', from: :task_priority_type
        click_button "Create Task"
      end
    end
    it "New task is registered with deadline" do
      expect(page).to have_content("Task Created")
    end
    it "The registered task is displayed" do
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
    before(:each) do
      visit root_path
      fill_in "Username", with: "szyar"
      fill_in "Password", with: "batman"
      within("form") do
        click_button "Log In"
        visit new_task_path
        fill_in "Name", with: "Name 1"
        fill_in "Detail", with: "Name 1 Detail"
        select '2020', from: :task_expired_at_1i
        select '9月', from: :task_expired_at_2i
        select '29', from: :task_expired_at_3i
        select 'Unstarted', from: :task_status
        select 'High', from: :task_priority_type
        click_button "Create Task"
      end
    end
    it 'New task is displayed at the top' do
        visit new_task_path
        fill_in "Name", with: "Name 2"
        fill_in "Detail", with: "Name 2 Detail"
        select '2020', from: :task_expired_at_1i
        select '9月', from: :task_expired_at_2i
        select '29', from: :task_expired_at_3i
        select 'Unstarted', from: :task_status
        select 'High', from: :task_priority_type
        click_button "Create Task"
        task_list = Task.all.order(created_at: :desc)
        task = task_list.first
        expect(task.name).to eq("Name 2")
    end
  end

  context 'Check sorting by deadline' do
    before(:each) do
      visit root_path
      fill_in "Username", with: "szyar"
      fill_in "Password", with: "batman"
      within("form") do
        click_button "Log In"
        visit new_task_path
        fill_in "Name", with: "Name 1"
        fill_in "Detail", with: "Name 1 Detail"
        select '2020', from: :task_expired_at_1i
        select '9月', from: :task_expired_at_2i
        select '29', from: :task_expired_at_3i
        select 'Unstarted', from: :task_status
        select 'High', from: :task_priority_type
        click_button "Create Task"
      end
    end
    it 'Task with later date is displayed at the top' do
        visit new_task_path
        fill_in "Name", with: "Name 2"
        fill_in "Detail", with: "Name 2 Detail"
        select '2020', from: :task_expired_at_1i
        select '9月', from: :task_expired_at_2i
        select '30', from: :task_expired_at_3i
        select 'Unstarted', from: :task_status
        select 'High', from: :task_priority_type
        click_button "Create Task"
        task_list = Task.all.order(expired_at: :desc)
        task = task_list.first
        expect(task.name).to eq("Name 2")
    end
  end

  context 'When registering a new task, can also register the status' do
    before(:each) do
      visit root_path
      fill_in "Username", with: "szyar"
      fill_in "Password", with: "batman"
      within("form") do
        click_button "Log In"
        visit new_task_path
        fill_in "Name", with: "Name 1"
        fill_in "Detail", with: "Name 1 Detail"
        select '2020', from: :task_expired_at_1i
        select '9月', from: :task_expired_at_2i
        select '29', from: :task_expired_at_3i
        select 'Unstarted', from: :task_status
        select 'High', from: :task_priority_type
        click_button "Create Task"
      end
    end
    it 'Status is displayed' do
      visit new_task_path
      fill_in "Name", with: "Name 2"
      fill_in "Detail", with: "Name 2 Detail"
      select '2020', from: :task_expired_at_1i
      select '9月', from: :task_expired_at_2i
      select '29', from: :task_expired_at_3i
      select 'Completed', from: :task_status
      select 'High', from: :task_priority_type
      click_button "Create Task"
      task_list = Task.all
      task = task_list.first
      expect(task.status).to eq("Unstarted")
    end
  end

  context "Search tasks" do
    before(:each) do
      visit root_path
      fill_in "Username", with: "szyar"
      fill_in "Password", with: "batman"
      within("form") do
        click_button "Log In"
        FactoryBot.create(:first_task)
        FactoryBot.create(:second_task)
        visit tasks_path
      end
    end
    it "Search by name passes" do
      tasks = Task.search('Name 1', '')
      tasks.each do |task|
        expect(task.name).to eq('Name 1')
      end
    end
    it "Search by status passes" do
      tasks = Task.search('', 'Unstarted')
      tasks.each do |task|
        expect(task.status).to eq('Unstarted')
      end
    end
    it "Search by both name and status passes" do
      tasks = Task.search('Name 1', 'Unstarted')
      tasks.each do |task|
        expect(task.name).to eq('Name 1')
        expect(task.status).to eq('Unstarted')
      end
    end
  end

  context 'When tasks are arranged in descending order of priority' do
    before(:each) do
      visit root_path
      fill_in "Username", with: "szyar"
      fill_in "Password", with: "batman"
      within("form") do
        click_button "Log In"
        visit new_task_path
        fill_in "Name", with: "Name 1"
        fill_in "Detail", with: "Name 1 Detail"
        select '2020', from: :task_expired_at_1i
        select '9月', from: :task_expired_at_2i
        select '29', from: :task_expired_at_3i
        select 'Unstarted', from: :task_status
        select 'Low', from: :task_priority_type
        click_button "Create Task"
      end
    end
    it 'Task with higher priority is displayed at the top' do
      visit new_task_path
      fill_in "Name", with: "Name 2"
      fill_in "Detail", with: "Name 2 Detail"
      select '2020', from: :task_expired_at_1i
      select '9月', from: :task_expired_at_2i
      select '29', from: :task_expired_at_3i
      select 'Unstarted', from: :task_status
      select 'High', from: :task_priority_type
      click_button "Create Task"
      task_list = Task.all.order(priority_type: :desc)
      task = task_list.first
      expect(task.name).to eq("Name 2")
    end
  end

end
