50.times do |n|
  name = Faker::Users::Human.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               )
end