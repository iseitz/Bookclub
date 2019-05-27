@removed_users = User.where(username: 'removedUser')
if @removed_users.length == 0
  puts 'Seeding removed_users'
  User.create!( username: 'removedUser',
                email: 'bookapeclub@gmail.com',
                role: 'inactive',
                password: 'UserWithNoProfile2019',
                password_confirmation: 'UserWithNoProfile2019')
end
