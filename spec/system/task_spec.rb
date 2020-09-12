require 'rails_helper'
RSpec.describe 'Task management function', type: :system do
  before do
    # Create two tasks to use in the task list test in advance
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end
  
  describe 'New creation function' do
    context 'When creating a new task' do
      it 'The created task is displayed' do
      end
    end
  end
  describe 'List display function' do
    context 'When transitioning to the list screen' do
      it 'The created task list is displayed' do
      end
    end
  end
  describe 'Detailed display function' do
     context 'When transitioned to any task details screen' do
       it 'The content of the relevant task is displayed' do
       end
     end
  end
end
