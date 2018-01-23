  # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
tmp = User.new(name:  "Example User",
             email: "user@example.com",
             password:              "123456",
             password_confirmation: "123456",
             admin: true)
	tmp.skip_confirmation!
	tmp.skip_confirmation_notification!
  tmp.save!


99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  tmp = User.new(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
  tmp.skip_confirmation!
	tmp.skip_confirmation_notification!
  tmp.save!
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::RickAndMorty.quote[0,139]
  users.each{ |user| user.microposts.create!(content: content)}
end

 # user = User.new(
 #      :email                 => "admin@xxxxx.xxx",
 #      :password              => "123456",
 #      :password_confirmation => "123456"
 #  )
 #  user.skip_confirmation!
 #  user.save!