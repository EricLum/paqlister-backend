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

images = [
  'https://i1.wp.com/freepngimages.com/wp-content/uploads/2016/02/blue-skater-skirt-transparent-background.png?resize=624%2C527',
  'http://pngriver.com/wp-content/uploads/2017/11/Jacket-clothes-free-PNG-transparent-background-images-free-download-clipart-pics-strickfleece-steppjacke-rekordmeister-21959.png',
  'http://www.pngmart.com/files/4/Floral-Dress-PNG-Photos.png',
  'http://www.pngmart.com/files/1/Jacket-PNG-Clipart.png',
  'http://www.pngmart.com/files/1/Jacket-PNG-Transparent-Image.png'
]

user = User.create(username: 'charlie' , password: 'monkeybusiness')
2.times do
  Manifest.create(title: Faker::Lorem.word, limit: 20, description: Faker::Lorem.sentence, user_id: User.last.id)
end

Manifest.all.each do |manifest|
  images.each do |img|
    item = Item.create(name: Faker::Lorem.word, description: Faker::Lorem.sentence, price: 5.00, brand: Faker::Lorem.word, image: img)
    manifest.items << item
  end
end
