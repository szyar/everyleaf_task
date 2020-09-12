require 'rails_helper'
describe 'Task management function', type: :system do
  describe 'List display function' do
    context 'When transitioning to the list screen' do
      it 'The created task list is displayed' do
      # Create a task for use in testing
        task = FactoryBot.create(:task, name: 'task')
        # Transition to task list page
        visit tasks_path
        # The text "task" appears on the visited (transitioned) page (task list page)
        # have_contentされているか。（含まれているか。）ということをexpectする（確認・期待する）
        # expect(page).to have_content 'task'
        # Write a test that deliberately expects wrong results
        expect(page).to have_content 'task_failure'
        # If the result of expect is true, the test is successful, if false, the result is output as failure.
      end
    end
  end
end
