FactoryBot.define do
  factory :first_task, class: Task do
    name { 'Name 1' }
    detail { 'Detail 1' }
    expired_at { '2020-09-26 19:32:00'}
    status { 'Unstarted' }
  end

  factory :second_task, class: Task do
    name { 'Name 2' }
    detail { 'Detail 2' }
    expired_at { '2020-09-27 19:32:00'}
    status { 'Completed' }
  end
end
