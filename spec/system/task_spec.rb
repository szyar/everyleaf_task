require 'rails_helper'

RSpec.feature "Tasks", type: :feature do
  FactoryBot.create(:first_task)
  FactoryBot.create(:second_task)

  # context "Create new task" do
  #   before(:each) do
  #     visit new_task_path
  #     within("form") do
  #       fill_in "Name", with: "Test Name"
  #       fill_in "Detail", with: "Test detail"
  #     end
  #   end
  #   scenario "New task is registered" do
  #     click_button "Create Task"
  #     expect(page).to have_content("Task Created")
  #   end
  #   scenario "The registered task is displayed" do
  #     click_button "Create Task"
  #     expect(page).to have_content("Test Name")
  #   end
  # end

  # context "Check Task Lists" do
  #   before(:each) do
  #     visit tasks_path
  #   end
  #   scenario "Task list page is displayed" do
  #     expect(page).to have_content("Task List")
  #   end
  # end

  context 'When tasks are arranged in descending order of creation date and time' do
    context 'When tasks are arranged in descending order of creation date and time' do
      it 'New task is displayed at the top' do
        # Implement here
        tasks = Task.all.order(created_at: :desc)
        task = Task.last
        expect(task.id).to eq(101)
      end
    end
  end

end
