@user = User.new
@user.email = 'admin@gmail.com'
@user.password = 'password'
@user.add_role :admin
@user.save(:validate => false)