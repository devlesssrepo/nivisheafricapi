# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
countries = Country.create(name: 'Ghana', code: 'GH')
designers = Designer.create(design_label: 'Rosemani',first_name: 'Kate', last_name: 'Kimani', phone_number: '0201201243', email_address: 'kate@rosemani.com', physical_address: 'East Legon Accra',country_id: Country.first)
collections = Collection.create(name: 'Sunflower Orange 2016', designer_id: Designer.first)