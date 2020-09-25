require 'rails_helper'
describe 'Task model function', type: :model do
  # describe 'Validation test' do
  #   context 'If the task title is empty' do
  #     it 'It\'s hard to Validation' do
  #       task = Task.new(name: '', detail: 'Failure test')
  #       expect(task).not_to be_valid
  #     end
  #   end
  #   context 'If the task details are empty' do
  #     it 'Default detail will be added if detail is blank' do
  #       task = Task.new(name: 'Failure test', detail: '')
  #       expect(task).to be_valid
  #     end
  #   end
  #   context 'When the content is described in the task title and details' do
  #     it 'Validation passes' do
  #       task = Task.new(name: 'Pass', detail: 'Pass test')
  #       expect(task).to be_valid
  #     end
  #   end
  # end

  describe 'Searching test' do
    FactoryBot.create(:first_task)
    FactoryBot.create(:second_task)
    context 'Search by name' do
      it 'Search by name passes' do
        tasks = Task.search('Name 1', '')
        tasks.each do |task|
          expect(task.name).to eq('Name 1')
        end
      end
    end
    context 'Search by status' do
      it 'Search by status passes' do
        tasks = Task.search('', 'Unstarted')
        tasks.each do |task|
          expect(task.status).to eq('Unstarted')
        end
      end
    end
    context 'Search by both name and status' do
      it 'Search by name and status passes' do
        tasks = Task.search('Name 1', 'Unstarted')
        tasks.each do |task|
          expect(task.name).to eq('Name 1')
          expect(task.status).to eq('Unstarted')
        end
      end
    end
  end
end
