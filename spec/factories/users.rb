FactoryBot.define do
  factory :user do
    username { 'User' }
    password_digest { 'hellouser' }
    email { 'user@user.com' }
  end

  factory :normal_user, class: User do
    username { 'Normal User' }
    password_digest { 'hellouser' }
    email { 'user@test.com' }
  end

  factory :admin_user, class: User do
    username { 'Admin User' }
    password_digest { 'helloadmin' }
    email { 'admin@test.com' }
    admin { true }
  end
end
