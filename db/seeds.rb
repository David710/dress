# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

vectors_bulk = File.read(Rails.root.join('lib', 'seeds', 'vectors_img.txt'))
urls_bulk = File.read(Rails.root.join('lib', 'seeds', 'urls.txt'))

vectors = JSON.parse(vectors_bulk)
urls = JSON.parse(urls_bulk)

for i in 0..urls.length
  dress = Robe.new
  dress.feature_vector = vectors[i]
  dress.url = urls[i]
  dress.save
end
