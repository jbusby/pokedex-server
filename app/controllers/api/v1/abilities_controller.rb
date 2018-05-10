module Api
  module V1
    class AbilitiesController < ApplicationController
      def index
        render json: Ability.offset(params['offset']).limit(params['limit'])
      end

      def show
        @ability = Ability.find(params['id']) 
        render json: @ability
      end
    end
  end
end

