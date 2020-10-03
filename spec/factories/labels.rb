FactoryBot.define do
  # factory :label do
  #   name { "MyString" }
  # end

  factory :first_label, class: Label do
    name { 'Label 1' }
    user_id { User.first.id }
  end

  factory :second_label, class: Label do
    name { 'Label 2' }
    user_id { User.first.id }
  end
end
