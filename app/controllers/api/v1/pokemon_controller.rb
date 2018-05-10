module Api
  module V1
    class PokemonController < ApplicationController
      def index
        render json: Pokemon.offset(params['offset']).limit(params['limit'])
      end

      def show
        @pokemon = Pokemon.find(params['id']) 
        render json: @pokemon.to_json(
          :include => {
            :abilities => {
              :except => [:created_at, :updated_at]
            }
          },
          :except => [:created_at, :updated_at]
        )
      end
    end
  end
end

