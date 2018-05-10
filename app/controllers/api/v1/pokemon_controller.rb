module Api
  module V1
    class PokemonController < ApplicationController
      def index
        render json: Pokemon.all
      end
    end
  end
end

