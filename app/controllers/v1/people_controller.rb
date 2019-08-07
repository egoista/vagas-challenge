module V1
  class PeopleController < ApplicationController
    def create
      location = Location.find_by(name: params.require('localizacao'))

      if location.nil?
        render json: translate('location_not_found'), status: :unprocessable_entity and return
      end

      people = Person.new(translate_create_params.merge(location: location))
      if people.save
        render json: { id: people.id }, status: :created
      else
        render json: translate('person_not_saved'), status: :unprocessable_entity and return
      end
    end

    private

    def translate_create_params
      {
        name: params.require('nome'),
        occupation: params.require('profissao'),
        level: params.require('nivel').to_i
      }
    end
  end
end
