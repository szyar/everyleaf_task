# The statement "Use FactoryBot"
FactoryBot.define do
  # Name the test data to be created "task"
  # (If you give a name of test data that matches the name of the class that actually exists, the test data of that class will be created automatically)
  factory :task do
    name { 'Default name created by Factory 1' }
    detail { 'Default detail 1 made by Factory 1' }
  end
  # Name the test data to be created "second_task"
  # (If you want to name a class that does not exist, optionally specify "Please use test data for this class")
  factory :second_task, class: Task do
    name { 'Default name created by Factory 2' }
    detail { 'Default detail 2 made by Factory 2' }
  end
end
