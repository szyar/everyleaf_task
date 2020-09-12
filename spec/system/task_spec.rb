require 'rails_helper'
describe 'task management function', type: :system do
   describe 'list display function' do
     context 'When transitioning to the list screen' do
       it 'A list of created tasks is displayed' do
         #Create a task for use in testing
         task = FactoryBot.create(:task, name: 'task')
         #Transition to task list page
         visit tasks_path
         #The character string "task" appears on the visited (transitioned) page (task list page).
         #have_content Expect (confirm / expect) whether it is included (included)
         expect(page).to have_content'task'
         #If the result of expect is true, the test is successful, and if false, the result is output as failure.
       end
     end
   end
end
