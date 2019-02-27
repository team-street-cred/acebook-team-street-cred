# This file should contain all the record creation needed to seed the database with its
# default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database
# with db:setup).
#
# Examples:

  User.create([{ first_name: 'Bob', last_name: 'Jonson',
    pronoun: 'he', email: 'bob@bob.com',
    password: 'bbb', profile_pic_link: 'www.bob.com' },
{ first_name: 'Jane', last_name: 'Smith',
  pronoun: 'she', email: 'jane@jane.com',
  password: 'jjj', 
  profile_pic_link: 'www.jane.com' }])

  Post.create([{ user_id: 1, message: 'Hello World' }, { user_id: 1, message: 'Huzzah!' }])



  # Character.create(name: 'Luke', movie: movies.first)
#
#   movies = Movie.create([{ name: 'Star Wars' },
# { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
