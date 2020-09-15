FactoryBot.define do
  factory :first_task, class: Task do
    name { 'Default name created by Factory 1' }
    detail { 'Default detail created by Factory 1' }
  end

  factory :second_task, class: Task do
    name { 'Default name created by Factory 2' }
    detail { 'Default detail created by Factory 2' }
  end
end
