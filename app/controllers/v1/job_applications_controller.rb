module V1
  class JobApplicationsController < ApplicationController
    def create
      job_application = JobApplication.new(person_id: params.require('id_pessoa'), job_opportunity_id: params.require('id_vaga'))

      if job_application.save
        job_application.set_score

        render json: { id: job_application.id }, status: :created
      else
        render_error_message('job_application_not_saved') and return
      end
    end
    def ranking
      job_opportunity = JobOpportunity.find(params[:job_opportunity_id])

      render json: job_opportunity.job_applications.order(score: :desc).as_json, staus: :ok
    end
  end
end
