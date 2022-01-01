# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if OxfordWord.count.zero?
    File.foreach("app/assets/oxford_3000/the_oxford_3000.txt", chomp: true) do |word|
      OxfordWord.create(word: word)
    end
  end
  