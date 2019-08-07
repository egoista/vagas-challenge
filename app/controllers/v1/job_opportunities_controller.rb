module V1
  class JobOpportunitiesController < ApplicationController
    
    def create
      location = Location.find_by(name: params.require('localizacao'))

      if location.nil?
        render_error_message('location_not_found') and return
      end

      job_opportunity = JobOpportunity.new(translate_create_params.merge(location: location))
      if job_opportunity.save
        render json: { id: job_opportunity.id }, status: :created
      else
        render_error_message('job_opportunity_not_saved') and return
      end
    end

    private

    def translate_create_params
      {
        company: params.require('empresa'),
        title: params.require('titulo'),
        description: params.require('descricao'),
        level: params.require('nivel').to_i
      }
    end
  end
end