require 'rails_helper'

RSpec.describe V1::PeopleController, type: :controller do
  let(:params) do
    {
      nome: "John Doe",
      profissao: "Engenheiro de Software",
      localizacao: "C",
      nivel: 2
    }
  end
  
  describe 'POST create' do
    context 'with valid params' do
      context 'when location exists' do
        before do
          Location.create(name: params[:localizacao])
        end
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

      context 'when location does not exists' do
        it "has a 422 status code" do
          post :create, params: params

          expect(response.status).to eq(422)
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
