# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
password = '123456'
User.create(name: 'Admin', surname: 'Home', email: 'admin@mail.ru', password: password, password_confirmation: password, role: 'admin')
User.create(name: 'client', surname: 'Home', email: 'client@mail.ru', password: password, password_confirmation: password, role: 'client')
