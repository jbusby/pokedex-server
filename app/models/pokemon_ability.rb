class PokemonAbility < ApplicationRecord
  belongs_to :ability
  belongs_to :pokemon
end
