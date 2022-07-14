5.times do
  username = FFaker::Name.unique.name
  email = FFaker::Internet.email
  password = 'password'
  password_confirmation = 'password'

  User.create username: username, email: email, password: password, password_confirmation: password_confirmation
end
