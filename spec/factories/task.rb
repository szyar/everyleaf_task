FactoryBot.define do
  factory :first_task, class: Task do
    name { 'Name 1' }
    detail { 'Detail 1' }
  end

  factory :second_task, class: Task do
    name { 'Name 2' }
    detail { 'Detail 2' }
  end
end
