# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Manifest.destroy_all
Item.destroy_all
ManifestItem.destroy_all

user = User.create(username: 'charlie' , password: 'monkeybusiness')
20.times do
  Manifest.create(title: Faker::Lorem.word, limit: 20, description: Faker::Lorem.sentence, user_id: User.last.id)
end

Manifest.all.each do |manifest|
  5.times do
    item = Item.create(name: Faker::Lorem.word, description: Faker::Lorem.sentence, price: 5.00, brand: Faker::Lorem.word)
    manifest.items << item
  end
end
