user_list = [
  [ "example_user", "user@example.com",21, "foobar", "male"],
  [ "lalolanda", "lalolanda@gmail.com",17, "foobar", "male" ]
]

user_list.each do |user|
  User.create(:name => user[0], :email => user[1], :age => user[2], :password => user[3], :sex => user[4])
end

46.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  sex = "male"
  User.create!(name:  name,
               email: email,
               sex: sex,
               password:              password,
               password_confirmation: password)
end