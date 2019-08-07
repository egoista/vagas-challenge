require 'rails_helper'

RSpec.describe V1::JobApplicationsController, type: :controller do
  describe 'POST create' do
    context 'with valid params' do
      context 'when person and job opportunity exists' do
        let(:person) { create(:person) }
        let(:job_opportunity) { create(:job_opportunity) }
        let(:params) { {id_vaga: job_opportunity.id, id_pessoa: person.id} }
        
        it "has a 201 status code" do
          post :create, params: params

          expect(response.status).to eq(201)
        end

        it "answers with the person id" do
          post :create, params: params

          json = JSON.parse(response.body)
          expect(json).to include_json(id: /\d*/)
        end
      end

      context 'when just person exists' do
        let(:person) { create(:person) }
        let(:params) { {id_vaga: 1, id_pessoa: person.id} }
        
        it "has a 422 status code" do
          post :create, params: params

          expect(response.status).to eq(422)
        end

        it "answers with the person id" do
          post :create, params: params

          json = JSON.parse(response.body)
          expect(json).to include_json(error_message: 'Erro ao salvar Candidatura')
        end
      end


      context 'when just job opportunity exists' do
        let(:job_opportunity) { create(:job_opportunity) }
        let(:params) { {id_vaga: job_opportunity.id, id_pessoa: 1} }
        
        it "has a 422 status code" do
          post :create, params: params

          expect(response.status).to eq(422)
        end

        it "answers with the person id" do
          post :create, params: params

          json = JSON.parse(response.body)
          expect(json).to include_json(error_message: 'Erro ao salvar Candidatura')
        end
      end
    end

    context 'with invalid params' do
      it "has a 400 status code" do
        post :create, params: {}

        expect(response.status).to eq(400)
      end
    end
  end
  
end
