# require 'rails_helper'
# describe 'Task model function', type: :model do
#   describe 'Validation test' do
#     context 'If the task title is empty' do
#       it 'It\'s hard to Validation' do
#         task = Task.new(name: '', detail: 'Failure test')
#         expect(task).not_to be_valid
#       end
#     end
#     context 'If the task details are empty' do
#       it 'Default detail will be added if detail is blank' do
#         task = Task.new(name: 'Failure test', detail: '')
#         expect(task).to be_valid
#       end
#     end
#     context 'When the content is described in the task title and details' do
#       it 'Validation passes' do
#         task = Task.new(name: 'Pass', detail: 'Pass test')
#         expect(task).to be_valid
#       end
#     end
#   end
# end
