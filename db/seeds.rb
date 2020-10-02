# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create(username: 'test1', email:'test1@test.com', password:'hellotest1')
# User.create(username: 'test2', email:'test2@test.com', password:'hellotest2')
# User.create(username: 'test3', email:'test3@test.com', password:'hellotest3')
# User.create(username: 'test4', email:'test4@test.com', password:'hellotest4')
# User.create(username: 'test5', email:'test5@test.com', password:'hellotest5')

# User.create(username: 'seedadmin', email:'seed@admin.com', password:'helloseedadmin', admin: true)

Task.create(name: "Name 1", detail: "Detail 1",
  expired_at: '2020-10-5 19:32:00', status: "Unstarted", priority_type: "High",
  user_id: User.first.id, label_ids: Label.first.id)
Task.create(name: "Name 2", detail: "Detail 2",
  expired_at: '2020-10-3 19:32:00', status: "Completed", priority_type: "Medium",
  user_id: User.first.id, label_ids: Label.first.id)
Task.create(name: "Name 3", detail: "Detail 3",
  expired_at: '2020-10-4 19:32:00', status: "In Progress", priority_type: "Low",
  user_id: User.first.id, label_ids: Label.first.id)
Task.create(name: "Name 4", detail: "Detail 4",
  expired_at: '2020-10-6 19:32:00', status: "Completed", priority_type: "Medium",
  user_id: User.first.id, label_ids: Label.first.id)
Task.create(name: "Name 5", detail: "Detail 5",
  expired_at: '2020-10-5 19:32:00', status: "In Progress", priority_type: "Low",
  user_id: User.first.id, label_ids: Label.first.id)
Task.create(name: "Name 6", detail: "Detail 6",
  expired_at: '2020-10-7 19:32:00', status: "Unstarted", priority_type: "Low",
  user_id: User.first.id, label_ids: Label.first.id)
Task.create(name: "Name 7", detail: "Detail 7",
  expired_at: '2020-10-4 19:32:00', status: "In Progress", priority_type: "Low",
  user_id: User.first.id, label_ids: Label.first.id)
Task.create(name: "Name 8", detail: "Detail 8",
  expired_at: '2020-10-3 19:32:00', status: "Unstarted", priority_type: "Medium",
  user_id: User.first.id, label_ids: Label.first.id)
Task.create(name: "Name 9", detail: "Detail 9",
  expired_at: '2020-10-3 19:32:00', status: "Unstarted", priority_type: "High",
  user_id: User.first.id, label_ids: Label.first.id)
Task.create(name: "Name 10", detail: "Detail 10",
  expired_at: '2020-10-9 19:32:00', status: "In Progress", priority_type: "High",
  user_id: User.first.id, label_ids: Label.first.id)

User.create(username: 'name1', email:'name1@test.com', password:'helloname1')
User.create(username: 'name2', email:'name2@test.com', password:'helloname2')
User.create(username: 'name3', email:'name3@test.com', password:'helloname3')
User.create(username: 'name4', email:'name4@test.com', password:'helloname4')
User.create(username: 'name5', email:'name5@test.com', password:'helloname5')

Label.create(name: "Label 1", user_id: User.first.id)
Label.create(name: "Label 2", user_id: User.first.id)
Label.create(name: "Label 3", user_id: User.first.id)
Label.create(name: "Label 4", user_id: User.first.id)
Label.create(name: "Label 5", user_id: User.first.id)
