# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

puts 'Seeding Default Users...'
User.create! email: 'admin@bright.local', password: 'brighter', password_confirmation: 'brighter'
