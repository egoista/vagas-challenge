module V1
  class JobOpportunitiesController < ApplicationController
    def create
      location = Location.find_by(name: params['localizacao'])

      if location.nil?
        render json: translate('location_not_found'), status: :unprocessable_entity and return
      end

      job_opportunity = JobOpportunity.new(translate_create_params.merge(location: location))
      if job_opportunity.save
        render json: { id: job_opportunity.id }, status: :created
      else
        render json: translate('job_opportunity_not_saved'), status: :unprocessable_entity and return
      end
    end

    private

    def translate_create_params
      {
        company: params['empresa'],
        title: params['titulo'],
        description: params['descricao'],
        level: params['nivel'].to_i
      }
    end
  end
end