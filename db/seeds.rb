# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_text = File.read(Rails.root.join('db/pokemon.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  p = Pokemon.new
  p.identifier = row['identifier']
  p.species_id = row['species_id']
  p.height = row['height']
  p.weight = row['weight']
  p.base_experience = row['base_experience']
  p.order = row['order']
  p.is_default = row['is_default']
  p.save
  puts "#{p.identifier} saved"
end

csv_text = File.read(Rails.root.join('db/abilities.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  p = Ability.new
  p.identifier = row['identifier']
  p.generation_id = row['generation_id']
  p.is_main_series = row['is_main_series']
  p.save
  puts "Ability #{p.identifier} saved"
end

csv_text = File.read(Rails.root.join('db/pokemon_abilities.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  p = PokemonAbility.create(
    pokemon_id: row['pokemon_id'],
    ability_id: row['ability_id'],
    is_hidden: row['is_hidden'],
    slot: row['slot']
  )
  p.save
  puts "#{p.pokemon_id} saved"
end

