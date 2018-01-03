# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(name: "About Me", description: "My unabridged about me.")
Category.create(name: "Book Shops", description: "Overviews of local Michigan used bookstores.")
Category.create(name: "Bibliophiles Anonymous", description: "Me and my love of books.")
Category.create(name: "Psychology and Teaching", description: "My love of Psychology and my passion for teaching.")
Category.create(name: "It's Been a While", description: "Things that I haven't done in a long time, like blogging!")
Category.create(name: "The Internet", description: "Miscellaneous internet things like net neutrality and annoying comments.")
Category.create(name: "Whine and Dine", description: "My days as a server.")