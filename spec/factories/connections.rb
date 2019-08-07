FactoryBot.define do
  factory :connection do
    association :first_location, factory: :location
    association :second_location, factory: :location
    distance { rand(20) }
  end
end