require 'rails_helper'

RSpec.describe JobApplication, type: :model do
  describe '#as_json' do
    let(:job_application) { create(:job_application) }
    let(:expected_return) do
      {
        "nome": job_application.person.name,
        "profissao": job_application.person.occupation,
        "localizacao": job_application.person.location.name,
        "nivel": Person.levels[job_application.person.level],
        "score": job_application.score
      }
    end
    it 'returns a translated hash with person info and score' do
      expect(job_application.as_json).to eq expected_return
    end
  end

  describe '#set_score' do
    subject { job_application.set_score }

    let(:job_application) { create(:job_application, person: person, job_opportunity: job_opportunity) }
    let(:person) { create(:person, location: person_location, level: person_level) }
    let(:job_opportunity) { create(:job_opportunity, location: job_location, level: job_level) }
    let(:person_location) { create(:location) }
    let(:job_location) { create(:location) }
    let!(:connection) { create(:connection, first_location: person_location, second_location: job_location, distance: distance) }
    let(:distance) { 5 }
    let(:person_level) { 'expert' }
    let(:job_level) { 'expert' }

    context 'when the job and person level is expert' do

      context 'when the distance is lesser than 5' do
        let!(:distance) { 4 }

        it 'sets score to 100' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 100
        end
      end
      context 'when the distance is between 5 and 10' do
        let!(:distance) { 8 }
        
        it 'sets score to 87' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 87
        end
      end
      context 'when the distance is between 10 and 15' do
        let!(:distance) { 12 }

        it 'sets score to 75' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 75
        end
      end
      context 'when the distance is between 15 and 20' do
        let!(:distance) { 17 }
        
        it 'sets score to 62' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 62
        end
      end
      context 'when the distance is bigger than 20' do
        let!(:distance) { 22 }
        
        it 'sets score to 50' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 50
        end
      end
    end

    context 'when the job level is expert and person level is intern' do
      let(:person_level) { 'intern' }

      context 'when the distance is lesser than 5' do
        let!(:distance) { 4 }

        it 'sets score to 50' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 50
        end
      end
      context 'when the distance is between 5 and 10' do
        let!(:distance) { 8 }
        
        it 'sets score to 37' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 37
        end
      end
      context 'when the distance is between 10 and 15' do
        let!(:distance) { 12 }

        it 'sets score to 25' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 25
        end
      end
      context 'when the distance is between 15 and 20' do
        let!(:distance) { 17 }
        
        it 'sets score to 12' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 12
        end
      end
      context 'when the distance is bigger than 20' do
        let!(:distance) { 22 }
        
        it 'sets score to 0' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 0
        end
      end
    end

    context 'when the job level is intern and person level is expert' do
      let(:job_level) { 'intern' }

      context 'when the distance is lesser than 5' do
        let!(:distance) { 4 }

        it 'sets score to 50' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 50
        end
      end
      context 'when the distance is between 5 and 10' do
        let!(:distance) { 8 }
        
        it 'sets score to 37' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 37
        end
      end
      context 'when the distance is between 10 and 15' do
        let!(:distance) { 12 }

        it 'sets score to 25' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 25
        end
      end
      context 'when the distance is between 15 and 20' do
        let!(:distance) { 17 }
        
        it 'sets score to 12' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 12
        end
      end
      context 'when the distance is bigger than 20' do
        let!(:distance) { 22 }
        
        it 'sets score to 0' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 0
        end
      end
    end

    context 'when the job level is junior and person level is expert' do
      let(:job_level) { 'junior' }

      context 'when the distance is lesser than 5' do
        let!(:distance) { 4 }

        it 'sets score to 62' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 62
        end
      end
      context 'when the distance is between 5 and 10' do
        let!(:distance) { 8 }
        
        it 'sets score to 50' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 50
        end
      end
      context 'when the distance is between 10 and 15' do
        let!(:distance) { 12 }

        it 'sets score to 37' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 37
        end
      end
      context 'when the distance is between 15 and 20' do
        let!(:distance) { 17 }
        
        it 'sets score to 25' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 25
        end
      end
      context 'when the distance is bigger than 20' do
        let!(:distance) { 22 }
        
        it 'sets score to 12' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 12
        end
      end
    end

    context 'when the job level is junior and person level is senior' do
      let(:job_level) { 'junior' }
      let(:person_level) { 'senior' }

      context 'when the distance is lesser than 5' do
        let!(:distance) { 4 }

        it 'sets score to 75' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 75
        end
      end
      context 'when the distance is between 5 and 10' do
        let!(:distance) { 8 }
        
        it 'sets score to 62' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 62
        end
      end
      context 'when the distance is between 10 and 15' do
        let!(:distance) { 12 }

        it 'sets score to 50' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 50
        end
      end
      context 'when the distance is between 15 and 20' do
        let!(:distance) { 17 }
        
        it 'sets score to 37' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 37
        end
      end
      context 'when the distance is bigger than 20' do
        let!(:distance) { 22 }
        
        it 'sets score to 25' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 25
        end
      end
    end

    context 'when the job and person level is full' do
      let(:person_level) { 'full' }
      let(:job_level) { 'full' }

      context 'when the distance is lesser than 5' do
        let!(:distance) { 4 }

        it 'sets score to 100' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 100
        end
      end
      context 'when the distance is between 5 and 10' do
        let!(:distance) { 8 }
        
        it 'sets score to 87' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 87
        end
      end
      context 'when the distance is between 10 and 15' do
        let!(:distance) { 12 }

        it 'sets score to 75' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 75
        end
      end
      context 'when the distance is between 15 and 20' do
        let!(:distance) { 17 }
        
        it 'sets score to 62' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 62
        end
      end
      context 'when the distance is bigger than 20' do
        let!(:distance) { 22 }
        
        it 'sets score to 50' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 50
        end
      end
    end

    context 'when the job and person level is intern' do
      let(:person_level) { 'intern' }
      let(:job_level) { 'intern' }

      context 'when the distance is lesser than 5' do
        let!(:distance) { 4 }

        it 'sets score to 100' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 100
        end
      end
      context 'when the distance is between 5 and 10' do
        let!(:distance) { 8 }
        
        it 'sets score to 87' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 87
        end
      end
      context 'when the distance is between 10 and 15' do
        let!(:distance) { 12 }

        it 'sets score to 75' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 75
        end
      end
      context 'when the distance is between 15 and 20' do
        let!(:distance) { 17 }
        
        it 'sets score to 62' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 62
        end
      end
      context 'when the distance is bigger than 20' do
        let!(:distance) { 22 }
        
        it 'sets score to 50' do
          expect(job_application.set_score).to be_truthy

          expect(job_application.score).to eq 50
        end
      end
    end
  end
end