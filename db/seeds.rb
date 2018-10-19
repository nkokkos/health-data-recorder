#Creating Master Admin user
user = User.create(
  :username => 'Your User Name',
  :email => 'user@user.test',
  :password => 'password',
  :password_confirmation => 'password',
  :admin => 1
)
