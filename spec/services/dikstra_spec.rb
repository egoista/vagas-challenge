require 'rails_helper'

RSpec.describe Dijkstra do
  describe '#shortest_distance_between' do
    subject { described_class.new.shortest_distance_between(location1, location2) }
    context 'when pass the same location' do
      let!(:location1) { create(:location) }
      let!(:location2) { location1 }

      it { is_expected.to be 0}
    end
    
    context 'when pass directly connected locations' do
      let!(:location1) { create(:location) }
      let!(:location2) { create(:location) }
      let!(:connection) { create(:connection, first_location: location1, second_location: location2) }
      
      it { is_expected.to eq connection.distance }
    end

    context 'when pass unconnected locations' do
      let!(:location1) { create(:location) }
      let!(:location2) { create(:location) }
      
      it { is_expected.to eq Float::INFINITY }
    end

    context 'when pass locations connected with just one path' do
      let!(:location1) { create(:location) }
      let!(:location2) { create(:location) }
      let!(:location3) { create(:location) }
      let!(:connection1) { create(:connection, first_location: location1, second_location: location3) }
      let!(:connection2) { create(:connection, first_location: location3, second_location: location2) }

      it { is_expected.to eq connection1.distance + connection2.distance }
    end

    context 'with challenge path' do
      let(:location_a) { create(:location, name:  'A') }
      let(:location_b) { create(:location, name:  'B') }
      let(:location_c) { create(:location, name:  'C') }
      let(:location_d) { create(:location, name:  'D') }
      let(:location_e) { create(:location, name:  'E') }
      let(:location_f) { create(:location, name:  'F') }
      before do
        Connection.create(
          [
            { first_location: location_a, second_location: location_b, distance: 5 },
            { first_location: location_b, second_location: location_c, distance: 7 },
            { first_location: location_c, second_location: location_e, distance: 4 },
            { first_location: location_b, second_location: location_d, distance: 3 },
            { first_location: location_e, second_location: location_d, distance: 10 },
            { first_location: location_d, second_location: location_f, distance: 8 },
          ]
        )
      end

      context 'distance from A to B' do
        let(:location1) { location_a }
        let(:location2) { location_b }

        it { is_expected.to eq 5 }
      end

      context 'distance from A to C' do
        let(:location1) { location_a }
        let(:location2) { location_c }

        it { is_expected.to eq 12 }
      end

      context 'distance from A to D' do
        let(:location1) { location_a }
        let(:location2) { location_d }

        it { is_expected.to eq 8 }
      end

      context 'distance from A to E' do
        let(:location1) { location_a }
        let(:location2) { location_e }

        it { is_expected.to eq 16 }
      end

      context 'distance from A to F' do
        let(:location1) { location_a }
        let(:location2) { location_f }

        it { is_expected.to eq 16 }
      end

      context 'distance from B to C' do
        let(:location1) { location_b }
        let(:location2) { location_c }

        it { is_expected.to eq 7 }
      end

      context 'distance from B to D' do
        let(:location1) { location_b }
        let(:location2) { location_d }

        it { is_expected.to eq 3 }
      end

      context 'distance from B to E' do
        let(:location1) { location_b }
        let(:location2) { location_e }

        it { is_expected.to eq 11 }
      end

      context 'distance from B to F' do
        let(:location1) { location_b }
        let(:location2) { location_f }

        it { is_expected.to eq 11 }
      end

      context 'distance from C to D' do
        let(:location1) { location_c }
        let(:location2) { location_d }

        it { is_expected.to eq 10 }
      end

      context 'distance from C to E' do
        let(:location1) { location_c }
        let(:location2) { location_e }

        it { is_expected.to eq 4 }
      end

      context 'distance from C to F' do
        let(:location1) { location_c }
        let(:location2) { location_f }

        it { is_expected.to eq 18 }
      end

      context 'distance from D to E' do
        let(:location1) { location_d }
        let(:location2) { location_e }

        it { is_expected.to eq 10 }
      end

      context 'distance from D to F' do
        let(:location1) { location_d }
        let(:location2) { location_f }

        it { is_expected.to eq 8 }
      end

      context 'distance from F to E' do
        let(:location1) { location_f }
        let(:location2) { location_e }

        it { is_expected.to eq 18 }
      end
    end
  end
end
