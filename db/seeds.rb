User.create!(name:  "Hieu Nguyen",
             email: "hieunmce@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

200.times do |n|
  title  = Faker::Lorem.sentence
  body = Faker::Lorem.paragraphs.join("\n")
  password = "password"
  if n < 80
    Post.create!(title:  title,
                 body: body,
                 user_id: 1,
                 views: "0")
  elsif n < 140
    Post.create!(title:  title,
                 body: body,
                 user_id: 2,
                 views: "0")
  else
    Post.create!(title:  title,
                 body: body,
                 user_id: 3,
                 views: "0")

  end
end
